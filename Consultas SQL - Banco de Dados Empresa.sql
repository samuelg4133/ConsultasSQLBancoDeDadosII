/*
1. Mostre os dados dos departamentos com nome começado com a letra "C".
select * from departamento where nome_depto like "c%";
2. Mostre o nome de todos os empregados supervisores.
select nome_emp as "Supervisor" from empregado where supervisiona_matricula_emp is null;
3. Mostre os dados dos dependentes com menos de 5 anos de idade.
select * from dependente where data_nascimento_dep>="2014-08-11";
4. Mostre a quantidade de empregados cadastrados em cada departamento.
select nome_depto as Departamento, count(numero_depto_emp) as Quantidade from departamento d, empregado e 
where numero_depto_emp=numero_depto
group by nome_depto;
5. Mostre o nome do empregado e quantidade de dependentes de cada empregado.
select nome_emp as "Empregado", count(matricula_emp_dep) as "Quantidade" from dependente d, empregado e
where matricula_emp_dep=matricula_emp
group by nome_emp;
6. Mostre o nome do projeto que utilizou o maior número de horas (soma do número de horas de todos os empregados participantes do projeto).
*/