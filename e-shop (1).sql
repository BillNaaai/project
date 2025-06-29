-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 09:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password_hash`, `created_at`) VALUES
(6, 'admin@admin.com', '$2y$10$hLh/5Ybd2iMmvAbepw2uDuRBpwzBm0LREbENPj44YBq1MOZcdmx2y', '2025-06-11 19:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `user_id`, `title`, `description`, `price`, `category`, `image_url`, `created_at`) VALUES
(12, 25, 'Gaming Laptop', 'High-performance laptop for gaming and work.', 1799.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(13, 26, 'Bluetooth Headphones', 'Wireless over-ear headphones with noise cancellation.', 199.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(14, 27, 'Smartwatch Pro', 'Fitness and health tracker with GPS.', 249.99, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(15, 28, 'USB-C Hub', '7-in-1 adapter for laptops and tablets.', 49.95, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(16, 29, '4K Monitor', 'Ultra HD monitor with HDR support.', 399.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(18, 25, 'Mechanical Keyboard', 'RGB backlit keyboard for typing and gaming.', 89.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(19, 26, 'Portable SSD 1TB', 'Fast external drive for backups and media.', 1111.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(20, 27, 'Action Camera', 'Waterproof camera for adventure filming.', 299.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(21, 28, 'Men\'s Casual Shirt', 'Cotton slim fit shirt for daily wear.', 29.99, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(22, 29, 'Women\'s Denim Jacket', 'Stylish and durable denim outerwear.', 49.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(24, 25, 'Running Shoes', 'Breathable lightweight shoes for jogging.', 65.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(25, 26, 'Winter Coat', 'Insulated waterproof coat for cold weather.', 120.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(26, 27, 'Summer Dress', 'Floral print dress for warm days.', 39.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(27, 28, 'Formal Trousers', 'Classic tailored pants for office wear.', 55.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(30, 25, 'Wool Scarf', 'Soft warm scarf for winter.', 18.50, 'Clothing', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(31, 26, 'LED Lamp', 'Adjustable LED desk lamp with dimmer.', 22.99, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(32, 27, 'Coffee Table', 'Modern wooden table for living rooms.', 129.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(33, 28, 'Wall Art Set', 'Abstract paintings for interior decoration.', 69.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(34, 29, 'Kitchen Knife Set', 'Stainless steel knives with block.', 59.95, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(36, 25, 'Floor Rug', 'Large woven rug for living space.', 89.99, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(37, 26, 'Planter Stand', 'Multi-tier indoor plant stand.', 45.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(38, 27, 'Storage Organizer', 'Foldable fabric bins for shelves.', 25.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(39, 28, 'Scented Candles', 'Relaxing candles in glass jars.', 20.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(40, 29, 'Blanket Throw', 'Warm fleece blanket for couches.', 30.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(42, 25, 'Yoga Mat', 'Non-slip mat for yoga and workouts.', 22.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(43, 26, 'Dumbbell Set', 'Adjustable dumbbells for home workouts.', 75.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(44, 27, 'Running Shorts', 'Breathable athletic shorts.', 18.99, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(45, 28, 'Tennis Racket', 'Lightweight racket for beginners.', 49.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(46, 29, 'Cycling Helmet', 'Protective gear with air vents.', 40.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(48, 25, 'Resistance Bands', 'Full set of color-coded bands.', 28.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(49, 26, 'Golf Gloves', 'Premium grip gloves for golfers.', 20.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(50, 27, 'Swim Goggles', 'Anti-fog UV protection goggles.', 14.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(51, 28, 'The Great Novel', 'A captivating story of adventure.', 12.99, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(52, 29, 'Math Workbook', 'Comprehensive exercises for learners.', 18.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(54, 25, 'Fantasy Epic', 'An epic journey in a magical realm.', 16.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(55, 26, 'History of Art', 'Illustrated guide to famous artworks.', 35.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(56, 27, 'Daily Journal', 'Hardcover notebook for personal writing.', 10.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(57, 28, 'Recipe Book', '100 easy recipes for beginners.', 22.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(58, 29, 'Poetry Collection', 'Modern poems of life and love.', 15.00, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(60, 25, 'Business Strategy', 'Case studies from real companies.', 27.50, 'Books', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(61, 26, 'Face Moisturizer', 'Hydrating cream for daily use.', 14.99, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(62, 27, 'Hair Serum', 'Strengthens and protects hair.', 18.50, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(63, 28, 'Lip Balm', 'Soothing balm with SPF.', 4.50, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(64, 29, 'Makeup Palette', 'Full-face makeup kit.', 35.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(66, 25, 'Perfume Spray', 'Floral fragrance for women.', 45.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(67, 26, 'Beard Oil', 'Nourishes and softens beard hair.', 12.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(68, 27, 'Nail Kit', 'Complete manicure and pedicure set.', 20.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(69, 28, 'Sunscreen SPF50', 'Non-greasy formula for UV protection.', 24.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(70, 29, 'Eye Cream', 'Reduces puffiness and dark circles.', 17.99, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 03:33:25'),
(72, 25, 'VR Gaming Headset', 'Immersive virtual reality headset with 4K resolution.', 4799.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(73, 26, 'Smart Home Hub', 'Central controller for home automation devices.', 1999.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(74, 27, 'AI Security Camera', 'Real-time AI facial recognition with 360° rotation.', 2199.99, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(75, 28, 'Foldable Smartphone', 'Futuristic foldable device with dual-screen display.', 7999.95, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(76, 29, 'Drone Pro Max', 'Professional drone with 8K camera and long flight time.', 6499.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(78, 25, 'E-Ink Tablet', 'Paper-like digital notepad with stylus support.', 2499.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(79, 26, 'Smart LED TV 65\"', 'Ultra HD smart television with voice control.', 7099.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(80, 27, 'Gaming Console Z', 'Next-gen console with 1TB storage and 8K support.', 6599.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(81, 28, 'Tailored Wool Coat', 'Premium handmade wool coat for winter elegance.', 1499.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(82, 29, 'Luxury Silk Dress', 'Evening gown made from pure silk.', 2399.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(84, 25, 'Designer Sneakers', 'Limited-edition designer shoes with bold design.', 3499.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(85, 26, 'Cashmere Sweater', 'Soft breathable sweater made from pure cashmere.', 1899.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(86, 27, 'Linen Summer Set', 'Lightweight linen shirt and pants combo.', 899.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(87, 28, 'Formal Blazer', 'Slim fit professional blazer for business wear.', 1099.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(88, 29, 'Techwear Trousers', 'Water-resistant pants with hidden zippers.', 1199.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(90, 25, 'Parka Arctic Pro', 'Windproof parka for sub-zero adventures.', 1999.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(91, 26, 'Marble Coffee Table', 'Luxury centerpiece made from Italian marble.', 5899.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(92, 27, 'Smart Thermostat', 'Energy-saving thermostat with mobile control.', 1399.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(93, 28, 'Leather Recliner Chair', 'Adjustable recliner with heated seating.', 6799.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(94, 29, 'Automatic Espresso Machine', 'Barista-grade coffee with touchscreen presets.', 4499.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(96, 25, 'Crystal Chandelier', 'Elegant lighting fixture with gold detailing.', 9999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(97, 26, 'Smart Mirror', 'Interactive mirror with weather, calendar, and lighting.', 2699.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(98, 27, 'Robotic Vacuum Cleaner', 'Self-cleaning vacuum with mapping AI.', 2999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(99, 28, 'Luxury Bedding Set', '1000-thread count Egyptian cotton sheet set.', 1999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(100, 29, 'Modular Sofa', 'Reconfigurable sectional sofa with washable covers.', 8999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(102, 25, 'Smart Treadmill', 'Foldable treadmill with touchscreen workouts.', 6799.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(103, 26, 'Adjustable Kettlebell', 'All-in-one dumbbell with variable weight.', 1199.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(104, 27, 'Boxing Kit Elite', 'Full boxing set with gloves, bag, and wraps.', 1399.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(105, 28, 'Rowing Machine', 'Hydraulic resistance indoor rower.', 2999.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(106, 29, 'Carbon Tennis Racket', 'Lightweight racket with pro grip.', 1599.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(108, 25, 'Climbing Gear Kit', 'Full harness and rope kit for climbing.', 2299.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(110, 27, 'Professional Skateboard', 'Durable deck and high-speed bearings.', 1199.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(111, 28, 'Mastering AI', 'Comprehensive guide to artificial intelligence.', 499.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(112, 29, 'Entrepreneur Handbook', 'Start and grow your dream business.', 799.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(114, 25, 'Historical Atlas', 'World history maps and timelines.', 1299.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(115, 26, 'Medical Encyclopedia', 'Trusted health guide for the family.', 1599.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(116, 27, 'Photography Masterclass', 'Advanced photography with lighting tips.', 899.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(117, 28, 'Financial Freedom Plan', 'Steps to invest and retire early.', 699.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(118, 29, 'Advanced Coding in Python', 'Real-world projects and AI integration.', 1199.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(120, 25, 'Global Politics Explained', 'Modern geopolitics and diplomacy.', 1099.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(121, 26, 'Luxury Skincare Set', 'Anti-aging complete treatment kit.', 2499.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(122, 27, 'Hair Straightening Brush', 'One-pass ionic straightening brush.', 1299.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(123, 28, 'Anti-Wrinkle Serum', 'Dermatologist-recommended peptide serum.', 899.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(126, 25, 'Salon Hair Dryer', 'Ionic dryer with heat control and diffuser.', 1799.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(127, 26, 'LED Makeup Mirror', '10X magnification with touch dimmer.', 699.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(128, 27, 'Nail Art Station', 'Professional electric manicure tool kit.', 1599.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(130, 29, 'Spa Facial Steamer', 'Nano-ionic face steamer for home spa.', 1299.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:11:35'),
(132, 25, 'GlidePad Pro Tablet', 'Lightweight productivity tablet with stylus support.', 3899.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(133, 26, 'CyberBeam Router', 'Tri-band gigabit router with Wi-Fi 6.', 1099.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(134, 27, 'HoloView Projector', '4K ultra short throw projector with 3D capability.', 9799.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(135, 28, 'PowerDock Station', '15-port USB-C docking station with fast charging.', 899.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(136, 29, 'X-Ray Drone', 'Aerial drone with real-time thermal imaging.', 7499.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(138, 25, 'EchoShield Smartwatch', 'AI health tracking with emergency response.', 1599.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(139, 26, 'VoltMax Inverter', 'Home backup inverter system with mobile alerts.', 4399.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(140, 27, 'GlideVR Glasses', 'Immersive lightweight VR glasses with spatial sound.', 4699.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(141, 28, 'Urban Trail Boots', 'Water-resistant hiking boots with ankle support.', 1299.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(142, 29, 'Eclipse Winter Jacket', 'Thermal-insulated coat with inner fleece.', 2799.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(144, 25, 'Skyline Joggers', 'Slim-fit athletic joggers with zip pockets.', 899.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(145, 26, 'FeatherFit Tracksuit', 'Stretchy tracksuit with anti-sweat fabric.', 1399.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(146, 27, 'Savanna Maxi Dress', 'Colorful long dress made from breathable fabric.', 1099.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(147, 28, 'IronGrip Denim Jeans', 'Heavy-duty dark wash jeans with reinforced seams.', 799.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(148, 29, 'CloudStep Sneakers', 'Foam-based running shoes with heel support.', 1499.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(150, 25, 'Fusion Tech Jacket', 'Windproof active jacket with USB heating.', 2299.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(151, 26, 'Granite Cookware Set', 'Non-stick cookware with granite coating.', 1899.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(152, 27, 'Cedarwood Bookshelf', '5-tier rustic shelf made from real cedar.', 2999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(153, 28, 'Zen Fountain', 'Indoor water fountain with LED lighting.', 1399.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(154, 29, 'ThermaHeater Pro', 'Smart heater with app-controlled scheduling.', 1699.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(156, 25, 'Bliss Hammock Set', 'Freestanding hammock with stand and pillow.', 2199.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(157, 26, 'Modern LED Chandelier', 'Geometric lighting fixture with dimmable glow.', 4999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(158, 27, 'IronForge Firepit', 'Outdoor steel firepit with spark guard.', 3599.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(159, 28, 'Bamboo Room Divider', '4-panel folding divider with eco finish.', 1299.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(160, 29, 'Luxury Mattress Topper', 'Memory foam topper with cooling gel.', 2799.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(162, 25, 'AquaSprint Swim Fins', 'Ergonomic short-blade fins for training.', 1299.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(163, 26, 'StrikeZone Punch Bag', 'Suspended punch bag with shock absorption.', 2599.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(164, 27, 'Altitude Trainer Mask', 'Breathing mask for endurance workouts.', 1399.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(165, 28, 'ProFlex Gym Bench', 'Multi-angle bench for dumbbell training.', 3499.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(166, 29, 'Titan Kettlebell Set', 'Color-coded steel kettlebells (8–32kg).', 4299.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(168, 25, 'Battle Rope Kit', 'Heavy rope with anchor and gloves.', 1099.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(169, 26, 'Power Grip Pull Bar', 'Door-mounted bar with foam grips.', 1299.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(170, 27, 'IronClad Dumbbells', 'Rubber hex dumbbell pair with steel core.', 1799.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(171, 28, 'Artificial Futures', 'Exploring the moral dilemmas of AI.', 899.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(172, 29, 'Design Patterns Illustrated', 'Modern guide to software architecture.', 1199.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(174, 25, 'Creative Writing Lab', 'Unlock the secrets of compelling storytelling.', 699.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(175, 26, 'The Investment Compass', 'Smart strategies for long-term wealth.', 1799.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(176, 27, 'World War Chronicles', 'Historical records with rare photographs.', 999.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(177, 28, 'The Joy of Cooking Again', 'Redefined recipes for healthy living.', 1099.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(178, 29, 'Astrophysics for Seekers', 'Understanding the cosmos in plain language.', 899.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(180, 25, 'Mindful Living', 'Daily rituals to reclaim peace and clarity.', 1199.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(181, 26, 'Radiance Facial Kit', 'Complete 4-step glow restoration set.', 1799.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(182, 27, 'Dermacare Hair Regrowth', 'Peptide scalp serum for volume boost.', 1499.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(183, 28, 'GlowLite Vanity Mirror', 'Touch-activated tri-fold mirror with LED.', 999.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(184, 29, 'SilkWave Hair Curler', 'Automatic rotating ceramic curling wand.', 1999.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(186, 25, 'AquaMist Face Steamer', 'Deep pore cleansing steam treatment.', 899.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(187, 26, 'Lash Luxe Kit', 'Magnetic eyelash extension kit.', 1199.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(188, 27, 'Essence Perfume Set', 'Elegant fragrances for every occasion.', 1899.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(189, 28, 'HydraShield SPF Cream', 'Day cream with UVA/UVB protection.', 1099.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(190, 29, 'VelvetTouch Shaver', 'Rechargeable facial and body hair remover.', 1399.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:14:26'),
(193, 26, 'HoloLens Display', 'Wearable AR display with immersive visuals.', 9400.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(194, 27, 'ZenPad X1', 'Ultra-thin tablet with edge-to-edge screen.', 4999.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(195, 28, 'Nova Drone', '4K aerial drone with auto-stabilization.', 7999.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(196, 29, 'VoltCharge Station', 'Portable power station for emergencies.', 1200.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(198, 25, 'CrystalMonitor 27\"', 'Frameless 27-inch QHD monitor.', 3699.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(199, 26, 'PulseBuds Max', 'Wireless earbuds with ANC and touch controls.', 1599.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(200, 27, 'MagNet Charger', 'Magnetic charger for multiple devices.', 499.00, 'Electronics', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(201, 28, 'TrailRunner Shoes', 'All-terrain sneakers with shock absorbent sole.', 1699.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(202, 29, 'Glacier Parka', 'Heavy-duty parka for extreme weather.', 2999.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(204, 25, 'AeroFlex Gym Wear', 'Breathable gym outfit with stretch fabric.', 899.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(205, 26, 'Chic Evening Gown', 'Elegant gown for formal occasions.', 6499.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(206, 27, 'Stonewashed Jeans', 'Relaxed fit jeans with vintage look.', 799.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(207, 28, 'BreezeFit Shorts', 'Moisture-wicking shorts for active days.', 459.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(208, 29, 'Metro Leather Jacket', 'Urban-style jacket made from real leather.', 4699.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(210, 25, 'Classic Fedora Hat', 'Stylish fedora with satin band.', 699.00, 'Clothing', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(211, 26, 'Aurora Ceiling Light', 'Smart LED light with color presets.', 1399.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(212, 27, 'Maple Dining Set', '6-piece modern dining set with chairs.', 8499.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(213, 28, 'EcoClean Vacuum', 'Cordless vacuum with self-emptying dock.', 4799.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(214, 29, 'Riverstone Basin', 'Stone-crafted bathroom sink.', 2399.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(216, 25, 'Sunset Lounger', 'Outdoor chair with reclining function.', 1899.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(217, 26, 'Arctic Air Conditioner', 'Portable AC unit with app controls.', 5999.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(218, 27, 'StoneCraft Coffee Table', 'Natural stone table with glass top.', 3799.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(219, 28, 'Flora Vase Set', 'Decorative vase collection for centerpieces.', 899.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(220, 29, 'Bamboo Bath Mat', 'Water-resistant bamboo mat with grip.', 399.00, 'Home & Garden', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(222, 25, 'ClimbMax Grip Trainer', 'Adjustable grip strengthener.', 599.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(223, 26, 'FlexBox Gym Kit', 'Full body workout kit in a compact box.', 1799.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(224, 27, 'Precision Golf Putter', 'Balanced putter with alignment lines.', 1699.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(225, 28, 'Enduro Treadmill', 'Smart treadmill with incline and music sync.', 9999.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(226, 29, 'BoxMaster Punch Gloves', 'Shock-absorbing boxing gloves.', 799.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(228, 25, 'Altitude Tent', 'Simulates high altitude for endurance.', 6999.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(229, 26, 'StormBall 500', 'Weighted medicine ball for core training.', 599.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(230, 27, 'AquaFit Swim Kit', 'Includes fins, snorkel, and training board.', 1199.00, 'Sports', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(231, 28, 'Neuromind Revolution', 'Exploring the future of neurotech.', 499.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(232, 29, 'Ocean Explorers', 'Illustrated guide to deep sea discoveries.', 899.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(234, 25, 'Modern Economics Unlocked', 'How markets evolve in the digital age.', 799.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(235, 26, 'Titan Empire Trilogy', 'Sci-fi saga set in the Titan system.', 999.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(236, 27, 'The Renaissance Eye', 'Art and vision in 15th century Italy.', 699.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(238, 29, 'Startup Myths Busted', 'Entrepreneurial truths backed by data.', 599.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(240, 25, 'Adventure Atlas', 'Rare locations and tales from global expeditions.', 999.00, 'Books', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(241, 26, 'GlowUp Facial Brush', 'Rotating brush for daily cleansing.', 1299.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(243, 28, 'SculptPro Roller', 'Face sculpting tool with cooling tip.', 499.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(246, 25, 'Bliss Essentials Kit', 'Luxury skincare set in travel pouch.', 1899.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(247, 26, 'VelvetBrush Hair Dryer', 'Ionic dryer with multiple heat settings.', 1999.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(248, 27, 'SilkLuxe Body Lotion', 'Deep nourishing cream for all skin types.', 399.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(249, 28, 'BioGlow Lip Serum', 'Glossy serum with collagen boosters.', 249.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25'),
(250, 29, 'CrystalNail UV Lamp', 'Professional nail dryer with LED panel.', 1199.00, 'Beauty & Personal Care', 'images/placeholder.jpg', '2025-06-06 04:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `buyer_id`, `total_amount`, `created_at`) VALUES
(34, 29, 1847.00, '2025-06-06 14:37:07'),
(35, 26, 1847.00, '2025-06-11 04:09:41'),
(37, 29, 2597.00, '2025-06-11 21:25:03'),
(40, 29, 2098.00, '2025-06-12 15:11:43'),
(41, 29, 67.99, '2025-06-14 19:51:36'),
(42, 29, 249.00, '2025-06-17 00:34:46'),
(43, 29, 499.00, '2025-06-17 00:36:54'),
(44, 29, 899.00, '2025-06-17 00:46:38'),
(45, 29, 1999.00, '2025-06-17 00:49:10'),
(46, 29, 249.00, '2025-06-17 00:58:35'),
(47, 29, 249.00, '2025-06-17 01:00:44'),
(48, 29, 1199.00, '2025-06-17 01:03:53'),
(49, 29, 699.00, '2025-06-17 01:31:50'),
(50, 29, 1199.00, '2025-06-17 01:36:53'),
(51, 29, 1199.00, '2025-06-17 01:40:06'),
(52, 29, 1199.00, '2025-06-17 01:41:40'),
(53, 29, 1199.00, '2025-06-17 01:41:57'),
(54, 29, 1399.00, '2025-06-17 01:44:48'),
(55, 29, 8999.00, '2025-06-17 01:45:17'),
(56, 29, 9999.00, '2025-06-17 01:46:03'),
(57, 29, 9999.00, '2025-06-17 01:46:41'),
(58, 29, 799.00, '2025-06-17 01:49:09'),
(59, 29, 4998.00, '2025-06-17 01:49:49'),
(60, 29, 249.00, '2025-06-17 01:52:37'),
(61, 29, 4299.00, '2025-06-17 01:53:09'),
(62, 29, 499.00, '2025-06-17 01:54:49'),
(63, 29, 1999.00, '2025-06-17 01:55:10'),
(64, 29, 8298.00, '2025-06-17 01:55:26'),
(65, 29, 249.00, '2025-06-17 01:56:16'),
(66, 29, 24.00, '2025-06-17 01:56:48'),
(67, 29, 699.00, '2025-06-17 01:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `status` enum('Pending','Shipped','Completed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `seller_id`, `quantity`, `price`, `status`) VALUES
(37, 34, 250, 29, 1, 1199.00, 'Shipped'),
(38, 34, 249, 28, 1, 249.00, 'Pending'),
(39, 34, 248, 27, 1, 399.00, 'Pending'),
(40, 35, 250, 29, 1, 1199.00, 'Shipped'),
(41, 35, 249, 28, 1, 249.00, 'Pending'),
(42, 35, 16, 29, 1, 399.00, 'Shipped'),
(44, 37, 250, 29, 1, 1199.00, 'Pending'),
(45, 37, 248, 27, 1, 399.00, 'Pending'),
(46, 37, 235, 26, 1, 999.00, 'Pending'),
(49, 40, 172, 29, 1, 1199.00, 'Pending'),
(51, 41, 66, 25, 1, 45.00, 'Pending'),
(52, 41, 31, 26, 1, 22.99, 'Pending'),
(53, 42, 249, 28, 1, 249.00, 'Pending'),
(54, 43, 243, 28, 1, 499.00, 'Pending'),
(56, 45, 247, 26, 1, 1999.00, 'Pending'),
(57, 46, 249, 28, 1, 249.00, 'Pending'),
(58, 47, 249, 28, 1, 249.00, 'Pending'),
(59, 48, 250, 29, 1, 1199.00, 'Pending'),
(60, 49, 210, 25, 1, 699.00, 'Pending'),
(61, 50, 250, 29, 1, 1199.00, 'Pending'),
(62, 51, 250, 29, 1, 1199.00, 'Pending'),
(63, 52, 250, 29, 1, 1199.00, 'Pending'),
(64, 53, 250, 29, 1, 1199.00, 'Pending'),
(65, 54, 92, 27, 1, 1399.00, 'Pending'),
(66, 55, 100, 29, 1, 8999.00, 'Pending'),
(67, 56, 96, 25, 1, 9999.00, 'Pending'),
(68, 57, 225, 28, 1, 9999.00, 'Pending'),
(69, 58, 147, 28, 1, 799.00, 'Pending'),
(70, 59, 187, 26, 1, 1199.00, 'Pending'),
(71, 59, 218, 27, 1, 3799.00, 'Pending'),
(72, 60, 249, 28, 1, 249.00, 'Pending'),
(73, 61, 166, 29, 1, 4299.00, 'Pending'),
(74, 62, 231, 28, 1, 499.00, 'Pending'),
(75, 63, 247, 26, 1, 1999.00, 'Pending'),
(76, 64, 126, 25, 1, 1799.00, 'Pending'),
(77, 64, 76, 29, 1, 6499.00, 'Pending'),
(78, 65, 249, 28, 1, 249.00, 'Pending'),
(79, 66, 69, 28, 1, 24.00, 'Pending'),
(80, 67, 236, 27, 1, 699.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`, `created_at`) VALUES
(1, 'stadlerkieran@gmail.com', '07a8067d0149754a7a06e50d573f39598bebc3ea649154897d22a4bd0e15811b', '2025-06-05 18:32:50', '2025-06-05 15:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_email` varchar(255) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reporter_email` varchar(255) NOT NULL,
  `issue` text NOT NULL,
  `report_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `item_id`, `seller_id`, `seller_email`, `reporter_id`, `reporter_email`, `issue`, `report_time`) VALUES
(3, 235, 26, 'stadlerkieran2@gmail.com', 29, 'stadlerkieran24@gmail.com', 'Issue with seller', '2025-06-11 21:24:59'),
(4, 196, 29, 'stadlerkieran24@gmail.com', 29, 'stadlerkieran24@gmail.com', 'Super bad service from this seller\n', '2025-06-12 03:04:26'),
(5, 72, 25, 'stadlerktwvbggbvrieran@gmail.com', 29, 'stadlerkieran24@gmail.com', 'This guy is a poes', '2025-06-12 15:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `item_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 250, 29, 5, 'Excellent', '2025-06-11 18:08:37'),
(2, 249, 29, 5, 'Great product!', '2025-06-11 18:09:03'),
(3, 249, 29, 5, 'Great product!', '2025-06-11 18:09:36'),
(5, 126, 34, 5, 'Great product. My girlfriend loves it.', '2025-06-11 22:27:32'),
(6, 196, 29, 3, 'Its an ok product I guess...', '2025-06-12 03:03:51'),
(7, 92, 29, 4, 'Nice product', '2025-06-17 01:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `address`, `business_name`, `created_at`) VALUES
(25, 'Kieran', 'Stadler', 'stadlerktwvbggbvrieran@gmail.com', '0784733187', '$2y$10$sjTx.2k7gCW4R8wdfd5Hde3PEdWYz/JiOUqvF99EazXkGP/VMZmia', NULL, NULL, '2025-06-05 00:01:48'),
(26, 'Kieran', 'Stadler', 'stadlerkieran2@gmail.com', '078473300', '$2y$10$DYKubuoJnpaoZCS0Lx8mFuYs97JmRrSnf4HMZfoTJryJW7u7ByQya', '2 Egret Street Flamingo Vlei', 'Phoenix Riggingssssssss', '2025-06-05 00:04:18'),
(27, 'Kieran', 'Stadler', 'stadlerkieran2dddd@gmail.com', '0784733187', '$2y$10$hNsFAFt74VRLTFv0WAiaVueTg1YVXcfCBRq9G2SsoI0Fib1gT4fju', NULL, NULL, '2025-06-05 01:16:59'),
(28, 'Kieran', 'Stadler', 'stadlerkieran2@gmail.co', '0784733187', '$2y$10$28W22P.CY14Dw3wgodz2l.MFGNy3X1vSf9NmMHXE2NVQuKRRsChpe', NULL, NULL, '2025-06-05 16:05:43'),
(29, 'Kieran', 'Stadler', 'stadlerkieran24@gmail.com', '0784761234', '$2y$10$laqfEyUt0.8kdcJsbux02O6.D7aa3M999WpfIGdGP888Cl0TIxiQS', '39 Egret', 'Phoenix Rigging', '2025-06-06 00:34:07'),
(30, 'Kieran', 'Stadler', 'stadlerkieran333@gmail.com', '0784733187', '$2y$10$W.QjhBQ5RmGYgm9FzI45VuSb2PGLAR/9qISVMgceT..ghloPur2fK', NULL, NULL, '2025-06-11 01:11:04'),
(33, 'Kayleigh', 'Stadler', 'stadlerkayleigh@gmail.com', '0732072811', '$2y$10$RNVKOjHYNipVrkqKb4./ke7p.bHyyiddYKbe3Exzpmd/Pmtki/Zdi', NULL, NULL, '2025-06-11 19:31:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `reporter_id` (`reporter_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
