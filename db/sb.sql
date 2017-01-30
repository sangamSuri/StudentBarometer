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
  `ColName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collist`
--

/*!40000 ALTER TABLE `collist` DISABLE KEYS */;
INSERT INTO `collist` (`ColWebId`,`ColName`) VALUES 
 ('www.apsce-blr.org','A P S College of Engineering'),
 ('www.acharyainstitutes.ac.in','Acharya Institute of Technology'),
 ('www.atria.edu','Atria Institute of Technology'),
 ('B.N.M. Institute of Technology','B.N.M. Institute of Technology'),
 ('www.bmsce.ac.in','B. M. Sreenivasaiah College of Engg.'),
 ('www.bcet.ac.in','Bangalore College of Engineering and Technology'),
 ('www.cmrit.com','C. M. R. Institute of Technology'),
 ('www.dayanandasagar.edu','Dayananda Sagar College of Engg.'),
 (' www.dbit.ac.in','Don Bosco Institute of Technology'),
 ('www.epcet.net','East Point College of Engineering and Technology'),
 ('www.ewit.edu','East West Institute of Technology'),
 ('www.impactinstitutions.org','Impact College of Engineering & AppliedSciences'),
 ('www.msrit.edu','M. S. Ramaiah Institute of Technology'),
 ('www.rithassan.org','Rajeev Institute of Technology');
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
  PRIMARY KEY (`usn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed`
--

/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` (`experince`,`faciliti`,`standrads`,`sports`,`unions`,`usn`,`date`,`comments`) VALUES 
 (4,3,3,3,4,'1us12asd12121','2017-01-30',' good'),
 (2,2,2,2,2,'v1234','2017-01-29',' ssssss'),
 (5,5,4,4,2,'v12341','2017-01-29',' hhhhhhh');
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
 ('Test1','1us12asd12121','Bangalore College of Engineering and Technology'),
 ('sdeep','v1234','kits'),
 ('sdeep1','v12341','kits'),
 ('Rajsahekar','vr1234','kits');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
