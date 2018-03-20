DROP TABLE Registration;
DROP TABLE Course;
DROP TABLE Account;
DROP TABLE Student;
DROP TABLE Department;

-- �w��
CREATE TABLE Department (
	id		serial	PRIMARY	KEY,
	code		varchar(2) NOT NULL UNIQUE,
	name		varchar(128) NOT NULL
);

-- �w��
CREATE TABLE Student (
	id		serial	PRIMARY	KEY,
	no		varchar(6) NOT NULL UNIQUE,
	name		varchar(128) NOT NULL,
	department_id	integer NOT NULL REFERENCES Department(id)
);

-- �R���s���[�^�[�A�J�E���g
CREATE TABLE Account (
	student_id	integer PRIMARY KEY REFERENCES Student(id),
	username	varchar(32) NOT NULL UNIQUE,
	password	varchar(32) NOT NULL
);

-- ����
CREATE TABLE Course (
	id	serial	PRIMARY	KEY,
	code	varchar(5) NOT NULL UNIQUE,
	name	varchar(128) NOT NULL
);

-- ���C
CREATE TABLE Registration (
	student_id	integer REFERENCES Student(id),
	course_id	integer REFERENCES Course(id),
	PRIMARY KEY (student_id, course_id)
);


INSERT INTO Department(code, name) VALUES('10', '���w��');
INSERT INTO Department(code, name) VALUES('20', '�o�ϊw��');
INSERT INTO Department(code, name) VALUES('30', '�o�c�w��');
INSERT INTO Department(code, name) VALUES('40', '�Љ�w��');
INSERT INTO Department(code, name) VALUES('50', '���H�w��');
INSERT INTO Student(no, name, department_id) VALUES('10-001', 'Alan Mathison Turing', 1);
INSERT INTO Student(no, name, department_id) VALUES('20-001', 'Brian Kernighan', 2);
INSERT INTO Student(no, name, department_id) VALUES('20-002', 'Charles Babbage', 2);
INSERT INTO Student(no, name, department_id) VALUES('20-003', 'Dennis Ritchie', 2);
INSERT INTO Student(no, name, department_id) VALUES('30-001', 'Edsger Wybe Dijkstra', 3);
INSERT INTO Account(student_id, username, password) VALUES(1, 'alan', 'enigma');
INSERT INTO Account(student_id, username, password) VALUES(3, 'charles', 'diffengine');
INSERT INTO Account(student_id, username, password) VALUES(5, 'edsger', 'sturucture');
INSERT INTO Course(code, name) VALUES('10001', '�v�Z�@�v���O�����̃R�E�]�E�Ɖ���');
INSERT INTO Course(code, name) VALUES('10002', '�v���O�}�e�B�b�N�E�v���O���~���O');
INSERT INTO Course(code, name) VALUES('10003', '�f�U�C���p�^�[�� ����');
INSERT INTO Course(code, name) VALUES('10004', '���p P of EAA');
INSERT INTO Course(code, name) VALUES('10005', '���|�I�v���O���~���O');
INSERT INTO Registration(student_id, course_id) VALUES(1, 5);
INSERT INTO Registration(student_id, course_id) VALUES(1, 1);
INSERT INTO Registration(student_id, course_id) VALUES(1, 2);
INSERT INTO Registration(student_id, course_id) VALUES(2, 1);
INSERT INTO Registration(student_id, course_id) VALUES(2, 2);
INSERT INTO Registration(student_id, course_id) VALUES(2, 3);
INSERT INTO Registration(student_id, course_id) VALUES(3, 2);
INSERT INTO Registration(student_id, course_id) VALUES(3, 3);
INSERT INTO Registration(student_id, course_id) VALUES(3, 4);
INSERT INTO Registration(student_id, course_id) VALUES(4, 3);
INSERT INTO Registration(student_id, course_id) VALUES(4, 4);
INSERT INTO Registration(student_id, course_id) VALUES(4, 5);
INSERT INTO Registration(student_id, course_id) VALUES(5, 4);
INSERT INTO Registration(student_id, course_id) VALUES(5, 5);
INSERT INTO Registration(student_id, course_id) VALUES(5, 1);

