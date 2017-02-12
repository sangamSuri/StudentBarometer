-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sb
--

CREATE DATABASE IF NOT EXISTS sb;
USE sb;

--
-- Definition of table `collist`
--

DROP TABLE IF EXISTS `collist`;
CREATE TABLE `collist` (
  `ColWebId` varchar(50) DEFAULT NULL,
  `ColName` varchar(100) NOT NULL,
  `ColID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collist`
--

/*!40000 ALTER TABLE `collist` DISABLE KEYS */;
INSERT INTO `collist` (`ColWebId`,`ColName`,`ColID`) VALUES 
 ('www.apsce-blr.org','A P S College of Engineering','c1'),
 ('www.acharyainstitutes.ac.in','Acharya Institute of Technology','c2'),
 ('www.atria.edu','Atria Institute of Technology','c3'),
 ('B.N.M. Institute of Technology','B.N.M. Institute of Technology','c4'),
 ('www.bmsce.ac.in','B. M. Sreenivasaiah College of Engg.','c5'),
 ('www.bcet.ac.in','Bangalore College of Engineering and Technology','c6'),
 ('www.cmrit.com','C. M. R. Institute of Technology','c7'),
 ('www.dayanandasagar.edu','Dayananda Sagar College of Engg.','c8'),
 (' www.dbit.ac.in','Don Bosco Institute of Technology','c9'),
 ('www.epcet.net','East Point College of Engineering and Technology','c10'),
 ('www.ewit.edu','East West Institute of Technology','c11'),
 ('www.impactinstitutions.org','Impact College of Engineering & AppliedSciences','c12'),
 ('www.msrit.edu','M. S. Ramaiah Institute of Technology','c13'),
 ('www.rithassan.org','Rajeev Institute of Technology','c14');
/*!40000 ALTER TABLE `collist` ENABLE KEYS */;


--
-- Definition of table `feed`
--

DROP TABLE IF EXISTS `feed`;
CREATE TABLE `feed` (
  `experince` int(11) DEFAULT NULL,
  `faciliti` int(11) DEFAULT NULL,
  `standrads` int(11) DEFAULT NULL,
  `sports` int(11) DEFAULT NULL,
  `unions` int(11) DEFAULT NULL,
  `usn` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `ColID` varchar(10) NOT NULL,
  PRIMARY KEY (`usn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed`
--

/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` (`experince`,`faciliti`,`standrads`,`sports`,`unions`,`usn`,`date`,`comments`,`ColID`) VALUES 
 (5,2,2,3,3,'1kt06ee19','2017-02-12',' super','c1'),
 (5,4,4,4,4,'1us12asd12121','2017-02-12',' test','c1');
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sname` varchar(50) DEFAULT NULL,
  `usn` varchar(50) NOT NULL,
  `college` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`sname`,`usn`,`college`) VALUES 
 ('san','123','c2'),
 ('sangam','1us12asd12121','c1'),
 ('sangam','232','c2'),
 ('western','test','c1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
