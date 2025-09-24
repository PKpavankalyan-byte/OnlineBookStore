CREATE DATABASE  IF NOT EXISTS `register` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `register`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: register
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Java Basics','John Doe',299.00,'Technology',10,NULL,NULL,'2025-09-24 06:15:34'),(2,'History of India','Amit Sharma',199.00,'History',5,NULL,NULL,'2025-09-24 06:15:34'),(3,'Science Today','Rita Kumar',249.00,'Science',8,NULL,NULL,'2025-09-24 06:15:34'),(4,'Fictional Tales','Anil Verma',149.00,'Fiction',12,NULL,NULL,'2025-09-24 06:15:34'),(5,'Java','kameshsir',220.00,'technology',50,'Core java and Advance java made easy','https://www.oracle.com/img/tech/cb88-java-logo-001.jpg','2025-09-24 06:48:40'),(6,'The Alchemist','Paulo Coelho',299.00,'Fiction',50,'A journey of self-discovery.','https://example.com/alchemist.jpg','2025-09-24 07:01:14'),(7,'Atomic Habits','James Clear',399.00,'Self-Help',40,'Guide to building good habits.','https://example.com/atomichabits.jpg','2025-09-24 07:01:14'),(8,'Rich Dad Poor Dad','Robert Kiyosaki',349.00,'Finance',30,'Financial education book.','https://example.com/richdad.jpg','2025-09-24 07:01:14'),(9,'Harry Potter and the Sorcerer\'s Stone','J.K. Rowling',499.00,'Fantasy',60,'The first book of Harry Potter series.','https://example.com/harrypotter1.jpg','2025-09-24 07:01:14'),(10,'The Power of Habit','Charles Duhigg',399.00,'Self-Help',35,'How habits shape our life.','https://example.com/powerofhabit.jpg','2025-09-24 07:01:14'),(11,'To Kill a Mockingbird','Harper Lee',299.00,'Fiction',45,'Classic novel on justice and race.','https://example.com/mockingbird.jpg','2025-09-24 07:01:14'),(12,'The Lean Startup','Eric Ries',449.00,'Business',25,'Guide to startup success.','https://example.com/leanstartup.jpg','2025-09-24 07:01:14'),(13,'1984','George Orwell',299.00,'Dystopian',40,'Classic dystopian novel.','https://example.com/1984.jpg','2025-09-24 07:01:14'),(14,'Sapiens','Yuval Noah Harari',499.00,'History',20,'A brief history of humankind.','https://example.com/sapiens.jpg','2025-09-24 07:01:14'),(15,'The Subtle Art of Not Giving a F*ck','Mark Manson',399.00,'Self-Help',30,'A counterintuitive approach to living a good life.','https://example.com/subtleart.jpg','2025-09-24 07:01:14'),(16,'Thinking, Fast and Slow','Daniel Kahneman',449.00,'Psychology',30,'Understanding human thinking.','https://example.com/thinkingfastslow.jpg','2025-09-24 07:01:14'),(17,'The Great Gatsby','F. Scott Fitzgerald',299.00,'Fiction',40,'Classic American novel.','https://example.com/gatsby.jpg','2025-09-24 07:01:14'),(18,'The Intelligent Investor','Benjamin Graham',499.00,'Finance',20,'Guide to investing wisely.','https://example.com/intelligentinvestor.jpg','2025-09-24 07:01:14'),(19,'Pride and Prejudice','Jane Austen',299.00,'Fiction',35,'Classic romance novel.','https://example.com/prideprejudice.jpg','2025-09-24 07:01:14'),(20,'The 7 Habits of Highly Effective People','Stephen R. Covey',399.00,'Self-Help',40,'Proven habits for success.','https://example.com/7habits.jpg','2025-09-24 07:01:14'),(21,'Clean Code','Robert C. Martin',499.00,'Programming',25,'Best practices for writing clean code.','https://example.com/cleancode.jpg','2025-09-24 07:01:14'),(22,'The Hobbit','J.R.R. Tolkien',399.00,'Fantasy',50,'A prelude to Lord of the Rings.','https://example.com/hobbit.jpg','2025-09-24 07:01:14'),(23,'Meditations','Marcus Aurelius',299.00,'Philosophy',30,'Stoic philosophy wisdom.','https://example.com/meditations.jpg','2025-09-24 07:01:14'),(24,'Deep Work','Cal Newport',399.00,'Self-Help',40,'Focus in a distracted world.','https://example.com/deepwork.jpg','2025-09-24 07:01:14'),(25,'The Catcher in the Rye','J.D. Salinger',299.00,'Fiction',45,'Classic coming-of-age novel.','https://example.com/catcher.jpg','2025-09-24 07:01:14'),(26,'Thinking in Java','Bruce Eckel',499.00,'Programming',20,'Comprehensive Java guide.','https://example.com/thinkinginjava.jpg','2025-09-24 07:01:14'),(27,'The Art of War','Sun Tzu',299.00,'Strategy',40,'Classic military strategy book.','https://example.com/artofwar.jpg','2025-09-24 07:01:14'),(28,'The Da Vinci Code','Dan Brown',399.00,'Thriller',50,'Mystery thriller novel.','https://example.com/davinci.jpg','2025-09-24 07:01:14'),(29,'Zero to One','Peter Thiel',449.00,'Business',25,'Notes on startups and innovation.','https://example.com/zerotoone.jpg','2025-09-24 07:01:14'),(30,'Man\'s Search for Meaning','Viktor E. Frankl',299.00,'Psychology',35,'Finding purpose in life.','https://example.com/manssearch.jpg','2025-09-24 07:01:14'),(31,'Cracking the Coding Interview','Gayle Laakmann McDowell',499.00,'Programming',30,'Prepare for coding interviews.','https://example.com/ctci.jpg','2025-09-24 07:01:14'),(32,'The Road','Cormac McCarthy',349.00,'Dystopian',25,'Post-apocalyptic novel.','https://example.com/theroad.jpg','2025-09-24 07:01:14'),(33,'Algorithms','Robert Sedgewick',499.00,'Programming',20,'Comprehensive algorithms book.','https://example.com/algorithms.jpg','2025-09-24 07:01:14'),(34,'The Lean Product Playbook','Dan Olsen',449.00,'Business',30,'Step-by-step guide to product-market fit.','https://example.com/leanproduct.jpg','2025-09-24 07:01:14'),(35,'The Four Agreements','Don Miguel Ruiz',299.00,'Self-Help',40,'Practical guide to personal freedom.','https://example.com/fouragreements.jpg','2025-09-24 07:01:14'),(36,'Guns, Germs, and Steel','Jared Diamond',499.00,'History',20,'Origins of societies and civilizations.','https://example.com/gunsgermssteel.jpg','2025-09-24 07:01:14'),(37,'The Intelligent Asset Allocator','William Bernstein',399.00,'Finance',25,'Guide to building wealth.','https://example.com/assetallocator.jpg','2025-09-24 07:01:14'),(38,'Brave New World','Aldous Huxley',299.00,'Dystopian',40,'Classic dystopian novel.','https://example.com/bravenewworld.jpg','2025-09-24 07:01:14'),(39,'Freakonomics','Steven D. Levitt',399.00,'Economics',35,'Hidden side of everyday life.','https://example.com/freakonomics.jpg','2025-09-24 07:01:14'),(40,'The 48 Laws of Power','Robert Greene',449.00,'Self-Help',30,'Guide to gaining power.','https://example.com/48laws.jpg','2025-09-24 07:01:14'),(41,'The Book Thief','Markus Zusak',399.00,'Fiction',40,'Novel set in WWII Germany.','https://example.com/bookthief.jpg','2025-09-24 07:01:14'),(42,'Steve Jobs','Walter Isaacson',499.00,'Biography',25,'Biography of Steve Jobs.','https://example.com/stevejobs.jpg','2025-09-24 07:01:14'),(43,'Elon Musk','Ashlee Vance',499.00,'Biography',20,'Biography of Elon Musk.','https://example.com/elonmusk.jpg','2025-09-24 07:01:14'),(44,'The Lean Mindset','J. Brantner',399.00,'Business',30,'Adopting lean thinking.','https://example.com/leanmindset.jpg','2025-09-24 07:01:14'),(45,'The Psychology of Money','Morgan Housel',399.00,'Finance',35,'Behavioral finance book.','https://example.com/psychmoney.jpg','2025-09-24 07:01:14'),(46,'Norwegian Wood','Haruki Murakami',299.00,'Fiction',25,'Novel about love and loss.','https://example.com/norwegianwood.jpg','2025-09-24 07:01:14'),(47,'Kafka on the Shore','Haruki Murakami',349.00,'Fiction',30,'Surreal Japanese novel.','https://example.com/kafka.jpg','2025-09-24 07:01:14'),(48,'Thinking in Systems','Donella Meadows',399.00,'Science',20,'Introduction to systems thinking.','https://example.com/systems.jpg','2025-09-24 07:01:14'),(49,'The Innovators','Walter Isaacson',449.00,'Biography',25,'Story of great tech innovators.','https://example.com/innovators.jpg','2025-09-24 07:01:14'),(50,'Start with Why','Simon Sinek',399.00,'Business',40,'Motivational business book.','https://example.com/startwithwhy.jpg','2025-09-24 07:01:14'),(51,'Dune','Frank Herbert',499.00,'Sci-Fi',50,'Epic science fiction novel.','https://example.com/dune.jpg','2025-09-24 07:01:14'),(52,'Ender\'s Game','Orson Scott Card',399.00,'Sci-Fi',35,'Classic sci-fi novel.','https://example.com/ender.jpg','2025-09-24 07:01:14'),(53,'Foundation','Isaac Asimov',449.00,'Sci-Fi',30,'Classic sci-fi series.','https://example.com/foundation.jpg','2025-09-24 07:01:14'),(54,'Thinking Like a Lawyer','Frederick Schauer',399.00,'Law',20,'Introduction to legal thinking.','https://example.com/lawyer.jpg','2025-09-24 07:01:14'),(55,'Richest Man in Babylon','George S. Clason',299.00,'Finance',40,'Financial wisdom in parables.','https://example.com/babylon.jpg','2025-09-24 07:01:14'),(56,'The Intelligent Entrepreneur','Bill Murphy Jr.',449.00,'Business',25,'Guide for modern entrepreneurs.','https://example.com/intelligententrepreneur.jpg','2025-09-24 07:01:14'),(57,'Mindset','Carol S. Dweck',399.00,'Self-Help',35,'Growth vs fixed mindset.','https://example.com/mindset.jpg','2025-09-24 07:01:14'),(58,'The War of Art','Steven Pressfield',399.00,'Self-Help',20,'Break through creative blocks.','https://example.com/warofart.jpg','2025-09-24 07:01:14'),(59,'How to Win Friends & Influence People','Dale Carnegie',299.00,'Self-Help',40,'Classic self-help book.','https://example.com/friends.jpg','2025-09-24 07:01:14'),(60,'Grit','Angela Duckworth',399.00,'Self-Help',25,'Power of perseverance.','https://example.com/grit.jpg','2025-09-24 07:01:14'),(61,'Thinking in Bets','Annie Duke',399.00,'Self-Help',30,'Decision-making under uncertainty.','https://example.com/bets.jpg','2025-09-24 07:01:14'),(62,'Principles','Ray Dalio',499.00,'Finance',20,'Life and work principles.','https://example.com/principles.jpg','2025-09-24 07:01:14'),(63,'Measure What Matters','John Doerr',449.00,'Business',25,'Objectives & Key Results (OKRs).','https://example.com/measure.jpg','2025-09-24 07:01:14'),(64,'The Magic of Thinking Big','David J. Schwartz',399.00,'Self-Help',30,'Think bigger and achieve more.','https://example.com/magicthinking.jpg','2025-09-24 07:01:14'),(65,'Drive','Daniel H. Pink',399.00,'Self-Help',35,'Motivation in work and life.','https://example.com/drive.jpg','2025-09-24 07:01:14');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(100) NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_email` (`customer_email`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `register1` (`email`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(100) NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_email` (`customer_email`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `register1` (`email`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'mpavankalyan55@gmail.com',1,1,299,'2025-09-24 06:27:52'),(2,'mpavankalyan55@gmail.com',1,1,299,'2025-09-24 06:29:05'),(3,'mpavankalyan55@gmail.com',1,1,299,'2025-09-24 06:56:01'),(4,'pavann@gmail.com',57,1,399,'2025-09-24 07:10:47');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register1`
--

DROP TABLE IF EXISTS `register1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register1` (
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'customer',
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register1`
--

LOCK TABLES `register1` WRITE;
/*!40000 ALTER TABLE `register1` DISABLE KEYS */;
INSERT INTO `register1` VALUES ('M PAVAN KALYAN','mpavankalyan55@gmail.com','pavan','Male','Hyderabad','customer'),('priya','priya@gmai1.com','priya','Female','Banglore','customer'),('mukesh','mukesh@gmail.com','mukesh','Male','Banglore','customer'),(NULL,NULL,NULL,NULL,NULL,'customer'),(NULL,NULL,NULL,NULL,NULL,'customer'),('naravi','naravi@gmail.com','naravi','Female','Mumbai','customer'),('sai priya','priya@gmail.com','priya','Female','Pune','customer'),('Admin User','admin@gmail.com','admin123','Male','Hyderabad','admin'),('priyanka','priyanka@gmail.com','priyanka','Male','Select City','customer'),('pavan','pavann@gmail.com','pavan','Male','Hyderabad','customer');
/*!40000 ALTER TABLE `register1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 14:43:59
