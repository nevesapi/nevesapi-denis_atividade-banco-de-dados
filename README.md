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

  FOREIGN KEY (professores_id) REFERENCES cursos(id);


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
)
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
