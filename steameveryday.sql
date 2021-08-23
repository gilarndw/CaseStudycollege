/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.32 : Database - steameveryday2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`steameveryday2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `steameveryday2`;

/*Table structure for table `barang` */

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_BARANG` varchar(255) DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_BARANG`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `barang` */

insert  into `barang`(`ID_BARANG`,`NAMA_BARANG`,`STOCK`) values (1,'Shampoo',79),(2,'Pewangi',91),(3,'Semir Ban',97),(4,'Pengkilat Kit',89);

/*Table structure for table `jasa` */

CREATE TABLE `jasa` (
  `ID_JASA` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(255) DEFAULT NULL,
  `DESKRIPSI` text,
  `HARGA` decimal(15,0) DEFAULT NULL,
  `KEUNTUNGAN` decimal(15,0) DEFAULT NULL,
  `UPAH` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`ID_JASA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `jasa` */

insert  into `jasa`(`ID_JASA`,`NAMA`,`DESKRIPSI`,`HARGA`,`KEUNTUNGAN`,`UPAH`) values (1,'Cuci Motor Besar','Layanan Cuci Motor Berukuran Besar Seperti Motor Sport',30000,20000,10000),(2,'Cuci Motor Biasa','Layanan cuci motor berukuran biasa seperti motor bebek\r\n',20000,15000,5000),(3,'Cuci Mobil Sedan','Layanan cuci mobil sedan',50000,35000,15000),(4,'Cuci Mobil Biasa','Layanan cuci mobil berukuran biasa seperti avanza',55000,40000,15000),(5,'Cuci Mobil Besar','Layanan cuci mobil berukuran besar seperti Pajero dan minibus',100000,60000,40000),(6,'Semir Ban ','Layanan Semir ban mengkilat',15000,7000,8000);

/*Table structure for table `jasabarang` */

CREATE TABLE `jasabarang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_JASA` int(11) NOT NULL,
  `BANYAK_KEBUTUHAN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_BARANG`,`ID_JASA`),
  KEY `FK_JASABARANG2` (`ID_JASA`),
  CONSTRAINT `FK_JASABARANG` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON UPDATE CASCADE,
  CONSTRAINT `FK_JASABARANG2` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jasabarang` */

insert  into `jasabarang`(`ID_BARANG`,`ID_JASA`,`BANYAK_KEBUTUHAN`) values (1,1,1),(1,2,1),(1,3,2),(1,4,2),(1,5,3),(2,3,1),(2,4,1),(2,5,1),(3,6,1),(4,1,1),(4,2,1),(4,3,1),(4,4,1),(4,5,1);

/*Table structure for table `jasadikerjakan` */

CREATE TABLE `jasadikerjakan` (
  `ID_PENCUCI` int(11) NOT NULL,
  `ID_DETAIL_TRANSAKSI` int(11) NOT NULL,
  PRIMARY KEY (`ID_PENCUCI`,`ID_DETAIL_TRANSAKSI`),
  KEY `FK_JASADIKERJAKAN2` (`ID_DETAIL_TRANSAKSI`),
  CONSTRAINT `FK_JASADIKERJAKAN` FOREIGN KEY (`ID_PENCUCI`) REFERENCES `pencuci` (`ID_PENCUCI`) ON UPDATE CASCADE,
  CONSTRAINT `FK_JASADIKERJAKAN2` FOREIGN KEY (`ID_DETAIL_TRANSAKSI`) REFERENCES `transaksijasa` (`ID_DETAIL_TRANSAKSI`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jasadikerjakan` */

insert  into `jasadikerjakan`(`ID_PENCUCI`,`ID_DETAIL_TRANSAKSI`) values (1,1),(3,1),(2,2),(1,3),(2,3),(2,4),(3,4),(1,5),(3,5),(1,6),(2,6),(2,7),(3,7),(1,8),(3,8),(1,9),(2,9),(3,10),(1,11),(2,12),(3,12),(2,13),(3,14);

/*Table structure for table `kasir` */

CREATE TABLE `kasir` (
  `ID_KASIR` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(255) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELEPON` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_KASIR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `kasir` */

insert  into `kasir`(`ID_KASIR`,`NAMA`,`ALAMAT`,`NO_TELEPON`) values (1,'Ramadhan','jl.Pangrango Raya NO.69','500505'),(2,'Ade','Jl. Perjuangan 4 No.12','567002');

/*Table structure for table `kupon` */

CREATE TABLE `kupon` (
  `ID_KUPON` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROMO` int(11) DEFAULT NULL,
  `ID_PELANGGAN` int(11) DEFAULT NULL,
  `ID_DETAIL_TRANSAKSI` int(11) DEFAULT NULL,
  `GET_DATE` date DEFAULT NULL,
  `USED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_KUPON`),
  KEY `FK_DIBAYARDENGAN` (`ID_DETAIL_TRANSAKSI`),
  KEY `FK_RELATIONSHIP_15` (`ID_PROMO`),
  KEY `ID_PELANGGAN` (`ID_PELANGGAN`),
  CONSTRAINT `FK_DIBAYARDENGAN` FOREIGN KEY (`ID_DETAIL_TRANSAKSI`) REFERENCES `transaksijasa` (`ID_DETAIL_TRANSAKSI`) ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`ID_PROMO`) REFERENCES `promo` (`ID_PROMO`) ON UPDATE CASCADE,
  CONSTRAINT `kupon_ibfk_1` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `pelanggan` (`ID_PELANGGAN`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `kupon` */

insert  into `kupon`(`ID_KUPON`,`ID_PROMO`,`ID_PELANGGAN`,`ID_DETAIL_TRANSAKSI`,`GET_DATE`,`USED`) values (1,2,1,8,'2018-07-19',1);

/*Table structure for table `menggunakanbarang` */

CREATE TABLE `menggunakanbarang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_DETAIL_TRANSAKSI` int(11) NOT NULL,
  `BANYAK_DIGUNAKAN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_BARANG`,`ID_DETAIL_TRANSAKSI`),
  KEY `ID_DETAIL_TRANSAKSI` (`ID_DETAIL_TRANSAKSI`),
  CONSTRAINT `menggunakanbarang_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON UPDATE CASCADE,
  CONSTRAINT `menggunakanbarang_ibfk_2` FOREIGN KEY (`ID_DETAIL_TRANSAKSI`) REFERENCES `transaksijasa` (`ID_DETAIL_TRANSAKSI`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menggunakanbarang` */

insert  into `menggunakanbarang`(`ID_BARANG`,`ID_DETAIL_TRANSAKSI`,`BANYAK_DIGUNAKAN`) values (1,1,2),(1,3,2),(1,4,2),(1,5,2),(1,6,2),(1,7,2),(1,8,2),(1,9,3),(1,10,1),(1,12,2),(1,13,1),(2,1,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1),(2,9,1),(2,12,1),(3,2,1),(3,11,1),(3,14,1),(4,1,1),(4,3,1),(4,4,1),(4,5,1),(4,6,1),(4,7,1),(4,8,1),(4,9,1),(4,10,1),(4,12,1),(4,13,1);

/*Table structure for table `merekkenderaan` */

CREATE TABLE `merekkenderaan` (
  `ID_MEREK` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_MEREK`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `merekkenderaan` */

insert  into `merekkenderaan`(`ID_MEREK`,`NAMA`) values (1,'Toyota'),(2,'Daihatsu'),(3,'Nissan'),(4,'Honda'),(5,'Kawasaki'),(6,'Suzuki'),(7,'Yamaha');

/*Table structure for table `pelanggan` */

CREATE TABLE `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(255) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELEPON` varchar(15) DEFAULT NULL,
  `JENIS_KELAMIN` char(1) DEFAULT NULL,
  `TANGGAL_LAHIR` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PELANGGAN`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`ID_PELANGGAN`,`NAMA`,`ALAMAT`,`NO_TELEPON`,`JENIS_KELAMIN`,`TANGGAL_LAHIR`,`EMAIL`) values (1,'Budi','Jl.H Sanusi Taming No.40','5609934','L','1989-02-15','Budi256@gmail.com'),(2,'Luce','Jl. Merpati blok CD no. 24\r\n','085534121243','P','1998-02-01','Lussy.Febriani@gmail.com'),(3,'Chris','Jl. Sangkar Burung 2 No.67\r\n','5674332','L','1991-08-22','ChrisTiny@gmail.com'),(4,'Ita','Jl. Parangtritis D no.72','085234140556','P','1895-06-08','dwpanpagi90@gmail.com');

/*Table structure for table `pemasukkan` */

CREATE TABLE `pemasukkan` (
  `ID_PEMASUKKAN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DETAIL_TRANSAKSI` int(11) DEFAULT NULL,
  `DESKRIPSI` text,
  `NILAI` decimal(15,0) DEFAULT NULL,
  `TANGGAL` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PEMASUKKAN`),
  KEY `ID_DETAIL_TRANSAKSI` (`ID_DETAIL_TRANSAKSI`),
  CONSTRAINT `pemasukkan_ibfk_1` FOREIGN KEY (`ID_DETAIL_TRANSAKSI`) REFERENCES `transaksijasa` (`ID_DETAIL_TRANSAKSI`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `pemasukkan` */

insert  into `pemasukkan`(`ID_PEMASUKKAN`,`ID_DETAIL_TRANSAKSI`,`DESKRIPSI`,`NILAI`,`TANGGAL`) values (1,1,'Pemasukkan dari transaksi 1#1',55000,'2018-01-09 10:12:37'),(2,2,'Pemasukkan dari transaksi 1#2',15000,'2018-01-09 10:14:00'),(3,3,'Pemasukkan dari transaksi 2#3',55000,'2018-01-09 10:26:34'),(4,4,'Pemasukkan dari transaksi 3#4',55000,'2018-01-09 10:26:46'),(5,5,'Pemasukkan dari transaksi 4#5',55000,'2018-01-09 10:26:54'),(6,6,'Pemasukkan dari transaksi 5#6',55000,'2018-01-09 10:27:02'),(7,7,'Pemasukkan dari transaksi 6#7',55000,'2018-01-09 10:27:08'),(8,8,'Pemasukkan dari transaksi 7#8',0,'2018-01-09 10:27:15'),(9,9,'Pemasukkan dari transaksi 8#9',100000,'2018-01-22 12:08:27'),(10,10,'Pemasukkan dari transaksi 9#10',30000,'2018-01-22 12:14:38'),(11,11,'Pemasukkan dari transaksi 10#11',15000,'2018-01-22 12:15:36'),(12,12,'Pemasukkan dari transaksi 11#12',50000,'2018-01-22 22:34:11'),(13,13,'Pemasukkan dari transaksi 12#13',20000,'2018-01-22 22:36:07'),(14,14,'Pemasukkan dari transaksi 12#14',15000,'2018-01-23 01:59:26');

/*Table structure for table `pencuci` */

CREATE TABLE `pencuci` (
  `ID_PENCUCI` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(255) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELEPON` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_PENCUCI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pencuci` */

insert  into `pencuci`(`ID_PENCUCI`,`NAMA`,`ALAMAT`,`NO_TELEPON`) values (1,'Karsono','Jl. Majapahit raya NO.22','55651667'),(2,'Doni','Jl. Penunjang 2 No.13','54366217'),(3,'Indra','Jl. Batu Kali 1 No.23 ','56522312');

/*Table structure for table `pengeluaran` */

CREATE TABLE `pengeluaran` (
  `ID_PENGELUARAN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DETAIL_TRANSAKSI` int(11) DEFAULT NULL,
  `DESKRIPSI` text,
  `NILAI` decimal(15,0) DEFAULT NULL,
  `TANGGAL` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PENGELUARAN`),
  KEY `FK_PENGELUARANSTEAM` (`ID_DETAIL_TRANSAKSI`),
  CONSTRAINT `FK_PENGELUARANSTEAM` FOREIGN KEY (`ID_DETAIL_TRANSAKSI`) REFERENCES `transaksijasa` (`ID_DETAIL_TRANSAKSI`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `pengeluaran` */

insert  into `pengeluaran`(`ID_PENGELUARAN`,`ID_DETAIL_TRANSAKSI`,`DESKRIPSI`,`NILAI`,`TANGGAL`) values (1,1,'Pengeluaran untuk upah pencuci dari transaksi 1#1',15000,'2018-01-09 10:12:37'),(2,2,'Pengeluaran untuk upah pencuci dari transaksi 1#2',8000,'2018-01-09 10:14:00'),(3,3,'Pengeluaran untuk upah pencuci dari transaksi 2#3',15000,'2018-01-09 10:26:34'),(4,4,'Pengeluaran untuk upah pencuci dari transaksi 3#4',15000,'2018-01-09 10:26:46'),(5,5,'Pengeluaran untuk upah pencuci dari transaksi 4#5',15000,'2018-01-09 10:26:55'),(6,6,'Pengeluaran untuk upah pencuci dari transaksi 5#6',15000,'2018-01-09 10:27:02'),(7,7,'Pengeluaran untuk upah pencuci dari transaksi 6#7',15000,'2018-01-09 10:27:08'),(8,8,'Pengeluaran untuk upah pencuci dari transaksi 7#8',15000,'2018-01-09 10:27:16'),(9,9,'Pengeluaran untuk upah pencuci dari transaksi 8#9',40000,'2018-01-22 12:08:27'),(10,10,'Pengeluaran untuk upah pencuci dari transaksi 9#10',10000,'2018-01-22 12:14:38'),(11,11,'Pengeluaran untuk upah pencuci dari transaksi 10#11',8000,'2018-01-22 12:15:36'),(12,12,'Pengeluaran untuk upah pencuci dari transaksi 11#12',15000,'2018-01-22 22:34:11'),(13,13,'Pengeluaran untuk upah pencuci dari transaksi 12#13',5000,'2018-01-22 22:36:07'),(14,14,'Pengeluaran untuk upah pencuci dari transaksi 12#14',8000,'2018-01-23 01:59:26');

/*Table structure for table `promo` */

CREATE TABLE `promo` (
  `ID_PROMO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_JASA` int(11) DEFAULT NULL,
  `JUMLAH_JASA_DILAKUKAN` int(11) DEFAULT NULL,
  `DESKRIPSI` text,
  `STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PROMO`),
  KEY `FK_RELATIONSHIP_19` (`ID_JASA`),
  CONSTRAINT `FK_RELATIONSHIP_19` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `promo` */

insert  into `promo`(`ID_PROMO`,`ID_JASA`,`JUMLAH_JASA_DILAKUKAN`,`DESKRIPSI`,`STATUS`) values (1,1,5,'Menggunakan Jasa Cuci Motor Besar sebanyak 5x dan dapat Gratis 1x',1),(2,4,6,'Menggunakan Jasa Cuci Mobil Biasa sebanyak 6x dan dapat Gratis 1x',1);

/*Table structure for table `tipekendaraan` */

CREATE TABLE `tipekendaraan` (
  `ID_TIPE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_MEREK` int(11) DEFAULT NULL,
  `ID_JASA` int(11) DEFAULT NULL,
  `NAMA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPE`),
  KEY `FK_BERTIPE` (`ID_MEREK`),
  KEY `FK_CUCIBERTIPEKENDARAAN` (`ID_JASA`),
  CONSTRAINT `FK_BERTIPE` FOREIGN KEY (`ID_MEREK`) REFERENCES `merekkenderaan` (`ID_MEREK`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUCIBERTIPEKENDARAAN` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tipekendaraan` */

insert  into `tipekendaraan`(`ID_TIPE`,`ID_MEREK`,`ID_JASA`,`NAMA`) values (1,1,4,'Avanza'),(2,1,5,'Fortuner'),(3,2,4,'Ayla'),(4,3,3,'GT-R'),(5,4,1,'CBR 250R'),(6,7,2,'Jupiter Z'),(7,2,6,'Xenia'),(8,5,1,'Ninja 250RR');

/*Table structure for table `transaksi` */

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT,
  `ID_KASIR` int(11) DEFAULT NULL,
  `ID_TIPE` int(11) DEFAULT NULL,
  `ID_PELANGGAN` int(11) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL,
  `NO_POLISI` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSAKSI`),
  KEY `FK_MEMILIKITIPE` (`ID_TIPE`),
  KEY `FK_MELAKUKANTRANSAKSI` (`ID_PELANGGAN`),
  KEY `FK_MELAYANI` (`ID_KASIR`),
  CONSTRAINT `FK_MELAKUKANTRANSAKSI` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `pelanggan` (`ID_PELANGGAN`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MELAYANI` FOREIGN KEY (`ID_KASIR`) REFERENCES `kasir` (`ID_KASIR`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MEMILIKITIPE` FOREIGN KEY (`ID_TIPE`) REFERENCES `tipekendaraan` (`ID_TIPE`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`ID_TRANSAKSI`,`ID_KASIR`,`ID_TIPE`,`ID_PELANGGAN`,`TANGGAL`,`NO_POLISI`) values (1,1,1,1,'2018-01-09 00:00:00','B 1242 KLO'),(2,2,1,1,'2018-01-24 00:00:00','B 1242 KLO'),(3,1,1,1,'2018-02-27 00:00:00','B 1242 KLO'),(4,1,1,1,'2018-03-23 00:00:00','B 1242 KLO'),(5,2,1,1,'2018-04-09 00:00:00','B 1242 KLO'),(6,1,1,1,'2018-07-19 00:00:00','B 1242 KLO'),(7,1,1,1,'2018-11-01 00:00:00','B 1242 KLO'),(8,1,2,2,'2018-05-24 00:00:00','B 6151 MLS'),(9,2,8,3,'2018-07-12 00:00:00','B 2563 NNJ'),(10,2,7,4,'2018-01-03 00:00:00','B 1776 ITA'),(11,2,4,3,'2018-10-19 00:00:00','B 670 BTC'),(12,1,6,1,'2018-01-18 00:00:00','B 0089 STR');

/*Table structure for table `transaksijasa` */

CREATE TABLE `transaksijasa` (
  `ID_DETAIL_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT,
  `ID_JASA` int(11) DEFAULT NULL,
  `ID_TRANSAKSI` int(11) DEFAULT NULL,
  `ID_PEMASUKKAN` int(11) DEFAULT NULL,
  `ID_KUPON` int(11) DEFAULT NULL,
  `ID_PENGELUARAN` int(11) DEFAULT NULL,
  `PROMO_CHECK` tinyint(1) DEFAULT '0',
  `HARGA` decimal(15,0) DEFAULT NULL,
  `KEUNTUNGAN` decimal(15,0) DEFAULT NULL,
  `UPAH` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`ID_DETAIL_TRANSAKSI`),
  KEY `FK_DIBAYARDENGAN2` (`ID_KUPON`),
  KEY `FK_MEMILIKIDETAILTRANSAKSI` (`ID_TRANSAKSI`),
  KEY `FK_PENGELUARANSTEAM2` (`ID_PENGELUARAN`),
  KEY `FK_TRANSAKSIMEMILIKIJASA` (`ID_JASA`),
  KEY `FK_PEMASUKKANSTEAM` (`ID_PEMASUKKAN`),
  CONSTRAINT `FK_DIBAYARDENGAN2` FOREIGN KEY (`ID_KUPON`) REFERENCES `kupon` (`ID_KUPON`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MEMILIKIDETAILTRANSAKSI` FOREIGN KEY (`ID_TRANSAKSI`) REFERENCES `transaksi` (`ID_TRANSAKSI`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PENGELUARANSTEAM2` FOREIGN KEY (`ID_PENGELUARAN`) REFERENCES `pengeluaran` (`ID_PENGELUARAN`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRANSAKSIMEMILIKIJASA` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `transaksijasa` */

insert  into `transaksijasa`(`ID_DETAIL_TRANSAKSI`,`ID_JASA`,`ID_TRANSAKSI`,`ID_PEMASUKKAN`,`ID_KUPON`,`ID_PENGELUARAN`,`PROMO_CHECK`,`HARGA`,`KEUNTUNGAN`,`UPAH`) values (1,4,1,1,NULL,1,1,55000,40000,15000),(2,6,1,2,NULL,2,0,15000,7000,8000),(3,4,2,3,NULL,3,1,55000,40000,15000),(4,4,3,4,NULL,4,1,55000,40000,15000),(5,4,4,5,NULL,5,1,55000,40000,15000),(6,4,5,6,NULL,6,1,55000,40000,15000),(7,4,6,7,NULL,7,1,55000,40000,15000),(8,4,7,8,1,8,1,0,0,15000),(9,5,8,9,NULL,9,0,100000,60000,40000),(10,1,9,10,NULL,10,0,30000,20000,10000),(11,6,10,11,NULL,11,0,15000,7000,8000),(12,3,11,12,NULL,12,0,50000,35000,15000),(13,2,12,13,NULL,13,0,20000,15000,5000),(14,6,12,14,NULL,14,0,15000,7000,8000);

/* Trigger structure for table `jasa` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `triggerAutoCalculateUpahOnTableJasa` BEFORE INSERT ON `jasa` FOR EACH ROW BEGIN
	DECLARE UPAH_JASA DECIMAL(20,0);
	SET UPAH_JASA = NEW.HARGA - NEW.KEUNTUNGAN;
	SET NEW.UPAH = UPAH_JASA;
    END */$$


DELIMITER ;

/* Trigger structure for table `menggunakanbarang` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `triggerAutoUpdateStockBarang` AFTER INSERT ON `menggunakanbarang` FOR EACH ROW BEGIN
	DECLARE stok INTEGER;
	DECLARE selisih INTEGER;
	
	SET stok = (SELECT STOCK FROM barang WHERE ID_Barang = NEW.ID_Barang);
		SET selisih = stok - NEW.BANYAK_DIGUNAKAN;
		UPDATE barang SET STOCK = selisih WHERE ID_BARANG = NEW.ID_BARANG;
    END */$$


DELIMITER ;

/* Trigger structure for table `transaksijasa` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `triggerAutoInsertTableMenggunakanBarang` AFTER INSERT ON `transaksijasa` FOR EACH ROW BEGIN
	DECLARE IDBarang INTEGER;
	declare BanyakKebutuhan INTEGER;
	DECLARE done INTEGER DEFAULT FALSE;
	DECLARE Cursor1 CURSOR FOR
		SELECT 
		jb.`ID_BARANG`,
		jb.`BANYAK_KEBUTUHAN`
		FROM transaksijasa tj
		INNER JOIN jasa j
		ON tj.ID_JASA = j.ID_JASA
		INNER JOIN jasabarang jb
		ON j.`ID_JASA` = jb.`ID_JASA`
		INNER JOIN barang b
		ON jb.`ID_BARANG` = b.`ID_BARANG`
		WHERE tj.ID_DETAIL_TRANSAKSI = NEW.ID_DETAIL_TRANSAKSI AND tj.ID_JASA = NEW.ID_JASA;
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
	
	open Cursor1;
	
	readloop: LOOP
		FETCH Cursor1 INTO IDBarang, BanyakKebutuhan;
		
		if done then
			leave readloop;
		end if;
		
		INSERT INTO `menggunakanbarang` values (IDBarang, NEW.ID_DETAIL_TRANSAKSI, BanyakKebutuhan);
		
	END LOOP;	
	CLOSE Cursor1;
    END */$$


DELIMITER ;

/* Function  structure for function  `getIdPromo` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getIdPromo`(JASA_ID INTEGER) RETURNS int(11)
BEGIN
	DECLARE PROMO_ID INTEGER;
	SET PROMO_ID = (SELECT ID_PROMO
	FROM PROMO WHERE STATUS = 1 AND ID_JASA = JASA_ID);
	RETURN PROMO_ID;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKupon` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKupon`(PELANGGAN_ID INTEGER, JASA_ID INTEGER) RETURNS int(11)
BEGIN
	DECLARE KUPON_ID integer;
	set KUPON_ID = (
		SELECT k.ID_KUPON
		FROM kupon k
		JOIN PROMO p
		ON k.ID_PROMO = p.ID_PROMO
		WHERE k.ID_PELANGGAN = PELANGGAN_ID AND p.ID_JASA = JASA_ID AND k.USED = 0 LIMIT 1);
		
	RETURN KUPON_ID;
	
    END */$$
DELIMITER ;

/* Function  structure for function  `getMinimalJasaPromo` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getMinimalJasaPromo`(Jasa_ID INTEGER) RETURNS int(11)
BEGIN
    declare minim INTEGER;
    SET minim = (SELECT JUMLAH_JASA_DILAKUKAN FROM PROMO WHERE Status = 1 and ID_JASA = Jasa_Id);
    return minim;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertTransaksiJasa` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransaksiJasa`(JASA_ID INTEGER, TRANSAKSI_ID INTEGER)
BEGIN
	DECLARE BIAYA DECIMAL(15,0);
	DECLARE UNTUNG DECIMAL(15,0);
	DECLARE GAJI DECIMAL(15,0);
	DECLARE LAST_DETAIL_ID INTEGER;
	DECLARE LAST_PEMASUKKAN_ID INTEGER;
	DECLARE LAST_PENGELUARAN_ID INTEGER;
	DECLARE COUNT_PROMO INTEGER;
	DECLARE MINIMAL_JASA INTEGER;
	DECLARE TANGGAL_TRANSAKSI DATE;
	DECLARE PELANGGAN_ID INTEGER;
	DECLARE KUPON_ID INTEGER;
	SET BIAYA = (SELECT HARGA FROM JASA WHERE ID_JASA = JASA_ID);
	SET UNTUNG = (SELECT KEUNTUNGAN FROM JASA WHERE ID_JASA = JASA_ID);
	SET GAJI = (BIAYA - UNTUNG);
	SET TANGGAL_TRANSAKSI = (SELECT TANGGAL FROM transaksi where ID_TRANSAKSI = TRANSAKSI_ID);
	SET PELANGGAN_ID = (SELECT ID_PELANGGAN FROM transaksi where ID_TRANSAKSI = TRANSAKSI_ID);
	
	if(`getKupon`(PELANGGAN_ID, JASA_ID) IS NOT null) THEN
		
		SET KUPON_ID = (SELECT getKupon(PELANGGAN_ID, JASA_ID));
		set BIAYA = 0;
		INSERT INTO transaksijasa(ID_JASA, ID_TRANSAKSI, ID_KUPON, `PROMO_CHECK`, HARGA, KEUNTUNGAN, UPAH) VALUES(JASA_ID, TRANSAKSI_ID, KUPON_ID, 1, 0, 0, GAJI);
		SET LAST_DETAIL_ID = LAST_INSERT_ID();
		UPDATE kupon SET ID_DETAIL_TRANSAKSI = LAST_DETAIL_ID, USED = 1 WHERE ID_KUPON = KUPON_ID;
	ELSE
		inSERT INTO transaksijasa(ID_JASA, ID_TRANSAKSI, HARGA, KEUNTUNGAN, UPAH) VALUES(JASA_ID, TRANSAKSI_ID, BIAYA, UNTUNG, GAJI);
		SET LAST_DETAIL_ID = LAST_INSERT_ID();
	
	END IF;
	
	INSERT INTO `pemasukkan`(ID_DETAIL_TRANSAKSI, DESKRIPSI, NILAI) 
		VALUES(LAST_DETAIL_ID, CONCAT("Pemasukkan dari transaksi ", TRANSAKSI_ID, "#", LAST_DETAIL_ID), BIAYA);
	SET LAST_PEMASUKKAN_ID = LAST_INSERT_ID();
	
	INSERT INTO pengeluaran(ID_DETAIL_TRANSAKSI, DESKRIPSI, NILAI)
		VALUES(LAST_DETAIL_ID, CONCAT("Pengeluaran untuk upah pencuci dari transaksi ", TRANSAKSI_ID, "#", LAST_DETAIL_ID), GAJI);
	SET LAST_PENGELUARAN_ID = LAST_INSERT_ID();
	
	UPDATE transaksijasa SET ID_PEMASUKKAN = LAST_PEMASUKKAN_ID, `ID_PENGELUARAN` = LAST_PENGELUARAN_ID WHERE ID_DETAIL_TRANSAKSI = LAST_DETAIL_ID;
	
	SET COUNT_PROMO = (SELECT COUNT(*) AS 'count'
			FROM transaksijasa tj
			JOIN transaksi t
			ON tj.`ID_TRANSAKSI` = t.`ID_TRANSAKSI`
			JOIN pelanggan p
			ON t.`ID_PELANGGAN` = p.`ID_PELANGGAN`
			WHERE tj.ID_JASA = JASA_ID AND p.`ID_PELANGGAN` = PELANGGAN_ID AND tj.PROMO_CHECK = 0);
			
	IF(COUNT_PROMO >= `getMinimalJasaPromo`(JASA_ID)) THEN 
		INSERT INTO kupon(ID_PROMO, `ID_PELANGGAN`, `GET_DATE`, `USED`)
			VALUES(`getIdPromo`(JASA_ID), PELANGGAN_ID, TANGGAL_TRANSAKSI, 0);
		
		UPDATE viewpromocheck SET PROMO_CHECK = 1 WHERE ID_JASA = JASA_ID AND ID_PELANGGAN = PELANGGAN_ID;
	END IF;
    END */$$
DELIMITER ;

/*Table structure for table `viewpromocheck` */

DROP TABLE IF EXISTS `viewpromocheck`;

/*!50001 CREATE TABLE  `viewpromocheck`(
 `ID_TRANSAKSI` int(11) ,
 `ID_JASA` int(11) ,
 `ID_PELANGGAN` int(11) ,
 `PROMO_CHECK` tinyint(1) 
)*/;

/*Table structure for table `viewreportlaporandetail` */

DROP TABLE IF EXISTS `viewreportlaporandetail`;

/*!50001 CREATE TABLE  `viewreportlaporandetail`(
 `ID_TRANSAKSI` int(11) ,
 `ID_KASIR` int(11) ,
 `NAMA_KASIR` varchar(255) ,
 `ID_PELANGGAN` int(11) ,
 `NAMA_PELANGGAN` varchar(255) ,
 `ID_TIPE` int(11) ,
 `TIPE KENDARAAN` varchar(255) ,
 `NO_POLISI` varchar(12) ,
 `TANGGAL` datetime ,
 `ID_JASA` int(11) ,
 `NAMA_JASA` varchar(255) ,
 `ID_KUPON` int(11) ,
 `HARGA` decimal(15,0) ,
 `KEUNTUNGAN` decimal(15,0) ,
 `UPAH` decimal(15,0) 
)*/;

/*Table structure for table `viewreportpemasukkan` */

DROP TABLE IF EXISTS `viewreportpemasukkan`;

/*!50001 CREATE TABLE  `viewreportpemasukkan`(
 `JUMLAH_TRANSAKSI` bigint(21) ,
 `JUMLAH_JASA_PER_TRANSAKSI` bigint(21) ,
 `HARGA` decimal(37,0) ,
 `KEUNTUNGAN` decimal(37,0) ,
 `UPAH` decimal(37,0) ,
 `TANGGAL` varchar(69) 
)*/;

/*View structure for view viewpromocheck */

/*!50001 DROP TABLE IF EXISTS `viewpromocheck` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewpromocheck` AS (select `t`.`ID_TRANSAKSI` AS `ID_TRANSAKSI`,`tj`.`ID_JASA` AS `ID_JASA`,`t`.`ID_PELANGGAN` AS `ID_PELANGGAN`,`tj`.`PROMO_CHECK` AS `PROMO_CHECK` from ((`transaksijasa` `tj` join `transaksi` `t` on((`tj`.`ID_TRANSAKSI` = `t`.`ID_TRANSAKSI`))) join `pelanggan` `p` on((`t`.`ID_PELANGGAN` = `p`.`ID_PELANGGAN`))) where (`tj`.`PROMO_CHECK` = 0)) */;

/*View structure for view viewreportlaporandetail */

/*!50001 DROP TABLE IF EXISTS `viewreportlaporandetail` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewreportlaporandetail` AS (select `t`.`ID_TRANSAKSI` AS `ID_TRANSAKSI`,`t`.`ID_KASIR` AS `ID_KASIR`,`k`.`NAMA` AS `NAMA_KASIR`,`t`.`ID_PELANGGAN` AS `ID_PELANGGAN`,`p`.`NAMA` AS `NAMA_PELANGGAN`,`t`.`ID_TIPE` AS `ID_TIPE`,`tp`.`NAMA` AS `TIPE KENDARAAN`,`t`.`NO_POLISI` AS `NO_POLISI`,`t`.`TANGGAL` AS `TANGGAL`,`tj`.`ID_JASA` AS `ID_JASA`,`j`.`NAMA` AS `NAMA_JASA`,`tj`.`ID_KUPON` AS `ID_KUPON`,`tj`.`HARGA` AS `HARGA`,`tj`.`KEUNTUNGAN` AS `KEUNTUNGAN`,`tj`.`UPAH` AS `UPAH` from ((((((`transaksi` `t` join `transaksijasa` `tj` on((`t`.`ID_TRANSAKSI` = `tj`.`ID_TRANSAKSI`))) join `pelanggan` `p` on((`t`.`ID_PELANGGAN` = `p`.`ID_PELANGGAN`))) join `tipekendaraan` `tp` on((`t`.`ID_TIPE` = `tp`.`ID_TIPE`))) join `kasir` `k` on((`t`.`ID_KASIR` = `k`.`ID_KASIR`))) join `jasa` `j` on((`tj`.`ID_JASA` = `j`.`ID_JASA`))) left join `kupon` `kp` on((`tj`.`ID_KUPON` = `kp`.`ID_KUPON`)))) */;

/*View structure for view viewreportpemasukkan */

/*!50001 DROP TABLE IF EXISTS `viewreportpemasukkan` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewreportpemasukkan` AS (select count(distinct `t`.`ID_TRANSAKSI`) AS `JUMLAH_TRANSAKSI`,count(`tj`.`ID_DETAIL_TRANSAKSI`) AS `JUMLAH_JASA_PER_TRANSAKSI`,sum(`tj`.`HARGA`) AS `HARGA`,sum(`tj`.`KEUNTUNGAN`) AS `KEUNTUNGAN`,sum(`tj`.`UPAH`) AS `UPAH`,date_format(`t`.`TANGGAL`,'%Y-%M') AS `TANGGAL` from (`transaksijasa` `tj` join `transaksi` `t` on((`t`.`ID_TRANSAKSI` = `tj`.`ID_TRANSAKSI`))) group by year(`t`.`TANGGAL`),month(`t`.`TANGGAL`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
