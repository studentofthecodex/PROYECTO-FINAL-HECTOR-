USE nuevasia_db;





create table adminz (
admin_id int auto_increment primary key,
username varchar(50) not null unique, 
email varchar(100) not null unique
);
create table product (
product_id int auto_increment primary key, 
product_name varchar(100) not null,
brand varchar(50),
category varchar(50),
units_stock int not null, 
low_stock_threshhold int, 
supplier varchar(100), -- en donde normalmente se van a comprar las cosas
notes TEXT
);

insert into adminz (username, email) values
('admin1', 'chencizheng@qq.com'),
('admin2', 'ccli@qq.com'),
('manager1', 'mangratliu@gmail.com');

insert into product (product_name, brand, category, units_stock, low_stock_threshhold, supplier, notes
)
Values 
('salsa soya', 'kikkoman', 'salsa', 45, 10, 'metro cencosud', ' para poner en mesas'),
('Arroz jazmín', 'Diana', 'carbohidrato', 100, 15, 'Metro Cencosud', 'Base para platos principales'),
('Fideos de arroz', 'Doña Pancha', 'carbohidrato', 60, 12, 'Ólimpica', 'Para sopas y salteados'),
('Aceite de sésamo', 'La Española', 'aceite', 30, 6, 'Ólimpica', 'Para saborizar y freír'),
('Pollo fresco', 'Avianca', 'proteína', 50, 10, 'Metro Cencosud', 'Cortado en tiras'),
('Tofu firme', 'Tofu Orgánico', 'proteína', 40, 8, 'Ólimpica', 'Producto vegetariano'),
('Salsa de ostras', 'Lee Kum Kee', 'salsa', 35, 7, 'Metro Cencosud', 'Sabor umami para salteados'),
('Salsa de chile dulce', 'Colanta', 'salsa', 25, 5, 'Ólimpica', 'Para acompañar platos'),
('Verduras congeladas', 'Frío Real', 'vegetales', 80, 15, 'Metro Cencosud', 'Mezcla variada'),
('Jengibre fresco', 'Mercado Local', 'condimento', 20, 4, 'Ólimpica', 'Rallado o en trozos'),
('Cebolla blanca', 'La Colina', 'vegetales', 70, 12, 'Metro Cencosud', 'Para sofritos y salsas'),
('Salsa de soja baja sal', 'Kikkoman', 'salsa', 50, 10, 'Ólimpica', 'Alternativa baja sodio'),
('Harina de trigo', 'Harimasa', 'carbohidrato', 90, 17, 'Metro Cencosud', 'Para tempura y masas'),
('Azúcar morena', 'Néctar', 'condimento', 40, 8, 'Ólimpica', 'Para balancear sabores'),
('Almidón de maíz', 'Doña Pancha', 'carbohidrato', 60, 12, 'Metro Cencosud', 'Para espesar salsas'),
('Aceite vegetal', 'La Española', 'aceite', 70, 14, 'Ólimpica', 'Aceite neutro para freír');


/*A continuacion los 14 requisitos funcionales que cree, enumerados y descritos.*/
-- Requerimientos funcionales:

--

-- 1. Mostrar todos los productos disponibles en el inventario.
SELECT * FROM product;

-- 2. Identificar los productos cuyo stock está por debajo o igual al umbral de stock bajo.

SELECT * FROM product WHERE units_stock <= low_stock_threshhold;

-- 3. Permitir agregar un nuevo producto con todos sus detalles.
INSERT INTO product (product_name, brand, category, units_stock, low_stock_threshhold, supplier, notes)
VALUES ('Nuevo Producto', 'Marca Ejemplo', 'categoria', 50, 10, 'Ólimpica', 'Descripción ejemplo');

-- 4. Permitir actualizar la cantidad de unidades en stock de un producto.
UPDATE product
SET units_stock = 40
WHERE product_id = 1;

-- 5. Permitir eliminar un producto del inventario.
DELETE FROM product WHERE product_id = 1;

-- 6. Permitir buscar productos filtrando por categoría.
SELECT * FROM product WHERE category = 'proteína';

-- 7. Permitir buscar productos filtrando por proveedor.

SELECT * FROM product WHERE supplier = 'Metro Cencosud';

-- 8. Permitir ver los detalles de un producto buscando por nombre (con coincidencia parcial).

SELECT * FROM product WHERE product_name LIKE '%salsa%';

-- 9. Calcular y mostrar el total de unidades en stock en todos los productos.

SELECT SUM(units_stock) AS total_units FROM product;

-- 10. Crea un bloqueo cuando se trata de crear una insercion de producto identica a la otra, esto quiere decir mismo producto, tipo, marca, mercado, ya que es el mismo producto. 
ALTER TABLE product
ADD CONSTRAINT unique_product_entry
UNIQUE (product_name, brand, supplier);

/*RQFS de tabla admin*/

-- 11. Permitir que un administrador inicie sesión verificando usuario y correo electrónico.
SELECT * FROM adminz WHERE username = 'adminUser' AND email = 'admin@example.com';

-- 12. Permitir agregar un nuevo usuario administrador con nombre y correo.
INSERT INTO adminz (username, email) VALUES ('newAdmin', 'newadmin@example.com');

-- 13. Permitir actualizar el nombre de usuario y correo de un administrador existente.

UPDATE adminz
SET username = 'updatedAdmin', email = 'updated@example.com'
WHERE admin_id = 1;

-- 14. Permitir eliminar un usuario administrador del sistema.

DELETE FROM adminz WHERE admin_id = 1;


INSERT INTO adminz (username, email) VALUES ('hector1', 'newadmin@example.com');

SELECT * FROM adminz;

DESCRIBE adminz;

SELECT COUNT(*) FROM adminz;

UPDATE product
SET units_stock = 69
WHERE product_id = 2; 
SELECT * FROM product;





















