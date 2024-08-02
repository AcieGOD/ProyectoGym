CREATE DATABASE SuplementosGimnasio;
USE SuplementosGimnasio;

CREATE TABLE Roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion_rol VARCHAR(255)
);

CREATE TABLE Funciones (
    id_funcion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_funcion VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE FuncionesRelacionadasRoles (
    id_rol INT,
    id_funcion INT,
    PRIMARY KEY (id_rol, id_funcion),
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol),
    FOREIGN KEY (id_funcion) REFERENCES Funciones(id_funcion)
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    fecha_registro DATE,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    Categoria VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(255),
    estado BOOLEAN NOT NULL
);
/*creatinas*/
INSERT INTO Productos (NombreProducto, descripcion, Categoria, cantidad, precio, imagen, estado)
VALUES ('CREATINA INNER ARMOUR 400G 133 SERVING', 'CREATINE MONOHIDRATADA ™ contiene un puro, seguro y efectivo Monohidrato de Creatina . El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 'Creatina', 10, 800, 'https://nutrispothonduras.com/wp-content/uploads/2024/07/Creatina-Inner-400g-v1.jpg', TRUE);
INSERT INTO Productos (NombreProducto, descripcion, Categoria, cantidad, precio, imagen, estado)
VALUES ('CREATINA RAZE 300G', 'CREATINE RAZE ™ contiene un puro, seguro y efectivo Monohidrato de Creatina . El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 'Creatina', 20, 500, 'https://nutrispothonduras.com/wp-content/uploads/2022/11/Creatina-Raze-300g.jpg', TRUE),
('CREATINA ULTIMATE 300G', 'El Monohidrato de Creatina es uno de los ingredientes más estudiados e investigados para mejorar el rendimiento deportivo.Se ha demostrado que la creatina aumenta la resistencia, la masa muscular y la fuerza cuando se toma como parte de un régimen de entrenamiento.', 'Creatina', 3, 1093, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/Creatina-Ultimate-300g.jpg', TRUE),
('ISO SENSATION 5LB + CREATINA ULTIMATE 300G', 'ISO Sensation® 93 incluye un complejo de glutamina para ayudar a preservar la masa muscular y mejorar el equilibrio de nitrógeno.', 'Creatina', 2, 2497, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/ISO-SENSATION-5LB-CREATINA-ULTIMATE-300G.jpg', TRUE),
('CREATINE NUTREX 1000G 200 SERVING', 'CREATINE NUTREX ™ contiene un puro, seguro y efectivo Monohidrato de Creatina . El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.  Nuestro monohidrato de creatina satisface incluso las demandas más exigentes de los consumidores en cuanto a calidad, seguridad y eficacia.', 'Creatina', 5, 1399, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/Creatina-Nutrex-200-serv.jpg', TRUE),
('CREATINE NUTREX 300G', 'CREATINE NUTREX ™ contiene un puro, seguro y efectivo Monohidrato de Creatina . El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 'Creatina', 1, 650, 'https://nutrispothonduras.com/wp-content/uploads/2023/11/Creatina-Nutrex-300g-.jpg', TRUE);

/*Proteinas*/
INSERT INTO Productos (NombreProducto, descripcion, Categoria, cantidad, precio, imagen, estado)
VALUES ('ANABOLIC PEAK', 'Anabolic Peak es una fórmula proteica altamente concentrada, contiene una mezcla de aminoácidos rica en glutamina y aminoácidos ramificados los cuales proporcionarán una rápida recuperación y máximo crecimiento muscular. Además, es altamente energética, especial para personas con un metabolismo acelerado.', 'Proteina', 25, 999, 'https://nutrispothonduras.com/wp-content/uploads/2023/08/ANABOLIC-PEAK-12-LB.jpg', TRUE),
 ('HYDROWHEY 3.5 LB', 'Platinum HYDROWHEY hidrolizado y de rápida digestión es la proteína de suero más avanzada que jamás hayamos desarrollado y contiene 100 % de aislado de proteína de suero hidrolizado. ', 'Proteina', 10, 2400, 'https://nutrispothonduras.com/wp-content/uploads/2024/03/HYDROWHEY-3.5-LB.jpg', TRUE),
 ('LENNY & LARRY COOKIES', '¡Galletas de proteína de origen vegetal sorprendentemente deliciosas y nutritivas!', 'Proteina', 100, 75, 'https://nutrispothonduras.com/wp-content/uploads/2022/02/Lenny-Larry-Cookies-complete.jpeg', TRUE),
 ('PROTEIN COOKIES', 'Quest Protein Cookies es la galleta de proteínas de mejor calidad del mercado. Por fin es posible consumir una barrita de proteínas con un contenido de azúcares y carbohidratos realmente bajo. ', 'Proteina', 7, 85, 'https://nutrispothonduras.com/wp-content/uploads/2020/12/PROTEIN-COOKIES.jpg', TRUE),
 ('SERIOUS MASS GAINER', 'Serious Mass es lo último en fórmulas de aumento de peso. Con 1.250 calorías por porción y 50 gramos de proteína para apoyar la recuperación muscular, este polvo para uso instantáneo hace el batido ideal post-entrenamiento y entre las comidas para dimensionar sus objetivos.', 'Proteina', 2, 2700, 'https://nutrispothonduras.com/wp-content/uploads/2021/09/PRODUCTOS-NUTRISPOT.png', TRUE),
 ('SIMPLY 100% WHEY PROTEIN', 'No busques más que Simply Whey Protein 5LB en sabor a chocolate o vainilla. Con 25 g de proteína por porción, aminoácidos esenciales y bajo contenido de grasas y carbohidratos.', 'Proteina', 22, 1700, 'https://nutrispothonduras.com/wp-content/uploads/2023/09/WHEY-PROTEIN-5-LB-VAINILLA1.jpg', TRUE),
 ('RAZE WHEY 2 LB', 'Los aislados de proteína de suero (WPI) son la forma más pura de proteína de suero que existe en la actualidad. WPI son costosos de usar, pero están entre las mejores proteínas que el dinero puede comprar.', 'Proteina', 7, 1000, 'https://nutrispothonduras.com/wp-content/uploads/2023/07/RAZE-WHEY-2-LB-VAINILLA.jpg', TRUE);

/*Preentreno*/
INSERT INTO Productos (NombreProducto, descripcion, Categoria, cantidad, precio, imagen, estado)
VALUES ('CELSIUS DRINK 12 ONZAS', 'Celsius es una bebida de gran sabor que te ayuda a ponerte y mantenerte en forma. Múltiples estudios muestran que el consumo de Celsius antes del ejercicio moderado impulsará el metabolismo, quemará calorías, reducirá la grasa corporal, proporcionará energía duradera y mejorará la resistencia.', 'Preentreno', 12, 89, 'https://nutrispothonduras.com/wp-content/uploads/2022/02/Celsius-Drink.jpg', TRUE),
('L-ARGININE 120 CAPSULAS', 'Deje que L-ARGININE 1000 libere su potencial de rendimiento con el poder de un flujo sanguíneo mejorado. Un potente aminoácido, la L-Arginina, actúa como vasodilatador y se convierte sin problemas en óxido nítrico dentro del cuerpo.', 'Preentreno', 15, 599, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/L-ARGININE-120-CAPS.jpg', TRUE),
('OUTLIFT AMPED 22 SERVING', 'Es hora de aumentar tu intensidad al máximo con OUTLIFT® AMPED, la fórmula definitiva de alta estimulación previa al entrenamiento. Esta potente combinación de nootrópicos, cafeínas naturales y electrolitos potenciará tu energía, tu estado de ánimo y tu concentración mental.', 'Preentreno', 74, 997, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/OUTLIFT-AMPED-22-SERV.jpg', TRUE),
('OUTLIFT BURN 22 SERVING', 'Ahora puedes tener lo mejor de ambos mundos con el pre-entrenamiento quemador de grasa (termogénico) más completo del mercado, Outlift Burn.', 'Preentreno', 47, 997, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/OUTLIFT-BURN-22-SERV.jpg', TRUE),
('RAZE ENERGY DRINK 16 ONZAS', 'Energía hidratante, rápida recuperación restaurativa Resistencia, intensidad, enfoque mental Cero azúcar, 300 mg de cafeína, 0 calorías.', 'Preentreno', 28, 48, 'https://nutrispothonduras.com/wp-content/uploads/2022/06/Raze-Pear-.jpg', TRUE),
('RYSE ENERGY DRINK 16 ONZAS', 'RYSE ENERGY DRINK 16 ONZAS', 'Preentreno', 4, 49, 'https://nutrispothonduras.com/wp-content/uploads/2023/11/Ryse-Drink-16on-Ring-Pop.jpg', TRUE);

/*Aminoacidos*/
INSERT INTO Productos (NombreProducto, descripcion, Categoria, cantidad, precio, imagen, estado)
VALUES ('CELSIUS DRINK 12 ONZAS', 'Celsius es una bebida de gran sabor que te ayuda a ponerte y mantenerte en forma. Múltiples estudios muestran que el consumo de Celsius antes del ejercicio moderado impulsará el metabolismo, quemará calorías.', 'Aminoacidos', 15, 89, 'https://nutrispothonduras.com/wp-content/uploads/2022/02/Celsius-Drink.jpg', TRUE),
('GLUTAMINA NUTREX 300G', 'La Glutamina es el aminoácido único más abundante en el cuerpo humano; como resultado, está involucrado en muchos procesos fisiológicos desde la recuperación hasta el apoyo del sistema inmune.', 'Aminoacidos', 13, 699, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/GLUTAMINA-PURE-300.jpg', TRUE),
('SIMPLY AMINOS', 'No busque más, Simply Aminos sirve con sabor a sandía o ponche de frutas. Con 5 g de aminoácidos esenciales por porción, soporte de hidratación y electrolitos para una función muscular óptima.', 'Aminoacidos', 78, 1299, 'https://nutrispothonduras.com/wp-content/uploads/2023/09/SIMPLY-AMINOS-80-SERV-FRUIT-PUNCH.jpg', TRUE),
('XTEND BCAA', 'Xtend BCAAs de Scivation es la fórmula Nº1 en USA. Xtend BCAAs te ayudará a construir masa muscular y eliminar la masa grasa, mejorando además la resistencia y la recuperación tras el entrenamiento.', 'Aminoacidos', 4, 999, 'https://nutrispothonduras.com/wp-content/uploads/2021/06/Xtend-Bcaa-30serv-Grape.jpeg', TRUE),
('AMINO ENERGY ON', 'Amino Energy de Optimum Nutrition es un suplemento en polvo que contiene una mezcla de aminoácidos esenciales micronizados, con CarnoSyn® beta-alanina y una mezcla energética que ha sido diseñada para utilizar antes, durante y/o después del entrenamiento.', 'Aminoacidos', 3, 700, 'https://nutrispothonduras.com/wp-content/uploads/2020/04/Amino-Enegy-Gree-Apple.png', TRUE),
('AMINO X 30 SERVING', 'AMINO X es una fórmula BCAA libre de estimulantes diseñada para apoyar la resistencia durante su entrenamiento y ayudar en la recuperación de los músculos después del entrenamiento, para que pueda empujar su rendimiento al siguiente nivel.', 'Aminoacidos', 55, 797, 'https://nutrispothonduras.com/wp-content/uploads/2020/07/AMINOX-W-IM-OPT_2000x.png', TRUE),
('HMB 120 CAPSULAS', 'El HMB  es un metabolito de origen natural investigado clínicamente del aminoácido de cadena ramificada leucina. ', 'Aminoacidos', 8, 1097, 'https://nutrispothonduras.com/wp-content/uploads/2020/04/HMB-120-CAPSULAS.png', TRUE);

INSERT INTO Roles (nombre_rol, descripcion_rol) VALUES
('Cliente', 'Usuario que compra productos'),
('Administrador', 'Administra la página web'),
('Vendedor', 'Gestiona productos y pedidos');

INSERT INTO Funciones (nombre_funcion, descripcion) VALUES
('ver_productos', 'Permite ver los productos'),
('añadir_productos', 'Permite añadir nuevos productos'),
('editar_productos', 'Permite editar productos existentes'),
('eliminar_productos', 'Permite eliminar productos'),
('ver_pedidos', 'Permite ver todos los pedidos'),
('gestionar_pedidos', 'Permite gestionar (aprobar/enviar) pedidos'),
('ver_usuarios', 'Permite ver la lista de usuarios'),
('gestionar_usuarios', 'Permite editar y eliminar usuarios'),
('ver_roles', 'Permite ver los roles disponibles'),
('gestionar_roles', 'Permite crear, editar y eliminar roles');

INSERT INTO FuncionesRelacionadasRoles (id_rol, id_funcion) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10);

INSERT INTO Usuarios (nombre_usuario, email, password, telefono, fecha_registro, id_rol) VALUES
('Gonzalo Aciego', 'gonzaloaciego@gmail.com', 'password1', '89186191', '2024-07-01', 1),
('Eder Chacon', 'ederchacon@gmail.com', 'password2', '99360256', '2024-07-01', 2),
('Rodrigo Rodriguez', 'rodrigorodriguez@gmail.com', 'password3', '89503039', '2024-07-01', 3);










