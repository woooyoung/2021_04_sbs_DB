# DB 생성
DROP DATABASE IF EXISTS text_board;
CREATE DATABASE text_board;

# DB 선택
USE text_board;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(200) NOT NULL
);

#임시 회원
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = SHA2('test1',256),
`name` = '홍길동';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = SHA2('test2',256),
`name` = '홍길순';


#게시물 테이블에 memberId 칼럼 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

#게시물 테이블에 memberId 칼럼 추가
ALTER TABLE article ADD COLUMN hit INT(10) UNSIGNED NOT NULL AFTER `body`;

ALTER TABLE article MODIFY COLUMN hit INT(10) UNSIGNED NOT NULL DEFAULT '0';

#게시물 추가
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1',
memberId = 1,
hit = 5;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2',
memberId = 1,
hit = 4;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3',
memberId = 2,
hit = 3;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4',
memberId = 2,
hit = 2;


DESC article;
SELECT * FROM article;
SELECT * FROM `member`;