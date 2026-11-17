PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS estudiantes;

CREATE TABLE autores (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE libros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor_id INTEGER NOT NULL,
    anio_publicacion INTEGER NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE estudiantes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    carrera TEXT NOT NULL
);

CREATE TABLE prestamos (
    id INTEGER PRIMARY KEY,
    libro_id INTEGER NOT NULL,
    estudiante_id INTEGER NOT NULL,
    fecha_prestamo TEXT NOT NULL,
    fecha_devolucion TEXT,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id)
);

INSERT INTO autores (id, nombre) VALUES
    (1, 'Isabel Allende'),
    (2, 'Gabriel García Márquez'),
    (3, 'Julio Cortázar'),
    (4, 'Mary Shelley');

INSERT INTO libros (id, titulo, autor_id, anio_publicacion) VALUES
    (1, 'La casa de los espíritus', 1, 1982),
    (2, 'Cien años de soledad', 2, 1967),
    (3, 'Rayuela', 3, 1963),
    (4, 'Frankenstein', 4, 1818),
    (5, 'El cuaderno de Maya', 1, 2011);

INSERT INTO estudiantes (id, nombre, carrera) VALUES
    (1, 'Ana Pérez', 'Informática'),
    (2, 'Bruno Quispe', 'Matemática'),
    (3, 'Carla Flores', 'Informática'),
    (4, 'Diego Rojas', 'Historia');

INSERT INTO prestamos (id, libro_id, estudiante_id, fecha_prestamo, fecha_devolucion) VALUES
    (1, 2, 1, '2026-03-02', NULL),
    (2, 4, 2, '2026-03-03', '2026-03-10'),
    (3, 1, 3, '2026-03-04', NULL);
