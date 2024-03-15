CREATE TABLE `Student` (
  `Id_No` integer PRIMARY KEY,
  `Name` varchar(255),
  `Email` varchar(255),
  `Mobile` integer,
  `language` varchar(255),
  `course` varchar(255),
  `Batch` varchar(255),
  `Task` varchar(255),
  `Session` varchar(255),
  `Quries` varchar(255),
  `Attentence` bool,
  `leave_application` varchar(255),
  `Dashboard` varchar(255)
);

CREATE TABLE `Co_ordinator` (
  `Co_ordinator_id` integer PRIMARY KEY,
  `Co_ordinator_name` varchar(255),
  `Mentor_id` integer,
  `student_id` integer,
  `Session_allocation` varchar(255),
  `Session_timing` timestamp,
  `Query_Assesment` varchar(255),
  `Task_Overview` varchar(255),
  `placement` varchar(255),
  `Attentence` varchar(255),
  `mock_interview` varchar(255),
  `test` varchar(255)
);

CREATE TABLE `Mentor` (
  `Mentor_id` integer PRIMARY KEY,
  `Mentor_name` varchar(255),
  `email` varchar(255),
  `Phone` integer,
  `gendar` varchar(255),
  `Exprience` integer,
  `specalist` varchar(255),
  `Available_time` timestamp,
  `session` varchar(255),
  `language` varchar(255),
  `isQuerySolve` bool
);

CREATE TABLE `dashboard` (
  `student_id` integer PRIMARY KEY,
  `Co_ordinator_id` integer,
  `Completed_tasks` integer,
  `Bending_tasks` integer,
  `interview_mark` integer
);

CREATE TABLE `Course` (
  `course_id` integer PRIMARY KEY,
  `course_name` varchar(255),
  `students_id` integer,
  `Mentor_id` integer,
  `Co_ordinator_id` integer,
  `duration` integer,
  `certificate` varchar(255)
);

CREATE TABLE `Quries` (
  `Quries_id` integer PRIMARY KEY,
  `student_id` integer,
  `co_ordinator_id` integer,
  `language` varchar(255),
  `quriey_title` varchar(255),
  `session_quries` varchar(255),
  `placement_quries` varchar(255),
  `co_ordination_quires` varchar(255),
  `pre_boor_quries` varchar(255),
  `time_allocation` timestamp
);

CREATE TABLE `session` (
  `session_id` integer PRIMARY KEY,
  `course_id` integer,
  `student_id` integer,
  `co_ordinator_id` integer,
  `session_day` integer,
  `addional_session` varchar(255),
  `Placement_session` varchar(255),
  `Doubt_clarification_session` varchar(255)
);

CREATE TABLE `tasks` (
  `student_id` integer PRIMARY KEY,
  `co_ordinator_id` integer,
  `Mentor_id` integer,
  `course_id` integer,
  `No_of_tasks` integer,
  `completed_tasks` integer,
  `bending_tasks` integer,
  `Completed_codeKata` integer,
  `Completed_webkata` integer
);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `dashboard` (`student_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `Co_ordinator` (`Co_ordinator_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `session` (`session_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `tasks` (`student_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`Id_No`) REFERENCES `Quries` (`Quries_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `Mentor` (`Mentor_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `dashboard` (`student_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `Quries` (`Quries_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `session` (`session_id`);

ALTER TABLE `Co_ordinator` ADD FOREIGN KEY (`Co_ordinator_id`) REFERENCES `tasks` (`student_id`);

ALTER TABLE `tasks` ADD FOREIGN KEY (`student_id`) REFERENCES `Mentor` (`Mentor_id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`course_id`) REFERENCES `Mentor` (`Mentor_id`);
