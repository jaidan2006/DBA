-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2026 at 07:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coaching_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'admin', 'Admin@123', 'admin@coachingfinder.com', '2026-02-02 06:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `duration_hours` int(11) DEFAULT 1,
  `mode` enum('online','offline') NOT NULL,
  `status` enum('pending','confirmed','completed','cancelled') DEFAULT 'pending',
  `payment_details` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `student_id`, `tutor_id`, `center_id`, `subject_id`, `booking_date`, `booking_time`, `duration_hours`, `mode`, `status`, `payment_details`, `message`, `created_at`) VALUES
(1, 1, 1, NULL, 1, '2024-02-15', '10:00:00', 2, 'online', 'confirmed', NULL, NULL, '2026-02-02 06:47:05'),
(2, 2, 2, NULL, 3, '2024-02-16', '14:00:00', 1, 'offline', 'pending', NULL, NULL, '2026-02-02 06:47:05'),
(3, 3, 3, NULL, 7, '2024-02-17', '16:00:00', 2, 'online', 'confirmed', NULL, NULL, '2026-02-02 06:47:05'),
(4, 4, NULL, 6, 5, '2026-02-06', '00:00:08', 3, 'online', 'confirmed', NULL, 'hi', '2026-02-03 07:21:00'),
(5, 4, NULL, 6, 2, '2026-02-06', '00:00:09', 2, 'online', 'confirmed', NULL, 'hi', '2026-02-03 09:00:58'),
(6, 4, NULL, 6, 1, '2026-02-04', '00:00:10', 1, 'online', 'confirmed', '4000', 'dd', '2026-02-03 09:12:56'),
(7, 4, NULL, 5, 5, '2026-02-20', '00:00:10', 1, 'online', 'confirmed', '100 ruppee per hour', 'Hi This is Jaidan . i want to join in your center.Kindly send the fee details.', '2026-02-03 19:20:17'),
(8, 4, 7, NULL, 3, '2026-02-05', '00:00:11', 3, 'online', 'pending', NULL, 'hi', '2026-02-03 19:25:14'),
(9, 4, NULL, 5, 5, '2026-02-05', '00:00:12', 3, 'online', 'confirmed', '400 per hour', 'hi', '2026-02-04 08:15:52'),
(10, 4, 7, NULL, 1, '2026-03-07', '00:00:12', 2, 'online', 'pending', NULL, 'hl', '2026-03-06 05:47:00'),
(11, 4, NULL, 6, 5, '2026-03-08', '00:00:01', 4, 'online', 'confirmed', '2000', 'thanjs', '2026-03-06 05:52:27'),
(12, 4, NULL, 6, 2, '2026-03-07', '00:00:12', 3, 'online', 'pending', NULL, 'hi', '2026-03-06 06:01:12'),
(13, 4, NULL, 6, 5, '2026-03-23', '00:00:20', 5, 'online', 'confirmed', '$5000 per month', 'Thanks for your booking !!!!!!', '2026-03-06 06:07:11'),
(14, 4, 8, NULL, 13, '2026-03-10', '00:00:05', 1, 'online', 'confirmed', '20000000000000', 'Hari oru potta', '2026-03-06 06:15:43'),
(15, 6, 8, NULL, 13, '2026-03-10', '00:00:05', 2, 'online', 'confirmed', '200 per hour', 'poda hari noob', '2026-03-06 06:24:16'),
(16, 6, NULL, 6, 14, '2026-06-12', '00:00:22', 1, 'online', 'pending', NULL, 'hi', '2026-03-06 06:42:39'),
(17, 4, 8, NULL, 13, '2026-03-10', '00:00:20', 3, 'online', 'confirmed', '550 per hour', 'thank you for enrollment', '2026-03-09 09:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `coaching_centers`
--

CREATE TABLE `coaching_centers` (
  `center_id` int(11) NOT NULL,
  `center_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `courses_offered` text DEFAULT NULL,
  `teaching_mode` enum('online','offline','both') DEFAULT 'both',
  `description` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `availability_status` enum('available','unavailable') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coaching_centers`
--

INSERT INTO `coaching_centers` (`center_id`, `center_name`, `email`, `phone`, `password`, `address`, `location`, `courses_offered`, `teaching_mode`, `description`, `website`, `logo`, `availability_status`, `created_at`, `approved`) VALUES
(1, 'Excel Learning Center', 'info@excellearning.com', '9876543216', 'center123', '123 Main Street, Delhi', 'Delhi', 'Mathematics, Science, English', 'both', 'Premier coaching center for competitive exams.', NULL, NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(2, 'Bright Future Academy', 'contact@brightfuture.com', '9876543217', 'center123', '456 Park Road, Mumbai', 'Mumbai', 'All Subjects', 'offline', 'Complete education solution from KG to PG.', NULL, NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(3, 'Tech Institute', 'info@techinstitute.com', '9876543218', 'center123', '789 Tech Park, Bangalore', 'Bangalore', 'Computer Science, IT', 'online', 'Specialized in technology and programming courses.', NULL, NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(5, 'Sakthi Coaching Center', 'jaidanray@gmail.com', '8893333367', '$2y$10$wJFLXUpV78HK4tbPhysQ2.BHT/YLadLoRnJYHGIBC5Z9uX94TOjYO', 'Door no:10,Chruch Street,Nungambakkam,Chennai-621722.', 'Chennai', 'English,C,C++', 'online', '44', '', NULL, 'available', '2026-02-02 16:08:41', 'approved'),
(6, 'Joshua Coaching Center', 'joshua@gmail.com', '7845469817', '$2y$10$rGkiIYpRZ0BfBp0JvP.DUeXum7EIxbOs7ShGvJrcYJPr0Ykm3SU3q', '234-2, Ramakrishna nagar , Chennai -623984', 'Chennai', 'English,C,C++', 'online', 'kk', '', NULL, 'available', '2026-02-03 06:43:16', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('new','read','replied') DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_submissions`
--

INSERT INTO `contact_submissions` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `status`) VALUES
(1, 'joshwa K', 'jaidanray@gmail.com', 'Msg', 'Thanks for your support', '2026-03-08 18:26:53', 'new'),
(2, 'Caroles C', 'caro@gmail.com', 'About your Functionality', 'I want to you to add tutor image in their profile so it will make us to know who it is before i enroll my course or subject.Hope your team add this feature..', '2026-03-08 18:30:20', 'new'),
(3, 'joshwa', 'jso@gmail.com', 'hi', 'Testing Msg', '2026-03-08 18:32:01', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `login_credentials`
--

CREATE TABLE `login_credentials` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('student','tutor','center','admin') NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`id`, `user_id`, `user_type`, `login_time`, `logout_time`, `session_id`, `ip_address`) VALUES
(1, 4, 'student', '2026-02-02 08:23:29', '2026-02-02 08:35:59', NULL, '::1'),
(2, 4, 'student', '2026-02-02 08:33:40', '2026-02-02 08:35:59', NULL, '::1'),
(3, 4, 'student', '2026-02-02 08:36:20', '2026-02-02 08:38:27', NULL, '::1'),
(4, 4, 'student', '2026-02-02 08:36:47', '2026-02-02 08:38:27', NULL, '::1'),
(5, 1, 'admin', '2026-02-02 08:42:57', '2026-02-02 08:43:06', NULL, '::1'),
(6, 1, 'admin', '2026-02-02 08:43:21', '2026-02-02 08:48:01', NULL, '::1'),
(7, 4, 'student', '2026-02-02 08:44:32', '2026-02-02 08:44:45', NULL, '::1'),
(8, 1, 'admin', '2026-02-02 08:45:22', '2026-02-02 08:48:01', NULL, '::1'),
(9, 1, 'admin', '2026-02-02 08:47:43', '2026-02-02 08:48:01', NULL, '::1'),
(10, 1, 'admin', '2026-02-02 08:48:13', '2026-02-02 08:48:41', NULL, '::1'),
(11, 1, 'admin', '2026-02-02 11:44:27', '2026-02-02 11:44:45', NULL, '::1'),
(12, 4, 'tutor', '2026-02-02 11:45:20', '2026-02-02 11:47:24', NULL, '::1'),
(13, 1, 'admin', '2026-02-02 11:50:18', '2026-02-02 11:50:37', NULL, '::1'),
(14, 4, 'center', '2026-02-02 11:51:14', '2026-02-02 12:01:49', NULL, '::1'),
(15, 1, 'admin', '2026-02-02 11:55:05', '2026-02-02 11:55:11', NULL, '::1'),
(16, 5, 'tutor', '2026-02-02 11:55:34', '2026-02-02 11:56:05', NULL, '::1'),
(17, 4, 'center', '2026-02-02 11:56:36', '2026-02-02 12:01:49', NULL, '::1'),
(18, 5, 'student', '2026-02-02 15:59:52', '2026-02-02 16:00:40', NULL, '::1'),
(19, 5, 'tutor', '2026-02-02 16:01:17', '2026-02-02 16:24:54', NULL, '::1'),
(20, 5, 'tutor', '2026-02-02 16:02:25', '2026-02-02 16:24:54', NULL, '::1'),
(21, 1, 'admin', '2026-02-02 16:03:03', '2026-02-02 16:03:41', NULL, '::1'),
(22, 1, 'admin', '2026-02-02 16:09:09', '2026-02-02 16:09:38', NULL, '::1'),
(23, 5, 'center', '2026-02-02 16:09:53', '2026-02-02 16:10:40', NULL, '::1'),
(24, 5, 'student', '2026-02-02 16:20:53', '2026-02-02 16:21:23', NULL, '::1'),
(25, 5, 'tutor', '2026-02-02 16:24:45', '2026-02-02 16:24:54', NULL, '::1'),
(26, 5, 'student', '2026-02-02 16:26:31', '2026-02-02 16:26:42', NULL, '::1'),
(27, 1, 'admin', '2026-02-02 17:10:54', '2026-02-02 17:26:56', NULL, '::1'),
(28, 4, 'student', '2026-02-03 05:18:29', '2026-02-03 05:18:34', NULL, '::1'),
(29, 1, 'admin', '2026-02-03 05:20:32', '2026-02-03 05:20:38', NULL, '::1'),
(30, 1, 'admin', '2026-02-03 05:20:48', '2026-02-03 06:43:57', NULL, '::1'),
(31, 4, 'student', '2026-02-03 05:21:11', '2026-02-03 05:36:07', NULL, '::1'),
(32, 1, 'admin', '2026-02-03 06:43:44', '2026-02-03 06:43:57', NULL, '::1'),
(33, 4, 'student', '2026-02-03 07:16:56', '2026-02-03 07:21:08', NULL, '::1'),
(34, 6, 'center', '2026-02-03 07:21:24', '2026-02-03 07:32:34', NULL, '::1'),
(35, 1, 'admin', '2026-02-03 07:32:47', '2026-02-03 07:33:07', NULL, '::1'),
(36, 6, 'center', '2026-02-03 08:25:59', '2026-02-03 08:48:26', NULL, '::1'),
(37, 6, 'center', '2026-02-03 08:48:59', '2026-02-03 08:53:51', NULL, '::1'),
(38, 4, 'student', '2026-02-03 08:54:00', '2026-02-03 08:59:22', NULL, '::1'),
(39, 4, 'student', '2026-02-03 08:59:38', '2026-02-03 09:01:05', NULL, '::1'),
(40, 6, 'center', '2026-02-03 09:01:19', '2026-02-03 09:09:35', NULL, '::1'),
(41, 4, 'student', '2026-02-03 09:09:44', '2026-02-03 09:13:01', NULL, '::1'),
(42, 4, 'student', '2026-02-03 09:11:53', '2026-02-03 09:13:01', NULL, '::1'),
(43, 6, 'center', '2026-02-03 09:13:15', '2026-02-03 09:13:32', NULL, '::1'),
(44, 4, 'student', '2026-02-03 09:13:41', '2026-02-03 09:39:52', NULL, '::1'),
(45, 4, 'student', '2026-02-03 09:40:23', '2026-02-03 19:20:20', NULL, '::1'),
(46, 4, 'student', '2026-02-03 19:17:21', '2026-02-03 19:20:20', NULL, '::1'),
(47, 5, 'center', '2026-02-03 19:20:44', '2026-02-03 19:21:43', NULL, '::1'),
(48, 4, 'student', '2026-02-03 19:21:51', '2026-02-03 19:22:38', NULL, '::1'),
(49, 4, 'student', '2026-02-03 19:23:53', '2026-02-03 19:25:19', NULL, '::1'),
(50, 7, 'tutor', '2026-02-03 19:25:44', '2026-02-03 19:32:50', NULL, '::1'),
(51, 7, 'tutor', '2026-02-03 19:27:10', '2026-02-03 19:32:50', NULL, '::1'),
(52, 1, 'admin', '2026-02-03 19:33:13', '2026-02-03 19:34:15', NULL, '::1'),
(53, 7, 'tutor', '2026-02-03 19:38:05', '2026-02-03 19:38:31', NULL, '::1'),
(54, 5, 'center', '2026-02-03 19:39:02', '2026-02-03 19:39:50', NULL, '::1'),
(55, 6, 'center', '2026-02-03 19:42:07', '2026-02-03 19:50:05', NULL, '::1'),
(56, 1, 'admin', '2026-02-03 19:50:17', '2026-02-03 19:50:30', NULL, '::1'),
(57, 1, 'admin', '2026-02-03 19:50:41', '2026-02-03 19:52:39', NULL, '::1'),
(58, 6, 'center', '2026-02-03 19:52:57', '2026-02-03 19:53:50', NULL, '::1'),
(59, 6, 'center', '2026-02-03 19:53:28', '2026-02-03 19:53:50', NULL, '::1'),
(60, 6, 'center', '2026-02-03 19:54:12', '2026-02-03 19:57:30', NULL, '::1'),
(61, 4, 'student', '2026-02-04 08:11:50', '2026-02-04 08:16:01', NULL, '::1'),
(62, 5, 'center', '2026-02-04 08:16:15', '2026-02-04 08:17:10', NULL, '::1'),
(63, 4, 'student', '2026-02-04 08:17:24', '2026-03-06 05:47:04', NULL, '::1'),
(64, 4, 'student', '2026-02-04 08:37:38', '2026-03-06 05:47:04', NULL, '::1'),
(65, 4, 'student', '2026-03-06 05:45:02', '2026-03-06 05:47:04', NULL, '::1'),
(66, 7, 'tutor', '2026-03-06 05:49:31', '2026-03-06 05:49:53', NULL, '::1'),
(67, 4, 'student', '2026-03-06 05:50:12', '2026-03-06 05:50:20', NULL, '::1'),
(68, 6, 'center', '2026-03-06 05:50:34', '2026-03-06 05:50:55', NULL, '::1'),
(69, 4, 'student', '2026-03-06 05:51:21', '2026-03-06 05:52:32', NULL, '::1'),
(70, 6, 'center', '2026-03-06 05:52:46', '2026-03-06 05:53:12', NULL, '::1'),
(71, 4, 'student', '2026-03-06 05:53:58', '2026-03-06 05:56:52', NULL, '::1'),
(72, 4, 'student', '2026-03-06 05:57:17', '2026-03-06 06:01:15', NULL, '::1'),
(73, 6, 'center', '2026-03-06 06:01:36', '2026-03-06 06:08:09', NULL, '::1'),
(74, 4, 'student', '2026-03-06 06:03:47', '2026-03-06 06:07:17', NULL, '::1'),
(75, 6, 'center', '2026-03-06 06:07:32', '2026-03-06 06:08:09', NULL, '::1'),
(76, 4, 'student', '2026-03-06 06:08:29', '2026-03-06 06:08:58', NULL, '::1'),
(77, 1, 'admin', '2026-03-06 06:13:57', '2026-03-06 06:14:01', NULL, '::1'),
(78, 8, 'tutor', '2026-03-06 06:14:16', '2026-03-06 06:14:24', NULL, '::1'),
(79, 4, 'student', '2026-03-06 06:14:33', '2026-03-06 06:15:46', NULL, '::1'),
(80, 8, 'tutor', '2026-03-06 06:15:57', '2026-03-06 06:19:59', NULL, '::1'),
(81, 4, 'student', '2026-03-06 06:20:07', '2026-03-06 06:20:19', NULL, '::1'),
(82, 8, 'tutor', '2026-03-06 06:20:39', '2026-03-06 06:20:58', NULL, '::1'),
(83, 1, 'admin', '2026-03-06 06:23:00', '2026-03-06 06:23:09', NULL, '::1'),
(84, 6, 'student', '2026-03-06 06:23:19', '2026-03-06 06:24:21', NULL, '::1'),
(85, 8, 'tutor', '2026-03-06 06:24:41', '2026-03-06 06:39:04', NULL, '::1'),
(86, 6, 'student', '2026-03-06 06:39:14', '2026-03-06 06:39:51', NULL, '::1'),
(87, 6, 'student', '2026-03-06 06:40:13', '2026-03-06 06:42:45', NULL, '::1'),
(88, 6, 'center', '2026-03-06 06:43:06', '2026-03-08 18:15:32', NULL, '::1'),
(89, 8, 'tutor', '2026-03-06 06:43:43', '2026-03-08 17:32:05', NULL, '::1'),
(90, 4, 'student', '2026-03-06 06:44:54', '2026-03-06 06:46:27', NULL, '::1'),
(91, 6, 'student', '2026-03-06 07:12:08', '2026-03-06 07:12:28', NULL, '::1'),
(92, 6, 'student', '2026-03-06 07:12:41', '2026-03-06 07:18:16', NULL, '::1'),
(93, 4, 'student', '2026-03-06 07:13:43', '2026-03-06 07:15:48', NULL, '::1'),
(94, 4, 'student', '2026-03-06 07:13:57', '2026-03-06 07:15:48', NULL, '::1'),
(95, 6, 'student', '2026-03-06 07:16:55', '2026-03-06 07:18:16', NULL, '::1'),
(96, 4, 'student', '2026-03-06 07:20:04', '2026-03-06 07:23:28', NULL, '::1'),
(97, 6, 'student', '2026-03-08 17:20:24', '2026-03-08 17:55:32', NULL, '::1'),
(98, 6, 'student', '2026-03-08 17:29:29', '2026-03-08 17:55:32', NULL, '::1'),
(99, 6, 'student', '2026-03-08 17:30:11', '2026-03-08 17:55:32', NULL, '::1'),
(100, 8, 'tutor', '2026-03-08 17:31:25', '2026-03-08 17:32:05', NULL, '::1'),
(101, 7, 'tutor', '2026-03-08 17:32:41', '2026-03-08 17:33:19', NULL, '::1'),
(102, 6, 'center', '2026-03-08 17:33:42', '2026-03-08 18:15:32', NULL, '::1'),
(103, 6, 'student', '2026-03-08 17:36:57', '2026-03-08 17:55:32', NULL, '::1'),
(104, 6, 'center', '2026-03-08 17:40:01', '2026-03-08 18:15:32', NULL, '::1'),
(105, 6, 'student', '2026-03-08 17:54:04', '2026-03-08 17:55:32', NULL, '::1'),
(106, 8, 'tutor', '2026-03-08 17:56:02', '2026-03-08 18:19:58', NULL, '::1'),
(107, 8, 'tutor', '2026-03-08 18:04:29', '2026-03-08 18:19:58', NULL, '::1'),
(108, 6, 'center', '2026-03-08 18:07:06', '2026-03-08 18:15:32', NULL, '::1'),
(109, 8, 'tutor', '2026-03-08 18:15:49', '2026-03-08 18:19:58', NULL, '::1'),
(110, 8, 'tutor', '2026-03-08 18:36:09', '2026-03-08 19:19:25', NULL, '::1'),
(111, 6, 'center', '2026-03-08 18:43:13', '2026-03-08 18:43:53', NULL, '::1'),
(112, 1, 'admin', '2026-03-08 18:44:38', '2026-03-08 18:45:24', NULL, '::1'),
(113, 5, 'center', '2026-03-08 18:54:38', '2026-03-08 18:56:17', NULL, '::1'),
(114, 5, 'center', '2026-03-08 18:57:25', '2026-03-08 19:13:43', NULL, '::1'),
(115, 5, 'center', '2026-03-08 19:04:24', '2026-03-08 19:13:43', NULL, '::1'),
(116, 8, 'tutor', '2026-03-08 19:14:02', '2026-03-08 19:19:25', NULL, '::1'),
(117, 8, 'tutor', '2026-03-08 19:14:48', '2026-03-08 19:19:25', NULL, '::1'),
(118, 6, 'center', '2026-03-08 19:19:44', '2026-03-08 19:27:02', NULL, '::1'),
(119, 6, 'student', '2026-03-08 19:30:44', '2026-03-08 19:33:28', NULL, '::1'),
(120, 4, 'student', '2026-03-08 19:35:08', '2026-03-08 19:36:08', NULL, '::1'),
(121, 8, 'tutor', '2026-03-09 09:13:12', '2026-03-09 09:22:20', NULL, '::1'),
(122, 6, 'center', '2026-03-09 09:13:50', NULL, NULL, '::1'),
(123, 8, 'tutor', '2026-03-09 09:16:25', '2026-03-09 09:22:20', NULL, '::1'),
(124, 8, 'tutor', '2026-03-09 09:17:15', '2026-03-09 09:22:20', NULL, '::1'),
(125, 6, 'center', '2026-03-09 09:23:09', NULL, NULL, '::1'),
(126, 8, 'tutor', '2026-03-09 09:23:40', '2026-03-09 09:25:01', NULL, '::1'),
(127, 8, 'tutor', '2026-03-09 09:24:20', '2026-03-09 09:25:01', NULL, '::1'),
(128, 4, 'student', '2026-03-09 09:25:19', '2026-03-09 10:28:26', NULL, '::1'),
(129, 8, 'tutor', '2026-03-09 09:26:33', '2026-03-09 10:27:51', NULL, '::1'),
(130, 4, 'student', '2026-03-09 09:54:42', '2026-03-09 10:28:26', NULL, '::1'),
(131, 5, 'student', '2026-03-09 09:58:29', '2026-03-09 10:01:33', NULL, '::1'),
(132, 5, 'student', '2026-03-09 10:02:23', '2026-03-09 10:03:23', NULL, '::1'),
(133, 5, 'student', '2026-03-09 10:04:53', '2026-03-09 10:09:47', NULL, '::1'),
(134, 5, 'student', '2026-03-09 10:11:54', '2026-03-09 10:13:36', NULL, '::1'),
(135, 5, 'student', '2026-03-09 10:12:53', '2026-03-09 10:13:36', NULL, '::1'),
(136, 4, 'student', '2026-03-09 10:22:06', '2026-03-09 10:28:26', NULL, '::1'),
(137, 7, 'tutor', '2026-03-09 10:22:38', '2026-03-09 10:23:01', NULL, '::1'),
(138, 8, 'tutor', '2026-03-09 10:27:27', '2026-03-09 10:27:51', NULL, '::1'),
(139, 4, 'student', '2026-03-09 10:28:19', '2026-03-09 10:28:26', NULL, '::1'),
(140, 1, 'admin', '2026-03-09 10:31:16', '2026-03-09 10:31:21', NULL, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `student_id`, `tutor_id`, `center_id`, `booking_id`, `rating`, `review_text`, `created_at`) VALUES
(1, 1, 1, NULL, 1, 5, 'Excellent teaching method! Very clear explanations.', '2026-02-02 06:47:05'),
(2, 2, 2, NULL, 2, 4, 'Good tutor, explains concepts well.', '2026-02-02 06:47:05'),
(3, 3, 3, NULL, 3, 5, 'Best programming tutor I have ever had!', '2026-02-02 06:47:05'),
(4, 4, 8, NULL, NULL, 3, 'i asked about him to hari , he is g', '2026-03-06 07:15:35'),
(5, 6, NULL, 6, NULL, 5, 'Good coaching center . i really loved my learning there...', '2026-03-06 07:17:47'),
(6, 4, 7, NULL, NULL, 4, 'Hi Sir , I like your patience in teaching and explaining things in easier way and i make sure to refer it to my more friends', '2026-03-06 07:23:15'),
(7, 6, 8, NULL, NULL, 5, 'Good Staff,I trained by him under the subject named Social.His teaching is like very understandable by everyone and i always grateful for it..', '2026-03-08 17:23:08'),
(8, 5, NULL, 6, NULL, 5, 'Thanks for your coaching !!', '2026-03-09 10:03:17'),
(9, 5, 8, NULL, NULL, 5, 'I always like your way of teaching Sir !! and you are my inspiration !!', '2026-03-09 10:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `address`, `created_at`, `status`) VALUES
(1, 'Rahul', 'Kumar', 'rahul@email.com', '9876543210', 'student123', 'Delhi, India', '2026-02-02 06:47:05', 'active'),
(2, 'Priya', 'Sharma', 'priya@email.com', '9876543211', 'student123', 'Mumbai, India', '2026-02-02 06:47:05', 'active'),
(3, 'Amit', 'Patel', 'amit@email.com', '9876543212', 'student123', 'Bangalore, India', '2026-02-02 06:47:05', 'active'),
(4, 'Jaidan', 'A', 'jaidanray@gmail.com', '7845469817', '$2y$10$7gxTV35iHQst8dALLfLHNuAgR3IdXTCjsqCBDf96jcm680hjpwlou', '', '2026-02-02 08:21:59', 'active'),
(5, 'Jaidan', 'Ray A', 'jaidan@gmail.com', '7845469817', '$2y$10$BYCfc0Kk0pTJhfg03k49mOqlNwpQ62xtpuZkUUGlUwNfajXLrCPw.', '2/5-2 Main Street,Thiruvallur.', '2026-02-02 15:59:14', 'active'),
(6, 'Hariharan', 'A M', 'hari@gmail.com', '8987676567', '$2y$10$J6gyo81P8go4NOzYXCpgXuWiH/wyPVZ3rqaFNxc4n0vZrHrZ.lT3W', '23/402 , main,good.', '2026-03-06 06:22:37', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `category`) VALUES
(1, 'Mathematics', 'Science'),
(2, 'Physics', 'Science'),
(3, 'Chemistry', 'Science'),
(4, 'Biology', 'Science'),
(5, 'English', 'Language'),
(6, 'Hindi', 'Language'),
(7, 'Computer Science', 'Technology'),
(8, 'History', 'Social Studies'),
(9, 'Geography', 'Social Studies'),
(10, 'Economics', 'Commerce'),
(11, 'Accountancy', 'Commerce'),
(12, 'Business Studies', 'Commerce'),
(13, 'Social', NULL),
(14, 'C', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `subjects_taught` text DEFAULT NULL,
  `teaching_mode` enum('online','offline','both') DEFAULT 'both',
  `location` varchar(100) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `availability_status` enum('available','unavailable') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`tutor_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `qualification`, `experience_years`, `subjects_taught`, `teaching_mode`, `location`, `hourly_rate`, `description`, `profile_image`, `availability_status`, `created_at`, `approved`) VALUES
(1, 'Dr. Rajesh', 'Singh', 'rajesh@email.com', '9876543213', 'tutor123', 'PhD in Mathematics', 10, 'Mathematics, Physics', 'both', 'Delhi', 500.00, 'Expert in Mathematics and Physics with 10 years of teaching experience.', NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(2, 'Sunita', 'Reddy', 'sunita@email.com', '9876543214', 'tutor123', 'M.Sc Chemistry', 8, 'Chemistry, Biology', 'online', 'Mumbai', 400.00, 'Specialized in Chemistry and Biology for competitive exams.', NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(3, 'Vikram', 'Mehta', 'vikram@email.com', '9876543215', 'tutor123', 'M.Tech Computer Science', 5, 'Computer Science, Mathematics', 'offline', 'Bangalore', 600.00, 'Software engineer with passion for teaching programming.', NULL, 'available', '2026-02-02 06:47:05', 'approved'),
(5, 'Hari', 'Haran A M', 'hari@gmail.com', '7788887373', '$2y$10$9.WiG.7nmfXVsRjdtylnpOeK4TfM/ee71/RFxXPghLUhRMN65y6ra', 'phd physics', 5, 'chemistry,Maths', 'offline', 'Delhi', 100.00, '', NULL, 'available', '2026-02-02 11:54:19', 'approved'),
(6, 'Ramesh', 'Ram A', 'ramesh@gmail.com', '8898383837', '$2y$10$hD7m1A8nGAIPnsdapDKwg.F15WDG3y77cGYY2ly/2Qt49rfu2OEmy', 'phd physics', 2, 'chemistry', 'online', 'Chennai', 20.00, 'hi', NULL, 'available', '2026-02-02 17:08:52', 'rejected'),
(7, 'Joy', 'Joshua J', 'joshua@gmail.com', '9983838388', '$2y$10$IWkBveWVGe5Ur9zxpQl8nOBgQDuNuz0FrrTCtCAmZtzbrowIXzCRa', 'phd physics', 2, 'Chemistry', 'online', 'Chennai', 200.00, 'hello', NULL, 'available', '2026-02-03 06:40:10', 'approved'),
(8, 'Jacob', 'Joshua J', 'jacob@gmail.com', '9987676567', '$2y$10$GYjbMeGmeEg/n9byC5WnAOla3zsakNpW.h9QO0WHRHZi3koxtnAYS', 'phd physics', 5, 'Social', 'online', 'Chennai', 400.00, 'good bro', NULL, 'available', '2026-03-06 06:13:07', 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `tutor_id` (`tutor_id`),
  ADD KEY `center_id` (`center_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `coaching_centers`
--
ALTER TABLE `coaching_centers`
  ADD PRIMARY KEY (`center_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `tutor_id` (`tutor_id`),
  ADD KEY `center_id` (`center_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_name` (`subject_name`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `coaching_centers`
--
ALTER TABLE `coaching_centers`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_credentials`
--
ALTER TABLE `login_credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tutors`
--
ALTER TABLE `tutors`
  MODIFY `tutor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`tutor_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`center_id`) REFERENCES `coaching_centers` (`center_id`),
  ADD CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`tutor_id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`center_id`) REFERENCES `coaching_centers` (`center_id`),
  ADD CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
