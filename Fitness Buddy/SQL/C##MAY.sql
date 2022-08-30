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

 Date: 31/08/2022 05:38:05
*/


-- ----------------------------
-- Table structure for CONSISTS
-- ----------------------------
DROP TABLE "C##MAY"."CONSISTS";
CREATE TABLE "C##MAY"."CONSISTS" (
  "ELOG_ID" NUMBER VISIBLE,
  "EXERCISE_ID" NUMBER VISIBLE,
  "EXERCISE_DURATION" NUMBER(6,2) VISIBLE
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
-- Records of CONSISTS
-- ----------------------------
INSERT INTO "C##MAY"."CONSISTS" VALUES ('1', '2', '15');
INSERT INTO "C##MAY"."CONSISTS" VALUES ('2', '2', '10');
INSERT INTO "C##MAY"."CONSISTS" VALUES ('3', '2', '10');

-- ----------------------------
-- Table structure for CONTAINS
-- ----------------------------
DROP TABLE "C##MAY"."CONTAINS";
CREATE TABLE "C##MAY"."CONTAINS" (
  "MEAL_ID" NUMBER VISIBLE,
  "ITEM_ID" NUMBER VISIBLE,
  "QUANTITY" NUMBER(6,2) VISIBLE
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
-- Records of CONTAINS
-- ----------------------------
INSERT INTO "C##MAY"."CONTAINS" VALUES ('43', '1', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('44', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('64', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('81', '8', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('101', '7', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('62', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('67', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('125', '1', '0.8');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('126', '1', '0.8');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('23', '1', '0.5');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('23', '3', '2');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('41', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('66', '1', '0.5');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('122', '1', '0.8');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('42', '1', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('61', '1', '0.8');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('65', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('81', '1', '0.8');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('121', '3', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('123', '8', '1');
INSERT INTO "C##MAY"."CONTAINS" VALUES ('124', '5', '1');

-- ----------------------------
-- Table structure for DIET_TYPE
-- ----------------------------
DROP TABLE "C##MAY"."DIET_TYPE";
CREATE TABLE "C##MAY"."DIET_TYPE" (
  "DIET" NUMBER VISIBLE NOT NULL,
  "CARB" NUMBER VISIBLE,
  "PROTEIN" NUMBER VISIBLE,
  "FAT" NUMBER VISIBLE
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
-- Records of DIET_TYPE
-- ----------------------------
INSERT INTO "C##MAY"."DIET_TYPE" VALUES ('0', '50', '25', '25');
INSERT INTO "C##MAY"."DIET_TYPE" VALUES ('1', '10', '25', '65');
INSERT INTO "C##MAY"."DIET_TYPE" VALUES ('2', '40', '35', '25');
INSERT INTO "C##MAY"."DIET_TYPE" VALUES ('3', '55', '25', '20');

-- ----------------------------
-- Table structure for EXERCISES
-- ----------------------------
DROP TABLE "C##MAY"."EXERCISES";
CREATE TABLE "C##MAY"."EXERCISES" (
  "EXERCISE_ID" NUMBER VISIBLE NOT NULL,
  "EXERCISE_NAME" VARCHAR2(255 BYTE) VISIBLE,
  "CALORIE_BURN" NUMBER(8,4) VISIBLE,
  "QUANTITY" NUMBER VISIBLE,
  "UNIT" VARCHAR2(255 BYTE) VISIBLE
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
-- Records of EXERCISES
-- ----------------------------
INSERT INTO "C##MAY"."EXERCISES" VALUES ('1', 'Normal Walking (3 mph)', '1.23', '20', 'Minute');
INSERT INTO "C##MAY"."EXERCISES" VALUES ('2', 'Slow Walking (2.5 mph)', '1.05', '20', 'Minute');
INSERT INTO "C##MAY"."EXERCISES" VALUES ('3', 'Fast Walking (3.5 mph)', '1.51', '20', 'Minute');
INSERT INTO "C##MAY"."EXERCISES" VALUES ('4', 'Very Fast Walking (4.0 mph)', '1.75', '20', 'Minute');

-- ----------------------------
-- Table structure for EXERCISE_LOG
-- ----------------------------
DROP TABLE "C##MAY"."EXERCISE_LOG";
CREATE TABLE "C##MAY"."EXERCISE_LOG" (
  "ELOG_ID" NUMBER VISIBLE NOT NULL,
  "EXERCISE_DATE" DATE VISIBLE,
  "USER_ID" NUMBER VISIBLE
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
-- Records of EXERCISE_LOG
-- ----------------------------
INSERT INTO "C##MAY"."EXERCISE_LOG" VALUES ('2', TO_DATE('2022-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '61');
INSERT INTO "C##MAY"."EXERCISE_LOG" VALUES ('3', TO_DATE('2022-08-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."EXERCISE_LOG" VALUES ('1', TO_DATE('2022-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');

-- ----------------------------
-- Table structure for FOOD_ITEMS
-- ----------------------------
DROP TABLE "C##MAY"."FOOD_ITEMS";
CREATE TABLE "C##MAY"."FOOD_ITEMS" (
  "ITEM_ID" NUMBER VISIBLE NOT NULL,
  "ITEM_NAME" VARCHAR2(255 BYTE) VISIBLE,
  "CALORIE" NUMBER(6,2) VISIBLE,
  "CARBS" NUMBER(6,2) VISIBLE,
  "FAT" NUMBER(6,2) VISIBLE,
  "PROTEIN" NUMBER(6,2) VISIBLE,
  "VITAMIN_C" NUMBER(6,2) VISIBLE,
  "IRON" NUMBER(6,2) VISIBLE,
  "SODIUM" NUMBER(6,2) VISIBLE,
  "SUGAR" NUMBER(6,2) VISIBLE,
  "DIETARY_FIBER" NUMBER(6,2) VISIBLE,
  "MEASURE_QUANTITY" NUMBER(6,2) VISIBLE,
  "MEASURE_UNIT" VARCHAR2(100 BYTE) VISIBLE
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
-- Records of FOOD_ITEMS
-- ----------------------------
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('3', 'Boiled Egg', '78', '0.6', '5', '6', '0', '0.6', '62', '1', '0', '1', 'Large');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('25', 'Grilled Chicken', '147', '0', '8.36', '16.79', '0', '0.77', '251', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('1', 'Boiled Rice', '170', '38', '0', '4', '0', '2.86', '3.16', '0.1', '1.42', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('4', 'Lentil-Daal', '116', '20', '0.4', '9', '1.5', '3.3', '2', '2', '8', '100', 'Grams');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('5', 'Mixed Vegetables', '147', '23.19', '3.86', '5.06', '5.6', '1.46', '453', '5.57', '7.8', '100', 'Grams');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('6', 'Chicken Curry', '140', '6', '4', '20', '5.1', '0.94', '484', '2.07', '0.9', '2', 'Medium Pieces');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('7', 'Paratha', '230', '37', '8', '2', '0', '0', '305', '1', '3', '1', 'Piece (Large)');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('8', 'Egg Omelette', '93', '0.42', '7.33', '6.48', '0', '0.94', '155', '0.2', '0', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('9', 'Roti', '120', '18', '4', '3', '0', '0', '119', '1', '0.4', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('10', 'Orange Juice', '112', '25.79', '0.5', '1.74', '124', '0.5', '2', '20.83', '0.5', '1', 'Glass');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('11', 'Lemon Juice', '12', '4.06', '0', '0.18', '21.6', '0.01', '0', '1.13', '0.2', '1', 'Glass');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('12', 'White Bread', '69', '13.16', '0.86', '1.99', '0', '0.97', '177', '0.6', '0.3', '1', 'Slice');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('13', 'Butter', '34', '0', '3.84', '0.04', '0', '0', '0.67', '0', '0', '1', 'Teaspoon');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('14', 'Honey', '21', '5.76', '0', '0.02', '0.03', '0.03', '0.33', '5.75', '0', '1', 'Teaspoon');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('15', 'Milk Tea with Sugar', '30', '4.97', '0.82', '0.93', '0', '0.03', '14', '4.84', '0.1', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('16', 'Green Tea', '2.5', '0.47', '0', '0.5', '0', '0', '2.5', '0', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('17', 'Black Tea with Sugar', '28', '7.4', '0', '0', '0', '0', '0.1', '6.7', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('18', 'Fruit Salad', '90', '25', '0', '1', '67.6', '0.28', '9', '20.46', '3.4', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('19', 'Coffee (With Milk and Sugar)', '30', '6.88', '0.14', '0.31', '0', '0', '0.07', '6', '6.54', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('20', 'Milk (Full Cream)', '146', '11.03', '7.93', '7.86', '0', '0.07', '98', '12.83', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('21', 'Corn Flakes', '101', '24.28', '0.03', '1.88', '0', '5.4', '266', '1.82', '1.3', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('22', 'Oats', '306', '54', '5.2', '10.6', '0', '4.56', '4.8', '0.8', '8.2', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('23', 'Naan', '137', '18.8', '5.1', '3.74', '0.1', '1.17', '142', '0.85', '0.7', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('24', 'Toasted Bread', '68', '12.32', '1.06', '2.39', '0', '0.87', '138', '1.44', '1.3', '1', 'Slice');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('26', 'Pouched Egg ', '64', '0.34', '4.36', '5.51', '0', '0.8', '129', '0.34', '0', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('27', 'Shrimp', '109', '0.94', '1.79', '20.97', '1.5', '2.24', '466', '0', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('28', 'Fish Curry', '95', '0', '10', '12', '0.6', '1.59', '50', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('29', 'Telapia', '96', '0', '1.7', '20.08', '0', '0.56', '52', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('30', 'Beef Steak', '161', '0', '7.39', '22.09', '0', '3.11', '60', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('31', 'Beef Curry', '320', '0', '23', '20', '0', '2.1', '50', '0', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('32', 'Duck', '185', '0', '15.53', '10.4', '0', '1.48', '122', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('33', 'Fried Chicken', '161', '0', '9.52', '17.74', '0', '0.78', '260', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('34', 'Lamb Curry', '257', '3.71', '13.83', '28.23', '1.4', '2.95', '496', '1.27', '0.9', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('35', 'Beef Meatballs', '57', '2.12', '3.69', '3.47', '0.2', '0.5', '134', '0.42', '0.1', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('36', 'Roast Chicken', '147', '0', '8.36', '16.78', '0', '0.78', '250', '0', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('38', 'Chicken Sausage', '49', '0.43', '2.83', '5.05', '0.5', '0.37', '205', '0', '0', '1', 'Link');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('39', 'Beef Sausage', '44', '0.24', '3.42', '2.77', '0', '0.29', '124', '0.2', '0', '1', 'Link');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('40', 'Almonds', '827', '28.23', '72.42', '30.4', '0', '6.15', '1', '6.86', '16.9', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('41', 'Peanut', '828', '23.55', '71.89', '37.67', '0', '6.69', '26', '5.8', '12.4', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('42', 'Cashew', '755', '39.21', '62.1', '21.89', '0.4', '7.86', '400', '6.51', '4.3', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('43', 'Walnuts', '785', '16.45', '78.25', '18.28', '1.6', '3.49', '2', '3.13', '8', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('44', 'Sesame Seeds', '825', '33.77', '71.52', '25.53', '0', '20.95', '16', '0.43', '17', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('45', 'Brown Rice', '215', '44.42', '1.75', '4.99', '0', '0.82', '587', '0.68', '3.5', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('46', 'Polao', '171', '31', '3', '4', '0', '0.1', '101', '2', '3', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('47', 'Fried Rice', '330', '41.7', '12.34', '12.47', '3.4', '2.75', '822', '1.5', '1.4', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('48', 'Noodles', '145', '27', '2', '5', '0', '1.35', '8', '1', '1', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('49', 'Pasta', '206', '41.56', '1', '7.56', '10.2', '2.63', '412', '6.35', '3.5', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('50', 'Chocolate Milk', '208', '25.85', '8.48', '7.92', '2.2', '0.6', '150', '23.85', '2', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('51', 'Lemonade', '99', '25.87', '0.1', '0.17', '9.7', '0.4', '5', '24.71', '0', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('52', 'Milk Shake', '271', '32', '13', '8', '0', '0.45', '0', '29', '1.2', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('53', 'Coke', '140', '39', '0', '0', '0', '0', '45', '39', '0', '1', 'Bottle');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('54', 'Salad', '160', '13', '12', '3', '5.5', '0.33', '330', '6', '3', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('55', 'Peanut Butter', '94', '3.13', '8.06', '4.01', '0', '0.3', '73', '1.48', '1', '1', 'tbsp');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('56', 'Chicken Soup', '75', '9.35', '2.46', '4.05', '0.2', '0.77', '1106', '0.27', '0.7', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('57', 'Tomato Soup', '102', '11.93', '2.93', '3.05', '66.4', '1.76', '705', '10.54', '1', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('58', 'Vegetable Soup', '90', '20', '0', '3', '0.3', '1.71', '940', '3', '3', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('59', 'Carrots', '25', '5.84', '0.15', '0.57', '3.6', '0.18', '42', '2.77', '1.7', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('60', 'Cucumber', '45', '10.93', '0.33', '1.96', '8.4', '0.84', '6', '5.03', '1.5', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('61', 'Corn', '132', '29.29', '1.82', '4.96', '10.5', '0.8', '23', '4.96', '4.2', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('62', 'Yogurt ', '179', '27', '6', '4.3', '0.5', '0.05', '46', '22.05', '0', '100', 'Grams');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('63', 'Sour Yogurt', '66', '6', '3', '4', '0.6', '0.1', '4', '4', '1', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('64', 'Burger', '272', '34.25', '9.77', '12.32', '2.2', '2.71', '534', '6.7', '2.3', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('65', 'Pizza', '180', '26', '5', '9', '0.55', '2.33', '410', '1', '1', '1', 'Slice');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('66', 'Nugget', '48', '2.61', '3.01', '2.49', '0.1', '0.13', '92', '0.14', '0.1', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('67', 'Nachos', '286', '12.07', '15.94', '23.21', '0', '1.26', '263', '0.3', '1', '100', 'Grams');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('68', 'Apple', '72', '19.06', '0.23', '0.36', '6.3', '0.17', '1', '14.34', '3.3', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('69', 'Banana', '105', '26.95', '0.39', '1.29', '10', '0.31', '1', '14.43', '3.1', '1', 'Medium');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('70', 'Blackberry', '62', '13.84', '0.71', '2', '30.2', '0.89', '1', '7.03', '7.6', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('71', 'Cherry', '74', '18.7', '0.23', '1.24', '8.2', '0.42', '0', '15', '2.5', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('72', 'Coconut', '283', '12.18', '26.79', '2.66', '2.6', '1.94', '16', '4.98', '7.2', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('73', 'Date', '23', '6.23', '0.03', '0.2', '0', '0.08', '0', '5.26', '0.7', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('74', 'Grape', '110', '29', '0.26', '1.15', '17.3', '0.58', '3', '24.77', '1.4', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('75', 'Litchi', '6', '1.59', '0.04', '0.08', '6.9', '0.03', '0', '1.46', '0.1', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('76', 'Mango', '135', '35.1', '0.56', '1.06', '57.3', '0.27', '4', '3.64', '3.7', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('77', 'Orange', '62', '15.3', '0.16', '1.23', '69.7', '0.13', '0', '12.25', '3.1', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('78', 'Papaya', '55', '113.7', '0.2', '0.85', '86.5', '0.14', '4', '8.26', '2.5', '1', 'Cup Cubed');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('79', 'Pineapple', '40', '10.61', '0.1', '0.45', '30.4', '0.24', '1', '7.78', '1.2', '1', 'Slice');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('80', 'Watermelon', '46', '11.48', '0.23', '0.93', '12.3', '0.36', '2', '9.42', '0.6', '1', 'Cup Diced');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('81', 'Guava', '61', '12.89', '0.86', '2.3', '205.5', '0.23', '2', '8.03', '4.9', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('82', 'Coleslaw', '41', '7.45', '1.57', '0.77', '19.6', '0.35', '14', '0', '0.9', '0.5', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('83', 'Pound Cake', '101', '13.5', '4.95', '1.46', '0', '0.41', '119', '6', '0.2', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('84', 'Chocolate Cake', '235', '34.66', '8.5', '2.65', '0.1', '1.41', '214', '12', '1.8', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('85', 'Vanilla Ice Cream', '145', '17', '7.92', '2.52', '0.4', '0.06', '58', '15.28', '0.5', '0.5', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('86', 'Chocolate Ice Cream', '287', '37.5', '14.63', '5.05', '0.9', '1.24', '101', '33.73', '1.6', '1', 'Cup');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('87', 'Rosogolla', '150', '30', '2', '2', '0', '0', '5', '33', '0', '1', 'Piece');
INSERT INTO "C##MAY"."FOOD_ITEMS" VALUES ('88', 'Kheer', '282', '48', '7', '8', '0', '0', '83', '44', '0', '1', 'Cup');

-- ----------------------------
-- Table structure for GOALS
-- ----------------------------
DROP TABLE "C##MAY"."GOALS";
CREATE TABLE "C##MAY"."GOALS" (
  "USER_ID" NUMBER VISIBLE,
  "CALORIE_INTAKE_GOAL" NUMBER(6,2) VISIBLE,
  "CALORIE_BURN_GOAL" NUMBER(6,2) VISIBLE,
  "WATER_INTAKE_GOAL" NUMBER VISIBLE,
  "DIET_TYPE" NUMBER VISIBLE,
  "VITAMIN_C" NUMBER VISIBLE,
  "IRON" NUMBER VISIBLE,
  "SODIUM" NUMBER VISIBLE,
  "SUGAR" NUMBER VISIBLE,
  "DIETARY_FIBER" NUMBER VISIBLE
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
-- Records of GOALS
-- ----------------------------
INSERT INTO "C##MAY"."GOALS" VALUES ('6', '1287.68', '150', '9', '2', '1', '1', '2', '2', '0');
INSERT INTO "C##MAY"."GOALS" VALUES ('43', '1606.85', '100', '9', '0', '1', '1', '1', '1', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('22', '1561.89', '150', '13', '0', '1', '1', '1', '1', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('70', '1265.71', '150', '9', '2', '1', '1', '1', '2', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('68', '1059.13', '100', '9', '2', '1', '1', '1', '1', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('21', '1570.89', '150', '9', '1', '1', '1', '1', '2', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('62', '1614.97', '150', '9', '2', '1', '1', '1', '1', '1');
INSERT INTO "C##MAY"."GOALS" VALUES ('61', '1096.73', '150', '9', '0', '1', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for MEAL_LOGGER
-- ----------------------------
DROP TABLE "C##MAY"."MEAL_LOGGER";
CREATE TABLE "C##MAY"."MEAL_LOGGER" (
  "MEAL_ID" NUMBER VISIBLE NOT NULL,
  "MEAL_TYPE" VARCHAR2(15 BYTE) VISIBLE,
  "MEAL_DATE" DATE VISIBLE,
  "USER_ID" NUMBER VISIBLE
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
-- Records of MEAL_LOGGER
-- ----------------------------
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('121', 'Lunch', TO_DATE('2022-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '61');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('122', 'Dinner', TO_DATE('2022-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '61');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('1', 'Breakfast', TO_DATE('2022-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '21');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('126', 'Dinner', TO_DATE('2022-08-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('123', 'Breakfast', TO_DATE('2022-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('124', 'Lunch', TO_DATE('2022-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('63', 'Dinner', TO_DATE('2022-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '22');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('23', 'Breakfast', TO_DATE('2022-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('42', 'Lunch', TO_DATE('2022-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('125', 'Dinner', TO_DATE('2022-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('41', 'Breakfast', TO_DATE('2022-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('43', 'Lunch', TO_DATE('2022-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '21');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('44', 'Breakfast', TO_DATE('2022-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '21');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('61', 'Breakfast', TO_DATE('2022-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('64', 'Breakfast', TO_DATE('2022-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '22');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('81', 'Dinner', TO_DATE('2022-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '43');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('101', 'Breakfast', TO_DATE('2022-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('62', 'Breakfast', TO_DATE('2022-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '22');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('65', 'Breakfast', TO_DATE('2022-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('66', 'Lunch', TO_DATE('2022-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6');
INSERT INTO "C##MAY"."MEAL_LOGGER" VALUES ('67', 'Breakfast', TO_DATE('2022-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '43');

-- ----------------------------
-- Table structure for MICRO_CONDITIONS
-- ----------------------------
DROP TABLE "C##MAY"."MICRO_CONDITIONS";
CREATE TABLE "C##MAY"."MICRO_CONDITIONS" (
  "ID" NUMBER VISIBLE NOT NULL,
  "DETAILS" VARCHAR2(255 BYTE) VISIBLE,
  "DEFICIENT" NUMBER(8,2) VISIBLE,
  "NORMAL" NUMBER(8,2) VISIBLE,
  "EXCESS" NUMBER(8,2) VISIBLE
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
-- Records of MICRO_CONDITIONS
-- ----------------------------
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('1', 'VitaminCM', '250', '90', '90');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('2', 'VitaminCF', '250', '75', '75');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('3', 'IronM', '12', '8.7', '8.7');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('4', 'IronF', '20', '18', '18');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('5', 'Sodium', '1500', '1500', '1000');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('6', 'SugarM', '36', '36', '20');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('7', 'SugarF', '25', '25', '15');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('9', 'FiberF', '35', '25', '25');
INSERT INTO "C##MAY"."MICRO_CONDITIONS" VALUES ('8', 'FiberM', '50', '38', '38');

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
  "DESIRE" NUMBER VISIBLE,
  "INITIAL_WEIGHT" FLOAT(126) VISIBLE
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
INSERT INTO "C##MAY"."USERS" VALUES ('6', 'mr_5919', 'Mayesha', 'Rashid', '80', '63', '15-Nov-1999', 'F', 'mayesha1599@gmail.com', 'abcd', '32.41', '1', '83');
INSERT INTO "C##MAY"."USERS" VALUES ('43', 'zm_98', 'Alina', 'Zaman', '52', '62', '05-Apr-2000', 'F', 'alina@hotmail.com', 'abcd', '20.97', '0', '52');
INSERT INTO "C##MAY"."USERS" VALUES ('22', 'scorp65', 'Shafin', 'Sowdagor', '85', '68', '10-Nov-2000', 'M', 'sowdagorshafin@gmail.com', 'abcd', '28.49', '1', '85');
INSERT INTO "C##MAY"."USERS" VALUES ('70', 'disha', 'Majisha', 'Jahan', '75', '68', '13-March-1999', 'F', 'majisha@gmail.com', '1234', '25.14', '1', '75');
INSERT INTO "C##MAY"."USERS" VALUES ('68', 'isbu', 'Tasnia', 'Isbat', '52', '58', '22-Jan-2001', 'F', 'ti@gmail.com', 'abcd', '23.96', '1', '52');
INSERT INTO "C##MAY"."USERS" VALUES ('21', 'chonky_mubash', 'Mubasshira', 'Musarrat', '48', '63', '31-Dec-2000', 'F', 'mubash@gmail.com', '1234', '18.75', '0', '48');
INSERT INTO "C##MAY"."USERS" VALUES ('62', 'lara_6277', 'Lara', 'Khan', '52', '63', '19-Sep-2000', 'F', 'lara62@gmail.com', 'abcd', '20.31', '0', '52');
INSERT INTO "C##MAY"."USERS" VALUES ('61', 'mt_78', 'Mehreen', 'Tabassum', '55', '62', '14-Dec-2000', 'F', 'mehreen78@gmail.com', 'abcd', '22.18', '1', '55');

-- ----------------------------
-- Table structure for WATER_CONSUMPTION
-- ----------------------------
DROP TABLE "C##MAY"."WATER_CONSUMPTION";
CREATE TABLE "C##MAY"."WATER_CONSUMPTION" (
  "USER_ID" NUMBER VISIBLE,
  "CONSUMED_WATER" NUMBER VISIBLE,
  "CONSUME_DATE" DATE VISIBLE
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
-- Records of WATER_CONSUMPTION
-- ----------------------------
INSERT INTO "C##MAY"."WATER_CONSUMPTION" VALUES ('6', '2', TO_DATE('2022-08-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##MAY"."WATER_CONSUMPTION" VALUES ('43', '3', TO_DATE('2022-08-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Function structure for FIND_MICROS
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##MAY"."FIND_MICROS" AS
BEGIN
IF GENDER='F' THEN
	IF OP=1 THEN
		SELECT VITAMIN_C INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=2;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=2;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=2;
		END IF;
	ELSIF OP=2 THEN
		SELECT IRON INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=4;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=4;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=4;
		END IF;
	ELSIF OP=3 THEN
		SELECT SODIUM INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		END IF;
	ELSIF OP=4 THEN
		SELECT SUGAR INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=7;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=7;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=7;
		END IF;
	ELSE
		SELECT DIETARY_FIBER INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=9;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=9;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=9;
		END IF;
	END IF;
ELSE
	IF OP=1 THEN
		SELECT VITAMIN_C INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=1;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=1;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=1;
		END IF;
	ELSIF OP=2 THEN
		SELECT IRON INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=3;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=3;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=3;
		END IF;
	ELSIF OP=3 THEN
		SELECT SODIUM INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=5;
		END IF;
	ELSIF OP=4 THEN
		SELECT SUGAR INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=6;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=6;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=6;
		END IF;
	ELSE
		SELECT DIETARY_FIBER INTO VAL
		FROM GOALS
		WHERE USER_ID=US_ID;
		IF VAL=0 THEN
			SELECT DEFICIENT INTO RES FROM MICRO_CONDITIONS WHERE ID=8;
		ELSIF VAL=1 THEN
			SELECT NORMAL INTO RES FROM MICRO_CONDITIONS WHERE ID=8;
		ELSE
			SELECT EXCESS INTO RES FROM MICRO_CONDITIONS WHERE ID=8;
		END IF;
	END IF;
END IF;
--RETURN RES;
END;
/

-- ----------------------------
-- Function structure for WEIGHT_UPDATE
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##MAY"."WEIGHT_UPDATE" AS
BEGIN
UPDATE USERS SET WEIGHT=WT WHERE USER_ID=US_ID;
SELECT HEIGHT INTO HT FROM USERS WHERE USER_ID=US_ID;
UPDATE USERS SET BMI=WT/(HT*HT*2.54*2.54*0.0001) WHERE USER_ID=US_ID;
END;
/

-- ----------------------------
-- Sequence structure for ELOG_SEQUENCE
-- ----------------------------
DROP SEQUENCE "C##MAY"."ELOG_SEQUENCE";
CREATE SEQUENCE "C##MAY"."ELOG_SEQUENCE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for FOOD_ITEM_SEQUENCE
-- ----------------------------
DROP SEQUENCE "C##MAY"."FOOD_ITEM_SEQUENCE";
CREATE SEQUENCE "C##MAY"."FOOD_ITEM_SEQUENCE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for MEAL_SEQUENCE
-- ----------------------------
DROP SEQUENCE "C##MAY"."MEAL_SEQUENCE";
CREATE SEQUENCE "C##MAY"."MEAL_SEQUENCE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for MEAL_SEQUENCE1
-- ----------------------------
DROP SEQUENCE "C##MAY"."MEAL_SEQUENCE1";
CREATE SEQUENCE "C##MAY"."MEAL_SEQUENCE1" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for USER_SEQUENCE
-- ----------------------------
DROP SEQUENCE "C##MAY"."USER_SEQUENCE";
CREATE SEQUENCE "C##MAY"."USER_SEQUENCE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table DIET_TYPE
-- ----------------------------
ALTER TABLE "C##MAY"."DIET_TYPE" ADD CONSTRAINT "SYS_C008068" PRIMARY KEY ("DIET");

-- ----------------------------
-- Primary Key structure for table EXERCISES
-- ----------------------------
ALTER TABLE "C##MAY"."EXERCISES" ADD CONSTRAINT "SYS_C008191" PRIMARY KEY ("EXERCISE_ID");

-- ----------------------------
-- Primary Key structure for table EXERCISE_LOG
-- ----------------------------
ALTER TABLE "C##MAY"."EXERCISE_LOG" ADD CONSTRAINT "SYS_C008192" PRIMARY KEY ("ELOG_ID");

-- ----------------------------
-- Triggers structure for table EXERCISE_LOG
-- ----------------------------
CREATE TRIGGER "C##MAY"."ELOG_TRIG" BEFORE INSERT ON "C##MAY"."EXERCISE_LOG" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
IF :NEW.ELOG_ID IS NULL
THEN
:NEW.ELOG_ID:=ELOG_SEQUENCE.NEXTVAL;
END IF;
END;
/

-- ----------------------------
-- Primary Key structure for table FOOD_ITEMS
-- ----------------------------
ALTER TABLE "C##MAY"."FOOD_ITEMS" ADD CONSTRAINT "SYS_C008086" PRIMARY KEY ("ITEM_ID");

-- ----------------------------
-- Triggers structure for table GOALS
-- ----------------------------
CREATE TRIGGER "C##MAY"."DIET_UPDATE" AFTER UPDATE OF "DIET_TYPE" ON "C##MAY"."GOALS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE T INTEGER;
BEGIN
IF :NEW.DIET_TYPE=1 THEN
	T:=1;
ELSIF :NEW.DIET_TYPE=2 THEN
	T:=1;
ELSIF :NEW.DIET_TYPE=0 THEN
	T:=0;
ELSE
	T:=2;
END IF;
UPDATE USERS SET DESIRE=T WHERE USER_ID=:NEW.USER_ID;
END;
/

-- ----------------------------
-- Primary Key structure for table MEAL_LOGGER
-- ----------------------------
ALTER TABLE "C##MAY"."MEAL_LOGGER" ADD CONSTRAINT "SYS_C008100" PRIMARY KEY ("MEAL_ID");

-- ----------------------------
-- Triggers structure for table MEAL_LOGGER
-- ----------------------------
CREATE TRIGGER "C##MAY"."MEAL_TRIG" BEFORE INSERT ON "C##MAY"."MEAL_LOGGER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
IF :NEW.MEAL_ID IS NULL
THEN
:NEW.MEAL_ID:=MEAL_SEQUENCE.NEXTVAL;
END IF;
END;

--SHOW ERRORS TRIGGER MEAL_TRIG;

/*CREATE TABLE DIET_TYPE
(
DIET INTEGER,
CARB INTEGER,
PROTEIN INTEGER,
FAT INTEGER,
PRIMARY KEY (DIET)
);*/;

-- ----------------------------
-- Primary Key structure for table MICRO_CONDITIONS
-- ----------------------------
ALTER TABLE "C##MAY"."MICRO_CONDITIONS" ADD CONSTRAINT "SYS_C008069" PRIMARY KEY ("ID");

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008065" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008066" UNIQUE ("USERNAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008067" UNIQUE ("EMAIL") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008062" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008063" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."USERS" ADD CONSTRAINT "SYS_C008064" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table USERS
-- ----------------------------
CREATE TRIGGER "C##MAY"."ADD_CALORIE_GOAL" AFTER INSERT ON "C##MAY"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE BMR FLOAT;
AGE INTEGER;
WATER INTEGER;
BEGIN
IF :NEW.GENDER ='F'
THEN
--DBMS_OUTPUT.PUT_LINE(:NEW.GENDER);
BMR:=1.2*(655.1+(9.563* :NEW.WEIGHT)+(1.85*2.54* :NEW.HEIGHT)-4.676*(MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12));
ELSE
--DBMS_OUTPUT.PUT_LINE(:NEW.GENDER);
BMR:=1.2*(66.47+(13.75*:NEW.WEIGHT)+(5.003*2.54*:NEW.HEIGHT)-6.755*(MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12));
END IF;
IF :NEW.DESIRE=1 THEN
	BMR:=(2*BMR)/3;
ELSIF :NEW.DESIRE=2 THEN
	BMR:=(4*BMR)/3;
END IF;

AGE:=MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12;
IF AGE<=13 THEN
WATER:=8;
ELSIF AGE<=18 THEN
WATER:=10;
ELSIF :NEW.GENDER='F' THEN
WATER:=9;
ELSE
WATER:=13;
END IF;


INSERT INTO GOALS(USER_ID,CALORIE_INTAKE_GOAL,WATER_INTAKE_GOAL)
VALUES(:NEW.USER_ID,BMR,WATER);

END;
/
CREATE TRIGGER "C##MAY"."ADD_WATER_INTAKE" AFTER INSERT ON "C##MAY"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE AGE INTEGER;
WATER INTEGER;
BEGIN
AGE:=MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12;
IF AGE<=13 THEN
WATER:=8;
ELSIF AGE<=18 THEN
WATER:=10;
ELSIF :NEW.GENDER='F' THEN
WATER:=9;
ELSE
WATER:=13;
END IF;
UPDATE GOALS
SET WATER_INTAKE_GOAL=WATER
WHERE USER_ID=:NEW.USER_ID;
END;
/
CREATE TRIGGER "C##MAY"."UPDATE_CALORIE" AFTER UPDATE ON "C##MAY"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE BMR NUMBER(6,2);
BEGIN
IF :NEW.GENDER ='F'
THEN
--DBMS_OUTPUT.PUT_LINE(:NEW.GENDER);
BMR:=1.2*(655.1+(9.563* :NEW.WEIGHT)+(1.85*2.54* :NEW.HEIGHT)-4.676*(MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12));
ELSE
--DBMS_OUTPUT.PUT_LINE(:NEW.GENDER);
BMR:=1.2*(66.47+(13.75*:NEW.WEIGHT)+(5.003*2.54*:NEW.HEIGHT)-6.755*(MONTHS_BETWEEN(TRUNC(SYSDATE),TO_DATE(:NEW.DATE_OF_BIRTH,'DD-MON-YYYY'))/12));
END IF;
IF :NEW.DESIRE=1 THEN
	BMR:=(2*BMR)/3;
ELSIF :NEW.DESIRE=2 THEN
	BMR:=(4*BMR)/3;
END IF;
UPDATE GOALS
SET CALORIE_INTAKE_GOAL=BMR
WHERE USER_ID=:NEW.USER_ID;
END;
/
CREATE TRIGGER "C##MAY"."USER_BIN" BEFORE INSERT ON "C##MAY"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
IF :NEW.USER_ID IS NULL
THEN
:NEW.USER_ID:=USER_SEQUENCE.NEXTVAL;
END IF;
END;

--DROP SEQUENCE USER_SEQUENCE;

-- ----------------------------
-- Foreign Keys structure for table CONSISTS
-- ----------------------------
ALTER TABLE "C##MAY"."CONSISTS" ADD CONSTRAINT "SYS_C008194" FOREIGN KEY ("ELOG_ID") REFERENCES "C##MAY"."EXERCISE_LOG" ("ELOG_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."CONSISTS" ADD CONSTRAINT "SYS_C008195" FOREIGN KEY ("EXERCISE_ID") REFERENCES "C##MAY"."EXERCISES" ("EXERCISE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table CONTAINS
-- ----------------------------
ALTER TABLE "C##MAY"."CONTAINS" ADD CONSTRAINT "SYS_C008102" FOREIGN KEY ("MEAL_ID") REFERENCES "C##MAY"."MEAL_LOGGER" ("MEAL_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##MAY"."CONTAINS" ADD CONSTRAINT "SYS_C008103" FOREIGN KEY ("ITEM_ID") REFERENCES "C##MAY"."FOOD_ITEMS" ("ITEM_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table EXERCISE_LOG
-- ----------------------------
ALTER TABLE "C##MAY"."EXERCISE_LOG" ADD CONSTRAINT "SYS_C008193" FOREIGN KEY ("USER_ID") REFERENCES "C##MAY"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table MEAL_LOGGER
-- ----------------------------
ALTER TABLE "C##MAY"."MEAL_LOGGER" ADD CONSTRAINT "SYS_C008101" FOREIGN KEY ("USER_ID") REFERENCES "C##MAY"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table WATER_CONSUMPTION
-- ----------------------------
ALTER TABLE "C##MAY"."WATER_CONSUMPTION" ADD CONSTRAINT "SYS_C008230" FOREIGN KEY ("USER_ID") REFERENCES "C##MAY"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
