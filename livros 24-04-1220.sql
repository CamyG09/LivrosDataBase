-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24-Abr-2022 às 17:21
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livros`
--
CREATE DATABASE IF NOT EXISTS `livros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `livros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros_emprestados`
--

CREATE TABLE `livros_emprestados` (
  `id_usuario` int(11) NOT NULL,
  `fk_isbn` varchar(10) NOT NULL,
  `nome_usuario` varchar(60) NOT NULL,
  `nome_livro` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros_item`
--

CREATE TABLE `livros_item` (
  `isbn` varchar(10) NOT NULL,
  `nome_livro` varchar(80) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `n_paginas` char(4) NOT NULL,
  `anexo` longblob NOT NULL,
  `emprestado` enum('SIM','NÃO') NOT NULL DEFAULT 'NÃO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` char(2) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `livros_emprestados`
--
ALTER TABLE `livros_emprestados`
  ADD UNIQUE KEY `fk_idusuario` (`id_usuario`),
  ADD UNIQUE KEY `fk_isbn` (`fk_isbn`);

--
-- Indexes for table `livros_item`
--
ALTER TABLE `livros_item`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `livros_emprestados`
--
ALTER TABLE `livros_emprestados`
  ADD CONSTRAINT `fk_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `livros` FOREIGN KEY (`fk_isbn`) REFERENCES `livros_item` (`isbn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
