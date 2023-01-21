-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 19, 2023 at 04:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `mobile` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `mobile`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin@1234', 1148458757);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(250) NOT NULL,
  `No_Of_Books` int(11) NOT NULL,
  `Origin` varchar(30) NOT NULL,
  `Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`, `No_Of_Books`, `Origin`, `Gender`) VALUES
(101, ' jaishankar', 5, 'INDIA', 'M'),
(102, 'M D Guptaa', 3, 'INDIA', 'M'),
(103, 'Chetan Bhagat', 4, 'INDIA', 'M'),
(104, 'Munshi Prem Chand', 10, 'INDIA', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(250) NOT NULL,
  `author_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `book_no` int(11) NOT NULL,
  `book_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `author_id`, `cat_id`, `book_no`, `book_price`) VALUES
(1, 'Software engineering', 102, 1, 4518, 270),
(2, 'Data structure', 102, 2, 6541, 300),
(9, 'The Indian Way', 101, 1, 8, 700),
(10, 'Lectures from Colombo to Almora', 0, 0, 1100, 101);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `Count_Books` int(11) NOT NULL,
  `Issued_Books_Category` int(11) NOT NULL,
  `Available_Books` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `Count_Books`, `Issued_Books_Category`, `Available_Books`) VALUES
(1, 'Computer Science Engineering ', 0, 0, 0),
(2, 'Novel', 0, 0, 0),
(4, 'Motivational', 0, 0, 0),
(5, 'Story', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `delay`
--

CREATE TABLE `delay` (
  `issue_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `total_days` int(11) NOT NULL,
  `total_fine` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delay`
--

INSERT INTO `delay` (`issue_id`, `name`, `total_days`, `total_fine`, `book_id`) VALUES
(2, '', 15, 150, 2);

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `s_no` int(11) NOT NULL,
  `book_no` int(11) NOT NULL,
  `book_name` varchar(200) NOT NULL,
  `book_author` varchar(200) NOT NULL,
  `student_id` int(11) NOT NULL,
  `stat` int(11) NOT NULL,
  `issue_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`s_no`, `book_no`, `book_name`, `book_author`, `student_id`, `stat`, `issue_date`) VALUES
(1, 6541, 'Data structure', 'D S Gupta', 1, 1, '0000-00-00'),
(18, 7845, 'half Girlfriend', 'Chetan Bhagat', 2, 1, '2020-04-22'),
(19, 465, 'The Indian Way', 'jaishankar', 11, 1, '2323-01-13'),
(28, 500, 'The Indian Way', 'jaishankar', 8, 1, '2023-01-14'),
(29, 5005, 'half girlfriend', 'Chetan Bhagat', 11, 1, '2023-01-13'),
(110, 22, 'Data Structures', 'M D Guptaa', 12, 1, '2023-01-18');

--
-- Triggers `issued_books`
--
DELIMITER $$
CREATE TRIGGER `checkvalid` BEFORE INSERT ON `issued_books` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM user WHERE user.student_id = NEW.student_id) > 0 THEN
        INSERT INTO issued_books(s_no,book_no,book_name,book_author,student_id,stat,issue_date) VALUES (null,NEW.book_no,NEW.book_name,NEW.book_author,NEW.student_id,1,NEW.issue_date);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` int(10) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `address`) VALUES
(1, 'user', 'user@gmail.com', 'user@1234', 2147483644, ' Jaipur'),
(2, 'hemant', 'hemant@gmail.com', 'hemant@123', 2147483644, 'Hubli'),
(8, 'shubhankar', 'shubhankarsharma22@gmail.com', '123', 2147483647, 'Bilekahalli'),
(11, 'shravanthmr9602@gmail.com', 'shravanthmr9602@gmail.com', '123', 544652351, 'Bengaluru'),
(12, 'Sanskriti Singh', 'sanskriti123@gmail.com', '123', 1112223334, 'Bengaluru');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `delay`
--
ALTER TABLE `delay`
  ADD KEY `user_id` (`issue_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Unk` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delay`
--
ALTER TABLE `delay`
  ADD CONSTRAINT `delay_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delay_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
