# Atividade de Banco de dados

## Etapa 1 - Modelo conceitual

O modelo conceitual de dados geralmente é construído na primeira etapa do processo de modelagem de dados. O objetivo deste modelo é fornecer uma perspectiva de nível resumido, omitindo detalhes mais finos em favor de um formato mais compreensível

![Modelo conceitual - Etapa 1!](/assets/exercicio_db_etapa_01.png)

## Etapa 2 - Modelo lógico

O modelo lógico serve como uma representação abstrata dos requisitos de dados da organização, concentrando-se em entidades, atributos e relacionamentos sem se preocupar com detalhes de implementação

![Modelo lógico - Etapa 2!](/assets/exercicio_db_etapa_02.png)

## Etapa 3 - Modelo físico

Os desenvolvedores de aplicações usam modelos de dados físicos para planejar e otimizar o armazenamento de dados ao criar aplicações para uso em produção. Os modelos de dados físicos são o esquema para armazenar dados em um banco de dados relacional.

### Comando utilizados

#### Criando banco de dados

```sql
CREATE DATABASE tecinternet_escola_denis CHARACTER SET utf8mb4;
```

#### Criando tabelas

```sql
CREATE TABLE cursos(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  carga_horaria INT NOT NULL,
  professores_id INT NULL -- SERÁ CHAVE ESTRANGEIRA
);

CREATE TABLE professores(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  area_atuacao ENUM('Design','Desenvolvimento','Infra') NOT NULL,
  cursos_id INT NOT NULL -- SERÁ CHAVE ESTRANGEIRA
);

CREATE TABLE alunos(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  data_de_nascimento DATE NOT NULL,
  primeira_nota DECIMAL(4,2) NOT NULL,
  segunda_nota DECIMAL(4,2) NOT NULL,
  cursos_id INT NOT NULL -- SERÁ CHAVE ESTRANGEIRA
);
```

#### Criando relacionamento entre as tabelas

```sql
-- Criar relacionamento entre as tableas cursos e professores
 ALTER TABLE cursos

  ADD CONSTRAINT fk_cursos_professores

  FOREIGN KEY (professores_id) REFERENCES professores(id);


-- Criar relacionamento entre as tableas professores e cursos
ALTER TABLE professores

  ADD CONSTRAINT fk_professores_cursos

  FOREIGN KEY (cursos_id) REFERENCES cursos(id);

-- Criar relacionamento entre as tableas cursos e alunos
ALTER TABLE alunos

  ADD CONSTRAINT fk_alunos_cursos

  FOREIGN KEY (cursos_id) REFERENCES cursos(id);
```

### CRUD

```sql
INSERT INTO cursos(titulo, carga_horaria, professores_id)
VALUES(
  'Front-End',
  40,
  NULL
)
,(
  'Back-End',
  80,
  NULL
)
,(
  'UX/UI Design',
  30,
  NULL
)
,(
  'Figma',
  10,
  NULL
)
,(
  'Redes de Computadores',
  100,
  NULL
);
```

```sql
INSERT INTO professores(nome, area_atuacao, cursos_id)
VALUES(
  'Jon Oliva',
  'Infra',
  5 -- id do CURSO / fk
)
,(
  'Lemmy Kilmister',
  'Design',
  4 -- id do CURSO / fk
)
,(
  'Neil Peart',
  'Design',
  3 -- id do CURSO / fk
)
,(
  'Ozzy Osbourne',
  'Desenvolvimento',
  2 -- id do CURSO / fk
)
,(
  'David Gilmour',
  'Desenvolvimento',
  1 -- id do CURSO / fk
);

```

```sql
INSERT INTO alunos(nome, data_de_nascimento, primeira_nota, segunda_nota, cursos_id)
VALUES(
  "Lucas Almeida",
  "1993-07-12",
  8.45,
  6.78,
  1
),
(
  "Maria Souza",
  "1995-03-22",
  5.72,
  7.10,
  2
),
(
  "Pedro Oliveira",
  "2001-11-05",
  9.68,
  8.90,
  3
),
(
  "Ana Costa",
  "1998-01-28",
  6.14,
  7.45,
  4
),
(
  "Carlos Pereira",
  "2003-09-16",
  7.93,
  6.88,
  5
),
(
  "Joana Silva",
  "1994-04-19",
  4.88,
  5.33,
  2
),(
  "Fernanda Rocha",
  "1999-08-02",
  10.00,
  9.50,
  3
),(
  "Gabriel Santos",
  "2000-12-25",
  7.35,
  8.10,
  4
),(
  "Ricardo Martins",
  "1996-05-30",
  3.60,
  5.20,
  1
),(
  "Juliana Ferreira",
  "1997-10-09",
  8.02,
  7.85,
  5
);
```

```sql
UPDATE cursos SET professores_id = 1 WHERE id = 5;
UPDATE cursos SET professores_id = 2 WHERE id = 4;
UPDATE cursos SET professores_id = 3 WHERE id = 3;
UPDATE cursos SET professores_id = 4 WHERE id = 2;
UPDATE cursos SET professores_id = 5 WHERE id = 1;

```

# Atividades de Banco de Dados - Etapa 4 (FINAL)

## CRUD - Consultas

---

### 1. Faça uma consulta que mostre os alunos que nasceram antes do ano 2009

```sql
SELECT * FROM alunos WHERE alunos.data_de_nascimento <= '1997-12-31';
```

---

### 2. Faça uma consulta que calcule a média das notas de cada aluno e as mostre com duas casas decimais.

```sql
SELECT nome, FORMAT((primeira_nota + segunda_nota)/2,2) AS media FROM alunos;
```

---

### 3. Faça uma consulta que calcule o limite de faltas de cada curso de acordo com a carga horária. Considere o limite como 25% da carga horária. Classifique em ordem crescente pelo título do curso.

```sql
SELECT titulo as Curso,
  (carga_horaria * 0.25) AS Carga
  FROM cursos
  ORDER BY Curso;
```

---

### 4. Faça uma consulta que mostre os nomes dos professores que são somente da área "desenvolvimento".

```sql
SELECT nome FROM professores WHERE area_atuacao = "Desenvolvimento"
```

---

### 5. Faça uma consulta que mostre a quantidade de professores que cada área ("design", "infra", "desenvolvimento"). possui.

```sql

```

---

### 6. Faça uma consulta que mostre o nome dos alunos, o título e a carga horária dos cursos que fazem.

```sql

```

---

### 7. Faça uma consulta que mostre o nome dos professores e o título do curso que lecionam. Classifique pelo nome do professor.

```sql

```

---

### 8. Faça uma consulta que mostre o nome dos alunos, o título dos cursos que fazem, e o professor de cada curso.

```sql

```

---

### 9. Faça uma consulta que mostre a quantidade de alunos que cada curso possui. Classifique os resultados em ordem descrecente de acordo com a quantidade de alunos.

```sql

```

---

### 10. Faça uma consulta que mostre o nome dos alunos, suas notas, médias, e o título dos cursos que fazem. Devem ser considerados somente os alunos de Front-End e Back-End. Mostre os resultados classificados pelo nome do aluno.

```sql

```

---

### 11. Faça uma consulta que altere o nome do curso de Figma para Adobe XD e sua carga horária de 10 para 15.

```sql

```

---

### 12. Faça uma consulta que exclua um aluno do curso de Redes de Computadores e um aluno do curso de UX/UI.

```sql

```

---

### 13. Faça uma consulta que mostre a lista de alunos atualizada e o título dos cursos que fazem, classificados pelo nome do aluno.

```sql

```

---

## 🔥 DESAFIOS 🔥

1. Criar uma consulta que calcule a idade do aluno

```sql

```

---

2. Criar uma consulta que calcule a média das notas de cada aluno e mostre somente os alunos que tiveram a média **maior ou igual a 7**.

```sql

```

---

3. Criar uma consulta que calcule a média das notas de cada aluno e mostre somente os alunos que tiveram a média **menor que 7**.

```sql

```

---

4. Criar uma consulta que mostre a quantidade de alunos com média **maior ou igual a 7**.

```sql

```
