PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2017-10-02 01:47:27.747548');
INSERT INTO django_migrations VALUES(2,'contenttypes','0002_remove_content_type_name','2017-10-02 01:47:27.937549');
INSERT INTO django_migrations VALUES(3,'auth','0001_initial','2017-10-02 01:47:28.107549');
INSERT INTO django_migrations VALUES(4,'auth','0002_alter_permission_name_max_length','2017-10-02 01:47:28.427549');
INSERT INTO django_migrations VALUES(5,'auth','0003_alter_user_email_max_length','2017-10-02 01:47:28.487549');
INSERT INTO django_migrations VALUES(6,'auth','0004_alter_user_username_opts','2017-10-02 01:47:28.567550');
INSERT INTO django_migrations VALUES(7,'auth','0005_alter_user_last_login_null','2017-10-02 01:47:28.637550');
INSERT INTO django_migrations VALUES(8,'auth','0006_require_contenttypes_0002','2017-10-02 01:47:28.707550');
INSERT INTO django_migrations VALUES(9,'auth','0007_alter_validators_add_error_messages','2017-10-02 01:47:28.777550');
INSERT INTO django_migrations VALUES(10,'auth','0008_alter_user_username_max_length','2017-10-02 01:47:28.847550');
INSERT INTO django_migrations VALUES(11,'accounts','0001_initial','2017-10-02 01:47:28.917550');
INSERT INTO django_migrations VALUES(12,'accounts','0002_bloguser','2017-10-02 01:47:29.127550');
INSERT INTO django_migrations VALUES(13,'admin','0001_initial','2017-10-02 01:47:29.297551');
INSERT INTO django_migrations VALUES(14,'admin','0002_logentry_remove_auto_add','2017-10-02 01:47:29.457551');
INSERT INTO django_migrations VALUES(15,'blog','0001_initial','2017-10-02 01:47:29.517551');
INSERT INTO django_migrations VALUES(16,'blog','0002_auto_20171002_1047','2017-10-02 01:47:29.697551');
INSERT INTO django_migrations VALUES(17,'comments','0001_initial','2017-10-02 01:47:29.767551');
INSERT INTO django_migrations VALUES(18,'comments','0002_comment','2017-10-02 01:47:29.917551');
INSERT INTO django_migrations VALUES(19,'sessions','0001_initial','2017-10-02 01:47:30.077552');
INSERT INTO django_migrations VALUES(20,'accounts','0003_remove_bloguser_test','2017-10-02 04:07:57.129414');
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','group');
INSERT INTO django_content_type VALUES(3,'auth','permission');
INSERT INTO django_content_type VALUES(4,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(5,'sessions','session');
INSERT INTO django_content_type VALUES(6,'blog','tag');
INSERT INTO django_content_type VALUES(7,'blog','article');
INSERT INTO django_content_type VALUES(8,'blog','category');
INSERT INTO django_content_type VALUES(9,'blog','links');
INSERT INTO django_content_type VALUES(10,'accounts','bloguser');
INSERT INTO django_content_type VALUES(11,'comments','comment');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,2,'add_group','Can add group');
INSERT INTO auth_permission VALUES(5,2,'change_group','Can change group');
INSERT INTO auth_permission VALUES(6,2,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(7,3,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(8,3,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(9,3,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(10,4,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(11,4,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(12,4,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(13,5,'add_session','Can add session');
INSERT INTO auth_permission VALUES(14,5,'change_session','Can change session');
INSERT INTO auth_permission VALUES(15,5,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(16,6,'add_tag','Can add 标签');
INSERT INTO auth_permission VALUES(17,6,'change_tag','Can change 标签');
INSERT INTO auth_permission VALUES(18,6,'delete_tag','Can delete 标签');
INSERT INTO auth_permission VALUES(19,7,'add_article','Can add 文章');
INSERT INTO auth_permission VALUES(20,7,'change_article','Can change 文章');
INSERT INTO auth_permission VALUES(21,7,'delete_article','Can delete 文章');
INSERT INTO auth_permission VALUES(22,8,'add_category','Can add 分类');
INSERT INTO auth_permission VALUES(23,8,'change_category','Can change 分类');
INSERT INTO auth_permission VALUES(24,8,'delete_category','Can delete 分类');
INSERT INTO auth_permission VALUES(25,9,'add_links','Can add links');
INSERT INTO auth_permission VALUES(26,9,'change_links','Can change links');
INSERT INTO auth_permission VALUES(27,9,'delete_links','Can delete links');
INSERT INTO auth_permission VALUES(28,10,'add_bloguser','Can add 用户');
INSERT INTO auth_permission VALUES(29,10,'change_bloguser','Can change 用户');
INSERT INTO auth_permission VALUES(30,10,'delete_bloguser','Can delete 用户');
INSERT INTO auth_permission VALUES(31,11,'add_comment','Can add 评论');
INSERT INTO auth_permission VALUES(32,11,'change_comment','Can change 评论');
INSERT INTO auth_permission VALUES(33,11,'delete_comment','Can delete 评论');
CREATE TABLE IF NOT EXISTS "accounts_bloguser_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "bloguser_id" integer NOT NULL REFERENCES "accounts_bloguser" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));
CREATE TABLE IF NOT EXISTS "accounts_bloguser_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "bloguser_id" integer NOT NULL REFERENCES "accounts_bloguser" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_bloguser" ("id"), "action_time" datetime NOT NULL);
INSERT INTO django_admin_log VALUES(1,'1','旅游',1,'[{"added": {}}]',8,1,'2017-10-02 01:48:47.535810');
INSERT INTO django_admin_log VALUES(2,'2','美食',1,'[{"added": {}}]',8,1,'2017-10-02 01:48:54.722221');
INSERT INTO django_admin_log VALUES(3,'1','三亚游',1,'[{"added": {}}]',7,1,'2017-10-02 01:49:21.949778');
INSERT INTO django_admin_log VALUES(4,'2','丽江游',1,'[{"added": {}}]',7,1,'2017-10-02 01:49:40.995868');
INSERT INTO django_admin_log VALUES(5,'3','九寨沟游',1,'[{"added": {}}]',7,1,'2017-10-02 01:50:01.315789');
INSERT INTO django_admin_log VALUES(6,'4','张家界游',1,'[{"added": {}}]',7,1,'2017-10-02 01:50:43.506851');
INSERT INTO django_admin_log VALUES(7,'5','庐山游',1,'[{"added": {}}]',7,1,'2017-10-02 01:51:08.006885');
INSERT INTO django_admin_log VALUES(8,'1','旅游',2,'[]',8,1,'2017-10-02 07:59:15.940565');
INSERT INTO django_admin_log VALUES(9,'3','国内旅游',1,'[{"added": {}}]',8,1,'2017-10-02 07:59:28.590582');
INSERT INTO django_admin_log VALUES(10,'1','旅游',2,'[{"changed": {"fields": ["parent_category"]}}]',8,1,'2017-10-02 07:59:38.044713');
INSERT INTO django_admin_log VALUES(11,'1','good!!',1,'[{"added": {}}]',11,1,'2017-10-03 06:48:53.991755');
CREATE TABLE IF NOT EXISTS "blog_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "create_time" datetime NOT NULL, "last_mod_time" datetime NOT NULL, "parent_category_id" integer NULL REFERENCES "blog_category" ("id"));
INSERT INTO blog_category VALUES(1,'旅游','2017-10-02 01:48:47.534810','2017-10-02 07:59:38.044713',3);
INSERT INTO blog_category VALUES(2,'美食','2017-10-02 01:48:54.721221','2017-10-02 01:48:54.721221',NULL);
INSERT INTO blog_category VALUES(3,'国内旅游','2017-10-02 07:59:28.580582','2017-10-02 07:59:28.580582',NULL);
CREATE TABLE IF NOT EXISTS "blog_links" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "sequence" integer NOT NULL UNIQUE, "created_time" datetime NOT NULL, "last_mod_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "blog_tag" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "create_time" datetime NOT NULL, "last_mod_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "blog_article" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "body" text NOT NULL, "create_time" datetime NOT NULL, "last_mod_time" datetime NOT NULL, "pub_time" datetime NULL, "status" varchar(1) NOT NULL, "comment_status" varchar(1) NOT NULL, "type" varchar(1) NOT NULL, "views" integer unsigned NOT NULL, "author_id" integer NOT NULL REFERENCES "accounts_bloguser" ("id"), "category_id" integer NULL REFERENCES "blog_category" ("id"));
INSERT INTO blog_article VALUES(1,'三亚游','三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游三亚游','2017-10-02 01:49:21.947778','2017-10-02 01:49:21.947778','2017-10-02 01:49:14','p','o','a',3,1,1);
INSERT INTO blog_article VALUES(2,'丽江游','丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游丽江游','2017-10-02 01:49:40.993868','2017-10-02 01:49:40.993868','2017-10-02 01:49:36','p','o','a',7,1,1);
INSERT INTO blog_article VALUES(3,'九寨沟游','九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游九寨沟游','2017-10-02 01:50:01.315789','2017-10-02 01:50:01.315789','2017-10-02 01:49:55','p','o','a',7,1,1);
INSERT INTO blog_article VALUES(4,'张家界游','张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游张家界游','2017-10-02 01:50:43.506851','2017-10-02 01:50:43.506851','2017-10-02 01:50:31','p','o','a',10,1,1);
INSERT INTO blog_article VALUES(5,'庐山游','庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游庐山游','2017-10-02 01:51:08.006885','2017-10-02 01:51:08.006885','2017-10-02 01:51:02','p','o','a',54,1,1);
CREATE TABLE IF NOT EXISTS "blog_article_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "article_id" integer NOT NULL REFERENCES "blog_article" ("id"), "tag_id" integer NOT NULL REFERENCES "blog_tag" ("id"));
CREATE TABLE IF NOT EXISTS "comments_comment" ("created_time" datetime NOT NULL, "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "body" text NOT NULL, "last_mod_time" datetime NOT NULL, "article_id" integer NOT NULL REFERENCES "blog_article" ("id"), "author_id" integer NOT NULL REFERENCES "accounts_bloguser" ("id"), "parent_comment_id" integer NULL REFERENCES "comments_comment" ("id"));
INSERT INTO comments_comment VALUES('2017-10-03 06:48:40',1,'good!!','2017-10-03 06:48:53.990755',5,1,NULL);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('wx74924uz7laydf08u70kg4caf2tq59m','NTQxODNlN2QzZjE4Y2FmZTg3NjViNGJmODExMDg4Yjg5MWU3MmVjZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1ZjljZTVlOWExZjlhNjA2OTY4NTNjOTQzN2YyNmZmODQ5NTUyM2VkIn0=','2017-10-16 01:48:35.815140');
INSERT INTO django_session VALUES('2bwx2480odxixujb7foy82pnqf0bjayk','OGI1MTMyNzY2M2U1Y2IzNTJkZTNjY2RhYTFkYjczMGNiNDc2MzViNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWY5Y2U1ZTlhMWY5YTYwNjk2ODUzYzk0MzdmMjZmZjg0OTU1MjNlZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-10-16 07:59:01.714538');
INSERT INTO django_session VALUES('e0lr7y3zhtt7fqdkrgbamt9fvxyknwhs','NTQxODNlN2QzZjE4Y2FmZTg3NjViNGJmODExMDg4Yjg5MWU3MmVjZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1ZjljZTVlOWExZjlhNjA2OTY4NTNjOTQzN2YyNmZmODQ5NTUyM2VkIn0=','2017-10-17 05:22:37.779985');
INSERT INTO django_session VALUES('iijypoexoid3kfuvunitf98z3zjtatp9','ZmFkMWYyYjFhZmE3MGM4ODU5M2FjMDYyOTY4NDllNzJiODcyMjNmODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZjljZTVlOWExZjlhNjA2OTY4NTNjOTQzN2YyNmZmODQ5NTUyM2VkIn0=','2017-10-17 06:48:33.791600');
INSERT INTO django_session VALUES('s7w5vn9bbtnxgz6ri8qrq5znyjf5w62x','YjY5YTI4Y2E5ZDUxZWJlMWVmZGQ2NGVjNmFlYTAyMzJjMTgyZTI0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmOWNlNWU5YTFmOWE2MDY5Njg1M2M5NDM3ZjI2ZmY4NDk1NTIzZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-17 07:42:46.129921');
CREATE TABLE IF NOT EXISTS "accounts_bloguser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "nickname" varchar(50) NOT NULL, "mugshot" varchar(100) NOT NULL);
INSERT INTO accounts_bloguser VALUES(1,'pbkdf2_sha256$36000$FXpQi9v7VM2x$qzXjuwcxdS8CKWF62Ej+wKk/BcLKc3qEHuID09c1lEw=','2017-10-03 07:42:46.019921',1,'root','','','kyo.stone2015@gmail.com',1,1,'2017-10-02 01:48:03.727599','','');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',20);
INSERT INTO sqlite_sequence VALUES('django_content_type',11);
INSERT INTO sqlite_sequence VALUES('auth_permission',33);
INSERT INTO sqlite_sequence VALUES('django_admin_log',11);
INSERT INTO sqlite_sequence VALUES('blog_article',5);
INSERT INTO sqlite_sequence VALUES('blog_category',3);
INSERT INTO sqlite_sequence VALUES('accounts_bloguser',1);
INSERT INTO sqlite_sequence VALUES('comments_comment',1);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "accounts_bloguser_groups_bloguser_id_group_id_fc37e89b_uniq" ON "accounts_bloguser_groups" ("bloguser_id", "group_id");
CREATE INDEX "accounts_bloguser_groups_bloguser_id_a16ccbb7" ON "accounts_bloguser_groups" ("bloguser_id");
CREATE INDEX "accounts_bloguser_groups_group_id_98d76804" ON "accounts_bloguser_groups" ("group_id");
CREATE UNIQUE INDEX "accounts_bloguser_user_permissions_bloguser_id_permission_id_14808777_uniq" ON "accounts_bloguser_user_permissions" ("bloguser_id", "permission_id");
CREATE INDEX "accounts_bloguser_user_permissions_bloguser_id_7e1b5742" ON "accounts_bloguser_user_permissions" ("bloguser_id");
CREATE INDEX "accounts_bloguser_user_permissions_permission_id_ae5159b9" ON "accounts_bloguser_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE INDEX "blog_category_parent_category_id_f50c3c0c" ON "blog_category" ("parent_category_id");
CREATE INDEX "blog_article_author_id_905add38" ON "blog_article" ("author_id");
CREATE INDEX "blog_article_category_id_7e38f15e" ON "blog_article" ("category_id");
CREATE UNIQUE INDEX "blog_article_tags_article_id_tag_id_b78a22e9_uniq" ON "blog_article_tags" ("article_id", "tag_id");
CREATE INDEX "blog_article_tags_article_id_82c02dd6" ON "blog_article_tags" ("article_id");
CREATE INDEX "blog_article_tags_tag_id_88eb3ed9" ON "blog_article_tags" ("tag_id");
CREATE INDEX "comments_comment_article_id_94fe60a2" ON "comments_comment" ("article_id");
CREATE INDEX "comments_comment_author_id_334ce9e2" ON "comments_comment" ("author_id");
CREATE INDEX "comments_comment_parent_comment_id_71289d4a" ON "comments_comment" ("parent_comment_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;