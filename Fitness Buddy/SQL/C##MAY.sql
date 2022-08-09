/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Host           : localhost:1521
 Source Schema         : C##MAY

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 09/08/2022 10:13:16
*/


-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "C##MAY"."USERS";
CREATE TABLE "C##MAY"."USERS" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "USERNAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "FIRST_NAME" VARCHAR2(50 BYTE) VISIBLE,
  "LAST_NAME" VARCHAR2(50 BYTE) VISIBLE,
  "WEIGHT" FLOAT(126) VISIBLE,
  "HEIGHT" FLOAT(126) VISIBLE,
  "DATE_OF_BIRTH" VARCHAR2(50 BYTE) VISIBLE,
  "GENDER" CHAR(1 BYTE) VISIBLE,
  "EMAIL" VARCHAR2(50 BYTE) VISIBLE NOT NULL,
  "PASSWORD" VARCHAR2(32 BYTE) VISIBLE NOT NULL,
  "BMI" NUMBER(4,2) VISIBLE,
  "BMR" NUMBER(6,2) VISIBLE,
  "MOVEMENT" NUMBER VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "C##MAY"."USERS" VALUES ('10', 'nanh', 'Nazmun', 'Nahar', '66', '60', '14-Apr-1969', 'F', 'nazmuntony@gmail.com', '1234', NULL, NULL, NULL);
INSERT INTO "C##MAY"."USERS" VALUES ('0', 'st91', 'Sadia', 'Tabassum', '48', '60', '10-Jul-2000', 'F', 'sadia0591@gmail.com', '123', '20.67', '1607.99', '1');
INSERT INTO "C##MAY"."USERS" VALUES ('2', 'scorp65', 'Shafin', 'Sowdagor', '85', '68', '10-Nov-2000', 'M', 'sowdagorshafin@gmail.com', 'abcd', '28.49', '2343.18', '1');
INSERT INTO "C##MAY"."USERS" VALUES ('7', 'lara62', 'Lara', 'Khan', '45', '63', '19-Sep-2000', 'F', 'lara62@gmail.com', '1234', NULL, NULL, NULL);
INSERT INTO "C##MAY"."USERS" VALUES ('12', 'mrashid_5919', 'Mayesha', 'Rashid', '83', '63', '15-11-1999', 'F', 'mayesha1599@gmail.com', '1234', NULL, NULL, NULL);

-- ----------------------------
-- Sequence structure for USER_SEQUENCE
-- ----------------------------
DROP SEQUENCE "C##MAY"."USER_SEQUENCE";
CREATE SEQUENCE "C##MAY"."USER_SEQUENCE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007975" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007976" UNIQUE ("USERNAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007977" UNIQUE ("EMAIL") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007972" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007973" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C007974" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table USERS
-- ----------------------------
CREATE TRIGGER "C##MAY"."USER_BIN" BEFORE INSERT ON "C##MAY"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
IF :NEW.USER_ID IS NULL
THEN
:NEW.USER_ID:=USER_SEQUENCE.NEXTVAL;
END IF;
END;


--DROP SEQUENCE USER_SEQUENCE;
