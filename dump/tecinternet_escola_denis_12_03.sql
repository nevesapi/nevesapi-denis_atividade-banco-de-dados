-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/03/2025 às 15:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tecinternet_escola_denis`
--
CREATE DATABASE IF NOT EXISTS `tecinternet_escola_denis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tecinternet_escola_denis`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `primeira_nota` decimal(4,2) NOT NULL,
  `segunda_nota` decimal(4,2) NOT NULL,
  `cursos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `data_de_nascimento`, `primeira_nota`, `segunda_nota`, `cursos_id`) VALUES
(1, 'Lucas Almeida', '1993-07-12', 8.45, 6.78, 1),
(2, 'Maria Souza', '1995-03-22', 5.72, 7.10, 2),
(3, 'Pedro Oliveira', '2001-11-05', 9.68, 8.90, 3),
(4, 'Ana Costa', '1998-01-28', 6.14, 7.45, 4),
(5, 'Carlos Pereira', '2003-09-16', 7.93, 6.88, 5),
(6, 'Joana Silva', '1994-04-19', 4.88, 5.33, 2),
(7, 'Fernanda Rocha', '1999-08-02', 10.00, 9.50, 3),
(8, 'Gabriel Santos', '2000-12-25', 7.35, 8.10, 4),
(9, 'Ricardo Martins', '1996-05-30', 3.60, 5.20, 1),
(10, 'Juliana Ferreira', '1997-10-09', 8.02, 7.85, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `professores_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id`, `titulo`, `carga_horaria`, `professores_id`) VALUES
(1, 'Front-End', 40, 5),
(2, 'Back-End', 80, 4),
(3, 'UX/UI Design', 30, 3),
(4, 'Adobe XD', 15, 2),
(5, 'Redes de Computadores', 100, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `area_atuacao` enum('Design','Desenvolvimento','Infra') NOT NULL,
  `cursos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `area_atuacao`, `cursos_id`) VALUES
(1, 'Jon Oliva', 'Infra', 5),
(2, 'Lemmy Kilmister', 'Design', 4),
(3, 'Neil Peart', 'Design', 3),
(4, 'Ozzy Osbourne', 'Desenvolvimento', 2),
(5, 'David Gilmour', 'Desenvolvimento', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alunos_cursos` (`cursos_id`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos_professores` (`professores_id`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professores_cursos` (`cursos_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk_alunos_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`);

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_professores` FOREIGN KEY (`professores_id`) REFERENCES `professores` (`id`);

--
-- Restrições para tabelas `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_professores_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
