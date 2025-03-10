# Atividade de Banco de dados

## Etapa 1 - Modelo conceitual

O modelo conceitual de dados geralmente é construído na primeira etapa do processo de modelagem de dados. O objetivo deste modelo é fornecer uma perspectiva de nível resumido, omitindo detalhes mais finos em favor de um formato mais compreensível

![Modelo conceitual - Etapa 1!](/assets/exercicio_db_etapa_01.png)

## Etapa 2 - Modelo lógico

O modelo lógico serve como uma representação abstrata dos requisitos de dados da organização, concentrando-se em entidades, atributos e relacionamentos sem se preocupar com detalhes de implementação

![Modelo lógico - Etapa 2!](/assets/exercicio_db_etapa_02.png)

## Etapa 3 - Modelo físico

O modelo lógico serve como uma representação abstrata dos requisitos de dados da organização, concentrando-se em entidades, atributos e relacionamentos sem se preocupar com detalhes de implementação

![Modelo físico - Etapa 3!](/assets/exercicio_db_etapa_03.png)

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
  area_atuacao ENUM('Design','Desenvolvimento','Infra'),
  id_curso INT NOT NULL,
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
