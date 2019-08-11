CREATE DATABASE  IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empresa`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `numero_depto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_depto` varchar(50) NOT NULL,
  PRIMARY KEY (`numero_depto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Comercial'),(2,'Financeiro'),(3,'Operacional');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `matricula_dep` int(11) NOT NULL AUTO_INCREMENT,
  `nome_dep` varchar(80) NOT NULL,
  `data_nascimento_dep` date DEFAULT NULL,
  `sexo_dep` varchar(10) DEFAULT NULL,
  `matricula_emp_dep` int(11) NOT NULL,
  PRIMARY KEY (`matricula_dep`),
  KEY `matricula_emp_dep` (`matricula_emp_dep`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`matricula_emp_dep`) REFERENCES `empregado` (`matricula_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'Samuel Gomes Vieira','1999-05-29','Masculino',2),(2,'Samuel Gomes Vieira','1999-05-29','Masculino',3),(3,'Wellington Gomes Vieira','1989-04-23','Masculino',2),(4,'Wellington Gomes Vieira','1989-04-23','Masculino',3),(5,'Arthur Murilo Gomes','2019-08-11','Masculino',1);
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `matricula_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nome_emp` varchar(80) NOT NULL,
  `cpf_emp` varchar(20) DEFAULT NULL,
  `fone_emp` varchar(20) DEFAULT NULL,
  `numero_depto_emp` int(11) NOT NULL,
  `supervisiona_matricula_emp` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula_emp`),
  KEY `numero_depto_emp` (`numero_depto_emp`),
  KEY `supervisiona_matricula_emp` (`supervisiona_matricula_emp`),
  CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`numero_depto_emp`) REFERENCES `departamento` (`numero_depto`),
  CONSTRAINT `empregado_ibfk_2` FOREIGN KEY (`supervisiona_matricula_emp`) REFERENCES `empregado` (`matricula_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1,'Samuel Gomes Vieira','099.154.226-60','38992433719',3,NULL),(2,'Dislene Gomes da Costa','038.157.946-84','38998154565',3,1),(3,'José Roberto Vieira','098.114.226-69','38998756437',2,1),(4,'Anderson Mauricio Vieira','001.786.546-90','38984567865',1,NULL);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `numero_projeto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_projeto` varchar(50) NOT NULL,
  `numero_depto_projeto` int(11) NOT NULL,
  PRIMARY KEY (`numero_projeto`),
  KEY `numero_depto_projeto` (`numero_depto_projeto`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`numero_depto_projeto`) REFERENCES `departamento` (`numero_depto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Sipag',1),(2,'Empréstimo',3),(3,'Contabilidade',2);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha`
--

DROP TABLE IF EXISTS `trabalha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalha` (
  `matricula_emp_trab` int(11) NOT NULL,
  `numero_projeto_trab` int(11) NOT NULL,
  `horas_trab` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`matricula_emp_trab`,`numero_projeto_trab`),
  KEY `numero_projeto_trab` (`numero_projeto_trab`),
  CONSTRAINT `trabalha_ibfk_1` FOREIGN KEY (`matricula_emp_trab`) REFERENCES `empregado` (`matricula_emp`),
  CONSTRAINT `trabalha_ibfk_2` FOREIGN KEY (`numero_projeto_trab`) REFERENCES `projeto` (`numero_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha`
--

LOCK TABLES `trabalha` WRITE;
/*!40000 ALTER TABLE `trabalha` DISABLE KEYS */;
INSERT INTO `trabalha` VALUES (1,1,10),(2,2,15),(3,3,30);
/*!40000 ALTER TABLE `trabalha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-11 19:53:55
