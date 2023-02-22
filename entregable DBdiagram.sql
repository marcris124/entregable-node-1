CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "last_name" varchar(30),
  "email" text NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" int
);

CREATE TABLE "course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" text,
  "description" text,
  "level" int NOT NULL,
  "teacher" int NOT NULL,
  "categorie_fk" int NOT NULL,
  "type" int NOT NULL,
  "price" int
);

CREATE TABLE "course_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" text,
  "url" text,
  "duration" int
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(25)
);

CREATE TABLE "video_per_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_fk" int NOT NULL,
  "video_fk" int
);

CREATE TABLE "users_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_fk" int,
  "course_video_fk" int NOT NULL,
  "state" int NOT NULL
);

CREATE TABLE "roles_users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_fk" int NOT NULL,
  "role_fk" int NOT NULL
);

CREATE TABLE "level" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level" varchar(20)
);

CREATE TABLE "course_state" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "state" varchar(20)
);

CREATE TABLE "type_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "type" varchar(15)
);

CREATE TABLE "teachers" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30),
  "last_name" varchar(25),
  "email" text,
  "age" int
);

ALTER TABLE "video_per_course" ADD FOREIGN KEY ("course_fk") REFERENCES "course" ("id");

ALTER TABLE "video_per_course" ADD FOREIGN KEY ("video_fk") REFERENCES "course_video" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_fk") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_video_fk") REFERENCES "video_per_course" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("categorie_fk") REFERENCES "categories" ("id");

ALTER TABLE "roles_users" ADD FOREIGN KEY ("user_fk") REFERENCES "users" ("id");

ALTER TABLE "roles_users" ADD FOREIGN KEY ("role_fk") REFERENCES "roles" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("level") REFERENCES "level" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("state") REFERENCES "course_state" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("type") REFERENCES "type_course" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("teacher") REFERENCES "teachers" ("id");
