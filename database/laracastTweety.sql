/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.21 : Database - laracasttweety
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laracasttweety` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `laracasttweety`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `follows` */

DROP TABLE IF EXISTS `follows`;

CREATE TABLE `follows` (
  `user_id` bigint unsigned NOT NULL,
  `following_user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`following_user_id`),
  KEY `follows_following_user_id_foreign` (`following_user_id`),
  CONSTRAINT `follows_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `follows` */

insert  into `follows`(`user_id`,`following_user_id`,`created_at`,`updated_at`) values 
(4,5,NULL,NULL),
(4,6,NULL,NULL);

/*Table structure for table `likes` */

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `tweet_id` bigint unsigned NOT NULL,
  `liked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_user_id_tweet_id_unique` (`user_id`,`tweet_id`),
  KEY `likes_tweet_id_foreign` (`tweet_id`),
  CONSTRAINT `likes_tweet_id_foreign` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `likes` */

insert  into `likes`(`id`,`user_id`,`tweet_id`,`liked`,`created_at`,`updated_at`) values 
(4,4,230,1,'2021-04-20 06:52:19','2021-04-20 06:53:09');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_03_01_070034_create_tweets_table',1),
(5,'2021_03_03_162835_create_follows_table',1),
(6,'2021_04_18_064338_create_likes_table',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `tweets` */

DROP TABLE IF EXISTS `tweets`;

CREATE TABLE `tweets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tweets` */

insert  into `tweets`(`id`,`user_id`,`body`,`created_at`,`updated_at`) values 
(214,4,'Rerum esse animi quibusdam nostrum enim voluptatem molestias.','2021-04-14 08:00:30','2021-04-14 08:00:30'),
(215,4,'Est rerum enim recusandae quia.','2021-04-14 08:00:30','2021-04-14 08:00:30'),
(216,4,'Quasi officiis est quod reprehenderit sequi non eius.','2021-04-14 08:00:30','2021-04-14 08:00:30'),
(217,4,'Amet quia laborum eaque sint temporibus.','2021-04-14 08:00:30','2021-04-14 08:00:30'),
(218,4,'Sed consequatur porro est enim accusantium qui rerum.','2021-04-14 08:00:30','2021-04-14 08:00:30'),
(219,4,'Velit et dignissimos et sit et autem.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(220,4,'Neque asperiores et animi.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(221,4,'Earum quod laboriosam officia.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(222,4,'Vitae non qui dolores aut.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(223,4,'Dolor et soluta ipsa et voluptate fugit ut voluptatibus.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(224,5,'Nesciunt nihil veniam natus.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(225,5,'Impedit eum non maiores quasi et enim.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(226,5,'Dolor ad praesentium fugit deleniti mollitia.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(227,5,'Maxime totam in expedita nulla et id ea.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(228,5,'Placeat tempora odio veritatis quia delectus ratione.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(229,5,'Rerum ullam et eveniet est qui.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(230,5,'Laboriosam inventore iste similique facere id fuga non.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(231,5,'Autem maiores est consequatur et ipsa autem dicta nam.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(232,5,'Occaecati voluptatem nihil et vitae vel delectus fugit.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(233,5,'Quo sed quia voluptatem odit ullam molestiae rerum dolorum.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(234,6,'Quasi accusamus qui tempore dolorem illo ut nihil.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(235,6,'Ducimus mollitia est labore libero quo eius esse qui.','2021-04-14 08:00:31','2021-04-14 08:00:31'),
(236,6,'Ipsa nulla qui repudiandae ipsam vitae nihil deleniti.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(237,6,'Dolor quae optio nihil porro voluptas recusandae.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(238,6,'Nostrum est ipsa explicabo velit odio.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(239,6,'Voluptas rem eaque quam repellat dolore.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(240,6,'Saepe voluptatem ea error perspiciatis sapiente consequatur possimus.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(241,6,'Rem debitis accusamus id accusamus vel modi sint.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(242,6,'Magni similique aspernatur tenetur voluptatem sed cumque.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(243,6,'Minima architecto culpa animi omnis neque explicabo.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(244,7,'Commodi cumque odio ea eaque quis.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(245,7,'Soluta aut aut sit corrupti tenetur molestiae est.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(246,7,'Odit aut quo ut sit aliquid.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(247,7,'Quidem dolores illo cupiditate aut in voluptate consectetur.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(248,7,'Repellat quo laudantium quo est veritatis praesentium minus.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(249,7,'Commodi distinctio mollitia sint consequuntur quia unde.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(250,7,'Est beatae excepturi et rem.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(251,7,'Quo alias est qui hic dolorem.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(252,7,'Reiciendis iusto officia nesciunt dolores omnis.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(253,7,'Consequatur voluptas cupiditate sed neque consequatur sed nesciunt.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(254,8,'A provident quia deserunt voluptas.','2021-04-14 08:00:32','2021-04-14 08:00:32'),
(255,8,'Architecto delectus numquam est aut.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(256,8,'Pariatur dignissimos magnam odit sed ut aut.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(257,8,'Dolor est et eligendi facere qui dolor id.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(258,8,'Doloribus perspiciatis dolorem provident.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(259,8,'Id qui qui molestiae doloribus explicabo velit ducimus laboriosam.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(260,8,'Enim nisi ab autem.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(261,8,'Id rerum mollitia dolor mollitia.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(262,8,'Tempore necessitatibus non et.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(263,8,'Corporis nihil sit est tempore rem.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(264,9,'Ratione velit et aliquid enim fuga ducimus voluptatem repellendus.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(265,9,'Repellat qui aut recusandae dolorem.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(266,9,'Nemo et debitis aspernatur ut non quia voluptatem.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(267,9,'Labore alias tenetur tempora voluptatum est in eum.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(268,9,'Similique harum voluptatem id assumenda quisquam consequatur et quia.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(269,9,'Qui debitis quam id error natus modi assumenda.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(270,9,'Exercitationem blanditiis at maxime voluptate quia omnis vel.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(271,9,'Eius quasi iste repellat at qui voluptas.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(272,9,'Et qui excepturi non debitis temporibus optio ipsum cumque.','2021-04-14 08:00:33','2021-04-14 08:00:33'),
(273,9,'Aut architecto maiores et quibusdam qui facilis quam.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(274,10,'Eum cum vero qui fugit.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(275,10,'Eum est nesciunt temporibus ea.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(276,10,'Ut voluptas id consequatur magnam.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(277,10,'Vel fugiat velit unde laudantium quia placeat.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(278,10,'Repellat quaerat explicabo beatae non.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(279,10,'Cupiditate laudantium et debitis quia perspiciatis eius accusantium cumque.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(280,10,'Nihil doloremque ab assumenda assumenda ipsum ut aut consectetur.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(281,10,'Dolor ipsam maxime quod consectetur.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(282,10,'Et ex aut repellat minus.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(283,10,'Dolorem aliquid dolores dolores similique et quibusdam quas repudiandae.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(284,11,'Sit corporis labore omnis architecto.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(285,11,'Dolor quia laudantium ratione repellendus culpa laborum ut illo.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(286,11,'Id et voluptate explicabo suscipit nihil molestias.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(287,11,'Aspernatur nam omnis quibusdam nulla.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(288,11,'Dolor harum ex incidunt rerum.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(289,11,'Et in sint non ut quas.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(290,11,'Sed voluptas commodi nulla enim est placeat et quaerat.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(291,11,'Molestiae blanditiis quo expedita.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(292,11,'Repudiandae rerum dolores nemo nihil.','2021-04-14 08:00:34','2021-04-14 08:00:34'),
(293,11,'Laboriosam laboriosam quo dolore iusto commodi aut.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(294,12,'Animi laboriosam cumque dignissimos eius.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(295,12,'Soluta beatae et autem sint rerum magni.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(296,12,'Quis et veniam quia doloribus eum modi.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(297,12,'Ullam similique fugiat eius ut sapiente explicabo.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(298,12,'Sunt est corporis expedita facilis minus molestias.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(299,12,'Omnis deleniti officiis illum sed aliquam totam a facilis.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(300,12,'Reiciendis ab at id.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(301,12,'Voluptatibus quam est laborum totam.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(302,12,'Atque placeat eveniet cumque.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(303,12,'Alias ex aut rerum est praesentium laboriosam.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(304,13,'Nam velit sequi architecto.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(305,13,'Blanditiis vel autem omnis ab velit dicta quo.','2021-04-14 08:00:35','2021-04-14 08:00:35'),
(306,13,'Qui voluptatum pariatur sequi rerum quis.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(307,13,'Odio nihil eos debitis qui consectetur eum.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(308,13,'Ut sint ad molestiae in deleniti commodi.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(309,13,'Repellendus est veniam ratione dolorem suscipit repudiandae.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(310,13,'Delectus modi sed esse corporis.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(311,13,'Libero delectus doloribus ut sint possimus mollitia.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(312,13,'Dolorum ipsum ad in praesentium doloremque quae.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(313,13,'Sed vel voluptas dolore at libero.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(314,14,'Et nihil fugiat velit maxime atque veniam odit.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(315,14,'Temporibus ea dolore non quia sapiente sint praesentium ut.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(316,14,'Quidem soluta rerum cum fugit.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(317,14,'Aut cumque accusantium rerum est fugiat animi.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(318,14,'Perferendis dolorem dolor exercitationem ut.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(319,14,'Ullam atque ut rerum natus.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(320,14,'Odit explicabo ipsam dolorem possimus eum accusamus cumque voluptatibus.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(321,14,'Vel qui est officiis facilis.','2021-04-14 08:00:36','2021-04-14 08:00:36'),
(322,14,'Voluptatem repellendus est voluptatem incidunt qui.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(323,14,'Quia corrupti perferendis consequatur perspiciatis ut.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(324,15,'Quo et perferendis nesciunt reprehenderit rem eum odio.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(325,15,'Dolor minus qui repellendus quasi saepe ullam.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(326,15,'Quas eius voluptatibus facere autem aut tempore.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(327,15,'Et rem rerum blanditiis.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(328,15,'Quaerat ut fugiat et blanditiis inventore consequatur.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(329,15,'Autem animi nesciunt sapiente quia incidunt cupiditate alias.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(330,15,'Vel et laborum voluptatem saepe.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(331,15,'Eum sapiente cumque aspernatur omnis cum porro.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(332,15,'Pariatur quia ex omnis.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(333,15,'Harum libero repellendus voluptatibus aliquid est fuga culpa.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(334,16,'Labore nisi eos error tempora illum.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(335,16,'Assumenda laudantium mollitia aut.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(336,16,'Dolorem aut qui eaque occaecati.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(337,16,'Facere veniam aut et quae nesciunt et.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(338,16,'Est minus officia nulla.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(339,16,'Tempora placeat voluptatem facere aut.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(340,16,'Ducimus nostrum et voluptas suscipit qui voluptatem.','2021-04-14 08:00:37','2021-04-14 08:00:37'),
(341,16,'Et voluptas eum consequatur unde praesentium.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(342,16,'Repellat ut autem odio.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(343,16,'Et molestiae voluptates alias fuga nesciunt.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(344,17,'Dolores earum ea mollitia beatae eum quisquam.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(345,17,'Id ipsa quo quisquam exercitationem.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(346,17,'Iste sed quo odit consequuntur sunt soluta iusto.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(347,17,'Illo omnis in autem et.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(348,17,'Modi nihil asperiores animi minus.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(349,17,'Voluptatem sunt praesentium quae impedit culpa omnis.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(350,17,'Nam voluptates at est dolorum aut est cum eum.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(351,17,'Officiis aliquid architecto ea dolorem.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(352,17,'Soluta quis libero in architecto.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(353,17,'Sit labore omnis laborum est.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(354,18,'Ad voluptas ipsa voluptatibus sed sapiente excepturi tempore.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(355,18,'Perferendis est expedita ut sed.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(356,18,'Quis rerum assumenda sed nemo recusandae quam.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(357,18,'Delectus sapiente voluptate mollitia.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(358,18,'Magni est qui nihil itaque.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(359,18,'Inventore eligendi quisquam est sint cupiditate.','2021-04-14 08:00:38','2021-04-14 08:00:38'),
(360,18,'Nostrum nobis autem optio quam ipsum.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(361,18,'Et voluptatem quis saepe recusandae eos odio dolores.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(362,18,'Temporibus id eligendi ea est consectetur tenetur.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(363,18,'Quidem expedita unde perferendis magnam.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(364,19,'Et natus quia consequuntur voluptatum.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(365,19,'Et qui ut est dolorem aut.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(366,19,'Amet autem molestias a.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(367,19,'Omnis alias saepe officiis dicta a repellendus omnis fuga.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(368,19,'Ut laudantium quibusdam aut.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(369,19,'Tempora et eos rerum non voluptatum qui.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(370,19,'Quam cumque id vel.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(371,19,'Quis rerum culpa iure a et.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(372,19,'Hic ut officia et aut illum.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(373,19,'Repellendus quaerat dolorem qui nostrum ut.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(374,20,'Et fugit temporibus voluptatum vel corrupti et.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(375,20,'Aliquid id explicabo quia et.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(376,20,'Ea amet molestiae sint illo exercitationem amet nobis dolorem.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(377,20,'Quibusdam quibusdam veniam consequuntur pariatur quo.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(378,20,'Provident officiis tempora nihil voluptates provident omnis.','2021-04-14 08:00:39','2021-04-14 08:00:39'),
(379,20,'Eum earum laboriosam quis enim repudiandae ea reprehenderit.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(380,20,'Nulla eligendi minima natus.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(381,20,'Eveniet non ut eos nisi.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(382,20,'Atque consequatur facere rerum eius quia accusantium suscipit.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(383,20,'Est enim in aliquam enim at fugit cum.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(384,21,'Illo occaecati quidem tenetur deleniti.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(385,21,'Necessitatibus totam qui eum amet.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(386,21,'Qui eos et possimus quos molestiae et.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(387,21,'Est vel doloribus sed eligendi cupiditate omnis.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(388,21,'Ut in qui et harum quaerat quisquam eum.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(389,21,'Culpa quia molestiae quam laborum.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(390,21,'Eveniet qui ab dolorum dolor harum cupiditate.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(391,21,'Nemo accusamus sit qui atque.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(392,21,'Aspernatur velit dolores delectus cupiditate molestias.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(393,21,'Quaerat asperiores quidem ipsam in voluptatem repellat voluptatem.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(394,22,'Error quam porro provident.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(395,22,'Eligendi sapiente aliquam quis magnam praesentium.','2021-04-14 08:00:40','2021-04-14 08:00:40'),
(396,22,'Qui laborum quisquam nam omnis aut sed.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(397,22,'Consectetur pariatur dignissimos dolore.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(398,22,'Eos velit quis reprehenderit fuga.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(399,22,'Temporibus quibusdam magnam est voluptatum tempore modi.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(400,22,'Perferendis sint eligendi alias aut illo quia rerum.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(401,22,'Enim harum sequi molestiae qui velit velit ut.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(402,22,'Accusantium ea reprehenderit non culpa.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(403,22,'Quisquam magni ullam et.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(404,23,'Quia qui tempora neque voluptas explicabo totam et.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(405,23,'Neque in laboriosam ratione quod tempore optio.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(406,23,'Facere hic quis soluta omnis molestias labore occaecati.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(407,23,'Et enim repudiandae voluptate temporibus et voluptatem eos.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(408,23,'Placeat repellendus id sunt qui nihil.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(409,23,'Illum harum delectus voluptate.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(410,23,'Nostrum error et aut iure labore iure et.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(411,23,'Reprehenderit et quia quo cumque sunt.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(412,23,'Esse deserunt repudiandae aliquam beatae repellat quam.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(413,23,'Consequatur nisi et rerum eos.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(414,24,'Soluta quo accusamus atque quibusdam voluptate quasi ipsum sit.','2021-04-14 08:00:41','2021-04-14 08:00:41'),
(415,24,'Necessitatibus delectus expedita corrupti.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(416,24,'Dolores qui tenetur qui incidunt et.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(417,24,'Ex non ducimus et eveniet non.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(418,24,'Incidunt accusantium delectus fugit optio maxime repellendus velit.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(419,24,'Dolore voluptas quis blanditiis.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(420,24,'Eaque esse reprehenderit voluptatem.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(421,24,'Architecto et impedit repellendus ut et.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(422,24,'Voluptas ea placeat quisquam.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(423,24,'Accusantium alias sed deserunt facilis quod asperiores odit.','2021-04-14 08:00:42','2021-04-14 08:00:42'),
(424,4,'We can create tweets.','2021-04-15 06:20:53','2021-04-15 06:20:53');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`name`,`avatar`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(4,'virat','Virat Kohli','avatars/HF6qvxPhAxPDHCkvTlbCyt2yggkMQIrwLvILIxzK.jpg','virat@gmail.com',NULL,'$2y$10$bjpAakVlmMCJbbBoGPE/8eDOCUUMlKxmyf0Qzo62YJZAVk0h3Z7VO','pRzjf4DJlFkt7mvFWwKOqqs8BLS1cd9LqDYJmJeN4tgVo9nqcGBgOwHfeDzm','2021-04-14 05:42:13','2021-04-16 06:16:30'),
(5,'soledad.murazik','Prof. Barry Altenwerth PhD',NULL,'wiegand.barton@example.org','2021-04-14 07:37:36','$2y$10$g6.yT9zAFEVipli6GHwGSODxZiFr4Io96OqhhjGTT9YaFRrqffwl6','XF3tvgweOa','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(6,'bobby.cormier','Mr. Eric Stokes V',NULL,'dstamm@example.com','2021-04-14 07:37:36','$2y$10$WgBjACxVTBgHMa6ZQijyMe1PfW7uKqC6iUMh3zcRa4.WnYsYMgFRu','M2BNdLLiy7','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(7,'kaden.berge','Prof. Eldora Bogan MD',NULL,'nheller@example.com','2021-04-14 07:37:36','$2y$10$zZsEVIthNoHHhZSfUdUbeuvnzgUiSJGalZPp1Hk1vQabdrWqine6e','6ithHiUgbQ','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(8,'erika.smith','Dr. Owen Beahan II',NULL,'aspinka@example.net','2021-04-14 07:37:36','$2y$10$Tgf68HsPZ9ViSErGTReU4ePi45ciwdOrPAKkjPlqx1RiCGPDmk2va','7LowhSZAx3','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(9,'gleichner.jamal','Celestino Haley',NULL,'freida43@example.com','2021-04-14 07:37:36','$2y$10$N.qXQZXil4FjhlH4B5Xzp.DoVAtkhvUJnEZLjwELmB6CxOO5PZXqy','8sdMlUDEPm','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(10,'bbartell','Rowena Rogahn I',NULL,'stiedemann.felix@example.com','2021-04-14 07:37:36','$2y$10$N1gZMFWZPhqBf6yXivYxUeqTb2cGfMUqKYB/WIunAHqwDUapa4.mO','Iwp3ektCBy','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(11,'lauretta.christiansen','Isaias Schulist',NULL,'magdalena82@example.net','2021-04-14 07:37:36','$2y$10$QzfWNaCqVJTFrY3EL3BNause42q28J1MG4/G3EzyckLver6f12Pu.','dGYfQ1JQBs','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(12,'claire92','Roscoe Wintheiser',NULL,'cassandra44@example.net','2021-04-14 07:37:36','$2y$10$VnIR14P2WYh.SWR5R0eei.EwIjH3IeJAfpFMqOFlj2Utt2R4JkRA2','wRtLWaDZY9','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(13,'muriel.predovic','Abelardo Marvin',NULL,'swift.jayde@example.net','2021-04-14 07:37:37','$2y$10$8Ty0/t4Rcj4ux4G2gYrh.e609YgbO7cGAoANEkyG5Do2G.y9G9.jq','oizj2B6PjN','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(14,'suzanne61','Katheryn Blanda',NULL,'emmanuelle.gulgowski@example.org','2021-04-14 07:37:37','$2y$10$Vp/ppc16/JioiLf.BxdNzuE0TP985YnNWb1mOSPJFT1sjiY552aDG','NKOZ2Ysw8B','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(15,'itreutel','Finn Weissnat',NULL,'xbashirian@example.net','2021-04-14 07:37:37','$2y$10$KJ3aeOST6blSoBNZN/6c9OgaMITQFyKNlDWsYNX8J.3KoVFEFg0ne','jdpgqQHAQs','2021-04-14 07:37:38','2021-04-14 07:37:38'),
(16,'dlangworth','Alexys Waelchi',NULL,'edgardo.heidenreich@example.com','2021-04-14 07:37:37','$2y$10$G5uUDDh1WD7Qp5zZ6XD4IOrpuHgI0BAmIjMm2IUpxrbE0VtiGOnqi','RmtDHd5dw8','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(17,'lowe.augusta','Omari Gutkowski',NULL,'rick.maggio@example.net','2021-04-14 07:37:37','$2y$10$UH7dysOGFcRGcrkJyfn.tec335mSZFIF39yydOgukZJl4514pFRfu','D06NL8SsbP','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(18,'powlowski.heaven','Mauricio Skiles',NULL,'devonte.nader@example.com','2021-04-14 07:37:37','$2y$10$v66A5fjfhq6l6RtuO0fr.uhn8Em.B1ZeFGYgVfuNpI2zUutpYiqyi','D1gZVmVk4S','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(19,'dgreenfelder','Mr. Ulises Muller Jr.',NULL,'marks.annabelle@example.org','2021-04-14 07:37:37','$2y$10$ATqV3CvD44nGAUWvMMjsj.Qjyrz8FEqNldcDUAsA0yIpaJ5zWVm4m','dhpzSu0hrg','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(20,'amalia78','Alfred Cronin',NULL,'bernice.leuschke@example.org','2021-04-14 07:37:37','$2y$10$1PNOgVn9zoJDr0Rno9IlX.F.1mxUrTG4q6Qcc3d2K8NqykhCmdOjy','uSSKyg4HvH','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(21,'gia.waters','Estell Dickinson',NULL,'trenner@example.net','2021-04-14 07:37:37','$2y$10$hCB9MwVqQbXFQow/EHHWL.LH3rYUbbP/nzju6XNhR2BtlBMVI148S','O3we7FO8Je','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(22,'rowe.columbus','Prof. Omari Beier',NULL,'hassie82@example.net','2021-04-14 07:37:37','$2y$10$7T30iOdD8cM1TbCxl8spxu46nxJcspeKZsk.d6ds98pCeEUQ.JK5W','3xPEltDY3T','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(23,'shaun.feest','Thelma Gulgowski',NULL,'murazik.willa@example.org','2021-04-14 07:37:37','$2y$10$Ao35YuxOGOHboQW3heKsMuJI5VO9oTT7OVlwgalRK7dRlvVbVXA7y','uCZwRLxfai','2021-04-14 07:37:39','2021-04-14 07:37:39'),
(24,'wferry','Enola Rippin',NULL,'zetta.prosacco@example.org','2021-04-14 07:37:37','$2y$10$ES/svKtODeQrWaAR9EHd7uqgGypcIVKp8Hk5XegNniFsxqCTRh7Se','vGJoJO13NR','2021-04-14 07:37:39','2021-04-14 07:37:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
