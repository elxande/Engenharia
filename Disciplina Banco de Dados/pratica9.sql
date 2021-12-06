-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Maio-2021 às 19:25
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pratica9`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `nome` varchar(100) NOT NULL,
  `sigla` char(3) DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `coordenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`nome`, `sigla`, `codigo`, `coordenador`) VALUES
('Tec. Telemática', 'DTT', 121, 121031),
('Tec.Construção de Edifícios', 'DCE', 122, 122047),
('Eng. Computação', 'DEC', 125, 125331);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE `dependente` (
  `matricProf` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `rg` int(11) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`matricProf`, `nome`, `rg`, `sexo`, `dataNasc`) VALUES
(125331, 'Miranda', 113020764, 'M', '1992-10-08'),
(125335, 'Léo', 125138908, 'M', '1996-11-30'),
(122047, 'Ingrid', 128243831, 'F', '1985-07-12'),
(121031, 'Samuca', 136255425, 'M', '1988-04-05'),
(121003, 'Maraia do Bairro', 143028352, 'F', '1993-02-21'),
(125332, 'Felipe', 164036003, 'M', '1995-07-12'),
(122045, 'Luan', 178960779, 'M', '1982-06-05'),
(121031, 'Enestina', 213447551, 'F', '1989-04-04'),
(121003, 'Cirilo', 226050166, 'M', '1991-03-15'),
(121003, 'Beto', 236833364, 'M', '1989-04-19'),
(122045, 'Gabi', 263444181, 'F', '1985-04-12'),
(125332, 'Poliana', 307510992, 'F', '1996-10-27'),
(125331, 'Raianna', 332186556, 'F', '1996-09-10'),
(122047, 'Renan', 353599104, 'M', '1992-09-11'),
(121031, 'Milli', 403192444, 'F', '1989-08-09'),
(125335, 'Bianca', 408833919, 'F', '1995-10-30'),
(121003, 'Maraia Joaquina', 468320507, 'F', '1990-01-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `matricProf` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`matricProf`, `email`) VALUES
(121003, 'pedro@mail.com'),
(121031, 'josemaria@mail.com'),
(122045, 'bento@mail.com'),
(122047, 'anaclara@mail.com'),
(125331, 'marialuiza@mail.com'),
(125332, 'joanamaria@mail.com'),
(125335, 'joaocarlos@mail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `nome` varchar(100) NOT NULL,
  `snome` varchar(100) NOT NULL,
  `matricula` int(11) NOT NULL,
  `dataNasc` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `matricCoordArea` int(11) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`nome`, `snome`, `matricula`, `dataNasc`, `sexo`, `salario`, `matricCoordArea`, `depto`) VALUES
('Pedro', 'Pereira da Silva', 121003, '1982-03-25', 'M', '4000.00', NULL, 121),
('José Maria', 'Campos', 121031, '1978-04-10', 'M', '7000.00', 121003, 121),
('Bento', 'Diniz Costa', 122045, '1980-11-27', 'M', '4000.00', NULL, 122),
('Ana Clara', 'Araújo Santos', 122047, '1994-12-30', 'F', '72000.00', 122045, 122),
('Maria Luiza', 'Machado', 125331, '1974-08-16', 'F', '6800.00', 125332, 125),
('Joana Maria', 'Pereira', 125332, '1990-06-12', 'F', '4500.00', NULL, 125),
('João Carlos', 'Matos Cavalcanti', 125335, '1976-07-22', 'M', '3700.00', 125332, 125);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `nome` varchar(100) NOT NULL,
  `codigo` int(11) NOT NULL,
  `depto` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`nome`, `codigo`, `depto`, `duracao`) VALUES
('Casas Ecológicas', 1305, 122, 1),
('Maratona de programação', 1306, 125, 1),
('Robótica', 1307, 121, 1),
('Olimpiada de informática', 1308, 125, 1),
('Aplicações de NoSQL', 1309, 121, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `matricProf` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`matricProf`, `telefone`) VALUES
(121003, '8333220001'),
(121031, '8333220001'),
(122045, '8333220003'),
(122047, '8333220004'),
(125331, '8333220007'),
(125332, '8333220005'),
(125335, '8333220006');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalhaem`
--

CREATE TABLE `trabalhaem` (
  `matricProf` int(11) NOT NULL,
  `codProf` int(11) NOT NULL,
  `horas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `trabalhaem`
--

INSERT INTO `trabalhaem` (`matricProf`, `codProf`, `horas`) VALUES
(121003, 1309, '00:00:08'),
(121031, 1307, '00:00:08'),
(122045, 1305, '00:00:08'),
(125331, 1306, '00:00:06'),
(125335, 1308, '00:00:10');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `coordenador` (`coordenador`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`rg`),
  ADD KEY `matricProf` (`matricProf`);

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`matricProf`,`email`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `depto` (`depto`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `depto` (`depto`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`matricProf`,`telefone`);

--
-- Índices para tabela `trabalhaem`
--
ALTER TABLE `trabalhaem`
  ADD PRIMARY KEY (`matricProf`,`codProf`),
  ADD KEY `codProf` (`codProf`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`coordenador`) REFERENCES `professor` (`matricula`);

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`matricProf`) REFERENCES `professor` (`matricula`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`codigo`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`codigo`);

--
-- Limitadores para a tabela `trabalhaem`
--
ALTER TABLE `trabalhaem`
  ADD CONSTRAINT `trabalhaem_ibfk_1` FOREIGN KEY (`matricProf`) REFERENCES `professor` (`matricula`),
  ADD CONSTRAINT `trabalhaem_ibfk_2` FOREIGN KEY (`codProf`) REFERENCES `projeto` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
