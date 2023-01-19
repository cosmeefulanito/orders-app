/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 90523
 Source Host           : localhost:5432
 Source Catalog        : orderapp
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90523
 File Encoding         : 65001

 Date: 18/01/2023 22:03:49
*/


-- ----------------------------
-- Sequence structure for Categoria_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Categoria_id_seq";
CREATE SEQUENCE "public"."Categoria_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Orden_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Orden_id_seq";
CREATE SEQUENCE "public"."Orden_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Producto_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Producto_id_seq";
CREATE SEQUENCE "public"."Producto_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Categoria
-- ----------------------------
DROP TABLE IF EXISTS "public"."Categoria";
CREATE TABLE "public"."Categoria" (
  "id" int4 NOT NULL DEFAULT nextval('"Categoria_id_seq"'::regclass),
  "nombre" text COLLATE "pg_catalog"."default" NOT NULL,
  "icono" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Categoria
-- ----------------------------
INSERT INTO "public"."Categoria" VALUES (1, 'Café', 'cafe');
INSERT INTO "public"."Categoria" VALUES (2, 'Hamburguesas', 'hamburguesa');
INSERT INTO "public"."Categoria" VALUES (3, 'Pizzas', 'pizza');
INSERT INTO "public"."Categoria" VALUES (4, 'Donas', 'dona');
INSERT INTO "public"."Categoria" VALUES (5, 'Pasteles', 'pastel');
INSERT INTO "public"."Categoria" VALUES (6, 'Galletas', 'galletas');

-- ----------------------------
-- Table structure for Orden
-- ----------------------------
DROP TABLE IF EXISTS "public"."Orden";
CREATE TABLE "public"."Orden" (
  "id" int4 NOT NULL DEFAULT nextval('"Orden_id_seq"'::regclass),
  "nombre" text COLLATE "pg_catalog"."default" NOT NULL,
  "fecha" text COLLATE "pg_catalog"."default" NOT NULL,
  "total" float8 NOT NULL,
  "pedido" jsonb NOT NULL,
  "estado" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of Orden
-- ----------------------------
INSERT INTO "public"."Orden" VALUES (1, 'ANDY', '1673045342197', 119.7, '[{"id": 15, "imagen": "donas_01", "nombre": "Paquete de 3 donas de Chocolate", "precio": 39.9, "cantidad": 1}, {"id": 16, "imagen": "donas_02", "nombre": "Paquete de 3 donas Glaseadas", "precio": 39.9, "cantidad": 1}, {"id": 22, "imagen": "donas_08", "nombre": "Paquete de 3 donas de Chocolate ", "precio": 39.9, "cantidad": 1}]', 't');
INSERT INTO "public"."Orden" VALUES (2, 'ANDY', '1673045696561', 119.7, '[{"id": 15, "imagen": "donas_01", "nombre": "Paquete de 3 donas de Chocolate", "precio": 39.9, "cantidad": 1}, {"id": 16, "imagen": "donas_02", "nombre": "Paquete de 3 donas Glaseadas", "precio": 39.9, "cantidad": 1}, {"id": 22, "imagen": "donas_08", "nombre": "Paquete de 3 donas de Chocolate ", "precio": 39.9, "cantidad": 1}]', 't');
INSERT INTO "public"."Orden" VALUES (4, 'Andrés Astorga', '1674059380635', 389.2, '[{"id": 35, "imagen": "hamburguesas_01", "nombre": "Hamburguesa Sencilla", "precio": 59.9, "cantidad": 2}, {"id": 42, "imagen": "hamburguesas_08", "nombre": "Paquete 2 Hot Dogs", "precio": 69.9, "cantidad": 2}, {"id": 29, "imagen": "galletas_01", "nombre": "Paquete Galletas de Chocolate", "precio": 29.9, "cantidad": 3}, {"id": 30, "imagen": "galletas_02", "nombre": "Paquete Galletas de Chocolate y Avena", "precio": 39.9, "cantidad": 1}]', 't');
INSERT INTO "public"."Orden" VALUES (3, 'bárbara h', '1673045743732', 329.4, '[{"id": 49, "imagen": "pizzas_01", "nombre": "Pizza Spicy con Doble Queso", "precio": 69.9, "cantidad": 1}, {"id": 53, "imagen": "pizzas_05", "nombre": "Pizza Chorizo", "precio": 69.9, "cantidad": 1}, {"id": 56, "imagen": "pizzas_08", "nombre": "Pizza Vegetales y Queso", "precio": 69.9, "cantidad": 1}, {"id": 34, "imagen": "galletas_06", "nombre": "Galletas de sabores frutales", "precio": 39.9, "cantidad": 1}, {"id": 30, "imagen": "galletas_02", "nombre": "Paquete Galletas de Chocolate y Avena", "precio": 39.9, "cantidad": 1}, {"id": 33, "imagen": "galletas_05", "nombre": "Galletas de Mantequilla Variadas", "precio": 39.9, "cantidad": 1}]', 't');
INSERT INTO "public"."Orden" VALUES (5, 'Fabiola', '1674061105115', 129.8, '[{"id": 49, "imagen": "pizzas_01", "nombre": "Pizza Spicy con Doble Queso", "precio": 69.9, "cantidad": 1}, {"id": 35, "imagen": "hamburguesas_01", "nombre": "Hamburguesa Sencilla", "precio": 59.9, "cantidad": 1}]', 't');

-- ----------------------------
-- Table structure for Producto
-- ----------------------------
DROP TABLE IF EXISTS "public"."Producto";
CREATE TABLE "public"."Producto" (
  "id" int4 NOT NULL DEFAULT nextval('"Producto_id_seq"'::regclass),
  "nombre" text COLLATE "pg_catalog"."default" NOT NULL,
  "precio" float8 NOT NULL,
  "imagen" text COLLATE "pg_catalog"."default" NOT NULL,
  "categoriaId" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Producto
-- ----------------------------
INSERT INTO "public"."Producto" VALUES (1, 'Café Caramel con Chocolate', 59.9, 'cafe_01', 1);
INSERT INTO "public"."Producto" VALUES (2, 'Café Frio con Chocolate Grande', 49.9, 'cafe_02', 1);
INSERT INTO "public"."Producto" VALUES (3, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_03', 1);
INSERT INTO "public"."Producto" VALUES (4, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_04', 1);
INSERT INTO "public"."Producto" VALUES (5, 'Malteada Fria con Chocolate Grande', 54.9, 'cafe_05', 1);
INSERT INTO "public"."Producto" VALUES (6, 'Café Mocha Caliente Chico', 39.9, 'cafe_06', 1);
INSERT INTO "public"."Producto" VALUES (7, 'Café Mocha Caliente Grande con Chocolate', 59.9, 'cafe_07', 1);
INSERT INTO "public"."Producto" VALUES (8, 'Café Caliente Capuchino Grande', 59.9, 'cafe_08', 1);
INSERT INTO "public"."Producto" VALUES (9, 'Café Mocha Caliente Mediano', 49.9, 'cafe_09', 1);
INSERT INTO "public"."Producto" VALUES (10, 'Café Mocha Frio con Caramelo Mediano', 49.9, 'cafe_10', 1);
INSERT INTO "public"."Producto" VALUES (11, 'Café Mocha Frio con Chocolate Mediano', 49.9, 'cafe_11', 1);
INSERT INTO "public"."Producto" VALUES (12, 'Café Espresso', 29.9, 'cafe_12', 1);
INSERT INTO "public"."Producto" VALUES (13, 'Café Capuchino Grande con Caramelo', 59.9, 'cafe_13', 1);
INSERT INTO "public"."Producto" VALUES (14, 'Café Caramelo Grande', 59.9, 'cafe_14', 1);
INSERT INTO "public"."Producto" VALUES (15, 'Paquete de 3 donas de Chocolate', 39.9, 'donas_01', 4);
INSERT INTO "public"."Producto" VALUES (16, 'Paquete de 3 donas Glaseadas', 39.9, 'donas_02', 4);
INSERT INTO "public"."Producto" VALUES (17, 'Dona de Fresa ', 19.9, 'donas_03', 4);
INSERT INTO "public"."Producto" VALUES (18, 'Dona con Galleta de Chocolate ', 19.9, 'donas_04', 4);
INSERT INTO "public"."Producto" VALUES (19, 'Dona glass con Chispas Sabor Fresa ', 19.9, 'donas_05', 4);
INSERT INTO "public"."Producto" VALUES (20, 'Dona glass con Chocolate ', 19.9, 'donas_06', 4);
INSERT INTO "public"."Producto" VALUES (21, 'Dona de Chocolate con MÁS Chocolate ', 19.9, 'donas_07', 4);
INSERT INTO "public"."Producto" VALUES (22, 'Paquete de 3 donas de Chocolate ', 39.9, 'donas_08', 4);
INSERT INTO "public"."Producto" VALUES (23, 'Paquete de 3 donas con Vainilla y Chocolate ', 39.9, 'donas_09', 4);
INSERT INTO "public"."Producto" VALUES (24, 'Paquete de 6 Donas', 69.9, 'donas_10', 4);
INSERT INTO "public"."Producto" VALUES (25, 'Paquete de 3 Variadas', 39.9, 'donas_11', 4);
INSERT INTO "public"."Producto" VALUES (26, 'Dona Natural con Chocolate', 19.9, 'donas_12', 4);
INSERT INTO "public"."Producto" VALUES (27, 'Paquete de 3 Donas de Chocolate con Chispas', 39.9, 'donas_13', 4);
INSERT INTO "public"."Producto" VALUES (28, 'Dona Chocolate y Coco', 19.9, 'donas_14', 4);
INSERT INTO "public"."Producto" VALUES (29, 'Paquete Galletas de Chocolate', 29.9, 'galletas_01', 6);
INSERT INTO "public"."Producto" VALUES (30, 'Paquete Galletas de Chocolate y Avena', 39.9, 'galletas_02', 6);
INSERT INTO "public"."Producto" VALUES (31, 'Paquete de Muffins de Vainilla', 39.9, 'galletas_03', 6);
INSERT INTO "public"."Producto" VALUES (32, 'Paquete de 4 Galletas de Avena', 24.9, 'galletas_04', 6);
INSERT INTO "public"."Producto" VALUES (33, 'Galletas de Mantequilla Variadas', 39.9, 'galletas_05', 6);
INSERT INTO "public"."Producto" VALUES (34, 'Galletas de sabores frutales', 39.9, 'galletas_06', 6);
INSERT INTO "public"."Producto" VALUES (35, 'Hamburguesa Sencilla', 59.9, 'hamburguesas_01', 2);
INSERT INTO "public"."Producto" VALUES (36, 'Hamburguesa de Pollo', 59.9, 'hamburguesas_02', 2);
INSERT INTO "public"."Producto" VALUES (37, 'Hamburguesa de Pollo y Chili', 59.9, 'hamburguesas_03', 2);
INSERT INTO "public"."Producto" VALUES (38, 'Hamburguesa Queso y  Pepinos', 59.9, 'hamburguesas_04', 2);
INSERT INTO "public"."Producto" VALUES (39, 'Hamburguesa Cuarto de Libra', 59.9, 'hamburguesas_05', 2);
INSERT INTO "public"."Producto" VALUES (40, 'Hamburguesa Doble Queso', 69.9, 'hamburguesas_06', 2);
INSERT INTO "public"."Producto" VALUES (41, 'Hot Dog Especial', 49.9, 'hamburguesas_07', 2);
INSERT INTO "public"."Producto" VALUES (42, 'Paquete 2 Hot Dogs', 69.9, 'hamburguesas_08', 2);
INSERT INTO "public"."Producto" VALUES (43, '4 Rebanadas de Pay de Queso', 69.9, 'pastel_01', 5);
INSERT INTO "public"."Producto" VALUES (44, 'Waffle Especial', 49.9, 'pastel_02', 5);
INSERT INTO "public"."Producto" VALUES (45, 'Croissants De la casa', 39.9, 'pastel_03', 5);
INSERT INTO "public"."Producto" VALUES (46, 'Pay de Queso', 19.9, 'pastel_04', 5);
INSERT INTO "public"."Producto" VALUES (47, 'Pastel de Chocolate', 29.9, 'pastel_05', 5);
INSERT INTO "public"."Producto" VALUES (48, 'Rebanada Pastel de Chocolate', 29.9, 'pastel_06', 5);
INSERT INTO "public"."Producto" VALUES (49, 'Pizza Spicy con Doble Queso', 69.9, 'pizzas_01', 3);
INSERT INTO "public"."Producto" VALUES (50, 'Pizza Jamón y Queso', 69.9, 'pizzas_02', 3);
INSERT INTO "public"."Producto" VALUES (51, 'Pizza Doble Queso', 69.9, 'pizzas_03', 3);
INSERT INTO "public"."Producto" VALUES (52, 'Pizza Especial de la Casa', 69.9, 'pizzas_04', 3);
INSERT INTO "public"."Producto" VALUES (53, 'Pizza Chorizo', 69.9, 'pizzas_05', 3);
INSERT INTO "public"."Producto" VALUES (54, 'Pizza Hawaiana', 69.9, 'pizzas_06', 3);
INSERT INTO "public"."Producto" VALUES (55, 'Pizza Tocino', 69.9, 'pizzas_07', 3);
INSERT INTO "public"."Producto" VALUES (56, 'Pizza Vegetales y Queso', 69.9, 'pizzas_08', 3);
INSERT INTO "public"."Producto" VALUES (57, 'Pizza Pepperoni y Queso', 69.9, 'pizzas_09', 3);
INSERT INTO "public"."Producto" VALUES (58, 'Pizza Aceitunas y Queso', 69.9, 'pizzas_10', 3);
INSERT INTO "public"."Producto" VALUES (59, 'Pizza Queso, Jamón y Champiñones', 69.9, 'pizzas_11', 3);

-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."_prisma_migrations";
CREATE TABLE "public"."_prisma_migrations" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "checksum" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "finished_at" timestamptz(6),
  "migration_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "logs" text COLLATE "pg_catalog"."default",
  "rolled_back_at" timestamptz(6),
  "started_at" timestamptz(6) NOT NULL DEFAULT now(),
  "applied_steps_count" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of _prisma_migrations
-- ----------------------------
INSERT INTO "public"."_prisma_migrations" VALUES ('9dffd676-8252-46de-955c-6c48aa9935da', 'a1f2d56924f53d5bfdef437f70ca8e19699391795b3dac3851e0c278caef6c37', '2022-12-14 13:22:23.333088-03', '20221214161634_productos_y_categorias', NULL, NULL, '2022-12-14 13:22:23.276019-03', 1);
INSERT INTO "public"."_prisma_migrations" VALUES ('b9be6998-31a1-4da6-a0e5-a23fd3afb691', '075ec56fc546cb7845fca8beede02db1a88977f1912650f209e60620eacadac5', '2022-12-14 13:24:37.485919-03', '20221214162437_orden', NULL, NULL, '2022-12-14 13:24:37.468862-03', 1);
INSERT INTO "public"."_prisma_migrations" VALUES ('a381d5e1-789b-4a22-a663-da7b4ebfc411', '2f830574d971ee50c2f5a2e0a16216567aa96e3e336855a636941c73c59e1aa7', '2023-01-06 20:05:45.918873-03', '20230106230545_estado_para_las_ordenes', NULL, NULL, '2023-01-06 20:05:45.852432-03', 1);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Categoria_id_seq"
OWNED BY "public"."Categoria"."id";
SELECT setval('"public"."Categoria_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Orden_id_seq"
OWNED BY "public"."Orden"."id";
SELECT setval('"public"."Orden_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Producto_id_seq"
OWNED BY "public"."Producto"."id";
SELECT setval('"public"."Producto_id_seq"', 60, true);

-- ----------------------------
-- Primary Key structure for table Categoria
-- ----------------------------
ALTER TABLE "public"."Categoria" ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Orden
-- ----------------------------
ALTER TABLE "public"."Orden" ADD CONSTRAINT "Orden_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Producto
-- ----------------------------
ALTER TABLE "public"."Producto" ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table _prisma_migrations
-- ----------------------------
ALTER TABLE "public"."_prisma_migrations" ADD CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table Producto
-- ----------------------------
ALTER TABLE "public"."Producto" ADD CONSTRAINT "Producto_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "public"."Categoria" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
