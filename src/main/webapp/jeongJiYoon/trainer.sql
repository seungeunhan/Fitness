-- health 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `health` /*!40100 DEFAULT CHARACTER SET euckr */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `health`;

-- 테이블 health.location 구조 내보내기
CREATE TABLE IF NOT EXISTS `location` (
  `num` int NOT NULL,
  `id` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '아이디',
  `postnum` varchar(10) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '헬스장 주소',
  `city` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '헬스장 주소',
  `streetaddr` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '헬스장 주소',
  `parking` tinyint(1) DEFAULT NULL COMMENT '헬스장 주차가능 여부',
  `size` int DEFAULT NULL COMMENT '수용인원',
  `callnum` varchar(20) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '헬스장 전화번호',
  `companyinfo` text CHARACTER SET euckr COLLATE euckr_korean_ci COMMENT '헬스장 사업자 등록 번호',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 health.location:~3 rows (대략적) 내보내기
INSERT INTO `location` (`num`, `id`, `postnum`, `city`, `streetaddr`, `parking`, `size`, `callnum`, `companyinfo`) VALUES
	(1, 'aaa', '12345', '서울', 'ㄴㄴ구 1번길', 1, 50, '051-123-4567', '000-12-34567'),
	(2, 'aaa', '56789', '서울', 'ㅇㅇ구 1번길', 0, 30, '051-456-7890', '000-12-34567'),
	(3, 'aaa', '34567', '부산', 'ㅁㅁ구 2번길', 1, 40, '051-123-4567', '000-12-34567');

-- 테이블 health.trainer 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer` (
  `num` int NOT NULL,
  `user` int DEFAULT NULL COMMENT '사용자',
  `imgname` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '파일명',
  `imgsname` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '서버에 저장되는 파일명',
  `fileext` varchar(10) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '확장자',
  `career` varchar(255) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '경력',
  `salary` int DEFAULT NULL COMMENT '기본 급여',
  PRIMARY KEY (`num`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 health.trainer:~3 rows (대략적) 내보내기
INSERT INTO `trainer` (`num`, `user`, `imgname`, `imgsname`, `fileext`, `career`, `salary`) VALUES
	(1, 1, 'UI-UW-03(1)', 'UI-UW-03(1)', '.jpg', '생활 스포츠지도사 2급', 300),
	(2, 2, 'UI-UW-03(2)', 'UI-UW-03(2)', '.jpg', '한국 피트니스 지도자', 350),
	(3, 3, 'UI-UW-03(3)', 'UI-UW-03(3)', '.jpg', '스포츠 마사지 1급', 400);