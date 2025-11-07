-- Consulta o nome do aluno e o nome do curso em que ele está matriculado
SELECT
	a.nome,
	c.nome_curso
FROM
	alunos a INNER JOIN cursos c
	ON a.curso_id = c.id;


-- Consulta todos os alunos matriculados no curso de Desenvolvimento Web
SELECT
	a.nome,
	c.nome_curso
FROM
	alunos a INNER JOIN cursos c
	ON a.curso_id = c.id
WHERE
	c.nome_curso = 'Desenvolvimento Web';


-- Atualiza o curso do aluno com o ID 1 para o curso de Ciência de Dados
UPDATE alunos
SET curso_id = 1
WHERE id = 1;


-- Consulta a aluna Maria Oliveira e o curso em que ela está matriculada
SELECT
	a.nome,
	c.nome_curso
FROM
	alunos a INNER JOIN cursos c
	ON a.curso_id = c.id
WHERE
	a.nome = 'Maria Oliveira';


-- Consulta os cursos que não tem alunos matriculados
SELECT 
	*
FROM
	cursos c LEFT JOIN alunos a
	ON c.id = a.curso_id
WHERE 
	a.id IS NULL;
