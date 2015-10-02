-- Host: localhost
-- Generation Time: Oct 02, 2015 at 03:38 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `whri`
--

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE IF NOT EXISTS `Items` (
  `productname` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `units` varchar(80) DEFAULT NULL,
  `unitcost` float NOT NULL,
  `source` varchar(80) DEFAULT NULL,
  `showitem` tinyint(1) NOT NULL,
  `dateadded` date NOT NULL,
  PRIMARY KEY (`productname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`productname`, `type`, `units`, `unitcost`, `source`, `showitem`, `dateadded`) VALUES
('Celery', 'Produce', 'stalk', 0.93, 'Lightsey', 1, '2015-10-02'),
('Honey', 'Product', 'jar', 7, 'WHRI', 1, '2015-10-02'),
('Milk', 'Livestock', 'pint', 2.3, 'WHRI', 1, '2015-10-02'),
('Tomato', 'Produce', 'tomato', 1, 'JBG', 1, '2015-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `Orders_Products`
--

CREATE TABLE IF NOT EXISTS `Orders_Products` (
  `orderid` int(11) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantitycost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders_Products`
--

INSERT INTO `Orders_Products` (`orderid`, `productname`, `quantity`, `quantitycost`) VALUES
(3001, 'Tomato', 3, 3),
(3001, 'Celery', 7, 6.5),
(3001, 'Donation', NULL, 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `Orders_Totals`
--

CREATE TABLE IF NOT EXISTS `Orders_Totals` (
  `orderid` int(11) NOT NULL,
  `totalcost` float NOT NULL,
  `discount` float NOT NULL,
  `method` varchar(30) NOT NULL,
  `location` varchar(80) NOT NULL,
  `orderdate` date NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders_Totals`
--

INSERT INTO `Orders_Totals` (`orderid`, `totalcost`, `discount`, `method`, `location`, `orderdate`) VALUES
(3001, 10, 0, 'Cash', 'Farm', '2015-10-02'),
(3002, 12.37, 0.25, 'Check', 'VeggieVan', '2015-10-02'),
(3003, 8, 0.34, 'Card', 'VeggieVan', '2015-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `Payouts_Locations`
--

CREATE TABLE IF NOT EXISTS `Payouts_Locations` (
  `Location` varchar(80) NOT NULL,
  `price` float NOT NULL,
  `note` varchar(255) NOT NULL,
  `orderdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Payouts_Locations`
--

INSERT INTO `Payouts_Locations` (`Location`, `price`, `note`, `orderdate`) VALUES
('Farm', 10, 'Needed to buy lunch', '2015-10-02'),
('VeggieVan', 15, 'Gas money', '2015-10-02');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
