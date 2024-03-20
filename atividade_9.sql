use biblioteca;

#--9:
#mais emprestado
SELECT id_livro, COUNT(*) AS num_emprestimos
FROM emprestimo
GROUP BY id_livro
ORDER BY num_emprestimos DESC
LIMIT 1;
#menos emprestado
SELECT id_livro, COUNT(*) AS num_emprestimos
FROM emprestimo
GROUP BY id_livro
ORDER BY num_emprestimos ASC
LIMIT 1;

select * from emprestimo;
SELECT *FROM AUTORES;
SELECT * FROM livro;
select * from usuario;
select * from categoria;

#--10:
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(data_nasimento)) AS idade_media
FROM autores;

#--11:
SELECT *
FROM livro
ORDER BY data_publicacao DESC
LIMIT 3;



#--12:
SELECT usuario.membro, COUNT(*) AS emprestimo_premium
FROM usuario
JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
WHERE usuario.membro= 'premium' 
GROUP BY usuario.membro
ORDER BY emprestimo_premium DESC
LIMIT 1000;

#--13:
SELECT autor, COUNT(*) AS quantidade_livro_autor
FROM livro
GROUP BY autor
LIMIT 1000;

#--14:
SELECT categoria.tipo AS categoria, COUNT(*) AS num_livros_emprestados
FROM livro
JOIN categoria ON livro.id_categoria = categoria.id_categoria
JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
GROUP BY categoria.tipo
LIMIT 1000;

#--15:
SELECT usuario.id_usuario, usuario.nome AS nome_usuario, COUNT(DISTINCT emprestimo.id_livro) AS num_livros_unicos
FROM usuario
JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
GROUP BY usuario.id_usuario, usuario.nome
ORDER BY num_livros_unicos DESC
LIMIT 1;

#--16:
SELECT AVG(DATEDIFF(data_devolutiva,data_retirada)) AS media_duracao_emprestimos
FROM emprestimo;

#--17:
SELECT livro.id_livro, livro.titulo
FROM livro
LEFT JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
WHERE emprestimo.id_livro IS NULL;

#--18:
SELECT categoria.tipo AS categoria, COUNT(*) AS num_livros
FROM livro
JOIN categoria ON livro.id_categoria = categoria.id_categoria
GROUP BY categoria.tipo
ORDER BY num_livros DESC
LIMIT 1;

#--19:
SELECT AVG(num_livros) AS media_livros_por_autor
FROM (
    SELECT autor, COUNT(*) AS num_livros
    FROM livro
    GROUP BY autor
) AS subquery;

#--20:
SELECT MONTH(data_retirada) AS mes, COUNT(*) AS num_emprestimos
FROM emprestimo
GROUP BY MONTH(data_retirada)
HAVING num_emprestimos > 10;





#--22:
SELECT usuario.id_usuario, usuario.nome
FROM usuario
JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
WHERE MONTH(usuario.data_registro) = MONTH(emprestimo.data_retirada);












