-- CREACIÓN DE LAS TABLAS

CREATE TABLE usuarios (
    id_usuario BIGINT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE,
    telefono INT
);


CREATE TABLE libro (
    id_libro VARCHAR(50) PRIMARY KEY,
    ISBN INT UNIQUE NOT NULL,
    genero VARCHAR(50),
    anno VARCHAR(4), 
    titulo VARCHAR(255) NOT NULL
);


CREATE TABLE categoria (
    id_cate VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE prestamos (
    id_prestamo VARCHAR(50) PRIMARY KEY,
    devolucion VARCHAR(50), 
    fecha DATE,
    id_usuario BIGINT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE ejemplares (
    id_ejemplar VARCHAR(50) PRIMARY KEY,
    estado VARCHAR(50),
    id_prestamo VARCHAR(50),
    id_libro VARCHAR(50),
    FOREIGN KEY (id_prestamo) REFERENCES prestamos(id_prestamo),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);


CREATE TABLE reseñas (
    id_reseña VARCHAR(50) PRIMARY KEY,
    fecha DATE,
    comentario VARCHAR(500),
    calificacion VARCHAR(10),
    id_usuario BIGINT,
    id_libro VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);


CREATE TABLE libro_categoria (
    id_libro VARCHAR(50),
    id_cate VARCHAR(50),
    PRIMARY KEY (id_libro, id_cate),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro),
    FOREIGN KEY (id_cate) REFERENCES categoria(id_cate)
);

-- AGREGANDO LOS DATOS A LAS TABLAS

INSERT INTO categoria (id_cate, nombre) VALUES 
('CAT01', 'Ficción'),
('CAT02', 'Ciencia'),
('CAT03', 'Historia');


INSERT INTO libro (id_libro, ISBN, genero, anno, titulo) VALUES 
('LIB01', 123456789, 'Ficción Contemporánea', '1967', 'Cien años de soledad'),
('LIB02', 987654321, 'Divulgación', '2014', 'Sapiens'),
('LIB03', 456789123, 'Distopía', '1949', '1984');


INSERT INTO libro_categoria (id_libro, id_cate) VALUES 
('LIB01', 'CAT01'),
('LIB02', 'CAT02'),
('LIB02', 'CAT03'),
('LIB03', 'CAT01');


INSERT INTO usuarios (id_usuario, email, nombre, fecha_registro, telefono) VALUES 
(1, 'juan.perez@email.com', 'Juan Pérez', '2026-01-15', 5551234),
(2, 'maria.garcia@email.com', 'María García', '2026-02-10', 5555678),
(3, 'luis.rodriguez@email.com', 'Luis Rodríguez', '2026-03-05', 5559012);


INSERT INTO prestamos (id_prestamo, devolucion, fecha, id_usuario) VALUES 
('PRE01', '2026-05-20', '2026-05-06', 1),
('PRE02', 'Pendiente', '2026-05-05', 2);


INSERT INTO ejemplares (id_ejemplar, estado, id_prestamo, id_libro) VALUES 
('EJE01-01', 'Prestado', 'PRE01', 'LIB01'),
('EJE01-02', 'Disponible', NULL, 'LIB01'),
('EJE02-01', 'Prestado', 'PRE02', 'LIB02'),
('EJE03-01', 'Disponible', NULL, 'LIB03');


INSERT INTO reseñas (id_reseña, fecha, comentario, calificacion, id_usuario, id_libro) VALUES 
('RES01', '2026-05-06', 'Una obra maestra de la literatura.', '5', 1, 'LIB01'),
('RES02', '2026-05-06', 'Muy interesante, aunque denso.', '4', 3, 'LIB02');

-- CONSULTAS DE PRUEBA

SELECT titulo, genero, anno 
FROM libro 
WHERE ISBN = 123456789;

SELECT nombre, email 
FROM usuarios 
WHERE fecha_registro >= '2026-03-01';

SELECT id_reseña, comentario, calificacion 
FROM reseñas 
WHERE calificacion > '3';