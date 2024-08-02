CREATE DATABASE SuplementosGimnasio;
USE SuplementosGimnasio;


CREATE TABLE
    `user` (
        `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
        `useremail` varchar(80) DEFAULT NULL,
        `username` varchar(80) DEFAULT NULL,
        `userpswd` varchar(128) DEFAULT NULL,
        `userfching` datetime DEFAULT NULL,
        `userpswdest` char(3) DEFAULT NULL,
        `userpswdexp` datetime DEFAULT NULL,
        `userest` char(3) DEFAULT NULL,
        `useractcod` varchar(128) DEFAULT NULL,
        `userpswdchg` varchar(128) DEFAULT NULL,
        `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
        PRIMARY KEY (`usercod`),
        UNIQUE KEY `useremail_UNIQUE` (`useremail`),
        KEY `usertipo` (
            `usertipo`,
            `useremail`,
            `usercod`,
            `userest`
        )
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles` (
        `rolescod` varchar(128) NOT NULL,
        `rolesdsc` varchar(45) DEFAULT NULL,
        `rolesest` char(3) DEFAULT NULL,
        PRIMARY KEY (`rolescod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles_usuarios` (
        `usercod` bigint(10) NOT NULL,
        `rolescod` varchar(128) NOT NULL,
        `roleuserest` char(3) DEFAULT NULL,
        `roleuserfch` datetime DEFAULT NULL,
        `roleuserexp` datetime DEFAULT NULL,
        PRIMARY KEY (`usercod`, `rolescod`),
        KEY `rol_usuario_key_idx` (`rolescod`),
        CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones` (
        `fncod` varchar(255) NOT NULL,
        `fndsc` varchar(255) DEFAULT NULL,
        `fnest` char(3) DEFAULT NULL,
        `fntyp` char(3) DEFAULT NULL,
        PRIMARY KEY (`fncod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones_roles` (
        `rolescod` varchar(128) NOT NULL,
        `fncod` varchar(255) NOT NULL,
        `fnrolest` char(3) DEFAULT NULL,
        `fnexp` datetime DEFAULT NULL,
        PRIMARY KEY (`rolescod`, `fncod`),
        KEY `rol_funcion_key_idx` (`fncod`),
        CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `bitacora` (
        `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
        `bitacorafch` datetime DEFAULT NULL,
        `bitprograma` varchar(255) DEFAULT NULL,
        `bitdescripcion` varchar(255) DEFAULT NULL,
        `bitobservacion` mediumtext,
        `bitTipo` char(3) DEFAULT NULL,
        `bitusuario` bigint(18) DEFAULT NULL,
        PRIMARY KEY (`bitacoracod`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;
    
    CREATE TABLE
    `products` (
        `productId` int(11) NOT NULL AUTO_INCREMENT,
        `productName` varchar(255) NOT NULL,
        `productDescription` text NOT NULL,
        `productPrice` decimal(10, 2) NOT NULL,
        `productImgUrl` varchar(255) NOT NULL,
        `productStock` int(11) NOT NULL DEFAULT 0,
        `productStatus` char(3) NOT NULL,
        PRIMARY KEY (`productId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
        `productId` int(11) NOT NULL,
        `crrctd` INT(5) NOT NULL,
        `crrprc` DECIMAL(12, 2) NOT NULL,
        `crrfching` DATETIME NOT NULL,
        PRIMARY KEY (`usercod`, `productId`),
        INDEX `productId_idx` (`productId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    
CREATE TABLE `carretillaanon` (
    `anoncod` varchar(128) NOT NULL,
    `productId` int(11) NOT NULL,
    `crrctd` int(5) NOT NULL,
    `crrprc` decimal(12, 2) NOT NULL,
    `crrfching` datetime NOT NULL,
    PRIMARY KEY (`anoncod`, `productId`),
    KEY `productId_idx` (`productId`),
    CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `encabezado_ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `usercod` bigint(10) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `usercod` (`usercod`),
  CONSTRAINT `encabezado_ventas_ibfk_1` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `detalle_ventas` (
  `id_venta` int NOT NULL,
  `productId` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_venta`,`productId`),
  KEY `productId` (`productId`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `encabezado_ventas` (`id_venta`)
);

/* Creatinas */
INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStock, productStatus)
VALUES 
('CREATINA INNER ARMOUR 400G 133 SERVING', 'CREATINE MONOHIDRATADA ™ contiene un puro, seguro y efectivo Monohidrato de Creatina. El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 800, 'https://nutrispothonduras.com/wp-content/uploads/2024/07/Creatina-Inner-400g-v1.jpg', 10, 'YES'),
('CREATINA RAZE 300G', 'CREATINE RAZE ™ contiene un puro, seguro y efectivo Monohidrato de Creatina. El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 500, 'https://nutrispothonduras.com/wp-content/uploads/2022/11/Creatina-Raze-300g.jpg', 20, 'YES'),
('CREATINA ULTIMATE 300G', 'El Monohidrato de Creatina es uno de los ingredientes más estudiados e investigados para mejorar el rendimiento deportivo. Se ha demostrado que la creatina aumenta la resistencia, la masa muscular y la fuerza cuando se toma como parte de un régimen de entrenamiento.', 1093, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/Creatina-Ultimate-300g.jpg', 3, 'YES'),
('ISO SENSATION 5LB + CREATINA ULTIMATE 300G', 'ISO Sensation® 93 incluye un complejo de glutamina para ayudar a preservar la masa muscular y mejorar el equilibrio de nitrógeno.', 2497, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/ISO-SENSATION-5LB-CREATINA-ULTIMATE-300G.jpg', 2, 'YES'),
('CREATINE NUTREX 1000G 200 SERVING', 'CREATINE NUTREX ™ contiene un puro, seguro y efectivo Monohidrato de Creatina. El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo. Nuestro monohidrato de creatina satisface incluso las demandas más exigentes de los consumidores en cuanto a calidad, seguridad y eficacia.', 1399, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/Creatina-Nutrex-200-serv.jpg', 5, 'YES'),
('CREATINE NUTREX 300G', 'CREATINE NUTREX ™ contiene un puro, seguro y efectivo Monohidrato de Creatina. El Monohidrato de Creatina generalmente se toma diariamente en cantidades de constante de 5 Gr durante un período de tiempo bastante largo.', 650, 'https://nutrispothonduras.com/wp-content/uploads/2023/11/Creatina-Nutrex-300g-.jpg', 1, 'YES');

/* Proteinas */
INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStock, productStatus)
VALUES 
('ANABOLIC PEAK', 'Anabolic Peak es una fórmula proteica altamente concentrada, contiene una mezcla de aminoácidos rica en glutamina y aminoácidos ramificados los cuales proporcionarán una rápida recuperación y máximo crecimiento muscular. Además, es altamente energética, especial para personas con un metabolismo acelerado.', 999, 'https://nutrispothonduras.com/wp-content/uploads/2023/08/ANABOLIC-PEAK-12-LB.jpg', 25, 'YES'),
('HYDROWHEY 3.5 LB', 'Platinum HYDROWHEY hidrolizado y de rápida digestión es la proteína de suero más avanzada que jamás hayamos desarrollado y contiene 100 % de aislado de proteína de suero hidrolizado.', 2400, 'https://nutrispothonduras.com/wp-content/uploads/2024/03/HYDROWHEY-3.5-LB.jpg', 10, 'YES'),
('LENNY & LARRY COOKIES', '¡Galletas de proteína de origen vegetal sorprendentemente deliciosas y nutritivas!', 75, 'https://nutrispothonduras.com/wp-content/uploads/2022/02/Lenny-Larry-Cookies-complete.jpeg', 100, 'YES'),
('PROTEIN COOKIES', 'Quest Protein Cookies es la galleta de proteínas de mejor calidad del mercado. Por fin es posible consumir una barrita de proteínas con un contenido de azúcares y carbohidratos realmente bajo.', 85, 'https://nutrispothonduras.com/wp-content/uploads/2020/12/PROTEIN-COOKIES.jpg', 7, 'YES'),
('SERIOUS MASS GAINER', 'Serious Mass es lo último en fórmulas de aumento de peso. Con 1.250 calorías por porción y 50 gramos de proteína para apoyar la recuperación muscular, este polvo para uso instantáneo hace el batido ideal post-entrenamiento y entre las comidas para dimensionar sus objetivos.', 2700, 'https://nutrispothonduras.com/wp-content/uploads/2021/09/PRODUCTOS-NUTRISPOT.png', 2, 'YES'),
('SIMPLY 100% WHEY PROTEIN', 'No busques más que Simply Whey Protein 5LB en sabor a chocolate o vainilla. Con 25 g de proteína por porción, aminoácidos esenciales y bajo contenido de grasas y carbohidratos.', 1700, 'https://nutrispothonduras.com/wp-content/uploads/2023/09/WHEY-PROTEIN-5-LB-VAINILLA1.jpg', 22, 'YES'),
('RAZE WHEY 2 LB', 'Los aislados de proteína de suero (WPI) son la forma más pura de proteína de suero que existe en la actualidad. WPI son costosos de usar, pero están entre las mejores proteínas que el dinero puede comprar.', 1000, 'https://nutrispothonduras.com/wp-content/uploads/2023/07/RAZE-WHEY-2-LB-VAINILLA.jpg', 7, 'YES');

/* Preentreno */
INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStock, productStatus)
VALUES 
('CELSIUS DRINK 12 ONZAS', 'Celsius es una bebida de gran sabor que te ayuda a ponerte y mantenerte en forma. Múltiples estudios muestran que el consumo de Celsius antes del ejercicio moderado impulsará el metabolismo, quemará calorías, reducirá la grasa corporal, proporcionará energía duradera y mejorará la resistencia.', 89, 'https://nutrispothonduras.com/wp-content/uploads/2022/02/Celsius-Drink.jpg', 12, 'YES'),
('L-ARGININE 120 CAPSULAS', 'Deje que L-ARGININE 1000 libere su potencial de rendimiento con el poder de un flujo sanguíneo mejorado. Un potente aminoácido, la L-Arginina, actúa como vasodilatador y se convierte sin problemas en óxido nítrico dentro del cuerpo.', 599, 'https://nutrispothonduras.com/wp-content/uploads/2024/02/L-ARGININE-120-CAPS.jpg', 15, 'YES'),
('OUTLIFT AMPED 22 SERVING', 'Es hora de aumentar tu intensidad al máximo con OUTLIFT® AMPED, la fórmula definitiva de alta estimulación previa al entrenamiento. Esta potente combinación de nootrópicos, cafeínas naturales y electrolitos potenciará tu energía, tu estado de ánimo y tu concentración mental.', 997, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/OUTLIFT-AMPED-22-SERV.jpg', 74, 'YES'),
('OUTLIFT BURN 22 SERVING', 'Ahora puedes tener lo mejor de ambos mundos con el pre-entrenamiento quemador de grasa (termogénico) más completo del mercado, Outlift Burn.', 997, 'https://nutrispothonduras.com/wp-content/uploads/2024/04/OUTLIFT-BURN-22-SERV.jpg', 47, 'YES');
