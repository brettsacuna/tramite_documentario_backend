-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2016 at 10:37 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistramdoc_db`
--
DROP DATABASE `sistramdoc_db`;
CREATE DATABASE IF NOT EXISTS `sistramdoc_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sistramdoc_db`;

-- --------------------------------------------------------

--
-- Table structure for table `accion`
--

DROP TABLE IF EXISTS `accion`;
CREATE TABLE `accion` (
  `accion_id` int(11) NOT NULL,
  `accion` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accion`
--

INSERT INTO `accion` (`accion_id`, `accion`, `estado`) VALUES
(1, 'NO INDICA', '1'),
(2, 'NORMAL', '1'),
(3, 'URGENTE', '1'),
(4, 'MUY URGENTE', '1');

-- --------------------------------------------------------

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE `clasificacion` (
  `clasificacion_id` int(11) NOT NULL DEFAULT '0',
  `clasificacion` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clasificacion`
--

INSERT INTO `clasificacion` (`clasificacion_id`, `clasificacion`, `estado`) VALUES
(1, 'COMUN', b'1'),
(2, 'CONFIDENCIAL', b'1'),
(3, 'RESERVADO', b'1'),
(4, 'SECRETO', b'1'),
(5, 'ESTRIC SECRETO', b'1'),
(6, 'JUDICIAL', b'1'),
(7, 'NO INDICA', b'1'),
(8, 'OTRO TIPO', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `controlador`
--

DROP TABLE IF EXISTS `controlador`;
CREATE TABLE `controlador` (
  `parametro` varchar(20) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `controlador`
--

INSERT INTO `controlador` (`parametro`, `valor`) VALUES
('documento', 1);

-- --------------------------------------------------------

--
-- Table structure for table `decreto`
--

DROP TABLE IF EXISTS `decreto`;
CREATE TABLE `decreto` (
  `decreto_id` int(11) NOT NULL,
  `documento_id` varchar(10) DEFAULT NULL,
  `accion_id` int(11) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `decreto`
--

INSERT INTO `decreto` (`decreto_id`, `documento_id`, `accion_id`, `observacion`, `estado`) VALUES
(1, '1', 3, '', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `decreto_disposicion`
--

DROP TABLE IF EXISTS `decreto_disposicion`;
CREATE TABLE `decreto_disposicion` (
  `decreto_id` int(11) DEFAULT NULL,
  `disposicion_id` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `decreto_disposicion`
--

INSERT INTO `decreto_disposicion` (`decreto_id`, `disposicion_id`, `estado`) VALUES
(1, 7, b'1'),
(1, 8, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `decreto_seccion`
--

DROP TABLE IF EXISTS `decreto_seccion`;
CREATE TABLE `decreto_seccion` (
  `decreto_id` int(11) DEFAULT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `decreto_seccion`
--

INSERT INTO `decreto_seccion` (`decreto_id`, `seccion_id`, `estado`) VALUES
(1, 7, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `disposicion`
--

DROP TABLE IF EXISTS `disposicion`;
CREATE TABLE `disposicion` (
  `disposicion_id` int(11) NOT NULL,
  `disposicion` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disposicion`
--

INSERT INTO `disposicion` (`disposicion_id`, `disposicion`, `estado`) VALUES
(1, 'NO INDICA', '1'),
(2, 'TRAMITE', '1'),
(3, 'DIFUSION', '1'),
(4, 'CONOC Y FINES', '1'),
(5, 'COORDINACION', '1'),
(6, 'ESTUDIO Y RECOMEND', '1'),
(7, 'SU ATENCION', '1'),
(8, 'SEGUIMIENTO', '1'),
(9, 'EXPLOTACION', '1'),
(10, 'OPINION', '1'),
(11, 'PRESENTAR H/RECOM', '1'),
(12, 'INFORME', '1'),
(13, 'CUMPLIMIENTO', '1'),
(14, 'PREPARAR RPTA', '1'),
(15, 'AGREGAR A LOS ANTECED', '1'),
(16, 'DAR CUENTA AL SUSCRITO', '1');

-- --------------------------------------------------------

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `documento_id` int(11) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `documento_fecha` date NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `documento_numero` varchar(10) NOT NULL,
  `unidad_id_origen` int(11) NOT NULL,
  `seccion_id_destino` int(11) NOT NULL,
  `url_archivo` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  `clasificacion_id` int(11) DEFAULT NULL,
  `estado_documento` int(11) NOT NULL,
  `fecha_decreto` datetime DEFAULT NULL,
  `fecha_disposicion` datetime DEFAULT NULL,
  `disposicion_final` longtext,
  `tipo_documento_id_disposicion_final` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `seccion_id` int(11) NOT NULL,
  `seccion` varchar(45) NOT NULL,
  `seccion_larga` varchar(200) NOT NULL,
  `seccion_abreviada` varchar(10) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seccion`
--

INSERT INTO `seccion` (`seccion_id`, `seccion`, `seccion_larga`, `seccion_abreviada`, `estado`) VALUES
(1, 'NO INDICA', 'NO INDICA DECRETO', 'NINGUNO', '1'),
(2, 'CRL PC', 'CORONEL PC', 'CRL', '1'),
(3, 'JEMA', 'JEM ADMTVO', 'JEMA', '1'),
(4, 'JEMO', 'JEM OPTVO', 'JEMO', '1'),
(5, 'INSP', 'INSPECTORIA', 'INSP', '1'),
(6, 'G-1', 'PERSONAL', 'G-1', '1'),
(7, 'G-2', 'INTELIGENCIA', 'G-2', '1'),
(8, 'G-3', 'INST	INSTRUCCIÓN Y ENTRENAMIENTO', 'G-3I', '1'),
(9, 'G-3', 'OPNS	OPERACIONES', 'G-3O', '1'),
(10, 'G-4', 'LOGISTICA', 'G-4', '1'),
(11, 'G-5', 'ASUNTOS CIVILES', 'G-5', '1'),
(12, 'G-6', 'TELEMATICA', 'G-6', '1'),
(13, 'G-7', 'RELACIONES PUBLICAS', 'G-7', '1'),
(14, 'G-8', 'DEPARTAMENTO DE PERSONAL', 'G-8', '1');

-- --------------------------------------------------------

--
-- Table structure for table `situacion`
--

DROP TABLE IF EXISTS `situacion`;
CREATE TABLE `situacion` (
  `situacion_id` int(11) NOT NULL,
  `situacion` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `situacion`
--

INSERT INTO `situacion` (`situacion_id`, `situacion`, `estado`) VALUES
(1, 'DESCARGA', b'1'),
(2, 'PARTE', b'1'),
(3, 'DECRETO', b'1'),
(4, 'TRAMITE', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `tipo_documento_id` int(11) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL,
  `tipo_documento_corto` varchar(10) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`tipo_documento_id`, `tipo_documento`, `tipo_documento_corto`, `estado`) VALUES
(1, 'OFICIO', 'OF', b'1'),
(2, 'OFICIO MULTIPLE', 'O/M', b'1'),
(3, 'MEMORANDUM', 'MEM', b'1'),
(4, 'MEMORANDUM MULT', 'M/M', b'1'),
(5, 'INFORME', 'INF', b'1'),
(6, 'PARTE', 'PARTE', b'1'),
(7, 'SOLICITUD', 'SOLICITUD', b'1'),
(8, 'FOJA ADICIONAL', 'FA', b'1'),
(9, 'DIRECTIVA', 'DIREC', b'1'),
(10, 'H COORDINACION', 'HC', b'1'),
(11, 'H INFORMATIVA', 'HI', b'1'),
(12, 'H TRAMITE', 'HT', b'1'),
(13, 'H RECOMENDACION', 'HR', b'1'),
(14, 'H RESPUESTA', 'HRES', b'1'),
(15, 'EXPEDIENTE', 'EXP', b'1'),
(16, 'RADIOGRAMA', 'RG', b'1'),
(17, 'RESOL MINISTERIAL', 'RES MI', b'1'),
(18, 'FAX', 'FAX', b'1'),
(19, 'ELEVACION', 'ELEV', b'1'),
(20, 'OTRO DOCUMENTO', 'OTRO DOC', b'1'),
(21, 'NO INDICA', 'NO INDICA', b'1'),
(22, 'ACUERDO', 'ACUERDO', b'1'),
(23, 'FACTURA', 'FACTURA', b'1'),
(24, 'RECIBO', 'RECIBO', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad` (
  `unidad_id` int(11) NOT NULL,
  `unidad_id_interno` varchar(10) NOT NULL,
  `unidad` varchar(100) NOT NULL,
  `unidad_gguu` varchar(100) NOT NULL,
  `unidad_nucleo` varchar(100) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad`
--

INSERT INTO `unidad` (`unidad_id`, `unidad_id_interno`, `unidad`, `unidad_gguu`, `unidad_nucleo`, `estado`) VALUES
(1, '0000', 'NO INDICA', 'NO INDICA', 'NO/IND', '1'),
(2, '0001', 'C INST OPNS ESP', 'C INST OPNS ESP', 'COEDE', '1'),
(3, '0002', 'ESC CMDOS', 'C INST OPNS ESP', 'COEDE', '1'),
(4, '0003', 'ESC FRANCO TIR', 'C INST OPNS ESP', 'COEDE', '1'),
(5, '0004', 'ESC MONTAÑA', 'C INST OPNS ESP', 'COEDE', '1'),
(6, '0005', 'ESC SELVA', 'C INST OPNS ESP', 'COEDE', '1'),
(7, '0006', 'B CMDO SERV 503', 'COEDE', 'COEDE', '1'),
(8, '0007', 'BTN PM N.503', 'COEDE', 'COEDE', '1'),
(9, '0008', 'COEDE', 'COEDE', 'COEDE', '1'),
(10, '0009', 'GAC  N. 2', 'COEDE', 'COEDE', '1'),
(11, '0010', 'GRAN BANDA', 'COEDE', 'COEDE', '1'),
(12, '0011', 'RC GHJ N° 1', 'COEDE', 'COEDE', '1'),
(13, '0012', 'EMCH', 'EMCH', 'COEDE', '1'),
(14, '0013', 'ESC ART', 'ESC ARMAS', 'COEDE', '1'),
(15, '0014', 'ESC CAB', 'ESC ARMAS', 'COEDE', '1'),
(16, '0015', 'ESC COM', 'ESC ARMAS', 'COEDE', '1'),
(17, '0016', 'ESC INF', 'ESC ARMAS', 'COEDE', '1'),
(18, '0017', 'ESC ING', 'ESC ARMAS', 'COEDE', '1'),
(19, '0018', 'CIVIME', 'ESC ESPECIALES', 'COEDE', '1'),
(20, '0019', 'ESC EQUIT', 'ESC ESPECIALES', 'COEDE', '1'),
(21, '0020', 'ESC INTEL EJTO', 'ESC ESPECIALES', 'COEDE', '1'),
(22, '0021', 'ESC OPN SIC EJT', 'ESC ESPECIALES', 'COEDE', '1'),
(23, '0022', 'ICTE', 'ESC ESPECIALES', 'COEDE', '1'),
(24, '0023', 'ESC INT EJTO', 'ESC SERVS', 'COEDE', '1'),
(25, '0024', 'ESC MG EJTO', 'ESC SERVS', 'COEDE', '1'),
(26, '0025', 'ESC S JUR EJTO', 'ESC SERVS', 'COEDE', '1'),
(27, '0026', 'CETAC', 'ESG', 'COEDE', '1'),
(28, '0027', 'ESG', 'ESG', 'COEDE', '1'),
(29, '0028', 'ETE', 'ETE', 'COEDE', '1'),
(30, '0029', 'COLOGE', 'COLOGE', 'COLOGE', '1'),
(31, '0030', 'BS N. 31', 'DAA-VRAE', 'COLOGE', '1'),
(32, '0031', 'BS N. 9', 'DAA-VRAE', 'COLOGE', '1'),
(33, '0032', 'BS N.2', 'DAA-VRAE', 'COLOGE', '1'),
(34, '0033', 'C CMDO SERVS 22', 'DAA-VRAE', 'COLOGE', '1'),
(35, '0034', 'CEM DAA-VRAE', 'DAA-VRAE', 'COLOGE', '1'),
(36, '0035', 'CIA TRANS VRAE', 'DAA-VRAE', 'COLOGE', '1'),
(37, '0036', 'CAL', 'OPARE', 'COLOGE', '1'),
(38, '0037', 'CARE CARAZ', 'OPARE', 'COLOGE', '1'),
(39, '0038', 'CARE CHIPE', 'OPARE', 'COLOGE', '1'),
(40, '0039', 'BTN COM A/M 511', 'SCOME', 'COLOGE', '1'),
(41, '0040', 'SCOME', 'SCOME', 'COLOGE', '1'),
(42, '0041', 'BING A/M N.511', 'SINGE', 'COLOGE', '1'),
(43, '0042', 'C ING C VIV 512', 'SINGE', 'COLOGE', '1'),
(44, '0043', 'CIA OP ANTARTIC', 'SINGE', 'COLOGE', '1'),
(45, '0044', 'SINGE', 'SINGE', 'COLOGE', '1'),
(46, '0045', 'B INT A/M 511', 'SINTE', 'COLOGE', '1'),
(47, '0046', 'SINTE', 'SINTE', 'COLOGE', '1'),
(48, '0047', 'B MG ARMTO 512', 'SMGE', 'COLOGE', '1'),
(49, '0048', 'B MG VEHIC 511', 'SMGE', 'COLOGE', '1'),
(50, '0049', 'CEMABLIN', 'SMGE', 'COLOGE', '1'),
(51, '0050', 'CEMAE', 'SMGE', 'COLOGE', '1'),
(52, '0051', 'CEMUNE', 'SMGE', 'COLOGE', '1'),
(53, '0052', 'CIA SEG PFF', 'SMGE', 'COLOGE', '1'),
(54, '0053', 'FAME', 'SMGE', 'COLOGE', '1'),
(55, '0054', 'SMGE', 'SMGE', 'COLOGE', '1'),
(56, '0055', 'BTN TRASP N.511', 'STRASPE', 'COLOGE', '1'),
(57, '0056', 'STRASPE', 'STRASPE', 'COLOGE', '1'),
(58, '0057', 'CIA VET N.511', 'SVETRE', 'COLOGE', '1'),
(59, '0058', 'HVC', 'SVETRE', 'COLOGE', '1'),
(60, '0059', 'SVETE', 'SVETRE', 'COLOGE', '1'),
(61, '0060', 'COPERE', 'COPERE', 'COPERE', '1'),
(62, '0061', 'JADPE', 'JADPE', 'COPERE', '1'),
(63, '0062', 'JAPE', 'JAPE', 'COPERE', '1'),
(64, '0063', 'SJAEC', 'JAPE', 'COPERE', '1'),
(65, '0064', 'SJAO', 'JAPE', 'COPERE', '1'),
(66, '0065', 'SJAT', 'JAPE', 'COPERE', '1'),
(67, '0066', 'SJATSO', 'JAPE', 'COPERE', '1'),
(68, '0067', 'BCE', 'JBIENE', 'COPERE', '1'),
(69, '0068', 'CENTROS EDUC', 'JBIENE', 'COPERE', '1'),
(70, '0069', 'CMP', 'JBIENE', 'COPERE', '1'),
(71, '0070', 'FOVIME', 'JBIENE', 'COPERE', '1'),
(72, '0071', 'JBIENE', 'JBIENE', 'COPERE', '1'),
(73, '0072', '11A BI RVA', 'COREMOVE', 'COREMOVE', '1'),
(74, '0073', '21A BI RVA', 'COREMOVE', 'COREMOVE', '1'),
(75, '0074', '3A BRIG INF RES', 'COREMOVE', 'COREMOVE', '1'),
(76, '0075', 'BRIG RES RMO', 'COREMOVE', 'COREMOVE', '1'),
(77, '0076', 'BRIG RES RMS', 'COREMOVE', 'COREMOVE', '1'),
(78, '0077', 'BTN RES N. 201', 'COREMOVE', 'COREMOVE', '1'),
(79, '0078', 'BTN RES N. 202', 'COREMOVE', 'COREMOVE', '1'),
(80, '0079', 'BTN RES N. 203', 'COREMOVE', 'COREMOVE', '1'),
(81, '0080', 'BTN RES N. 204', 'COREMOVE', 'COREMOVE', '1'),
(82, '0081', 'BTN RES N. 205', 'COREMOVE', 'COREMOVE', '1'),
(83, '0082', 'BTN RES N. 206', 'COREMOVE', 'COREMOVE', '1'),
(84, '0083', 'BTN RES N. 301', 'COREMOVE', 'COREMOVE', '1'),
(85, '0084', 'BTN RES N. 302', 'COREMOVE', 'COREMOVE', '1'),
(86, '0085', 'BTN RES N. 303', 'COREMOVE', 'COREMOVE', '1'),
(87, '0086', 'BTN RES N. 304', 'COREMOVE', 'COREMOVE', '1'),
(88, '0087', 'BTN RES N. 305', 'COREMOVE', 'COREMOVE', '1'),
(89, '0088', 'BTN RES N. 413', 'COREMOVE', 'COREMOVE', '1'),
(90, '0089', 'BTN RES N. 525', 'COREMOVE', 'COREMOVE', '1'),
(91, '0090', 'C R DPTAL  01-A', 'COREMOVE', 'COREMOVE', '1'),
(92, '0091', 'C R DPTAL  02-A', 'COREMOVE', 'COREMOVE', '1'),
(93, '0092', 'C R DPTAL  07-A', 'COREMOVE', 'COREMOVE', '1'),
(94, '0093', 'C R DPTAL  12-A', 'COREMOVE', 'COREMOVE', '1'),
(95, '0094', 'C R DPTAL  18-B', 'COREMOVE', 'COREMOVE', '1'),
(96, '0095', 'C R DPTAL  22-A', 'COREMOVE', 'COREMOVE', '1'),
(97, '0096', 'C R DPTAL  30-A', 'COREMOVE', 'COREMOVE', '1'),
(98, '0097', 'C R DPTAL  31-A', 'COREMOVE', 'COREMOVE', '1'),
(99, '0098', 'C R DPTAL  34-A', 'COREMOVE', 'COREMOVE', '1'),
(100, '0099', 'C R DPTAL  39-A', 'COREMOVE', 'COREMOVE', '1'),
(101, '0100', 'C R DPTAL  41-A', 'COREMOVE', 'COREMOVE', '1'),
(102, '0101', 'C R DPTAL  44-A', 'COREMOVE', 'COREMOVE', '1'),
(103, '0102', 'C R DPTAL  47-A', 'COREMOVE', 'COREMOVE', '1'),
(104, '0103', 'C R DPTAL  51-A', 'COREMOVE', 'COREMOVE', '1'),
(105, '0104', 'C R DPTAL  54-A', 'COREMOVE', 'COREMOVE', '1'),
(106, '0105', 'C R DPTAL  55-A', 'COREMOVE', 'COREMOVE', '1'),
(107, '0106', 'C R DPTAL  61-A', 'COREMOVE', 'COREMOVE', '1'),
(108, '0107', 'C R DPTAL  66-A', 'COREMOVE', 'COREMOVE', '1'),
(109, '0108', 'C R DPTAL  74-A', 'COREMOVE', 'COREMOVE', '1'),
(110, '0109', 'C R DPTAL  80-A', 'COREMOVE', 'COREMOVE', '1'),
(111, '0110', 'C R DPTAL  82-A', 'COREMOVE', 'COREMOVE', '1'),
(112, '0111', 'C R DPTAL  83-A', 'COREMOVE', 'COREMOVE', '1'),
(113, '0112', 'C R DPTAL  84-A', 'COREMOVE', 'COREMOVE', '1'),
(114, '0113', 'C R DPTAL  91-A', 'COREMOVE', 'COREMOVE', '1'),
(115, '0114', 'C R PROV   06-A', 'COREMOVE', 'COREMOVE', '1'),
(116, '0115', 'CEMOV RMC', 'COREMOVE', 'COREMOVE', '1'),
(117, '0116', 'CG COREMOVE', 'COREMOVE', 'COREMOVE', '1'),
(118, '0117', 'COMOV RMC', 'COREMOVE', 'COREMOVE', '1'),
(119, '0118', 'COMOV RMN', 'COREMOVE', 'COREMOVE', '1'),
(120, '0119', 'COMOV RMO', 'COREMOVE', 'COREMOVE', '1'),
(121, '0120', 'COMOV RMS', 'COREMOVE', 'COREMOVE', '1'),
(122, '0121', 'COREMOV RMC', 'COREMOVE', 'COREMOVE', '1'),
(123, '0122', 'COREMOV RMN', 'COREMOVE', 'COREMOVE', '1'),
(124, '0123', 'COREMOV RMO', 'COREMOVE', 'COREMOVE', '1'),
(125, '0124', 'COREMOV RMS', 'COREMOVE', 'COREMOVE', '1'),
(126, '0125', 'P R DPTAL  06-B', 'COREMOVE', 'COREMOVE', '1'),
(127, '0126', 'P R PROV   02-B', 'COREMOVE', 'COREMOVE', '1'),
(128, '0127', 'P R PROV   03-A', 'COREMOVE', 'COREMOVE', '1'),
(129, '0128', 'P R PROV   03-B', 'COREMOVE', 'COREMOVE', '1'),
(130, '0129', 'P R PROV   04-A', 'COREMOVE', 'COREMOVE', '1'),
(131, '0130', 'P R PROV   05-A', 'COREMOVE', 'COREMOVE', '1'),
(132, '0131', 'P R PROV   06-C', 'COREMOVE', 'COREMOVE', '1'),
(133, '0132', 'P R PROV   07-B', 'COREMOVE', 'COREMOVE', '1'),
(134, '0133', 'P R PROV   07-C', 'COREMOVE', 'COREMOVE', '1'),
(135, '0134', 'P R PROV   07-D', 'COREMOVE', 'COREMOVE', '1'),
(136, '0135', 'P R PROV   08-A', 'COREMOVE', 'COREMOVE', '1'),
(137, '0136', 'P R PROV   08-B', 'COREMOVE', 'COREMOVE', '1'),
(138, '0137', 'P R PROV   08-C', 'COREMOVE', 'COREMOVE', '1'),
(139, '0138', 'P R PROV   09-A', 'COREMOVE', 'COREMOVE', '1'),
(140, '0139', 'P R PROV   09-B', 'COREMOVE', 'COREMOVE', '1'),
(141, '0140', 'P R PROV   10-A', 'COREMOVE', 'COREMOVE', '1'),
(142, '0141', 'P R PROV   11-A', 'COREMOVE', 'COREMOVE', '1'),
(143, '0142', 'P R PROV   11-B', 'COREMOVE', 'COREMOVE', '1'),
(144, '0143', 'P R PROV   13-A', 'COREMOVE', 'COREMOVE', '1'),
(145, '0144', 'P R PROV   13-B', 'COREMOVE', 'COREMOVE', '1'),
(146, '0145', 'P R PROV   13-C', 'COREMOVE', 'COREMOVE', '1'),
(147, '0146', 'P R PROV   13-D', 'COREMOVE', 'COREMOVE', '1'),
(148, '0147', 'P R PROV   14-A', 'COREMOVE', 'COREMOVE', '1'),
(149, '0148', 'P R PROV   15-A', 'COREMOVE', 'COREMOVE', '1'),
(150, '0149', 'P R PROV   16-A', 'COREMOVE', 'COREMOVE', '1'),
(151, '0150', 'P R PROV   17-A', 'COREMOVE', 'COREMOVE', '1'),
(152, '0151', 'P R PROV   18-A', 'COREMOVE', 'COREMOVE', '1'),
(153, '0152', 'P R PROV   18-C', 'COREMOVE', 'COREMOVE', '1'),
(154, '0153', 'P R PROV   18-D', 'COREMOVE', 'COREMOVE', '1'),
(155, '0154', 'P R PROV   18-E', 'COREMOVE', 'COREMOVE', '1'),
(156, '0155', 'P R PROV   19-A', 'COREMOVE', 'COREMOVE', '1'),
(157, '0156', 'P R PROV   19-B', 'COREMOVE', 'COREMOVE', '1'),
(158, '0157', 'P R PROV   20-A', 'COREMOVE', 'COREMOVE', '1'),
(159, '0158', 'P R PROV   21-A', 'COREMOVE', 'COREMOVE', '1'),
(160, '0159', 'P R PROV   22-B', 'COREMOVE', 'COREMOVE', '1'),
(161, '0160', 'P R PROV   23-A', 'COREMOVE', 'COREMOVE', '1'),
(162, '0161', 'P R PROV   23-B', 'COREMOVE', 'COREMOVE', '1'),
(163, '0162', 'P R PROV   24-A', 'COREMOVE', 'COREMOVE', '1'),
(164, '0163', 'P R PROV   25-A', 'COREMOVE', 'COREMOVE', '1'),
(165, '0164', 'P R PROV   25-B', 'COREMOVE', 'COREMOVE', '1'),
(166, '0165', 'P R PROV   26-A', 'COREMOVE', 'COREMOVE', '1'),
(167, '0166', 'P R PROV   26-B', 'COREMOVE', 'COREMOVE', '1'),
(168, '0167', 'P R PROV   28-A', 'COREMOVE', 'COREMOVE', '1'),
(169, '0168', 'P R PROV   29-A', 'COREMOVE', 'COREMOVE', '1'),
(170, '0169', 'P R PROV   29-B', 'COREMOVE', 'COREMOVE', '1'),
(171, '0170', 'P R PROV   29-C', 'COREMOVE', 'COREMOVE', '1'),
(172, '0171', 'P R PROV   30-B', 'COREMOVE', 'COREMOVE', '1'),
(173, '0172', 'P R PROV   30-C', 'COREMOVE', 'COREMOVE', '1'),
(174, '0173', 'P R PROV   31-B', 'COREMOVE', 'COREMOVE', '1'),
(175, '0174', 'P R PROV   32-A', 'COREMOVE', 'COREMOVE', '1'),
(176, '0175', 'P R PROV   33-A', 'COREMOVE', 'COREMOVE', '1'),
(177, '0176', 'P R PROV   34-B', 'COREMOVE', 'COREMOVE', '1'),
(178, '0177', 'P R PROV   34-C', 'COREMOVE', 'COREMOVE', '1'),
(179, '0178', 'P R PROV   35-A', 'COREMOVE', 'COREMOVE', '1'),
(180, '0179', 'P R PROV   35-B', 'COREMOVE', 'COREMOVE', '1'),
(181, '0180', 'P R PROV   36-A', 'COREMOVE', 'COREMOVE', '1'),
(182, '0181', 'P R PROV   38-A', 'COREMOVE', 'COREMOVE', '1'),
(183, '0182', 'P R PROV   39-B', 'COREMOVE', 'COREMOVE', '1'),
(184, '0183', 'P R PROV   40-A', 'COREMOVE', 'COREMOVE', '1'),
(185, '0184', 'P R PROV   41-B', 'COREMOVE', 'COREMOVE', '1'),
(186, '0185', 'P R PROV   42-A', 'COREMOVE', 'COREMOVE', '1'),
(187, '0186', 'P R PROV   42-B', 'COREMOVE', 'COREMOVE', '1'),
(188, '0187', 'P R PROV   42-C', 'COREMOVE', 'COREMOVE', '1'),
(189, '0188', 'P R PROV   43-A', 'COREMOVE', 'COREMOVE', '1'),
(190, '0189', 'P R PROV   43-B', 'COREMOVE', 'COREMOVE', '1'),
(191, '0190', 'P R PROV   43-C', 'COREMOVE', 'COREMOVE', '1'),
(192, '0191', 'P R PROV   43-D', 'COREMOVE', 'COREMOVE', '1'),
(193, '0192', 'P R PROV   44-B', 'COREMOVE', 'COREMOVE', '1'),
(194, '0193', 'P R PROV   45-A', 'COREMOVE', 'COREMOVE', '1'),
(195, '0194', 'P R PROV   46-A', 'COREMOVE', 'COREMOVE', '1'),
(196, '0195', 'P R PROV   46-B', 'COREMOVE', 'COREMOVE', '1'),
(197, '0196', 'P R PROV   47-B', 'COREMOVE', 'COREMOVE', '1'),
(198, '0197', 'P R PROV   48-A', 'COREMOVE', 'COREMOVE', '1'),
(199, '0198', 'P R PROV   48-B', 'COREMOVE', 'COREMOVE', '1'),
(200, '0199', 'P R PROV   49-A', 'COREMOVE', 'COREMOVE', '1'),
(201, '0200', 'P R PROV   49-B', 'COREMOVE', 'COREMOVE', '1'),
(202, '0201', 'P R PROV   50-A', 'COREMOVE', 'COREMOVE', '1'),
(203, '0202', 'P R PROV   51-B', 'COREMOVE', 'COREMOVE', '1'),
(204, '0203', 'P R PROV   51-C', 'COREMOVE', 'COREMOVE', '1'),
(205, '0204', 'P R PROV   52-A', 'COREMOVE', 'COREMOVE', '1'),
(206, '0205', 'P R PROV   52-B', 'COREMOVE', 'COREMOVE', '1'),
(207, '0206', 'P R PROV   52-C', 'COREMOVE', 'COREMOVE', '1'),
(208, '0207', 'P R PROV   53-A', 'COREMOVE', 'COREMOVE', '1'),
(209, '0208', 'P R PROV   55-B', 'COREMOVE', 'COREMOVE', '1'),
(210, '0209', 'P R PROV   56-A', 'COREMOVE', 'COREMOVE', '1'),
(211, '0210', 'P R PROV   57-A', 'COREMOVE', 'COREMOVE', '1'),
(212, '0211', 'P R PROV   58-A', 'COREMOVE', 'COREMOVE', '1'),
(213, '0212', 'P R PROV   59-A', 'COREMOVE', 'COREMOVE', '1'),
(214, '0213', 'P R PROV   60-A', 'COREMOVE', 'COREMOVE', '1'),
(215, '0214', 'P R PROV   62-A', 'COREMOVE', 'COREMOVE', '1'),
(216, '0215', 'P R PROV   65-A', 'COREMOVE', 'COREMOVE', '1'),
(217, '0216', 'P R PROV   66-B', 'COREMOVE', 'COREMOVE', '1'),
(218, '0217', 'P R PROV   66-C', 'COREMOVE', 'COREMOVE', '1'),
(219, '0218', 'P R PROV   67-A', 'COREMOVE', 'COREMOVE', '1'),
(220, '0219', 'P R PROV   67-B', 'COREMOVE', 'COREMOVE', '1'),
(221, '0220', 'P R PROV   68-A', 'COREMOVE', 'COREMOVE', '1'),
(222, '0221', 'P R PROV   69-A', 'COREMOVE', 'COREMOVE', '1'),
(223, '0222', 'P R PROV   70-A', 'COREMOVE', 'COREMOVE', '1'),
(224, '0223', 'P R PROV   70-B', 'COREMOVE', 'COREMOVE', '1'),
(225, '0224', 'P R PROV   71-A', 'COREMOVE', 'COREMOVE', '1'),
(226, '0225', 'P R PROV   71-B', 'COREMOVE', 'COREMOVE', '1'),
(227, '0226', 'P R PROV   72-A', 'COREMOVE', 'COREMOVE', '1'),
(228, '0227', 'P R PROV   73-A', 'COREMOVE', 'COREMOVE', '1'),
(229, '0228', 'P R PROV   74-B', 'COREMOVE', 'COREMOVE', '1'),
(230, '0229', 'P R PROV   74-C', 'COREMOVE', 'COREMOVE', '1'),
(231, '0230', 'P R PROV   74-D', 'COREMOVE', 'COREMOVE', '1'),
(232, '0231', 'P R PROV   75-A', 'COREMOVE', 'COREMOVE', '1'),
(233, '0232', 'P R PROV   75-B', 'COREMOVE', 'COREMOVE', '1'),
(234, '0233', 'P R PROV   76-A', 'COREMOVE', 'COREMOVE', '1'),
(235, '0234', 'P R PROV   77-A', 'COREMOVE', 'COREMOVE', '1'),
(236, '0235', 'P R PROV   78-A', 'COREMOVE', 'COREMOVE', '1'),
(237, '0236', 'P R PROV   79-A', 'COREMOVE', 'COREMOVE', '1'),
(238, '0237', 'P R PROV   79-B', 'COREMOVE', 'COREMOVE', '1'),
(239, '0238', 'P R PROV   80-B', 'COREMOVE', 'COREMOVE', '1'),
(240, '0239', 'P R PROV   81-A', 'COREMOVE', 'COREMOVE', '1'),
(241, '0240', 'P R PROV   82-B', 'COREMOVE', 'COREMOVE', '1'),
(242, '0241', 'P R PROV   84-B', 'COREMOVE', 'COREMOVE', '1'),
(243, '0242', 'P R PROV   85-A', 'COREMOVE', 'COREMOVE', '1'),
(244, '0243', 'P R PROV   86-A', 'COREMOVE', 'COREMOVE', '1'),
(245, '0244', 'P R PROV   86-B', 'COREMOVE', 'COREMOVE', '1'),
(246, '0245', 'P R PROV   87-A', 'COREMOVE', 'COREMOVE', '1'),
(247, '0246', 'P R PROV   88-A', 'COREMOVE', 'COREMOVE', '1'),
(248, '0247', 'P R PROV   88-B', 'COREMOVE', 'COREMOVE', '1'),
(249, '0248', 'P R PROV   89-A', 'COREMOVE', 'COREMOVE', '1'),
(250, '0249', 'P R PROV   90-A', 'COREMOVE', 'COREMOVE', '1'),
(251, '0250', 'P R PROV   91-B', 'COREMOVE', 'COREMOVE', '1'),
(252, '0251', 'P R PROV   92-A', 'COREMOVE', 'COREMOVE', '1'),
(253, '0252', 'P R PROV  257-A', 'COREMOVE', 'COREMOVE', '1'),
(254, '0253', 'P R PROV  292-A', 'COREMOVE', 'COREMOVE', '1'),
(255, '0254', 'BTN SAN N.511', 'COSALE', 'COSALE', '1'),
(256, '0255', 'CLIN GERIA EJTO', 'COSALE', 'COSALE', '1'),
(257, '0256', 'COSALE', 'COSALE', 'COSALE', '1'),
(258, '0257', 'ESE', 'COSALE', 'COSALE', '1'),
(259, '0258', 'FOSPEME', 'COSALE', 'COSALE', '1'),
(260, '0259', 'HMC', 'COSALE', 'COSALE', '1'),
(261, '0260', 'HMR-RMN', 'COSALE', 'COSALE', '1'),
(262, '0261', 'HMR-RMO', 'COSALE', 'COSALE', '1'),
(263, '0262', 'HMR-RMS', 'COSALE', 'COSALE', '1'),
(264, '0263', 'POL CHORRILLOS', 'COSALE', 'COSALE', '1'),
(265, '0264', 'BIE N.511', 'BRIG INTG N.51', 'OA CGE', '1'),
(266, '0265', 'BOPE', 'BRIG INTG N.51', 'OA CGE', '1'),
(267, '0266', 'BPM N.505', 'BRIG INTG N.51', 'OA CGE', '1'),
(268, '0267', 'CG BRIG INTG 51', 'BRIG INTG N.51', 'OA CGE', '1'),
(269, '0268', 'CIA INFORMACION', 'BRIG INTG N.51', 'OA CGE', '1'),
(270, '0269', 'COTE', 'COTE', 'OA CGE', '1'),
(271, '0270', 'DIMOV', 'DIMOV', 'OA CGE', '1'),
(272, '0271', 'CCEE', 'DITELE', 'OA CGE', '1'),
(273, '0272', 'DITELE', 'DITELE', 'OA CGE', '1'),
(274, '0273', 'AGE', 'OA CGE', 'OA CGE', '1'),
(275, '0274', 'BANDA MUSICOS CGE', 'OA CGE', 'OA CGE', '1'),
(276, '0275', 'CAEN', 'OA CGE', 'OA CGE', '1'),
(277, '0276', 'CASA MILITAR', 'OA CGE', 'OA CGE', '1'),
(278, '0277', 'CCFA', 'OA CGE', 'OA CGE', '1'),
(279, '0278', 'CIA MG N.505', 'OA CGE', 'OA CGE', '1'),
(280, '0279', 'CIA SAAF', 'OA CGE', 'OA CGE', '1'),
(281, '0280', 'CICTE', 'OA CGE', 'OA CGE', '1'),
(282, '0281', 'CNI', 'OA CGE', 'OA CGE', '1'),
(283, '0282', 'CPHE-DINFE', 'OA CGE', 'OA CGE', '1'),
(284, '0283', 'CSJM', 'OA CGE', 'OA CGE', '1'),
(285, '0284', 'DIDETEC', 'OA CGE', 'OA CGE', '1'),
(286, '0285', 'DIE', 'OA CGE', 'OA CGE', '1'),
(287, '0286', 'DIEDOC', 'OA CGE', 'OA CGE', '1'),
(288, '0287', 'DILOG', 'OA CGE', 'OA CGE', '1'),
(289, '0288', 'DIMUE-DINFE', 'OA CGE', 'OA CGE', '1'),
(290, '0289', 'DINFE', 'OA CGE', 'OA CGE', '1'),
(291, '0290', 'DIPER', 'OA CGE', 'OA CGE', '1'),
(292, '0291', 'DIPLAN', 'OA CGE', 'OA CGE', '1'),
(293, '0292', 'DIRAC', 'OA CGE', 'OA CGE', '1'),
(294, '0293', 'IGE', 'OA CGE', 'OA CGE', '1'),
(295, '0294', 'IGN', 'OA CGE', 'OA CGE', '1'),
(296, '0295', 'JEMGE', 'OA CGE', 'OA CGE', '1'),
(297, '0296', 'JUZ MIL TRANSIT', 'OA CGE', 'OA CGE', '1'),
(298, '0297', 'OA CGE', 'OA CGE', 'OA CGE', '1'),
(299, '0298', 'OF AS JUR EJTO', 'OA CGE', 'OA CGE', '1'),
(300, '0299', 'OGECOE', 'OA CGE', 'OA CGE', '1'),
(301, '0300', 'PERS EN EXTRANJ', 'OA CGE', 'OA CGE', '1'),
(302, '0301', 'PROC PUB EJTO', 'OA CGE', 'OA CGE', '1'),
(303, '0302', 'SCGE', 'OA CGE', 'OA CGE', '1'),
(304, '0303', 'SEDENA', 'OA CGE', 'OA CGE', '1'),
(305, '0304', 'SGMD', 'OA CGE', 'OA CGE', '1'),
(306, '0305', 'VICARIA GRAL C', 'OA CGE', 'OA CGE', '1'),
(307, '0306', 'OGRE', 'OGRE', 'OA CGE', '1'),
(308, '0307', 'BAC N. 2', '22A BRIG ING', 'RM VRAE', '1'),
(309, '0308', 'BAC N. 4', '22A BRIG ING', 'RM VRAE', '1'),
(310, '0309', 'BING C/M N. 2', '22A BRIG ING', 'RM VRAE', '1'),
(311, '0310', 'BING C/M N. 8', '22A BRIG ING', 'RM VRAE', '1'),
(312, '0311', 'BING CONST N. 2', '22A BRIG ING', 'RM VRAE', '1'),
(313, '0312', 'BING CONST N. 3', '22A BRIG ING', 'RM VRAE', '1'),
(314, '0313', 'CG 22A BRIG ING', '22A BRIG ING', 'RM VRAE', '1'),
(315, '0314', 'CIA DESM H 115', '22A BRIG ING', 'RM VRAE', '1'),
(316, '0315', 'CIA FFEE N.61', '22A BRIG ING', 'RM VRAE', '1'),
(317, '0316', 'UMAR N.7', '22A BRIG ING', 'RM VRAE', '1'),
(318, '0317', 'BCT N. 34', '2A BRIG INF', 'RM VRAE', '1'),
(319, '0318', 'BCT N. 42', '2A BRIG INF', 'RM VRAE', '1'),
(320, '0319', 'BIM  N. 51', '2A BRIG INF', 'RM VRAE', '1'),
(321, '0320', 'BMUS N. 57', '2A BRIG INF', 'RM VRAE', '1'),
(322, '0321', 'BTN CMDOS N.116', '2A BRIG INF', 'RM VRAE', '1'),
(323, '0322', 'C ESP CMDOS  2', '2A BRIG INF', 'RM VRAE', '1'),
(324, '0323', 'CG 2A BRIG INF', '2A BRIG INF', 'RM VRAE', '1'),
(325, '0324', 'CIA CMDO N. 2', '2A BRIG INF', 'RM VRAE', '1'),
(326, '0325', 'CIA COM  N. 2', '2A BRIG INF', 'RM VRAE', '1'),
(327, '0326', 'CIA PM  N. 2', '2A BRIG INF', 'RM VRAE', '1'),
(328, '0327', 'JMP AYACUCHO', '2A BRIG INF', 'RM VRAE', '1'),
(329, '0328', 'BCS N.311', '31A BRIG INF', 'RM VRAE', '1'),
(330, '0329', 'BCT N. 312', '31A BRIG INF', 'RM VRAE', '1'),
(331, '0330', 'BCT N. 324', '31A BRIG INF', 'RM VRAE', '1'),
(332, '0331', 'BCT N. 43', '31A BRIG INF', 'RM VRAE', '1'),
(333, '0332', 'BCT N. 79', '31A BRIG INF', 'RM VRAE', '1'),
(334, '0333', 'BMUS N. 59', '31A BRIG INF', 'RM VRAE', '1'),
(335, '0334', 'C ESP CMDOS  31', '31A BRIG INF', 'RM VRAE', '1'),
(336, '0335', 'CG 31A BRIG INF', '31A BRIG INF', 'RM VRAE', '1'),
(337, '0336', 'CIA CMDO N. 31', '31A BRIG INF', 'RM VRAE', '1'),
(338, '0337', 'CIA COM  N. 31', '31A BRIG INF', 'RM VRAE', '1'),
(339, '0338', 'CIA PM  N. 31', '31A BRIG INF', 'RM VRAE', '1'),
(340, '0339', 'JMP HUANCAYO', '31A BRIG INF', 'RM VRAE', '1'),
(341, '0340', 'JMP HUANUCO', '31A BRIG INF', 'RM VRAE', '1'),
(342, '0341', 'CG VRAE', 'CG VRAE', 'RM VRAE', '1'),
(343, '0342', 'CIA COM VRAE', 'CG VRAE', 'RM VRAE', '1'),
(344, '0343', 'CIR N. 31', 'CG VRAE', 'RM VRAE', '1'),
(345, '0344', 'B MTÑA N.65', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(346, '0345', 'BTN FFEE N.314', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(347, '0346', 'BTN RES N. 513', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(348, '0347', 'CEM LA CONVENCION', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(349, '0348', 'CIA C SERV V VIRGEN', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(350, '0349', 'CIA ESP CMDO 22', 'DESTO LA CONVENCION', 'RM VRAE', '1'),
(351, '0350', 'BCT N.77', '18A BRIG BLIND', 'RMC', '1'),
(352, '0351', 'BMUS N. 58', '18A BRIG BLIND', 'RMC', '1'),
(353, '0352', 'BS N.241', '18A BRIG BLIND', 'RMC', '1'),
(354, '0353', 'BTQ N.232', '18A BRIG BLIND', 'RMC', '1'),
(355, '0354', 'CG 18A BB', '18A BRIG BLIND', 'RMC', '1'),
(356, '0355', 'CIA AT  N.512', '18A BRIG BLIND', 'RMC', '1'),
(357, '0356', 'CIA CMDO N. 18', '18A BRIG BLIND', 'RMC', '1'),
(358, '0357', 'CIA COM  N. 18', '18A BRIG BLIND', 'RMC', '1'),
(359, '0358', 'CIA PM  N. 18', '18A BRIG BLIND', 'RMC', '1'),
(360, '0359', 'INGUAR 18A BB', '18A BRIG BLIND', 'RMC', '1'),
(361, '0360', 'BMUS N. 60', '1A BRIG FFEE', 'RMC', '1'),
(362, '0361', 'BS N.61', '1A BRIG FFEE', 'RMC', '1'),
(363, '0362', 'BTN CMDOS N. 19', '1A BRIG FFEE', 'RMC', '1'),
(364, '0363', 'BTN CMDOS N. 61', '1A BRIG FFEE', 'RMC', '1'),
(365, '0364', 'BTN FFEE N. 39', '1A BRIG FFEE', 'RMC', '1'),
(366, '0365', 'BTN FFEE N. 40', '1A BRIG FFEE', 'RMC', '1'),
(367, '0366', 'CECOT N. 61', '1A BRIG FFEE', 'RMC', '1'),
(368, '0367', 'CG 1A BRIG FFEE', '1A BRIG FFEE', 'RMC', '1'),
(369, '0368', 'CIA CMDO N. 61', '1A BRIG FFEE', 'RMC', '1'),
(370, '0369', 'CIA COM  N. 61', '1A BRIG FFEE', 'RMC', '1'),
(371, '0370', 'CIA PM  N. 61', '1A BRIG FFEE', 'RMC', '1'),
(372, '0371', 'ESC PARACAIDIST', '1A BRIG FFEE', 'RMC', '1'),
(373, '0372', 'ESCD REC N.61', '1A BRIG FFEE', 'RMC', '1'),
(374, '0373', 'INGUAR 1A BR FE', '1A BRIG FFEE', 'RMC', '1'),
(375, '0374', 'COL MIL B. AUQUI', '2A BRIG INF', 'RMC', '1'),
(376, '0375', 'INGUAR 2A BRG I', '2A BRIG INF', 'RMC', '1'),
(377, '0376', 'COL MIL L. PRADO', '31A BRIG INF', 'RMC', '1'),
(378, '0377', 'COL MIL VALER S', '31A BRIG INF', 'RMC', '1'),
(379, '0378', 'INGUAR 31A BI', '31A BRIG INF', 'RMC', '1'),
(380, '0379', 'BING COMB N.112', '3A BRIG FFEE', 'RMC', '1'),
(381, '0380', 'BMUS N. 64', '3A BRIG FFEE', 'RMC', '1'),
(382, '0381', 'BS N.300', '3A BRIG FFEE', 'RMC', '1'),
(383, '0382', 'BTN FFEE N. 26', '3A BRIG FFEE', 'RMC', '1'),
(384, '0383', 'BTN FFEE N.313', '3A BRIG FFEE', 'RMC', '1'),
(385, '0384', 'C ESP CMDOS 115', '3A BRIG FFEE', 'RMC', '1'),
(386, '0385', 'CG 3A BRIG FFEE', '3A BRIG FFEE', 'RMC', '1'),
(387, '0386', 'CIA CMDO N.300', '3A BRIG FFEE', 'RMC', '1'),
(388, '0387', 'CIA COM  N.300', '3A BRIG FFEE', 'RMC', '1'),
(389, '0388', 'CIA PM  N.300', '3A BRIG FFEE', 'RMC', '1'),
(390, '0389', 'COL MIL M CACE', '3A BRIG FFEE', 'RMC', '1'),
(391, '0390', 'INGUAR 3A BR FE', '3A BRIG FFEE', 'RMC', '1'),
(392, '0391', 'JMP TARAPOTO', '3A BRIG FFEE', 'RMC', '1'),
(393, '0392', 'BS N.800', 'BRIG AE', 'RMC', '1'),
(394, '0393', 'BTN A/TRASP 811', 'BRIG AE', 'RMC', '1'),
(395, '0394', 'BTN A/TRASP 821', 'BRIG AE', 'RMC', '1'),
(396, '0395', 'BTN AVIONES 811', 'BRIG AE', 'RMC', '1'),
(397, '0396', 'BTN RE Y AT 811', 'BRIG AE', 'RMC', '1'),
(398, '0397', 'CG BRIG AE', 'BRIG AE', 'RMC', '1'),
(399, '0398', 'CIA CMDO N.800', 'BRIG AE', 'RMC', '1'),
(400, '0399', 'CIA COM  N.800', 'BRIG AE', 'RMC', '1'),
(401, '0400', 'CIA PM  N.800', 'BRIG AE', 'RMC', '1'),
(402, '0401', 'ESC AE', 'BRIG AE', 'RMC', '1'),
(403, '0402', 'INGUAR A E', 'BRIG AE', 'RMC', '1'),
(404, '0403', '2A Z J E', 'CG RMC', 'RMC', '1'),
(405, '0404', 'BS N.112', 'CG RMC', 'RMC', '1'),
(406, '0405', 'BTN COM N.112', 'CG RMC', 'RMC', '1'),
(407, '0406', 'BTN PM N.501', 'CG RMC', 'RMC', '1'),
(408, '0407', 'CG RMC', 'CG RMC', 'RMC', '1'),
(409, '0408', 'CIA CMDO N.112', 'CG RMC', 'RMC', '1'),
(410, '0409', 'COL MIL L PRADO', 'CG RMC', 'RMC', '1'),
(411, '0410', 'INGUAR RMC', 'CG RMC', 'RMC', '1'),
(412, '0411', 'CEM COAR', 'COAR', 'RMC', '1'),
(413, '0412', 'CIA C/SERV COAR', 'COAR', 'RMC', '1'),
(414, '0413', 'UMAR N.3', 'COAR', 'RMC', '1'),
(415, '0414', 'UMAR N.5', 'COAR', 'RMC', '1'),
(416, '0415', 'UMAR N.6', 'COAR', 'RMC', '1'),
(417, '0416', 'BAT ART VOLANTE', 'L P DE LA GUARDIA', 'RMC', '1'),
(418, '0417', 'BIM  N. 1', 'L P DE LA GUARDIA', 'RMC', '1'),
(419, '0418', 'BMUS EPR HJ N.1', 'L P DE LA GUARDIA', 'RMC', '1'),
(420, '0419', 'CEM LPG', 'L P DE LA GUARDIA', 'RMC', '1'),
(421, '0420', 'RC EPR', 'L P DE LA GUARDIA', 'RMC', '1'),
(422, '0421', 'RC EPR HJ N.1', 'L P DE LA GUARDIA', 'RMC', '1'),
(423, '0422', 'BCO N.111', '1A BRIG ART', 'RMN', '1'),
(424, '0423', 'CG 1A BRIG ART', '1A BRIG ART', 'RMN', '1'),
(425, '0424', 'GAC  N. 1', '1A BRIG ART', 'RMN', '1'),
(426, '0425', 'GAC  N.111', '1A BRIG ART', 'RMN', '1'),
(427, '0426', 'GAC  N.121', '1A BRIG ART', 'RMN', '1'),
(428, '0427', 'GAC  N.502', '1A BRIG ART', 'RMN', '1'),
(429, '0428', 'BING C/B N. 51', '1A BRIG CAB', 'RMN', '1'),
(430, '0429', 'BMUS N. 55', '1A BRIG CAB', 'RMN', '1'),
(431, '0430', 'CG 1A BRIG CAB', '1A BRIG CAB', 'RMN', '1'),
(432, '0431', 'CIA AT  N. 7', '1A BRIG CAB', 'RMN', '1'),
(433, '0432', 'CIA COM  N. 51', '1A BRIG CAB', 'RMN', '1'),
(434, '0433', 'ESCD C/S N.51', '1A BRIG CAB', 'RMN', '1'),
(435, '0434', 'ESCD PM N.51', '1A BRIG CAB', 'RMN', '1'),
(436, '0435', 'GAC  N. 8', '1A BRIG CAB', 'RMN', '1'),
(437, '0436', 'GAC  N.51', '1A BRIG CAB', 'RMN', '1'),
(438, '0437', 'INGUAR 1A BC', '1A BRIG CAB', 'RMN', '1'),
(439, '0438', 'JMP SULLANA', '1A BRIG CAB', 'RMN', '1'),
(440, '0439', 'RC  N. 7', '1A BRIG CAB', 'RMN', '1'),
(441, '0440', 'RCB  N. 13', '1A BRIG CAB', 'RMN', '1'),
(442, '0441', 'RCB  N. 15', '1A BRIG CAB', 'RMN', '1'),
(443, '0442', 'RCB  N. 17', '1A BRIG CAB', 'RMN', '1'),
(444, '0443', 'RCB  N. 5', '1A BRIG CAB', 'RMN', '1'),
(445, '0444', 'REG SERV N.51', '1A BRIG CAB', 'RMN', '1'),
(446, '0445', 'BTN INT N.111', '1A BRIG SERVS', 'RMN', '1'),
(447, '0446', 'C SAN/VET S 111', '1A BRIG SERVS', 'RMN', '1'),
(448, '0447', 'C TRAS SERV 111', '1A BRIG SERVS', 'RMN', '1'),
(449, '0448', 'CG 1A BRIG SERV', '1A BRIG SERVS', 'RMN', '1'),
(450, '0449', 'CIA C/SERV 111', '1A BRIG SERVS', 'RMN', '1'),
(451, '0450', 'CIA COM SRV 111', '1A BRIG SERVS', 'RMN', '1'),
(452, '0451', 'CIA ING SRV 111', '1A BRIG SERVS', 'RMN', '1'),
(453, '0452', 'CIA MG SERV 111', '1A BRIG SERVS', 'RMN', '1'),
(454, '0453', 'BIM  N. 11', '1RA BRIG INF', 'RMN', '1'),
(455, '0454', 'BIM  N. 23', '1RA BRIG INF', 'RMN', '1'),
(456, '0455', 'BIM  N. 5', '1RA BRIG INF', 'RMN', '1'),
(457, '0456', 'BING COMB N. 1', '1RA BRIG INF', 'RMN', '1'),
(458, '0457', 'BMUS N. 1', '1RA BRIG INF', 'RMN', '1'),
(459, '0458', 'BMUS N. 51', '1RA BRIG INF', 'RMN', '1'),
(460, '0459', 'BS N. 1', '1RA BRIG INF', 'RMN', '1'),
(461, '0460', 'CG 1A BRIG INF', '1RA BRIG INF', 'RMN', '1'),
(462, '0461', 'CIA AT  N. 1', '1RA BRIG INF', 'RMN', '1'),
(463, '0462', 'CIA CMDO N. 1', '1RA BRIG INF', 'RMN', '1'),
(464, '0463', 'CIA COM  N. 1', '1RA BRIG INF', 'RMN', '1'),
(465, '0464', 'CIA PM  N. 1', '1RA BRIG INF', 'RMN', '1'),
(466, '0465', 'GAAA N.113', '1RA BRIG INF', 'RMN', '1'),
(467, '0466', 'GAC  N.112', '1RA BRIG INF', 'RMN', '1'),
(468, '0467', 'INGUAR 1A BR IN', '1RA BRIG INF', 'RMN', '1'),
(469, '0468', 'JMP TUMBES', '1RA BRIG INF', 'RMN', '1'),
(470, '0469', 'RCB  N.111', '1RA BRIG INF', 'RMN', '1'),
(471, '0470', 'BIM  N. 37', '32A BRIG INF', 'RMN', '1'),
(472, '0471', 'BIM  N. 6', '32A BRIG INF', 'RMN', '1'),
(473, '0472', 'BIM  N.323', '32A BRIG INF', 'RMN', '1'),
(474, '0473', 'BING C/M N. 32', '32A BRIG INF', 'RMN', '1'),
(475, '0474', 'BMUS N. 56', '32A BRIG INF', 'RMN', '1'),
(476, '0475', 'BS N. 32', '32A BRIG INF', 'RMN', '1'),
(477, '0476', 'CG 32A BRIG INF', '32A BRIG INF', 'RMN', '1'),
(478, '0477', 'CIA CMDO N. 32', '32A BRIG INF', 'RMN', '1'),
(479, '0478', 'CIA COM  N. 32', '32A BRIG INF', 'RMN', '1'),
(480, '0479', 'CIA PM  N. 32', '32A BRIG INF', 'RMN', '1'),
(481, '0480', 'COL MIL RAMON C', '32A BRIG INF', 'RMN', '1'),
(482, '0481', 'GAC  N.116', '32A BRIG INF', 'RMN', '1'),
(483, '0482', 'INGUAR 32A BRIG', '32A BRIG INF', 'RMN', '1'),
(484, '0483', 'JMP TRUJILLO', '32A BRIG INF', 'RMN', '1'),
(485, '0484', 'BAT AAAE N.116', '6A BRIG SELVA', 'RMN', '1'),
(486, '0485', 'BIM  N.111', '6A BRIG SELVA', 'RMN', '1'),
(487, '0486', 'BING C/S N.116', '6A BRIG SELVA', 'RMN', '1'),
(488, '0487', 'BING CONS N. 1', '6A BRIG SELVA', 'RMN', '1'),
(489, '0488', 'BIS  N. 25', '6A BRIG SELVA', 'RMN', '1'),
(490, '0489', 'BIS  N. 32', '6A BRIG SELVA', 'RMN', '1'),
(491, '0490', 'BIS  N. 35', '6A BRIG SELVA', 'RMN', '1'),
(492, '0491', 'BIS  N. 69', '6A BRIG SELVA', 'RMN', '1'),
(493, '0492', 'BIS  N. 85', '6A BRIG SELVA', 'RMN', '1'),
(494, '0493', 'BMUS N.116', '6A BRIG SELVA', 'RMN', '1'),
(495, '0494', 'BS N.116', '6A BRIG SELVA', 'RMN', '1'),
(496, '0495', 'CG 6A BRIG SELV', '6A BRIG SELVA', 'RMN', '1'),
(497, '0496', 'CIA CMDO N.116', '6A BRIG SELVA', 'RMN', '1'),
(498, '0497', 'CIA COM  N.116', '6A BRIG SELVA', 'RMN', '1'),
(499, '0498', 'CIA DESM N. 116', '6A BRIG SELVA', 'RMN', '1'),
(500, '0499', 'CIA PM  N.116', '6A BRIG SELVA', 'RMN', '1'),
(501, '0500', 'COL MIL H. CENE', '6A BRIG SELVA', 'RMN', '1'),
(502, '0501', 'GAC  N.61', '6A BRIG SELVA', 'RMN', '1'),
(503, '0502', 'INGUAR 6A BRG S', '6A BRIG SELVA', 'RMN', '1'),
(504, '0503', 'UMAR N.1', '6A BRIG SELVA', 'RMN', '1'),
(505, '0504', '1A Z J E', '7A BRIG INF', 'RMN', '1'),
(506, '0505', 'BIM  N. 14', '7A BRIG INF', 'RMN', '1'),
(507, '0506', 'BIM  N. 38', '7A BRIG INF', 'RMN', '1'),
(508, '0507', 'BIM  N. 7', '7A BRIG INF', 'RMN', '1'),
(509, '0508', 'BING C/M N. 7', '7A BRIG INF', 'RMN', '1'),
(510, '0509', 'BMUS N. 2', '7A BRIG INF', 'RMN', '1'),
(511, '0510', 'BMUS N. 52', '7A BRIG INF', 'RMN', '1'),
(512, '0511', 'BS N. 7', '7A BRIG INF', 'RMN', '1'),
(513, '0512', 'CG 7A BRIG INF', '7A BRIG INF', 'RMN', '1'),
(514, '0513', 'CIA CMDO N. 7', '7A BRIG INF', 'RMN', '1'),
(515, '0514', 'CIA COM  N. 7', '7A BRIG INF', 'RMN', '1'),
(516, '0515', 'CIA DESM N. 111', '7A BRIG INF', 'RMN', '1'),
(517, '0516', 'CIA PM  N. 7', '7A BRIG INF', 'RMN', '1'),
(518, '0517', 'COL MIL ELIAS A', '7A BRIG INF', 'RMN', '1'),
(519, '0518', 'COL MIL H. RUBIO', '7A BRIG INF', 'RMN', '1'),
(520, '0519', 'GAC  N. 9', '7A BRIG INF', 'RMN', '1'),
(521, '0520', 'INGUAR 7A BRG I', '7A BRIG INF', 'RMN', '1'),
(522, '0521', 'BIB N.211', '9A BRIG BLIND', 'RMN', '1'),
(523, '0522', 'BING C/B N.211', '9A BRIG BLIND', 'RMN', '1'),
(524, '0523', 'BMUS N. 54', '9A BRIG BLIND', 'RMN', '1'),
(525, '0524', 'BS N.211', '9A BRIG BLIND', 'RMN', '1'),
(526, '0525', 'BTQ N.222', '9A BRIG BLIND', 'RMN', '1'),
(527, '0526', 'BTQ N.223', '9A BRIG BLIND', 'RMN', '1'),
(528, '0527', 'CG 9A BB', '9A BRIG BLIND', 'RMN', '1'),
(529, '0528', 'CIA CMDO N.211', '9A BRIG BLIND', 'RMN', '1'),
(530, '0529', 'CIA COM  N.211', '9A BRIG BLIND', 'RMN', '1'),
(531, '0530', 'CIA PM  N.211', '9A BRIG BLIND', 'RMN', '1'),
(532, '0531', 'GAAA N.111', '9A BRIG BLIND', 'RMN', '1'),
(533, '0532', 'GAB  N.211', '9A BRIG BLIND', 'RMN', '1'),
(534, '0533', 'AGRUPING PIURA', 'CG RMN', 'RMN', '1'),
(535, '0534', 'BMUS N.101', 'CG RMN', 'RMN', '1'),
(536, '0535', 'BTN COM N.111', 'CG RMN', 'RMN', '1'),
(537, '0536', 'C ESP CMDOS 111', 'CG RMN', 'RMN', '1'),
(538, '0537', 'C ING ANF N.111', 'CG RMN', 'RMN', '1'),
(539, '0538', 'CEM 1A BRIG ART', 'CG RMN', 'RMN', '1'),
(540, '0539', 'CG RMN', 'CG RMN', 'RMN', '1'),
(541, '0540', 'CIA CMDO N.111', 'CG RMN', 'RMN', '1'),
(542, '0541', 'CIA PM  N.111', 'CG RMN', 'RMN', '1'),
(543, '0542', 'COL MIL PRG', 'CG RMN', 'RMN', '1'),
(544, '0543', 'INGUAR RMN', 'CG RMN', 'RMN', '1'),
(545, '0544', 'JMP PIURA', 'CG RMN', 'RMN', '1'),
(546, '0545', 'BTN INT N.115', '5A BRIG SERVS', 'RMO', '1'),
(547, '0546', 'BTN MG SERV 115', '5A BRIG SERVS', 'RMO', '1'),
(548, '0547', 'BTN TRASP N.115', '5A BRIG SERVS', 'RMO', '1'),
(549, '0548', 'C SAN/VET S 115', '5A BRIG SERVS', 'RMO', '1'),
(550, '0549', 'CG 5A BRIG SRV', '5A BRIG SERVS', 'RMO', '1'),
(551, '0550', 'CIA C/SERV 115', '5A BRIG SERVS', 'RMO', '1'),
(552, '0551', 'CIA COM SRV 115', '5A BRIG SERVS', 'RMO', '1'),
(553, '0552', 'CIA ING SRV 115', '5A BRIG SERVS', 'RMO', '1'),
(554, '0553', '5A Z J E', 'CG RMO', 'RMO', '1'),
(555, '0554', '5TO C I R', 'CG RMO', 'RMO', '1'),
(556, '0555', 'BAT AAAE N.115', 'CG RMO', 'RMO', '1'),
(557, '0556', 'BAT AAAE N.125', 'CG RMO', 'RMO', '1'),
(558, '0557', 'BING C/S N. 5', 'CG RMO', 'RMO', '1'),
(559, '0558', 'BIS  N. 17', 'CG RMO', 'RMO', '1'),
(560, '0559', 'BIS  N. 27', 'CG RMO', 'RMO', '1'),
(561, '0560', 'BIS  N. 28', 'CG RMO', 'RMO', '1'),
(562, '0561', 'BIS  N. 29', 'CG RMO', 'RMO', '1'),
(563, '0562', 'BIS  N. 3', 'CG RMO', 'RMO', '1'),
(564, '0563', 'BIS  N. 30', 'CG RMO', 'RMO', '1'),
(565, '0564', 'BIS  N. 47', 'CG RMO', 'RMO', '1'),
(566, '0565', 'BIS  N. 49', 'CG RMO', 'RMO', '1'),
(567, '0566', 'BIS  N. 53', 'CG RMO', 'RMO', '1'),
(568, '0567', 'BIS  N. 83', 'CG RMO', 'RMO', '1'),
(569, '0568', 'BMUS N.105', 'CG RMO', 'RMO', '1'),
(570, '0569', 'BTN COM N.115', 'CG RMO', 'RMO', '1'),
(571, '0570', 'C ESP CMDOS 125', 'CG RMO', 'RMO', '1'),
(572, '0571', 'CG RMO', 'CG RMO', 'RMO', '1'),
(573, '0572', 'CIA CMDO N.115', 'CG RMO', 'RMO', '1'),
(574, '0573', 'CIA PM  N.115', 'CG RMO', 'RMO', '1'),
(575, '0574', 'UMAR N.2', 'CG RMO', 'RMO', '1'),
(576, '0575', 'BCO N.113', '3A BRIG ART', 'RMS', '1'),
(577, '0576', 'CG 3A BRIG ART', '3A BRIG ART', 'RMS', '1'),
(578, '0577', 'ESC ANFIBIOS', '3A BRIG ART', 'RMS', '1'),
(579, '0578', 'GAC  N.113', '3A BRIG ART', 'RMS', '1'),
(580, '0579', 'GAC  N.122', '3A BRIG ART', 'RMS', '1'),
(581, '0580', 'GAC  N.123', '3A BRIG ART', 'RMS', '1'),
(582, '0581', 'GAC  N.501', '3A BRIG ART', 'RMS', '1'),
(583, '0582', 'BIB  N. 41', '3A BRIG BLIND', 'RMS', '1'),
(584, '0583', 'BING C/B N. 3', '3A BRIG BLIND', 'RMS', '1'),
(585, '0584', 'BMUS N. 61', '3A BRIG BLIND', 'RMS', '1'),
(586, '0585', 'BS N. 3', '3A BRIG BLIND', 'RMS', '1'),
(587, '0586', 'BTQ N.211', '3A BRIG BLIND', 'RMS', '1'),
(588, '0587', 'BTQ N.221', '3A BRIG BLIND', 'RMS', '1'),
(589, '0588', 'CG 3A BB', '3A BRIG BLIND', 'RMS', '1'),
(590, '0589', 'CIA CMDO N. 3', '3A BRIG BLIND', 'RMS', '1'),
(591, '0590', 'CIA COM  N. 3', '3A BRIG BLIND', 'RMS', '1'),
(592, '0591', 'CIA ESP CMDO 3', '3A BRIG BLIND', 'RMS', '1'),
(593, '0592', 'CIA PM  N. 3', '3A BRIG BLIND', 'RMS', '1'),
(594, '0593', 'GAC  N. 3', '3A BRIG BLIND', 'RMS', '1'),
(595, '0594', 'INGUAR 3A BB', '3A BRIG BLIND', 'RMS', '1'),
(596, '0595', 'JMP MOQUEGUA', '3A BRIG BLIND', 'RMS', '1'),
(597, '0596', 'BING C/B N. 20', '3A BRIG CAB', 'RMS', '1'),
(598, '0597', 'BMUS N. 65', '3A BRIG CAB', 'RMS', '1'),
(599, '0598', 'BS N. 20', '3A BRIG CAB', 'RMS', '1'),
(600, '0599', 'CG 3A BRIG CAB', '3A BRIG CAB', 'RMS', '1'),
(601, '0600', 'CIA AT  N. 6', '3A BRIG CAB', 'RMS', '1'),
(602, '0601', 'CIA CMDO N. 20', '3A BRIG CAB', 'RMS', '1'),
(603, '0602', 'CIA COM  N. 20', '3A BRIG CAB', 'RMS', '1'),
(604, '0603', 'CIA ESP CMDO 20', '3A BRIG CAB', 'RMS', '1'),
(605, '0604', 'CIA PM  N. 20', '3A BRIG CAB', 'RMS', '1'),
(606, '0605', 'COL MIL G.ALBA', '3A BRIG CAB', 'RMS', '1'),
(607, '0606', 'ESCD CAB N.113', '3A BRIG CAB', 'RMS', '1'),
(608, '0607', 'GAC  N.20', '3A BRIG CAB', 'RMS', '1'),
(609, '0608', 'INGUAR 3A BR CA', '3A BRIG CAB', 'RMS', '1'),
(610, '0609', 'JMP TACNA', '3A BRIG CAB', 'RMS', '1'),
(611, '0610', 'RCB  N. 3', '3A BRIG CAB', 'RMS', '1'),
(612, '0611', 'RCB  N.101', '3A BRIG CAB', 'RMS', '1'),
(613, '0612', 'RCB  N.113', '3A BRIG CAB', 'RMS', '1'),
(614, '0613', 'RCB  N.211', '3A BRIG CAB', 'RMS', '1'),
(615, '0614', 'BTN COM N.113', '3A BRIG COM', 'RMS', '1'),
(616, '0615', 'BTN COM N.501', '3A BRIG COM', 'RMS', '1'),
(617, '0616', 'C CMDO SEG N. 3', '3A BRIG COM', 'RMS', '1'),
(618, '0617', 'CG 3A BRIG COM', '3A BRIG COM', 'RMS', '1'),
(619, '0618', 'CIA COM N. 8', '3A BRIG COM', 'RMS', '1'),
(620, '0619', 'CIA G ELECT 113', '3A BRIG COM', 'RMS', '1'),
(621, '0620', 'BTN INT N.113', '3A BRIG SERVS 113', 'RMS', '1'),
(622, '0621', 'C SAN/VET S 113', '3A BRIG SERVS 113', 'RMS', '1'),
(623, '0622', 'C TRASP SRV 113', '3A BRIG SERVS 113', 'RMS', '1'),
(624, '0623', 'CG 3A BRIG SERV', '3A BRIG SERVS 113', 'RMS', '1'),
(625, '0624', 'CIA C/SERV 113', '3A BRIG SERVS 113', 'RMS', '1'),
(626, '0625', 'CIA COM SRV 113', '3A BRIG SERVS 113', 'RMS', '1'),
(627, '0626', 'CIA ING SRV 113', '3A BRIG SERVS 113', 'RMS', '1'),
(628, '0627', 'CIA MG SERV 113', '3A BRIG SERVS 113', 'RMS', '1'),
(629, '0628', 'BIM  N. 15', '4A BRIG MTÐA', 'RMS', '1'),
(630, '0629', 'BIM  N. 21', '4A BRIG MTÐA', 'RMS', '1'),
(631, '0630', 'BIM  N. 55', '4A BRIG MTÐA', 'RMS', '1'),
(632, '0631', 'BIM  N. 59', '4A BRIG MTÐA', 'RMS', '1'),
(633, '0632', 'BING C/M N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(634, '0633', 'BMUS N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(635, '0634', 'BMUS N. 5', '4A BRIG MTÐA', 'RMS', '1'),
(636, '0635', 'BMUS N. 6', '4A BRIG MTÐA', 'RMS', '1'),
(637, '0636', 'BMUS N. 63', '4A BRIG MTÐA', 'RMS', '1'),
(638, '0637', 'BMUS N. 7', '4A BRIG MTÐA', 'RMS', '1'),
(639, '0638', 'BMUS N. 8', '4A BRIG MTÐA', 'RMS', '1'),
(640, '0639', 'BS N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(641, '0640', 'CG 4A BRIG MTÑA', '4A BRIG MTÐA', 'RMS', '1'),
(642, '0641', 'CIA AT  N.522', '4A BRIG MTÐA', 'RMS', '1'),
(643, '0642', 'CIA CMDO N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(644, '0643', 'CIA COM  N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(645, '0644', 'CIA ESP CMDO 4', '4A BRIG MTÐA', 'RMS', '1'),
(646, '0645', 'CIA PM  N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(647, '0646', 'COL MIL CAPAC', '4A BRIG MTÐA', 'RMS', '1'),
(648, '0647', 'GAC  N. 4', '4A BRIG MTÐA', 'RMS', '1'),
(649, '0648', 'INGUAR 4 BM', '4A BRIG MTÐA', 'RMS', '1'),
(650, '0649', 'JMP PUNO', '4A BRIG MTÐA', 'RMS', '1'),
(651, '0650', 'RCB  N. 9', '4A BRIG MTÐA', 'RMS', '1'),
(652, '0651', 'RCB  N.123', '4A BRIG MTÐA', 'RMS', '1'),
(653, '0652', '4A Z J E', '5A BRIG MTÐA', 'RMS', '1'),
(654, '0653', 'BIM  N. 63', '5A BRIG MTÐA', 'RMS', '1'),
(655, '0654', 'BIM  N. 9', '5A BRIG MTÐA', 'RMS', '1'),
(656, '0655', 'BING C/B N.241', '5A BRIG MTÐA', 'RMS', '1'),
(657, '0656', 'BING CONS N. 4', '5A BRIG MTÐA', 'RMS', '1'),
(658, '0657', 'BIS  N. 33', '5A BRIG MTÐA', 'RMS', '1'),
(659, '0658', 'BMUS N. 33-A', '5A BRIG MTÐA', 'RMS', '1'),
(660, '0659', 'BMUS N. 5-A', '5A BRIG MTÐA', 'RMS', '1'),
(661, '0660', 'BMUS N. 63-A', '5A BRIG MTÐA', 'RMS', '1'),
(662, '0661', 'BMUS N.104', '5A BRIG MTÐA', 'RMS', '1'),
(663, '0662', 'CG 5A BRIG MTÑA', '5A BRIG MTÐA', 'RMS', '1'),
(664, '0663', 'CIA CMDO N.114', '5A BRIG MTÐA', 'RMS', '1'),
(665, '0664', 'CIA COM  N.114', '5A BRIG MTÐA', 'RMS', '1'),
(666, '0665', 'CIA ESP CMDO 5', '5A BRIG MTÐA', 'RMS', '1'),
(667, '0666', 'CIA PM  N.114', '5A BRIG MTÐA', 'RMS', '1'),
(668, '0667', 'COL MIL ANCCOH', '5A BRIG MTÐA', 'RMS', '1'),
(669, '0668', 'COL MIL I.PACHA', '5A BRIG MTÐA', 'RMS', '1'),
(670, '0669', 'GAC  N.11', '5A BRIG MTÐA', 'RMS', '1'),
(671, '0670', 'INGUAR 5A BM', '5A BRIG MTÐA', 'RMS', '1'),
(672, '0671', 'UMAR N.4', '5A BRIG MTÐA', 'RMS', '1'),
(673, '0672', 'BIB  N. 45', '6A BRIG BLIND', 'RMS', '1'),
(674, '0673', 'BING C/B N. 6', '6A BRIG BLIND', 'RMS', '1'),
(675, '0674', 'BMUS N. 62', '6A BRIG BLIND', 'RMS', '1'),
(676, '0675', 'BS N. 6', '6A BRIG BLIND', 'RMS', '1'),
(677, '0676', 'BTQ N.212', '6A BRIG BLIND', 'RMS', '1'),
(678, '0677', 'BTQ N.213', '6A BRIG BLIND', 'RMS', '1'),
(679, '0678', 'CG 6A BRIG BLIND', '6A BRIG BLIND', 'RMS', '1'),
(680, '0679', 'CIA CMDO N. 6', '6A BRIG BLIND', 'RMS', '1'),
(681, '0680', 'CIA COM  N. 6', '6A BRIG BLIND', 'RMS', '1'),
(682, '0681', 'CIA PM  N. 6', '6A BRIG BLIND', 'RMS', '1'),
(683, '0682', 'ESC BLIND', '6A BRIG BLIND', 'RMS', '1'),
(684, '0683', 'GAAA N.501', '6A BRIG BLIND', 'RMS', '1'),
(685, '0684', 'BTN CMDOS N.613', '6A BRIG FFEE', 'RMS', '1'),
(686, '0685', 'BTN CMDOS N.623', '6A BRIG FFEE', 'RMS', '1'),
(687, '0686', 'BTN FFEE N.623', '6A BRIG FFEE', 'RMS', '1'),
(688, '0687', 'CEM 6A BRIG FFEE', '6A BRIG FFEE', 'RMS', '1'),
(689, '0688', 'C/CMDO AGRU AT3', 'AGRUP AT N.3', 'RMS', '1'),
(690, '0689', 'CEM AGRUP AT N3', 'AGRUP AT N.3', 'RMS', '1'),
(691, '0690', 'CIA AT 630', 'AGRUP AT N.3', 'RMS', '1'),
(692, '0691', 'CIA AT 632', 'AGRUP AT N.3', 'RMS', '1'),
(693, '0692', 'CIA AT 633', 'AGRUP AT N.3', 'RMS', '1'),
(694, '0693', 'CIA AT 634', 'AGRUP AT N.3', 'RMS', '1'),
(695, '0694', 'CIA AT 636', 'AGRUP AT N.3', 'RMS', '1'),
(696, '0695', 'CIA AT 638', 'AGRUP AT N.3', 'RMS', '1'),
(697, '0696', 'CIA INST/AP TCO', 'AGRUP AT N.3', 'RMS', '1'),
(698, '0697', 'BAT CMDO/COM N°4', 'AGRUP J GALVEZ', 'RMS', '1'),
(699, '0698', 'BAT SERVS N°4', 'AGRUP J GALVEZ', 'RMS', '1'),
(700, '0699', 'BMUS N. 68', 'AGRUP J GALVEZ', 'RMS', '1'),
(701, '0700', 'CG AGRUP J.GALV', 'AGRUP J GALVEZ', 'RMS', '1'),
(702, '0701', 'GPO COH AAE N.1', 'AGRUP J GALVEZ', 'RMS', '1'),
(703, '0702', 'GPO COH AAE N.2', 'AGRUP J GALVEZ', 'RMS', '1'),
(704, '0703', 'GPO COH AAE N.3', 'AGRUP J GALVEZ', 'RMS', '1'),
(705, '0704', 'GPO COH AAE N.4', 'AGRUP J GALVEZ', 'RMS', '1'),
(706, '0705', 'GPO TEC COH N°4', 'AGRUP J GALVEZ', 'RMS', '1'),
(707, '0706', '3A Z J E', 'CG RMS', 'RMS', '1'),
(708, '0707', 'BIB  N. 57', 'CG RMS', 'RMS', '1'),
(709, '0708', 'BIM  N. 13', 'CG RMS', 'RMS', '1'),
(710, '0709', 'BMUS N.103', 'CG RMS', 'RMS', '1'),
(711, '0710', 'C ING ANF N.113', 'CG RMS', 'RMS', '1'),
(712, '0711', 'CEM AA BOLOGNES', 'CG RMS', 'RMS', '1'),
(713, '0712', 'CG RMS', 'CG RMS', 'RMS', '1'),
(714, '0713', 'CIA CMDO N.113', 'CG RMS', 'RMS', '1'),
(715, '0714', 'CIA ESP CMDO 113', 'CG RMS', 'RMS', '1'),
(716, '0715', 'CIA PM  N.113', 'CG RMS', 'RMS', '1'),
(717, '0716', 'COL MIL D NIETO', 'CG RMS', 'RMS', '1'),
(718, '0717', 'COL MIL FCO BOL', 'CG RMS', 'RMS', '1'),
(719, '0718', 'INGUAR RMS', 'CG RMS', 'RMS', '1');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  `tipo_usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario`, `contrasena`, `estado`, `tipo_usuario`) VALUES
(1, 'admin', 'admin', b'1', '0'),
(6, 'usuario', 'usuario', b'1', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`accion_id`);

--
-- Indexes for table `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`clasificacion_id`);

--
-- Indexes for table `decreto`
--
ALTER TABLE `decreto`
  ADD PRIMARY KEY (`decreto_id`);

--
-- Indexes for table `disposicion`
--
ALTER TABLE `disposicion`
  ADD PRIMARY KEY (`disposicion_id`);

--
-- Indexes for table `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`documento_id`);

--
-- Indexes for table `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`seccion_id`);

--
-- Indexes for table `situacion`
--
ALTER TABLE `situacion`
  ADD PRIMARY KEY (`situacion_id`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipo_documento_id`);

--
-- Indexes for table `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`unidad_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accion`
--
ALTER TABLE `accion`
  MODIFY `accion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `decreto`
--
ALTER TABLE `decreto`
  MODIFY `decreto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `disposicion`
--
ALTER TABLE `disposicion`
  MODIFY `disposicion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `documento`
--
ALTER TABLE `documento`
  MODIFY `documento_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seccion`
--
ALTER TABLE `seccion`
  MODIFY `seccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `situacion`
--
ALTER TABLE `situacion`
  MODIFY `situacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tipo_documento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `unidad`
--
ALTER TABLE `unidad`
  MODIFY `unidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
