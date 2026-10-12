-- Run this once in MySQL Workbench to create the demo database and sample data.
CREATE DATABASE IF NOT EXISTS ebookshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ebookshop;

CREATE TABLE IF NOT EXISTS user_info (
  emailid VARCHAR(190) PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  address VARCHAR(255) NOT NULL,
  security_quest VARCHAR(255) NOT NULL,
  security_ans VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS login (
  userid VARCHAR(190) PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  usertype ENUM('Admin', 'Normal') NOT NULL DEFAULT 'Normal',
  CONSTRAINT fk_login_user FOREIGN KEY (userid) REFERENCES user_info(emailid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cat_subcat (
  category_name VARCHAR(80) NOT NULL,
  scategory_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (category_name, scategory_name)
);

CREATE TABLE IF NOT EXISTS books (
  bid INT AUTO_INCREMENT PRIMARY KEY,
  bname VARCHAR(180) NOT NULL,
  bpublication VARCHAR(180) NOT NULL,
  bdetail TEXT NOT NULL,
  bcost DECIMAL(10,2) NOT NULL,
  cover_image LONGBLOB NULL,
  bcategory VARCHAR(80) NOT NULL,
  bsubcategory VARCHAR(100) NOT NULL
);

INSERT IGNORE INTO user_info (emailid, name, address, security_quest, security_ans)
VALUES ('admin@ebookshop.local', 'Demo Administrator', 'College Demo', 'What is your first school name?', 'demo');
INSERT IGNORE INTO login (userid, password, usertype)
VALUES ('admin@ebookshop.local', 'admin123', 'Admin');

INSERT IGNORE INTO cat_subcat (category_name, scategory_name) VALUES
('Engineering', 'Civil Engineering'),
('Engineering', 'Computer Engineering'),
('Engineering', 'Mechanical Engineering'),
('Magazines', 'General');

INSERT INTO books (bname, bpublication, bdetail, bcost, bcategory, bsubcategory)
SELECT 'Introduction to Computer Science', 'Demo Publications', 'A sample catalog entry for the college presentation.', 450.00, 'Engineering', 'Computer Engineering'
WHERE NOT EXISTS (SELECT 1 FROM books WHERE bname = 'Introduction to Computer Science');
INSERT INTO books (bname, bpublication, bdetail, bcost, bcategory, bsubcategory)
SELECT 'Engineering Mechanics', 'Demo Publications', 'A sample mechanics book for the college presentation.', 520.00, 'Engineering', 'Mechanical Engineering'
WHERE NOT EXISTS (SELECT 1 FROM books WHERE bname = 'Engineering Mechanics');
INSERT INTO books (bname, bpublication, bdetail, bcost, bcategory, bsubcategory)
SELECT 'Basics of Civil Engineering', 'Demo Publications', 'A sample civil engineering book for the college presentation.', 390.00, 'Engineering', 'Civil Engineering'
WHERE NOT EXISTS (SELECT 1 FROM books WHERE bname = 'Basics of Civil Engineering');
INSERT INTO books (bname, bpublication, bdetail, bcost, bcategory, bsubcategory)
SELECT 'Campus Science Monthly', 'College Demo Press', 'A sample magazine for the college presentation.', 90.00, 'Magazines', 'General'
WHERE NOT EXISTS (SELECT 1 FROM books WHERE bname = 'Campus Science Monthly');
