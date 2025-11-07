-- Criação da Tabela Cursos
CREATE TABLE cursos(
	id SERIAL PRIMARY KEY,
	nome_curso varchar(100)
);


-- Criação da Tabela Alunos
CREATE TABLE alunos(
	id SERIAL PRIMARY KEY,
	nome varchar(100),
	email varchar(100),
	curso_id integer REFERENCES cursos(id)
);


-- Inserção de dados na tabela cursos
INSERT INTO cursos(nome_curso)
VALUES
	('Ciência de Dados'),
	('Desenvolvimento Web'),
	('Inteligência Artificial');


-- Inserção de dados na tabela alunos
INSERT INTO alunos(nome, email, curso_id)
VALUES
	('Maria Oliveira', 'mariaoliveira@gmail.com', 3),
	('João Silva', 'joaosilva@gmail.com', 2),
	('Terêncio Albuquerque', 'terencioalbuquerque@gmail.com', 1),
	('Karina Ribeiro', 'karinaribeiro@gmail.com', 2);
	