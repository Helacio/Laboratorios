/* SQL LABORATORIO 05
    Felipe Calvache - Hernan Sanchez
*/


-- C. Construccion: creando

-- CICLO 1: TABLAS

CREATE TABLE PRODUCTOS (
    nombre VARCHAR(5) NOT NULL,
    precio NUMBER(9, 0) NOT NULL
);

CREATE TABLE BASICOS (
    nombreProducto VARCHAR(5) NOT NULL,
    descripcion VARCHAR(10)
);

CREATE TABLE DESAYUNOS (
    nombreProducto VARCHAR(5) NOT NULL,
    decoracion VARCHAR(10),
    personas NUMBER(3, 0) NOT NULL
);

CREATE TABLE SeVendeEn (
    nombreProducto VARCHAR(5) NOT NULL,
    nombreEstilo VARCHAR(7) NOT NULL,
    precio NUMBER(9, 0) NOT NULL
);

CREATE TABLE ESTILOS (
    nombre VARCHAR(7) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE SePiden (
    nombreProducto VARCHAR(5) NOT NULL,
    numeroFactura NUMBER(5, 0) NOT NULL,
    unidades NUMBER(3, 0) NOT NULL
);

CREATE TABLE FACTURAS (
    numero NUMBER(5, 0) NOT NULL,
    fecha DATE NOT NULL,
    entrega DATE NOT NULL,
    unidades NUMBER(3, 0) NOT NULL,
    hora CHAR(5),
    detalle VARCHAR(100),
    total NUMBER(9, 0) NOT NULL,
    estado CHAR(1) NOT NULL,
    boleta NUMBER(10, 0) NOT NULL,
    nombreEstilo VARCHAR(7) NOT NULL,
    cedulaComprador NUMBER(15, 0) NOT NULL,
    cedulaDestinatario NUMBER(15, 0) NOT NULL
);

CREATE TABLE CLIENTES (
    cedula INTEGER NOT NULL,
    nombre VARCHAR(100),
    descuento INTEGER,
    direccion VARCHAR(100),
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE TELEFONOS (
    cedulaCliente NUMBER(15, 0) NOT NULL,
    telefono VARCHAR(7) NOT NULL
);

CREATE TABLE CampañasPublicitarias (
    id VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    presupuesto NUMBER(9, 0) NOT NULL,
    fechaInicio DATE NOT NULL,
    duracion VARCHAR(7) NOT NULL,
    nombreProducto VARCHAR(5) NOT NULL
);

CREATE TABLE ANUNCIOS (
    idAnuncio VARCHAR(10) NOT NULL,
    tituloDescriptivo VARCHAR(50) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    costo NUMBER(9, 0) NOT NULL,
    estado VARCHAR(9) NOT NULL,
    idCampañaPublicitaria VARCHAR(10) NOT NULL
);

CREATE TABLE FISICOS (
    idAnuncio VARCHAR(10) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    dimensiones VARCHAR(7) NOT NULL
);

CREATE TABLE DIGITALES (
    idAnuncio VARCHAR(10) NOT NULL,
    url VARCHAR(50) NOT NULL,
    especificacion VARCHAR2(50) NOT NULL
);


-- CICLO 1: xTablas

DROP TABLE SePiden;
DROP TABLE BASICOS;
DROP TABLE SeVendeEn;
DROP TABLE DESAYUNOS;
DROP TABLE FACTURAS;
DROP TABLE ESTILOS;
DROP TABLE TELEFONOS;
DROP TABLE CLIENTES;
DROP TABLE FISICOS;
DROP TABLE DIGITALES;
DROP TABLE ANUNCIOS;
DROP TABLE CampañasPublicitarias;
DROP TABLE PRODUCTOS;


-- D. Construccion: poblando

-- CICLO 1: PoblarOK

-- 1)

INSERT INTO PRODUCTOS VALUES ('U9560', 4344);
INSERT INTO PRODUCTOS VALUES ('Y1348', 9500);
INSERT INTO PRODUCTOS VALUES ('S8048', 9500);

INSERT INTO BASICOS VALUES('S8048', 'Frances');
INSERT INTO BASICOS VALUES('Y1348',NULL);
INSERT INTO BASICOS VALUES('U9560','Costeño');

INSERT INTO DESAYUNOS VALUES('S8048', 'Globos', 150);
INSERT INTO DESAYUNOS VALUES('Y1348', 'Sencilla', 15);
INSERT INTO DESAYUNOS VALUES('U9560', NULL, 50);

INSERT INTO ESTILOS VALUES('Simple', 'Se sirve en bandejas, platos y pocillos de carton y servilletas de papel.');
INSERT INTO ESTILOS VALUES('Normal', 'se sirve en bandejas de madera, platos, vasos y pocillos de ceramica, y servilletas de algodon.');
INSERT INTO ESTILOS VALUES('De Lujo', 'se sirve en bandejas de plata,platos y pocillos de porcelana,vasos de cristal y servilletas de lino.');

INSERT INTO SeVendeEn VALUES('S8048', 'Simple', 400);
INSERT INTO SeVendeEn VALUES('Y1348', 'Normal', 550);
INSERT INTO SeVendeEn VALUES('U9560', 'De Lujo', 900);

INSERT INTO CLIENTES VALUES(1001064920, 'Felipe Calvache', 90.0, 'Cra 7 # 7 - 39', 'felipe.calvache@gmail.com');
INSERT INTO CLIENTES VALUES(1001098441, 'Hernan Sanchez', 0, 'Cra 13 # 13 - 20', 'hernan.sanchez@hotmail.com');
INSERT INTO CLIENTES VALUES(35510050, 'Laura Herrera', 10.0, 'Cra 7 # 93 - 45', 'laura.herrera@outlook.com');
INSERT INTO CLIENTES VALUES(1001500232, 'Cristian Quinche', 40.0, 'Cra 7 # 93 - 45', 'cristian.quinche@outlook.com');
INSERT INTO CLIENTES VALUES(1001355202, 'Natalia Rojas', 30.0, 'Cra 7 # 93 - 45', 'natalia.rojas@outlook.com');
INSERT INTO CLIENTES VALUES(1001064919, 'David Sanchez', 20.0, 'Cra 7 # 93 - 45', 'david.sanchez@outlook.com');

INSERT INTO FACTURAS VALUES(59882, TO_DATE('2025-03-13', 'YYYY-MM-DD'), TO_DATE('2025-03-19', 'YYYY-MM-DD'), 30, NULL, 'Todos te queremos', 500,'N', 1022222, 'Simple', 1001064920, 1001500232);
INSERT INTO FACTURAS VALUES(45451, TO_DATE('2025-03-06', 'YYYY-MM-DD'), TO_DATE('2025-03-13', 'YYYY-MM-DD'), 6, NULL, 'Feliz cumpleaños', 900, 'B', 2000000, 'De Lujo', 1001098441, 1001355202);
INSERT INTO FACTURAS VALUES(22121, TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), 100, NULL, '¿Quieres ser mi novia?', 800, 'P', 820000, 'Normal', 35510050, 1001064919);

INSERT INTO SePiden VALUES('U9560', 22121, 30);
INSERT INTO SePiden VALUES('Y1348', 45451, 6);
INSERT INTO SePiden VALUES('S8048', 59882, 100);

INSERT INTO TELEFONOS VALUES(1001064920, '3233919');
INSERT INTO TELEFONOS VALUES(1001098441, '3115589');
INSERT INTO TELEFONOS VALUES(35510050, '3158416');

INSERT INTO CampañasPublicitarias VALUES('3233919837', 'Dia de la mujer', 'Dale una sorpresa en la mañana a las madres', 6000, TO_DATE('2025-03-15', 'YYYY-MM-DD'), '9 dias', 'S8048');
INSERT INTO CampañasPublicitarias VALUES('3158416060', 'Cumpleaños', 'Regalale un desayuno al cumpleañero', 15000, TO_DATE('2025-04-19', 'YYYY-MM-DD'),'4 dias', 'Y1348');
INSERT INTO CampañasPublicitarias VALUES('2103003399', 'Dia de los amigos', 'Empiecen el dia desde temprano', 1000, TO_DATE('2025-03-13', 'YYYY-MM-DD'), '8 dias', 'U9560');

INSERT INTO ANUNCIOS VALUES('1234567890', 'Vallas Publicitarias', TO_DATE('2025-03-13', 'YYYY-MM-DD'), TO_DATE('2025-05-13', 'YYYY-MM-DD'), 2000, 'activo', '3233919837');
INSERT INTO ANUNCIOS VALUES('0987456123', 'Panfletos', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 2500, 'cancelado', '3158416060');
INSERT INTO ANUNCIOS VALUES('1593578462', 'Redes Sociales', TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 3000, 'activo', '2103003399');

INSERT INTO FISICOS VALUES('1234567890', 'Cra 26 # 54 - 39', '3x3 m');
INSERT INTO FISICOS VALUES('1593578462', 'Cra 102 # 7 - 14', '4x3 m');
INSERT INTO FISICOS VALUES('0987456123', 'Cra 7 # 163 - 11', '8x3 m');

INSERT INTO DIGITALES VALUES('0987456123', 'https://www.tesla.com/', 'Video');
INSERT INTO DIGITALES VALUES('1593578462', 'https://www.microsoft.com/', 'Imagen');
INSERT INTO DIGITALES VALUES('1234567890', 'https://www.google.es', 'Video');


-- CICLO 1: PoblarNoOK

-- 2)

/*  El tipo que definimos para precio es un number, y lo que queremos insertar es una cadena
    La respuesta correcta seria: INSERT INTO PRODUCTOS VALUES ('U9560', 100);   */

INSERT INTO PRODUCTOS VALUES ('U9560', "Cien");

/*  En la creacion de la tabla ESTILOS definimos que la descripcion no podia estar NULA,
    por eso nos da un error de integridad, se espera que haya un valor en la descripcion.   */

INSERT INTO ESTILOS VALUES ('Simple', NULL);

/*  Se definio que el nombre del cliente era una cadena de longitud 20. El nombre que se
    intento insertar tiene 30 caracteres por lo que terminara en un error de longitud   */

INSERT INTO CLIENTES VALUES(1001064920, 'Cristian Camilo Quinche Berrio', 90.0, 'Cra 7 # 7 - 39', 'felipe.calvache@gmail.com');


-- 3)

/*  El idAnuncio es una llave primaria, por lo que no se deberia permitir valores repetidos ni nulos.
    Aun asi en este caso se pude volver a insertar la misma fila    */

INSERT INTO FISICOS VALUES('0987456123', 'Cra 7 # 163 - 11', '8x3 m');

/*  Como regla de negocio se definio que el presupuesto de una campaña no podia ser negativo, sin embargo
    al insertar el valor -1500, no hay nada que lo detenga y es permitida esa insercion  */

INSERT INTO CampañasPublicitarias VALUES('3158416060', 'Cumpleaños', 'Regalale un desayuno al cumpleañero', -1500, TO_DATE('2025-04-19', 'YYYY-MM-DD'),'4 dias', 'Y1348');

/*  Como regla de negocio se definio que los estados de los anuncios pueden ser 'activo' o 'cancelado'.
    Se espera que al insertar un estado distinto no lo permita, pero eso no ocurre en este caso */

INSERT INTO ANUNCIOS VALUES('0987456123', 'Panfletos', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 2500, 'aplazado', '3158416060');


-- CICLO 1: xPoblar

DELETE FROM PRODUCTOS;
DELETE FROM BASICOS;
DELETE FROM DESAYUNOS;
DELETE FROM SeVendeEn;
DELETE FROM ESTILOS;
DELETE FROM SePiden;
DELETE FROM FACTURAS;
DELETE FROM CLIENTES;
DELETE FROM TELEFONOS;
DELETE FROM CampañasPublicitarias;
DELETE FROM ANUNCIOS;
DELETE FROM FISICOS;
DELETE FROM DIGITALES;


-- D. Construccion: protegiendo

-- 1)

-- CICLO 1: Atributos

ALTER TABLE PRODUCTOS
ADD CONSTRAINT CK_Tmoneda_p CHECK (precio > 0);

ALTER TABLE DESAYUNOS
ADD CONSTRAINT CK_Tpositivo_d CHECK (personas > 0);

ALTER TABLE SeVendeEn
ADD CONSTRAINT CK_Tmoneda_sve CHECK (precio > 0);

ALTER TABLE SePiden
ADD CONSTRAINT CK_Tpositivo_sp CHECK (unidades > 0);

ALTER TABLE FACTURAS
ADD CONSTRAINT CK_Tpositivo_f CHECK (unidades > 0);

ALTER TABLE FACTURAS
ADD CONSTRAINT CK_Thora CHECK ((SUBSTR(hora, 1, 2) BETWEEN '05' AND '12') AND (SUBSTR(hora, 4, 2) = '00' OR SUBSTR(hora, 4, 2) = '30'));

ALTER TABLE FACTURAS
ADD CONSTRAINT CK_Tmoneda_f CHECK (total > 0);

ALTER TABLE FACTURAS
ADD CONSTRAINT CK_estado CHECK (estado IN ('N', 'B', 'P', 'E'));

ALTER TABLE FACTURAS
ADD CONSTRAINT CK_Tboleta CHECK (boleta > 100000);

ALTER TABLE CLIENTES
ADD CONSTRAINT CK_Tporcentaje CHECK (descuento BETWEEN 0 AND 100);

ALTER TABLE CampañasPublicitarias
ADD CONSTRAINT CK_Tmoneda_cp CHECK (presupuesto > 0);

ALTER TABLE CampañasPublicitarias
ADD CONSTRAINT CK_Tduracion CHECK (duracion LIKE '% dias' AND TO_NUMBER(SUBSTR(duracion, 1, INSTR(duracion, ' ') - 1)) > 0);

ALTER TABLE ANUNCIOS
ADD CONSTRAINT CK_Tmoneda_a CHECK (costo > 0);

ALTER TABLE ANUNCIOS
ADD CONSTRAINT CK_TestadoA CHECK (estado IN ('activo', 'cancelado'));

ALTER TABLE FISICOS
ADD CONSTRAINT CK_Tdireccion CHECK (REGEXP_LIKE(direccion, '^Cra [0-9]+ # [0-9]+ - [0-9]+$'));


-- CICLO 1: Primarias

ALTER TABLE PRODUCTOS
ADD CONSTRAINT PK_productos PRIMARY KEY (nombre);

ALTER TABLE BASICOS
ADD CONSTRAINT PK_basicos PRIMARY KEY (nombreProducto);

ALTER TABLE DESAYUNOS
ADD CONSTRAINT PK_desayunos PRIMARY KEY (nombreProducto);

ALTER TABLE SeVendeEn
ADD CONSTRAINT PK_SeVendeEn PRIMARY KEY (nombreProducto, nombreEstilo);

ALTER TABLE ESTILOS
ADD CONSTRAINT PK_estilos PRIMARY KEY (nombre);

ALTER TABLE SePiden
ADD CONSTRAINT PK_SePiden PRIMARY KEY (nombreProducto, numeroFactura);

ALTER TABLE FACTURAS
ADD CONSTRAINT PK_facturas PRIMARY KEY (numero);

ALTER TABLE CLIENTES
ADD CONSTRAINT PK_clientes PRIMARY KEY (cedula);

ALTER TABLE TELEFONOS
ADD CONSTRAINT PK_telefonos PRIMARY KEY (cedulaCliente, telefono);

ALTER TABLE CampañasPublicitarias
ADD CONSTRAINT CampañasPublicitarias PRIMARY KEY (id);

ALTER TABLE ANUNCIOS
ADD CONSTRAINT PK_anuncios PRIMARY KEY (idAnuncio);

ALTER TABLE FISICOS
ADD CONSTRAINT PK_fisicos PRIMARY KEY (idAnuncio);

ALTER TABLE DIGITALES
ADD CONSTRAINT PK_digitales PRIMARY KEY (idAnuncio);


-- CICLO 1: Unicas

ALTER TABLE FACTURAS
ADD CONSTRAINT UK_facturas UNIQUE (boleta);

ALTER TABLE CampañasPublicitarias
ADD CONSTRAINT UK_CampapñasPublicitarias UNIQUE (nombre);


-- CICLO 1: Foraneas

ALTER TABLE BASICOS ADD CONSTRAINT FK_basicos
FOREIGN KEY (nombreProducto) REFERENCES PRODUCTOS(nombre);

ALTER TABLE DESAYUNOS ADD CONSTRAINT FK_desayunos
FOREIGN KEY (nombreProducto) REFERENCES PRODUCTOS(nombre);

ALTER TABLE SeVendeEn ADD CONSTRAINT FK_SeVendeEn1
FOREIGN KEY (nombreProducto) REFERENCES DESAYUNOS(nombreProducto);

ALTER TABLE SeVendeEn ADD CONSTRAINT FK_SeVendeEn2
FOREIGN KEY (nombreEstilo) REFERENCES ESTILOS(nombre);

ALTER TABLE SePiden ADD CONSTRAINT FK_SePiden1
FOREIGN KEY (nombreProducto) REFERENCES BASICOS(nombreProducto);

ALTER TABLE SePiden ADD CONSTRAINT FK_SePiden2
FOREIGN KEY (numeroFactura) REFERENCES FACTURAS(numero);

ALTER TABLE FACTURAS ADD CONSTRAINT FK_facturas1
FOREIGN KEY (nombreEstilo) REFERENCES ESTILOS(nombre);

ALTER TABLE FACTURAS ADD CONSTRAINT FK_facturas2
FOREIGN KEY (cedulaComprador) REFERENCES CLIENTES(cedula);

ALTER TABLE FACTURAS ADD CONSTRAINT FK_facturas3
FOREIGN KEY (cedulaDestinatario) REFERENCES CLIENTES(cedula);

ALTER TABLE TELEFONOS ADD CONSTRAINT FK_telefonos
FOREIGN KEY (cedulaCliente) REFERENCES CLIENTES(cedula);

ALTER TABLE CampañasPublicitarias ADD CONSTRAINT FK_CampañasPublicitarias
FOREIGN KEY (nombreProducto) REFERENCES PRODUCTOS(nombre);

ALTER TABLE ANUNCIOS ADD CONSTRAINT FK_anuncios
FOREIGN KEY (idCampañaPublicitaria) REFERENCES CampañasPublicitarias(id);

ALTER TABLE FISICOS ADD CONSTRAINT FK_fisicos
FOREIGN KEY (idAnuncio) REFERENCES ANUNCIOS(idAnuncio);

ALTER TABLE DIGITALES ADD CONSTRAINT FK_digitales
FOREIGN KEY (idAnuncio) REFERENCES ANUNCIOS(idAnuncio);


-- CICLO 1: PoblarNoOK

-- 2)

/*  El idAnuncio es una llave primaria, por lo que no se deberia permitir valores repetidos ni nulos.
    Aun asi en este caso se pude volver a insertar la misma fila    
    
    PK_fisicos  */

INSERT INTO FISICOS VALUES('0987456123', 'Cra 7 # 163 - 11', '8x3 m');

/*  Como regla de negocio se definio que el presupuesto de una campaña no podia ser negativo, sin embargo
    al insertar el valor -1500, no hay nada que lo detenga y es permitida esa insercion   
    
    CK_Tmoneda_cp   */

INSERT INTO CampañasPublicitarias VALUES('3158416060', 'Cumpleaños', 'Regalale un desayuno al cumpleañero', -1500, TO_DATE('2025-04-19', 'YYYY-MM-DD'),'4 dias', 'Y1348');

/*  Como regla de negocio se definio que los estados de los anuncios pueden ser 'activo' o 'cancelado'.
    Se espera que al insertar un estado distinto no lo permita, pero eso no ocurre en este caso 
    
    CK_TestadoA */

INSERT INTO ANUNCIOS VALUES('0987456123', 'Panfletos', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 2500, 'aplazado', '3158416060');
 
 
-- 3)

-- CK_estado   
INSERT INTO FACTURAS VALUES(22122, TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), 100, NULL, '¿Quieres ser mi novia?', 800, 'X', 820000, 'Normal', 35510050, 1001064919);

-- PK_facturas
INSERT INTO FACTURAS VALUES(22121, TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), 100, NULL, '¿Quieres ser mi novia?', 800, 'N', 820000, 'Normal', 35510050, 1001064919);


-- CICLO 1: Consultar productos más vendidos
SELECT SePiden.nombreProducto, Productos.precio, SUM(SePiden.unidades) AS total_unidades_vendidas
FROM SePiden 
JOIN Productos ON SePiden.nombreProducto = Productos.nombre
GROUP BY SePiden.nombreProducto, Productos.precio
ORDER BY total_unidades_vendidas DESC;

-- CICLO 1: Consultar los estilos de presentación más populares
SELECT Clientes.nombre, COUNT(Facturas.numero) AS cantidad_compras
FROM Clientes
JOIN Facturas ON Clientes.cedula = Facturas.cedulaComprador
GROUP BY Clientes.nombre
ORDER BY cantidad_compras DESC;


-- INICIO LAB05

-- C. Modelo físico.

INSERT INTO CLIENTES (cedula, nombre, descuento, direccion, correo)
SELECT CEDULA, NOMBRE, COALESCE(DESCUENTO, 0.10), DIRECCION, COALESCE(EMAIL, CEDULA || '@mananitas.com')
FROM MBDA.DATA;


-- COMPONENTES:

-- Paquete Facturas

-- CRUDE

CREATE OR REPLACE PACKAGE PKG_Facturas
IS
PROCEDURE adicionarFactura(numero NUMBER, fecha DATE, entrega DATE, unidades NUMBER, hora CHAR, detalle VARCHAR,
    total NUMBER, estado CHAR, boleta NUMBER, nombreEstilo VARCHAR,
    cedulaComprador NUMBER, cedulaDestinatario NUMBER);
PROCEDURE consultarFactura(numero NUMBER, CFACTURA OUT SYS_REFCURSOR);
PROCEDURE consultarProductosMasVendidos(CProdMasVendido OUT SYS_REFCURSOR);
PROCEDURE consultarcomprasbajas(CEstPopular OUT SYS_REFCURSOR);
PROCEDURE consultarEstilosMayorGanacia(CEstiloMasGanancia OUT SYS_REFCURSOR);
END;

-- CRUDI

CREATE OR REPLACE PACKAGE BODY PKG_Facturas
IS
    -- Adicionar factura
    PROCEDURE adicionarFactura(numero NUMBER, fecha DATE, entrega DATE, unidades NUMBER, hora CHAR, detalle VARCHAR,
    total NUMBER, estado CHAR, boleta NUMBER, nombreEstilo VARCHAR,
    cedulaComprador NUMBER, cedulaDestinatario NUMBER)IS
    BEGIN
        INSERT INTO FACTURAS VALUES (numero, fecha, entrega, unidades, hora, detalle, total, estado, boleta, nombreEstilo,
            cedulaComprador, cedulaDestinatario);
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-2050, SQLERRM);
    END adicionarFactura;

    -- Consultar factura
    PROCEDURE consultarFactura(numero NUMBER, CFACTURA OUT SYS_REFCURSOR) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM FACTURAS
        WHERE numero = consultarFactura.numero;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-2051, 'Factura no encontrada');
        END IF;

        OPEN CFACTURA FOR
        SELECT numero, fecha, entrega, unidades, hora, detalle, total, estado, boleta, cedulaComprador
        FROM FACTURAS 
        WHERE numero = consultarFactura.numero;

    END consultarFactura;

    -- Consultar productos más vendidos
    PROCEDURE consultarProductosMasVendidos(CProdMasVendido OUT SYS_REFCURSOR) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM SePiden;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-2052, 'No hay productos vendidos');
        END IF;

        OPEN CProdMasVendido FOR
        SELECT SePiden.nombreProducto, Productos.precio, SUM(SePiden.unidades) AS total_unidades_vendidas
        FROM SePiden 
        JOIN Productos ON SePiden.nombreProducto = Productos.nombre
        GROUP BY SePiden.nombreProducto, Productos.precio
        ORDER BY total_unidades_vendidas DESC;
    END consultarProductosMasVendidos;

    --Consultar compras bajas
    PROCEDURE consultarcomprasbajas(CEstPopular OUT SYS_REFCURSOR) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count 
        FROM Clientes JOIN Facturas ON Clientes.cedula = Facturas.cedulaComprador;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-2053, 'No hay compras registradas');
        END IF;

        OPEN CEstPopular FOR
        SELECT Clientes.nombre, COUNT(Facturas.numero) AS cantidad_compras
        FROM Clientes
        JOIN Facturas ON Clientes.cedula = Facturas.cedulaComprador
        GROUP BY Clientes.nombre
        ORDER BY cantidad_compras DESC;
    END consultarcomprasbajas;

    -- Consultar estilos con mayor ganancia
    PROCEDURE consultarEstilosMayorGanacia(CEstiloMasGanancia OUT SYS_REFCURSOR) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM FACTURAS;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-2054, 'No hay facturas registradas para estilos');
        END IF;

        OPEN CEstiloMasGanancia FOR
        SELECT nombreEstilo, SUM(total) AS total_ganancia
        FROM FACTURAS
        GROUP BY nombreEstilo
        ORDER BY total_ganancia DESC;
    END consultarEstilosMayorGanacia;
END;


-- XCRUD
DROP PACKAGE PKG_Facturas;


-- CRUD OK

-- 1. Insertar factura valida
BEGIN
  PKG_Facturas.adicionarFactura(
    10001, DATE '2025-05-02', DATE '2025-05-05', 3, '14:00', 'Pedido regular',
    150000, 'B', 8001001, 'Normal',
    35515920, 1001064123
  );
END;

-- 2. Consultar factura
VARIABLE rc REFCURSOR;
EXEC PKG_Facturas.consultarFactura(10001, :rc);
PRINT rc;


-- 3. Consultar productos mas vendidos
VARIABLE rc REFCURSOR;
EXEC PKG_Facturas.consultarProductosMasVendidos(:rc);
PRINT rc;

-- 4. Consultar compras bajas
VARIABLE rc REFCURSOR;
EXEC PKG_Facturas.consultarcomprasbajas(:rc);
PRINT rc;

-- 5. Consultar estilos con mayor ganancia
VARIABLE rc REFCURSOR;
EXEC PKG_Facturas.consultarEstilosMayorGanacia(:rc);
PRINT rc;


-- CRUD NO OK

-- 1. Consultar factura inexistente
VARIABLE rc REFCURSOR;
EXEC PKG_Facturas.consultarFactura(99999, :rc);
PRINT rc;

-- 2. Insertar factura duplicada
BEGIN
  PKG_Facturas.adicionarFactura(
    100001, DATE '2025-05-02', DATE '2025-05-05', 3, '14:00', 'Duplicado',
    150000, 'A', 8001001, 'ST123',
    1234567890, 9876543210
  );
END;

-- 3. Insertar facutra con cedula inexistente (Nofunciona)
BEGIN
  PKG_Facturas.adicionarFactura(
    1002, DATE '2025-05-04', DATE '2025-05-06', 1, '16:00', 'Comprador inexistente',
    70000, 'A', 8001003, 'ST002',
    9999999999, 9876543210  -- cédula no registrada
  );
END;


-- ACTORESE

-- PAQUETE ADMINISTRADOR
CREATE OR REPLACE PACKAGE PKG_ADMINISTRADOR
IS
    PROCEDURE consultarDesayunosAD(CDesayunos OUT SYS_REFCURSOR);
    PROCEDURE consultarClientesAD(CClientes OUT SYS_REFCURSOR);
    PROCEDURE consultarProductosAD(CProductos OUT SYS_REFCURSOR);
END;

-- PAQUETE VENDEDOR
CREATE OR REPLACE PACKAGE PKG_VENDEDOR
IS
    PROCEDURE consultarVentasVE(CVentas OUT SYS_REFCURSOR);
END;


-- ACTORESI

-- (PACKAGE BODY) ADMINISTRADOR

CREATE OR REPLACE PACKAGE BODY PKG_ADMINISTRADOR
IS
    PROCEDURE consultarDesayunosAD(CDesayunos OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN CDesayunos FOR
        SELECT nombreProducto, decoracion, personas
        FROM DESAYUNOS;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20084, SQLERRM);
    END consultarDesayunosAD;
    
    PROCEDURE consultarClientesAD(CClientes OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN CClientes FOR 
        SELECT cedula, nombre, descuento, direccion, correo FROM CLIENTES;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20085, SQLERRM);
    END consultarClientesAD;
    
    PROCEDURE consultarProductosAD(CProductos OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN CProductos FOR 
        SELECT nombre, precio
        FROM PRODUCTOS;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20086, SQLERRM);
    END consultarProductosAD;
END;

-- (PACKAGE BODY) VENDEDOR
CREATE OR REPLACE PACKAGE  BODY PKG_VENDEDOR
IS
    PROCEDURE consultarVentasVE(CVentas OUT SYS_REFCURSOR)IS
    BEGIN
        OPEN CVentas FOR SELECT numero, fecha, unidades, hora, detalle, total, cedulaComprador FROM FACTURAS;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20089, SQLERRM);
    END consultarVentasVE;
END;


-- XPACKAGE
DROP PACKAGE PKG_ADMINISTRADOR;
DROP PACKAGE PKG_VENDEDOR;


-- SEGURIDAD

-- ROLES
CREATE ROLE ADMINISTRADORES;
CREATE ROLE VENDEDORES;

-- PERMISOS
-- ADMINISTRADOR
GRANT EXECUTE
ON PKG_ADMINISTRADOR
TO ADMINISTRADOR;

-- VENDEDOR
GRANT EXECUTE
ON PKG_VENDEDOR
TO VENDEDOR;

