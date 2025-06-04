import os
from faker import Faker
from datetime import datetime, date, timedelta, timezone  # Ensure all are imported
import random
import uuid
import hashlib
import enum  # For isinstance checks
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

# --- Configuration ---
DATABASE_URL = os.environ.get('DATABASE_URL',
                              'postgresql://postgres:password@localhost:5432/tsn_db?client_encoding=utf8')

NUM_USERS = 50
NUM_POSTS_PER_USER_AVG = 3
NUM_COMMENTS_PER_POST_AVG = 2
NUM_SHARES_PER_POST_AVG = 1
NUM_LIKES_PER_USER_AVG = 15
MAX_FRIENDS_PER_USER = 7
NUM_MESSAGES_PER_USER_AVG = 3

fake = Faker()
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


# --- Helper Functions ---
def get_random_visibility():
    # These MUST match the string values in your PostgreSQL ENUM type 'visibilityenum'
    return random.choice(['PUBLIC', 'FRIENDS', 'PRIVATE'])


def get_random_gender():
    # These MUST match the string values in your PostgreSQL ENUM type 'genderenum'
    return random.choice(['MALE', 'FEMALE', 'OTHER', 'PREFER_NOT_TO_SAY'])


def generate_hashed_password(password):
    # Placeholder: For real login with Flask-Security, use its hashing or pre-hash correctly.
    return hashlib.sha256(password.encode('utf-8')).hexdigest()


# --- Data Generation ---
def create_fake_data():
    db_session = SessionLocal()
    print("Starting data generation...")

    # 1. Create Roles
    print("Creating roles...")
    # ... (Your role creation logic - looks okay) ...
    # Ensure roles_in_db and user_role_id are correctly fetched/set
    roles_data = [
        {'name': 'user', 'description': 'Regular User'},
        {'name': 'admin', 'description': 'Administrator'},
    ]
    existing_role_names_query = db_session.execute(text("SELECT name FROM role")).fetchall()
    existing_role_names = [r[0] for r in existing_role_names_query]
    new_roles = [role for role in roles_data if role['name'] not in existing_role_names]
    if new_roles:
        for role_data in new_roles:  # Use different var name
            db_session.execute(text("INSERT INTO role (name, description) VALUES (:name, :description)"), [role_data])
        db_session.commit()
        print(f"{len(new_roles)} roles created.")
    else:
        print("Roles likely already exist.")
    roles_in_db_query = db_session.execute(text("SELECT id, name FROM role")).mappings().fetchall()
    roles_in_db = {r['name']: r['id'] for r in roles_in_db_query}
    user_role_id = roles_in_db.get('user')

    # 2. Create Users
    print(f"Creating {NUM_USERS} users...")
    users_to_insert = []
    # ... (Your user data generation loop - ensure 'gender' is string, 'date_joined' is date obj, 'confirmed_at' uses datetime.now(timezone.utc)) ...
    for i in range(NUM_USERS):
        profile = fake.profile()
        first_name = profile.get('name', '').split(' ')[0] or fake.first_name()
        last_name = profile.get('name', '').split(' ')[-1] if ' ' in profile.get('name', '') else fake.last_name()
        username = fake.unique.user_name()
        while db_session.execute(text("SELECT 1 FROM \"user\" WHERE username = :username"),
                                 {'username': username}).scalar_one_or_none():
            username = fake.unique.user_name() + str(random.randint(100, 999))
        email = fake.unique.email()
        while db_session.execute(text("SELECT 1 FROM \"user\" WHERE email = :email"),
                                 {'email': email}).scalar_one_or_none():
            email = fake.unique.email()
        phone_val = fake.unique.phone_number()  # Renamed to avoid conflict with 'phone' column name
        while db_session.execute(text("SELECT 1 FROM \"user\" WHERE phone = :phone"),
                                 {'phone': phone_val}).scalar_one_or_none():
            phone_val = fake.unique.phone_number() + str(random.randint(10, 99))

        user_data_dict = {
            'is_active': True, 'username': username, 'first_name': first_name, 'last_name': last_name,
            'email': email, 'password': generate_hashed_password('password123'), 'phone': phone_val,  # Use phone_val
            'date_birth': profile.get('birthdate', fake.date_of_birth(minimum_age=13, maximum_age=80)),
            'gender': get_random_gender(),  # This function MUST return the string like "MALE"
            'fs_uniquifier': str(uuid.uuid4()),
            'confirmed_at': datetime.now(timezone.utc) - timedelta(
                days=random.randint(1, 60)) if random.random() < 0.8 else None,
            'profile_pic': 'images/default.jpg',  # This assumes a file in static/images/
            'biography': fake.text(max_nb_chars=160) if random.random() < 0.7 else None,
            'location': fake.city() if random.random() < 0.5 else None,
            'date_joined': (datetime.now(timezone.utc) - timedelta(days=random.randint(0, 1095))).date()
            # Joined in last 3 years
        }
        users_to_insert.append(user_data_dict)

    user_ids = []
    user_map = {}
    if users_to_insert:
        user_insert_stmt = text(
            """INSERT INTO "user" (is_active, username, first_name, last_name, email, password, phone, date_birth, gender, fs_uniquifier, confirmed_at, profile_pic, biography, location, date_joined) VALUES (:is_active, :username, :first_name, :last_name, :email, :password, :phone, :date_birth, :gender, :fs_uniquifier, :confirmed_at, :profile_pic, :biography, :location, :date_joined) RETURNING id, username""")
        try:
            print("Inserting users one by one...")
            for user_data in users_to_insert:
                result = db_session.execute(user_insert_stmt, [user_data]).mappings().first()
                if result:
                    user_ids.append(result['id'])
                    user_map[result['username']] = result['id']
            db_session.commit()
            print(f"{len(user_ids)} users created.")
        except Exception as e:
            db_session.rollback();
            print(f"Error user insertion: {e}");
            db_session.close();
            return

        if user_role_id and user_ids:  # Assign roles
            roles_users_entries = [{'user_id': uid, 'role_id': user_role_id} for uid in user_ids]
            try:
                db_session.execute(text(
                    "INSERT INTO roles_users (user_id, role_id) VALUES (:user_id, :role_id) ON CONFLICT (user_id, role_id) DO NOTHING"),
                                   roles_users_entries)
                db_session.commit()
                print(f"Assigned 'user' role.")
            except Exception as e:  # Catch if ON CONFLICT target isn't set up (PK on roles_users)
                db_session.rollback()
                print(
                    f"Warning: Could not assign roles with ON CONFLICT (PK on roles_users?(user_id,role_id) might be missing): {e}")
                # Fallback: insert one by one checking existence
                print("Attempting to assign roles one by one (slower)...")
                for entry in roles_users_entries:
                    exists = db_session.execute(
                        text("SELECT 1 FROM roles_users WHERE user_id=:user_id AND role_id=:role_id"),
                        entry).scalar_one_or_none()
                    if not exists:
                        db_session.execute(
                            text("INSERT INTO roles_users (user_id, role_id) VALUES (:user_id, :role_id)"), [entry])
                db_session.commit()

    else:  # Fallback if no users were inserted
        print("No new users created. Fetching existing.")
        user_ids_query = db_session.execute(text("SELECT id, username FROM \"user\"")).mappings().fetchall()
        user_ids = [u['id'] for u in user_ids_query]
        user_map = {u['username']: u['id'] for u in user_ids_query}
        if not user_ids: print("No users in DB. Aborting further data gen."); db_session.close(); return

    # 3. Create Friendships
    print("Creating friendships...")
    # ... (Your friendship creation logic - looks okay, ensure commit/rollback) ...
    friendship_pairs = set()
    friendships_to_add = []
    if len(user_ids) > 1:
        for user_id in user_ids:
            num_friends = random.randint(0, min(MAX_FRIENDS_PER_USER, len(user_ids) - 1))
            possible_friends = [uid for uid in user_ids if uid != user_id]
            random.shuffle(possible_friends)
            friends_for_this_user = possible_friends[:num_friends]
            for friend_id in friends_for_this_user:
                pair1 = tuple(sorted((user_id, friend_id)))
                if pair1 not in friendship_pairs:  # Ensure (A,B) and (B,A) are treated as one pair for generation
                    friendships_to_add.append({'user_id': user_id, 'friend_id': friend_id})
                    friendships_to_add.append({'user_id': friend_id, 'friend_id': user_id})
                    friendship_pairs.add(pair1)
    if friendships_to_add:
        try:
            # Insert friendships, handling potential duplicates if PK (user_id, friend_id) exists
            # If friendships table has PK (user_id, friend_id), ON CONFLICT can be used
            # Otherwise, this might fail if script run multiple times without clearing.
            # For simplicity, assuming PK on friendships (user_id, friend_id) for ON CONFLICT
            db_session.execute(text(
                "INSERT INTO friendships (user_id, friend_id) VALUES (:user_id, :friend_id) ON CONFLICT (user_id, friend_id) DO NOTHING"),
                               friendships_to_add)
            db_session.commit()
            print(f"{len(friendship_pairs)} friendship relations established.")
        except Exception as e:
            db_session.rollback();
            print(f"Error creating friendships: {e}")

    # 4. Create Posts
    print("Creating posts...")
    posts_to_add_data = []
    post_ids = []  # INITIALIZED
    sample_media_files = ['sample1.jpeg', 'sample2.jpg', 'sample3.jpg']  # Example files

    if user_ids:
        for user_id in user_ids:
            for _ in range(random.randint(0, NUM_POSTS_PER_USER_AVG)):
                media_path = None
                if random.random() < 0.3:  # 30% chance of having media
                    if sample_media_files:
                        chosen_media_filename = random.choice(sample_media_files)
                        media_path = os.path.join('post_media', chosen_media_filename).replace("\\",
                                                                                               "/")  # Path like "post_media/sample1.jpeg"

                post_data = {
                    'user_id': user_id,
                    'content': fake.text(max_nb_chars=random.randint(50, 500)),
                    'visibility': get_random_visibility(),  # String value: "PUBLIC", "FRIENDS", "PRIVATE"
                    'timestamp': datetime.now(timezone.utc) - timedelta(days=random.randint(0, 365 * 2)),
                    'media': media_path
                }
                posts_to_add_data.append(post_data)

        if posts_to_add_data:
            post_insert_stmt = text(
                """INSERT INTO post (user_id, content, visibility, "timestamp", media) VALUES (:user_id, :content, :visibility, :timestamp, :media) RETURNING id""")
            try:
                print(f"Attempting to insert {len(posts_to_add_data)} posts one by one...")
                for p_data in posts_to_add_data:
                    result = db_session.execute(post_insert_stmt, [p_data]).mappings().first()
                    if result: post_ids.append(result['id'])
                db_session.commit()
                print(f"{len(post_ids)} posts created.")
            except Exception as e:
                db_session.rollback();
                print(f"Error during post insertion: {e}")
    else:
        print("No users available to create posts.")

    if not post_ids:  # If no new posts created, try to fetch existing ones
        print("No new posts. Fetching existing post IDs.")
        existing_posts_query = db_session.execute(text("SELECT id FROM post")).fetchall()
        post_ids = [p[0] for p in existing_posts_query]
        if not post_ids: print("No posts in DB. Skipping comments, shares, likes.")

    # 5. Create Comments
    comments_to_add = []
    comment_ids = []
    if post_ids and user_ids:
        print("Creating comments...")
        for post_id in post_ids:
            for _ in range(random.randint(0, NUM_COMMENTS_PER_POST_AVG)):
                commenter_id = random.choice(user_ids)
                # Ensure commenter is not the post author for more realism (optional)
                # post_author_id = db_session.execute(text("SELECT user_id FROM post WHERE id=:id"), {'id':post_id}).scalar_one()
                # if commenter_id == post_author_id and len(user_ids) > 1:
                #     commenter_id = random.choice([uid for uid in user_ids if uid != post_author_id])

                comment_data = {
                    'user_id': commenter_id, 'post_id': post_id, 'content': fake.sentence(),
                    'timestamp': datetime.now(timezone.utc) - timedelta(minutes=random.randint(1, 60 * 24 * 30)),
                    # Within last 30 days
                    'share_id': None  # Assuming comments are primarily on posts
                }
                comments_to_add.append(comment_data)
        if comments_to_add:
            comment_insert_stmt = text(
                """INSERT INTO comment (user_id, post_id, content, "timestamp", share_id) VALUES (:user_id, :post_id, :content, :timestamp, :share_id) RETURNING id""")
            try:
                print(f"Attempting to insert {len(comments_to_add)} comments one by one...")
                for c_data in comments_to_add:
                    result = db_session.execute(comment_insert_stmt, [c_data]).mappings().first()
                    if result: comment_ids.append(result['id'])
                db_session.commit()
                print(f"{len(comment_ids)} comments created.")
            except Exception as e:
                db_session.rollback();
                print(f"Error during comment insertion: {e}")

    if not comment_ids:  # Fetch existing if none created
        print("No new comments. Fetching existing comment IDs.")
        existing_comments_query = db_session.execute(text("SELECT id FROM comment")).fetchall()
        comment_ids = [c[0] for c in existing_comments_query]

    # 6. Create Shares
    shares_to_add = []
    share_ids = []
    if post_ids and user_ids:
        print("Creating shares...")
        for post_id_to_share in post_ids:
            for _ in range(random.randint(0, NUM_SHARES_PER_POST_AVG)):
                if random.random() < 0.2:  # 20% chance a post is shared
                    share_data = {
                        'user_id': random.choice(user_ids), 'post_id': post_id_to_share,
                        'content': fake.sentence() if random.random() < 0.5 else None,
                        'timestamp': datetime.now(timezone.utc) - timedelta(minutes=random.randint(1, 60 * 24 * 14))
                        # Within last 2 weeks
                    }
                    shares_to_add.append(share_data)
        if shares_to_add:
            share_insert_stmt = text(
                """INSERT INTO share (user_id, post_id, content, "timestamp") VALUES (:user_id, :post_id, :content, :timestamp) RETURNING id""")
            try:
                print(f"Attempting to insert {len(shares_to_add)} shares one by one...")
                for s_data in shares_to_add:
                    result = db_session.execute(share_insert_stmt, [s_data]).mappings().first()
                    if result: share_ids.append(result['id'])
                db_session.commit()
                print(f"{len(share_ids)} shares created.")
            except Exception as e:
                db_session.rollback();
                print(f"Error during share insertion: {e}")

    if not share_ids:  # Fetch existing if none created
        print("No new shares. Fetching existing share IDs.")
        existing_shares_query = db_session.execute(text("SELECT id FROM share")).fetchall()
        share_ids = [s[0] for s in existing_shares_query]

    # 7. Create Likes
    likes_to_add_data = []
    if user_ids:
        print("Creating likes...")
        for user_id in user_ids:
            for _ in range(random.randint(0, NUM_LIKES_PER_USER_AVG)):
                target_id = None
                like_data = {'user_id': user_id, 'post_id': None, 'comment_id': None, 'share_id': None,
                             'timestamp': datetime.now(timezone.utc) - timedelta(
                                 seconds=random.randint(1, 3600 * 24 * 90))}

                target_choice = random.random()
                if target_choice < 0.7 and post_ids:  # 70% likes on posts
                    like_data['post_id'] = random.choice(post_ids)
                elif target_choice < 0.9 and comment_ids:  # 20% likes on comments
                    like_data['comment_id'] = random.choice(comment_ids)
                elif share_ids:  # 10% likes on shares
                    like_data['share_id'] = random.choice(share_ids)

                if like_data['post_id'] or like_data['comment_id'] or like_data['share_id']:
                    likes_to_add_data.append(like_data)

        # Deduplicate likes before attempting insert
        unique_likes_to_insert = []
        seen_like_tuples = set()
        for l_data in likes_to_add_data:
            like_tuple = (l_data['user_id'], l_data['post_id'], l_data['comment_id'], l_data['share_id'])
            if like_tuple not in seen_like_tuples:
                unique_likes_to_insert.append(l_data)
                seen_like_tuples.add(like_tuple)

        if unique_likes_to_insert:
            like_insert_stmt = text(
                """INSERT INTO "like" (user_id, post_id, comment_id, share_id, "timestamp") VALUES (:user_id, :post_id, :comment_id, :share_id, :timestamp) ON CONFLICT DO NOTHING""")
            # Note: ON CONFLICT needs specific unique constraints to target.
            # Your uq_user_post_like etc. are partial. A single constraint on (user_id, post_id, comment_id, share_id) might be better
            # or handle conflicts by checking existence before appending to unique_likes_to_insert.
            # For now, relying on the partial unique constraints to prevent some duplicates.
            # If you have the CHECK constraint for exclusive FKs, direct insert might fail if a like tries to set more than one FK.
            # The logic above ensures only one FK is set per like_data.
            try:
                db_session.execute(like_insert_stmt, unique_likes_to_insert)
                db_session.commit()
                print(f"{len(unique_likes_to_insert)} likes created/attempted.")
            except Exception as e:
                db_session.rollback();
                print(f"Error creating likes: {e}")

    # 8. Create Messages
    messages_to_add = []
    if len(user_ids) >= 2:
        print("Creating messages...")
        # ... (Your message creation logic - looks okay, ensure commit/rollback) ...
        for sender_id in user_ids:
            for _ in range(random.randint(0, NUM_MESSAGES_PER_USER_AVG)):
                possible_recipients = [uid for uid in user_ids if uid != sender_id]
                if not possible_recipients: continue
                recipient_id = random.choice(possible_recipients)
                message_data = {
                    'sender_id': sender_id, 'recipient_id': recipient_id,
                    'content': fake.text(max_nb_chars=random.randint(20, 200)),
                    'timestamp': datetime.now(timezone.utc) - timedelta(minutes=random.randint(1, 60 * 24 * 7)),
                    # within last week
                    'is_read': random.random() < 0.4  # 40% chance of being read
                }
                messages_to_add.append(message_data)
        if messages_to_add:
            message_insert_stmt = text(
                """INSERT INTO message (sender_id, recipient_id, content, "timestamp", is_read) VALUES (:sender_id, :recipient_id, :content, :timestamp, :is_read)""")
            try:
                db_session.execute(message_insert_stmt, messages_to_add)
                db_session.commit()
                print(f"{len(messages_to_add)} messages created.")
            except Exception as e:
                db_session.rollback();
                print(f"Error creating messages: {e}")

    db_session.close()
    print("Data generation complete.")


if __name__ == "__main__":
    # ... (Your optional clear data logic - BE CAREFUL) ...
    create_fake_data()