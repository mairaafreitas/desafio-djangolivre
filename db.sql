BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "transferencia_transferencia" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"favorecido_id"	bigint NOT NULL,
	"valor"	decimal NOT NULL,
	"data"	datetime NOT NULL,
	"remetente_id"	bigint NOT NULL,
	FOREIGN KEY("remetente_id") REFERENCES "conta_conta"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("favorecido_id") REFERENCES "conta_conta"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "usuario_usuario" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nome"	varchar(80) NOT NULL,
	"cpf"	varchar(11) NOT NULL,
	"data_nascimento"	date NOT NULL,
	"telefone"	varchar(11) NOT NULL,
	"conta_id"	bigint NOT NULL,
	FOREIGN KEY("conta_id") REFERENCES "conta_conta"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "conta_conta" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"agencia"	varchar(4) NOT NULL,
	"saldo"	decimal NOT NULL,
	"conta"	varchar(6) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "transferencia_transferencia" ("id","favorecido_id","valor","data","remetente_id") VALUES (1,9,10.5,'2021-12-03 00:31:34.258664',4),
 (2,6,350,'2021-12-03 00:34:54.418893',2),
 (3,6,50,'2021-12-03 00:36:19.691960',2),
 (4,2,100,'2021-12-03 00:43:03.556764',6),
 (5,10,155,'2021-12-03 00:45:43.376690',5),
 (6,7,160.55,'2021-12-03 00:50:09.372086',3),
 (7,10,50,'2021-12-03 00:51:17.064593',4),
 (8,1,98.55,'2021-12-03 00:52:50.899072',6),
 (9,9,199.75,'2021-12-03 00:55:14.426972',7),
 (10,1,151,'2021-12-03 00:56:21.724856',6),
 (11,1,50,'2021-12-03 01:08:51.970545',5),
 (12,4,65.25,'2021-12-03 01:11:17.417754',9),
 (13,7,65.25,'2021-12-03 01:11:50.111684',6),
 (14,11,50,'2021-12-03 01:17:47.672953',12),
 (15,13,75,'2021-12-03 01:18:28.451841',11),
 (16,13,125,'2021-12-03 01:19:45.549598',12);
INSERT INTO "usuario_usuario" ("id","nome","cpf","data_nascimento","telefone","conta_id") VALUES (1,'Bruna dos Santos','89454758213','1990-05-20','47988526321',1),
 (2,'Marcelo Junior','8945475825','1993-05-10','21984426321',7),
 (3,'Junior Oliveira','585474125','2000-12-01','55988563214',6),
 (4,'Claudia Prudencio','585474435','1998-11-05','55988563214',9),
 (5,'Francisca Amaral','5845874435','1994-10-14','55988563214',5),
 (6,'Caetano Veloso','5842374435','1965-08-12','55988545214',2),
 (7,'Patricia Bruns','5842374435','1985-08-12','71988545214',3),
 (8,'Samanta Bruns','58002374435','1966-08-12','71988545000',4),
 (9,'Paulo Flores','524748541','1954-05-05','41988547412',10),
 (10,'Katia da Cunha','5874748541','2008-10-10','41988547412',8),
 (11,'João Feitosa','5847365241','2002-04-10','48988562411',11),
 (12,'Paula Gael','5847365241','1985-06-10','48988562400',12),
 (13,'Francielle Finger','5847365241','1985-06-10','48988562400',13);
INSERT INTO "conta_conta" ("id","agencia","saldo","conta") VALUES (1,'0001',449.55,'52540'),
 (2,'0001',350.5,'720231'),
 (3,'0001',9839.45,'147664'),
 (4,'0001',1840.5,'722801'),
 (5,'0001',382.45,'360463'),
 (6,'0001',6135.95,'95264'),
 (7,'0001',15376.25,'515738'),
 (8,'0001',1047.55,'844406'),
 (9,'0001',222.45,'569811'),
 (10,'0001',205.25,'998457'),
 (11,'0001',475,'543219'),
 (12,'0001',715.75,'166750'),
 (13,'0001',1150.5,'485679');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_usuario','Can add usuario'),
 (26,7,'change_usuario','Can change usuario'),
 (27,7,'delete_usuario','Can delete usuario'),
 (28,7,'view_usuario','Can view usuario'),
 (29,8,'add_transferencia','Can add transferencia'),
 (30,8,'change_transferencia','Can change transferencia'),
 (31,8,'delete_transferencia','Can delete transferencia'),
 (32,8,'view_transferencia','Can view transferencia'),
 (33,9,'add_conta','Can add conta'),
 (34,9,'change_conta','Can change conta'),
 (35,9,'delete_conta','Can delete conta'),
 (36,9,'view_conta','Can view conta');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'usuario','usuario'),
 (8,'transferencia','transferencia'),
 (9,'conta','conta');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2021-12-02 02:09:01.683565'),
 (2,'auth','0001_initial','2021-12-02 02:09:01.717246'),
 (3,'admin','0001_initial','2021-12-02 02:09:01.740910'),
 (4,'admin','0002_logentry_remove_auto_add','2021-12-02 02:09:01.760560'),
 (5,'admin','0003_logentry_add_action_flag_choices','2021-12-02 02:09:01.782559'),
 (6,'contenttypes','0002_remove_content_type_name','2021-12-02 02:09:01.808635'),
 (7,'auth','0002_alter_permission_name_max_length','2021-12-02 02:09:01.825169'),
 (8,'auth','0003_alter_user_email_max_length','2021-12-02 02:09:01.850598'),
 (9,'auth','0004_alter_user_username_opts','2021-12-02 02:09:01.871111'),
 (10,'auth','0005_alter_user_last_login_null','2021-12-02 02:09:01.891141'),
 (11,'auth','0006_require_contenttypes_0002','2021-12-02 02:09:01.901445'),
 (12,'auth','0007_alter_validators_add_error_messages','2021-12-02 02:09:01.920922'),
 (13,'auth','0008_alter_user_username_max_length','2021-12-02 02:09:01.940156'),
 (14,'auth','0009_alter_user_last_name_max_length','2021-12-02 02:09:01.959283'),
 (15,'auth','0010_alter_group_name_max_length','2021-12-02 02:09:01.980110'),
 (16,'auth','0011_update_proxy_permissions','2021-12-02 02:09:01.994041'),
 (17,'auth','0012_alter_user_first_name_max_length','2021-12-02 02:09:02.016822'),
 (18,'conta','0001_initial','2021-12-02 02:09:02.024308'),
 (19,'conta','0002_alter_conta_conta','2021-12-02 02:09:02.038006'),
 (20,'conta','0003_auto_20211130_2010','2021-12-02 02:09:02.053424'),
 (21,'conta','0004_alter_conta_conta','2021-12-02 02:09:02.068578'),
 (22,'sessions','0001_initial','2021-12-02 02:09:02.083757'),
 (23,'usuario','0001_initial','2021-12-02 02:09:02.102249'),
 (24,'transferencia','0001_initial','2021-12-02 02:09:02.119521'),
 (25,'transferencia','0002_transferencia_valor','2021-12-02 02:09:02.133806'),
 (26,'transferencia','0003_transferencia_data','2021-12-02 23:59:42.385662'),
 (27,'transferencia','0004_auto_20211202_1937','2021-12-02 23:59:42.406895');
CREATE INDEX IF NOT EXISTS "transferencia_transferencia_remetente_id_33be7027" ON "transferencia_transferencia" (
	"remetente_id"
);
CREATE INDEX IF NOT EXISTS "transferencia_transferencia_favorecido_id_53fc2c30" ON "transferencia_transferencia" (
	"favorecido_id"
);
CREATE INDEX IF NOT EXISTS "usuario_usuario_conta_id_eafcaa7e" ON "usuario_usuario" (
	"conta_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
