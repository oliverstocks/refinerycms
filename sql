-- MySQL dump 10.11
--
-- Host: localhost    Database: misterstocksinfo_dev
-- ------------------------------------------------------
-- Server version	5.0.67-0ubuntu6.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_settings`
--

DROP TABLE IF EXISTS `blog_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `value` tinyint(1) default NULL,
  `entry` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog_settings`
--

LOCK TABLES `blog_settings` WRITE;
/*!40000 ALTER TABLE `blog_settings` DISABLE KEYS */;
INSERT INTO `blog_settings` VALUES (1,'Manual Moderation',0,NULL,'Set this setting to true to review manually approve comments before they appear on the blog post or confirmed by the poster with email confirmation when Approve by comment is enabled. This setting need to be enabled if you use email confirmation.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(2,'Enable Approve Comment by email',0,NULL,'Set this setting to true to enable comment confirmation by email, commenter will recieve an email with a confirmation link.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(3,'Enable Captcha',0,NULL,'Set this setting to true to protect your commect with Captcha question.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(4,'Enable Categories',1,NULL,'Set this setting to true to enable \'Category\' tags.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(5,'Enable Tags',1,NULL,'Set this setting to true to enable \'Tags\' tags.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(6,'Enable Authors',1,NULL,'Set this setting to true to enable \'Authors\' tags.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(7,'Enable Recent Blog',1,NULL,'Set this setting to true to enable \'Recent blogs\'.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(8,'Enable Related Categories',1,NULL,'Set this setting to true to enable \'Category\' tags related list.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(9,'Enable Related Tags',1,NULL,'Set this setting to true to enable \'Tags\' tags related list.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(10,'Enable Related Authors',1,NULL,'Set this setting to true to enable \'Authors\' tags related list.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(11,'Enable email notification',1,NULL,'Set this setting to true to recieve email notification when new comment are posted.','2010-05-18 13:17:26','2010-05-18 13:17:26'),(12,'Notification email',NULL,'your@address.com','If email notification is set to true, email will be sent to this address.','2010-05-18 13:17:26','2010-05-18 13:17:26');
/*!40000 ALTER TABLE `blog_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `permalink` varchar(255) collate utf8_unicode_ci default NULL,
  `excerpt` text collate utf8_unicode_ci,
  `body` text collate utf8_unicode_ci,
  `draft` tinyint(1) default '0',
  `allow_comment` tinyint(1) default '1',
  `publishing_date` datetime default NULL,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_blogs_on_id` (`id`),
  KEY `index_blogs_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'First Try','first','<p><img src=\"/system/images/0000/0005/logo-small-medium.png\" class=\"float-left\" title=\"Logo Small Medium\" alt=\"/system/images/0000/0005/logo-small-medium.png\" />As a web developer i always though of have a website, a type of blog with some bells and horns. I could of done it <a href=\"http://www.php.net\" title=\"http://www.php.net\">PHP</a> but it\'s awesome enough for my feared skills!</p>\r\n\r\n<p>I would like to this a make notes website, i have tons a notes i bet people can use. Great picture to show and of course, mad dev skills and show off.\r\n</p>','<p>and the body</p>',0,1,'2010-05-18 13:22:00',NULL,'2010-05-18 13:24:11','2010-05-18 14:19:20');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `body` text collate utf8_unicode_ci,
  `approved` tinyint(1) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `token` varchar(255) collate utf8_unicode_ci default NULL,
  `blog_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_comments_on_blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `images` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `filename` varchar(255) collate utf8_unicode_ci default NULL,
  `thumbnail` varchar(255) collate utf8_unicode_ci default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `image_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_images_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,NULL,'image/jpeg','firefox-gray.jpg',NULL,3550,100,120,NULL,'2010-05-17 09:14:39','2010-05-17 09:14:39'),(2,NULL,'image/jpeg','gravatar.jpg',NULL,1118,40,40,NULL,'2010-05-17 16:22:19','2010-05-17 16:22:19'),(3,NULL,'image/jpeg','gravatar.jpg',NULL,1118,40,40,NULL,'2010-05-18 08:43:06','2010-05-18 08:43:06'),(4,NULL,'image/jpeg','firefox-gray.jpg',NULL,3550,100,120,NULL,'2010-05-18 08:43:25','2010-05-18 08:43:25'),(5,NULL,'image/png','logo-small-medium.png',NULL,6476,190,57,NULL,'2010-05-18 14:11:13','2010-05-18 14:11:13'),(6,NULL,'image/png','tree-root-intro.png',NULL,386241,500,310,NULL,'2010-05-19 10:16:03','2010-05-19 10:16:03'),(7,NULL,'image/png','wonka-intro.png',NULL,261763,500,329,NULL,'2010-05-19 10:47:41','2010-05-19 10:47:41'),(8,NULL,'image/png','photo-intro.png',NULL,100133,500,283,NULL,'2010-05-19 12:46:51','2010-05-19 12:46:51');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `message` text collate utf8_unicode_ci,
  `position` int(11) default NULL,
  `open` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,'rsss','stocks@ddd.com','lddl','lmkmlkmÃ¹',NULL,1,'2010-05-18 21:30:37','2010-05-18 21:30:37');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_settings`
--

DROP TABLE IF EXISTS `inquiry_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inquiry_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `value` text collate utf8_unicode_ci,
  `destroyable` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inquiry_settings`
--

LOCK TABLES `inquiry_settings` WRITE;
/*!40000 ALTER TABLE `inquiry_settings` DISABLE KEYS */;
INSERT INTO `inquiry_settings` VALUES (1,'Notification Recipients','stocks.oliver@gmail.com',0,'2010-05-13 14:14:36','2010-05-13 14:14:36'),(2,'Confirmation Body',NULL,NULL,'2010-05-13 14:32:39','2010-05-13 14:32:39'),(3,'Confirmation Body','Thank you for your inquiry %name%,\n\nThis email is a receipt to confirm we have received your inquiry and we\'ll be in touch shortly.\n\nThanks.',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(4,'Notification Recipients','',0,'2010-05-13 15:46:24','2010-05-13 15:46:24');
/*!40000 ALTER TABLE `inquiry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_parts`
--

DROP TABLE IF EXISTS `page_parts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_parts` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `body` text collate utf8_unicode_ci,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_page_parts_on_id` (`id`),
  KEY `index_page_parts_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_parts`
--

LOCK TABLES `page_parts` WRITE;
/*!40000 ALTER TABLE `page_parts` DISABLE KEYS */;
INSERT INTO `page_parts` VALUES (1,1,'Body','<h3><br />Fast website, going to the do some awesome.</h3>',NULL,'2010-05-13 14:18:24','2010-05-17 08:59:55'),(2,1,'Side Body','<p>And i have better things to do.</p>',NULL,'2010-05-13 14:18:24','2010-05-13 14:18:24'),(3,2,'Body','<p>the index page</p>',NULL,'2010-05-13 14:25:37','2010-05-13 14:25:37'),(4,2,'Side Body','<p>something </p>',NULL,'2010-05-13 14:25:37','2010-05-13 14:25:37'),(5,3,'Body','<p>There is many tutorial on the interwebs, i still like to have a place on write down notes on them. </p>\r\n<p>With google we read full article but i search for something and we want to get the answer directly so it\'s SEO friendly take what you need and have fun coding.</p>',NULL,'2010-05-13 15:23:13','2010-05-18 20:38:38'),(6,3,'Side Body','<p>Click on the side menu on the right and pick what you desire.</p>',NULL,'2010-05-13 15:23:13','2010-05-18 20:38:38'),(7,4,'Body','<h3>Installation&#160;</h3>\r\n<p>To do continued</p>',NULL,'2010-05-13 15:27:40','2010-05-18 21:22:22'),(8,4,'Side Body','<h3>Installing <a href=\"http://github.com/unixcharles/refinerycms-blog\" title=\"http://github.com/unixcharles/refinerycms-blog\">Refinerycms-blog</a>\r\n</h3>\r\n\r\n<p> \r\n   If you want to have some blog like mine (it\'s hacked up but you can get it in my github) it you follow the howto:\r\n</p>\r\n\r\n<blockquote><br />\r\n  <strong>Tags</strong>\r\n<br />\r\n You need to install http://github.com/mbleigh/acts-as-taggable-on<br />\r\n gem install acts-as-taggable-on<br />\r\n <br />\r\n add the line:<br />\r\n   config.gem \"acts-as-taggable-on\", :source =&gt; \"http://gemcutter.org\"<br />\r\n to your environment.rb (now application.rb)<br />\r\n if you are already using acts-as-taggable-on in your app, you may want to remove the migration file for \"tags/taggings\" tables.<br />\r\n</blockquote>\r\n<strong>Not not true! Since Rafinery uses bundle, you must add :</strong>\r\n<br />\r\n<code>\r\n    gem \'acts_as_taggable\' <br />\r\n    gem \'acts-as-taggable-on\'\r\n    Gemfile<br />\r\n</code>\r\n<p>\r\n In the Gemfile in your root application folder.\r\n</p>',NULL,'2010-05-13 15:27:40','2010-05-19 09:31:34'),(9,5,'Body','<h3>Text and Image</h3>\r\n\r\n				<p><a href=\"http://getfirefox.com/\"><img src=\"/system/images/0000/0004/firefox-gray.jpg\" title=\"Firefox Gray\" alt=\"/system/images/0000/0001/firefox-gray.jpg\" class=\"float-left\" /></a>\r\n				Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.\r\n				Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu\r\n				posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum\r\n				odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra\r\n				condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna.\r\n				In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.\r\n				Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu\r\n				posuere nunc justo tempus leo.\r\n				</p>\r\n\r\n				<p>\r\n        	   A <a href=\"style.html\">link</a>,\r\n				<acronym title=\"this really isn\'t a very good description\">acronym</acronym>,\r\n				<strong>strong text</strong> and\r\n				<del>deleted text</del>.\r\n        		</p>\r\n\r\n				<h3>Code</h3>\r\n				<p><code>\r\n				code-sample { <br />\r\n				font-weight: bold;<br />\r\n				font-style: italic;<br />\r\n				}\r\n				</code>\r\n</p>\r\n\r\n				<h3>Example Lists</h3>\r\n\r\n				<ol>\r\n					<li>Here is an example</li>\r\n					<li>of an ordered list</li>\r\n				</ol>\r\n\r\n				<ul>\r\n\r\n					<li>Here is an example</li>\r\n					<li>of an unordered list</li>\r\n				</ul>\r\n\r\n				<dl>\r\n            	<dt>Definition title</dt>\r\n            	<dd>Definition description</dd>\r\n\r\n            	<dt>Definition title</dt>\r\n            	<dd>Definition description</dd>\r\n         	</dl>\r\n\r\n				<h3>Blockquote</h3>\r\n\r\n				<blockquote>\r\n				<p>The credit belongs to the man who is actually in the arena;\r\n				whose face is marred by dust and sweat and blood; who strives valiantly;\r\n				who errs and comes short again and again; who knows the great enthusiasms,\r\n				the great devotions, and spends himself in a worthy cause;\r\n				who at the best knows in the end the triumph of high achievement;\r\n				and who at the worst, if he fails, at least fails while daring greatly.</p>\r\n\r\n				<p class=\"align-right\"> - Theodore Roosevelt</p>\r\n				</blockquote>\r\n\r\n				<h3>Headers</h3>\r\n\r\n				<h1>H1 Heading</h1>\r\n				<h2>H2 Heading</h2>\r\n\r\n				<h3>H3 Heading</h3>\r\n				<h4>H4 Heading</h4>\r\n\r\n				<h3>Tabular Data</h3>\r\n				<table>\r\n					<tbody><tr>\r\n						<th>post date</th>\r\n\r\n						<th>title</th>\r\n						<th>description</th>\r\n					</tr>\r\n					<tr>\r\n						<td>01.18.2010</td>\r\n						<td>Augue non nibh</td>\r\n						<td>Commodo <a href=\"index.html\">metus</a> vestibulum hdhdh djdjdj djdjdj</td>\r\n\r\n					</tr>\r\n					<tr>\r\n						<td>01.18.2010</td>\r\n						<td>Fusce ut diam</td>\r\n						<td>Purus in eget odio in sapien</td>\r\n					</tr>\r\n					<tr>\r\n\r\n						<td>01.17.2010</td>\r\n						<td>Augue non nibh</td>\r\n						<td>Adipiscing blandit </td>\r\n					</tr>\r\n					<tr>\r\n						<td>01.17.2010</td>\r\n						<td>Sed vestibulum</td>\r\n\r\n						<td>Cras <a href=\"index.html\">lobortis</a> commodo </td>\r\n					</tr>\r\n				</tbody>\r\n</table>\r\n\r\n				<h3>Contact Form</h3>\r\n\r\n				<form action=\"index.html\" method=\"get\" id=\"contactform\">\r\n\r\n					<p class=\"no-border\"><strong>Send me a message</strong>\r\n</p>\r\n\r\n					<p>\r\n						<label for=\"subject\">Subject</label>\r\n<br />\r\n         			<select id=\"subject\" name=\"subject\" tabindex=\"1\">\r\n           				<option value=\"1\">Option One</option>\r\n          				<option value=\"2\">Option Two</option>\r\n\r\n          	 			<option value=\"3\">Option Three</option>\r\n         			</select>\r\n					</p>\r\n\r\n					<p>\r\n						<label for=\"name\">Your Name</label>\r\n<br />\r\n						<input type=\"text\" id=\"name\" name=\"name\" value=\"Your Name\" tabindex=\"2\" />\r\n					</p>\r\n\r\n					<p>\r\n						<label for=\"email\">Your Email Address</label>\r\n<br />\r\n						<input type=\"text\" id=\"email\" name=\"email\" value=\"Your Email\" tabindex=\"3\" />\r\n					</p>\r\n\r\n					<p>\r\n						<label for=\"message\">Your Message</label>\r\n<br />\r\n						<textarea id=\"message\" name=\"message\" rows=\"10\" cols=\"20\" tabindex=\"4\"></textarea>\r\n\r\n					</p>\r\n\r\n					<p class=\"no-border\">\r\n						<input type=\"submit\" class=\"button\" value=\"Submit\" tabindex=\"5\" />\r\n         			<input type=\"reset\" class=\"button\" value=\"Reset\" tabindex=\"6\" />\r\n					</p>\r\n\r\n				</form>\r\n\r\n\r\n',0,'2010-05-13 15:46:24','2010-05-18 09:18:58'),(10,5,'Side Body','<p>This is another block of content over here.</p>',1,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(11,6,'Body','<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\r\n\r\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>',0,'2010-05-13 15:46:24','2010-05-18 15:01:07'),(12,6,'Side Body','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>',1,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(13,7,'Body','<p>Get in touch with us. Just use the form below and we\'ll get back to you as soon as we can.</p>',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(14,7,'Side Body','<p>Stocks Oliver</p>\r\n<p>La Guitler</p>\r\n<p>53110 - Thuboeuf </p>\r\n<p>France</p>',1,'2010-05-13 15:46:24','2010-05-18 15:02:12'),(15,8,'Body','<p><strong>We respect your privacy. We do not market, rent or sell our email list to any outside parties.</p><p>We need your e-mail address so that we can ensure that the people using our forms are bona fide. It also allows us to send you e-mail newsletters and other communications, if you opt-in. Your postal address is required in order to send you information and pricing, if you request it.</p><p>Please call us at 123 456 7890 if you have any questions or concerns.</p>',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(16,8,'Side Body','',1,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(17,9,'Body','<p>We\'ve received your inquiry and will get back to you with a response shortly.</p><p><a href=\'/\'>Return to the home page</a></p>',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(18,10,'Body','<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href=\'/\'>Return to the home page</a></p>',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(19,11,'Body','<p>Our site is currently down for maintenance. Please try back later.</p>',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(20,12,'Body','<p><img src=\"/system/images/0000/0003/gravatar.jpg\" class=\"float-left\" title=\"Gravatar\" alt=\"/system/images/0000/0003/gravatar.jpg\" />I\'m a wannabe photographer, a wannabe horse rider, a wanna dog trainer, a wannabe fisherman, basically a wannabe (but I\'m a true brain damage geek).</p>\r\n<p><a href=\"/pages/about-me\" title=\"About Me.\">View more...</a>\r\n<a href=\"/pages/about-me\" title=\"About Me.\"></a>\r\n</p>',NULL,'2010-05-17 16:31:31','2010-05-18 11:41:52'),(21,12,'Side Body','<p>On the things i do </p>',NULL,'2010-05-17 16:31:31','2010-05-17 16:31:31'),(22,13,'Body',NULL,NULL,'2010-05-18 13:17:26','2010-05-18 13:17:26'),(23,13,'Side Body',NULL,NULL,'2010-05-18 13:17:26','2010-05-18 13:17:26'),(24,13,'Invalid comment','<p>Your comment was invalid!</p>',NULL,'2010-05-18 13:17:26','2010-05-18 13:17:26'),(25,13,'Successful comment','<p>Your comment was posted successfully!</p>',NULL,'2010-05-18 13:17:26','2010-05-18 13:17:26'),(26,14,'Body','',NULL,'2010-05-18 15:05:42','2010-05-18 15:08:34'),(27,14,'Side Body','',NULL,'2010-05-18 15:05:42','2010-05-18 15:05:42'),(28,15,'Body','<p><img src=\"/system/images/0000/0006/tree-root-intro.png\" title=\"Tree Root Intro\" alt=\"/system/images/0000/0006/tree-root-intro.png\" /></p>',NULL,'2010-05-18 20:42:00','2010-05-19 10:16:41'),(29,15,'Side Body','<p>lot\'s of body text</p>',NULL,'2010-05-18 20:42:00','2010-05-19 10:16:41'),(30,16,'Body','<p>My favorite pets ;)</p>',NULL,'2010-05-18 21:35:59','2010-05-18 21:35:59'),(31,16,'Side Body','',NULL,'2010-05-18 21:35:59','2010-05-18 21:35:59'),(32,17,'Body','<br />',NULL,'2010-05-19 09:51:34','2010-05-19 09:51:34'),(33,17,'Side Body','',NULL,'2010-05-19 09:51:34','2010-05-19 09:51:34'),(34,18,'Body','<p><img src=\"/system/images/0000/0007/wonka-intro.png\" title=\"Wonka Intro\" alt=\"/system/images/0000/0007/wonka-intro.png\" /></p>',NULL,'2010-05-19 09:53:26','2010-05-19 10:48:10'),(35,18,'Side Body','',NULL,'2010-05-19 09:53:26','2010-05-19 09:53:26'),(36,19,'Body','',NULL,'2010-05-19 09:54:10','2010-05-19 09:54:10'),(37,19,'Side Body','',NULL,'2010-05-19 09:54:10','2010-05-19 09:54:10'),(38,20,'Body','',NULL,'2010-05-19 09:54:57','2010-05-19 09:54:57'),(39,20,'Side Body','',NULL,'2010-05-19 09:54:57','2010-05-19 09:54:57'),(40,21,'Body','<p><img src=\"/system/images/0000/0008/photo-intro.png\" title=\"Photo Intro\" alt=\"/system/images/0000/0008/photo-intro.png\" /></p>',NULL,'2010-05-19 12:47:12','2010-05-19 12:47:12'),(41,21,'Side Body','',NULL,'2010-05-19 12:47:12','2010-05-19 12:47:12');
/*!40000 ALTER TABLE `page_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) default NULL,
  `position` int(11) default NULL,
  `path` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `meta_keywords` varchar(255) collate utf8_unicode_ci default NULL,
  `meta_description` text collate utf8_unicode_ci,
  `show_in_menu` tinyint(1) default '1',
  `link_url` varchar(255) collate utf8_unicode_ci default NULL,
  `menu_match` varchar(255) collate utf8_unicode_ci default NULL,
  `deletable` tinyint(1) default '1',
  `custom_title` varchar(255) collate utf8_unicode_ci default NULL,
  `custom_title_type` varchar(255) collate utf8_unicode_ci default 'none',
  `draft` tinyint(1) default '0',
  `browser_title` varchar(255) collate utf8_unicode_ci default NULL,
  `skip_to_first_child` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `index_pages_on_id` (`id`),
  KEY `index_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Artistic projets',NULL,2,NULL,'2010-05-13 14:18:24','2010-05-18 14:58:56','','',1,'',NULL,1,'','none',0,'',0),(3,'Geek stuff',NULL,5,NULL,'2010-05-13 15:23:13','2010-05-19 09:52:07',' If you want to override the default browser title, do it here. ',' Enter a concise two or three sentences describing what this page is about. ',1,'',NULL,1,'Geek post-it.','text',0,'MrStocks Makes a tittle!',0),(4,'Refinery',3,0,NULL,'2010-05-13 15:27:40','2010-05-13 15:54:24','','',1,'',NULL,1,'','none',0,'',0),(5,'Home',NULL,0,NULL,'2010-05-13 15:46:24','2010-05-18 20:29:23',' Enter 5-10 keywords that relate to this page. Separate keywords by a comma. ',' Enter a concise two or three sentences describing what this page is about. ',1,'/','^/$',0,'','none',0,' If you want to override the default browser title, do it here. ',0),(6,'Need me?',NULL,6,NULL,'2010-05-13 15:46:24','2010-05-19 09:52:06','','',1,'',NULL,1,'','none',0,'',0),(7,'Contact',NULL,7,NULL,'2010-05-13 15:46:24','2010-05-19 09:52:07','','',1,'/inquiries/new','^/inquiries.*$',0,'','none',0,'',0),(8,'Privacy Policy',7,0,NULL,'2010-05-13 15:46:24','2010-05-13 15:46:24',NULL,NULL,0,NULL,NULL,1,NULL,'none',0,NULL,0),(9,'Thank You',7,1,NULL,'2010-05-13 15:46:24','2010-05-13 15:46:24',NULL,NULL,0,NULL,'^/inquiries/thank_you$',0,NULL,'none',0,NULL,0),(10,'Page not found',NULL,8,NULL,'2010-05-13 15:46:24','2010-05-19 09:52:07',NULL,NULL,0,NULL,'^/404$',0,NULL,'none',0,NULL,0),(11,'Down for maintenance',NULL,9,NULL,'2010-05-13 15:46:24','2010-05-19 09:52:07',NULL,NULL,0,NULL,'^/maintenance$',1,NULL,'none',0,NULL,0),(12,'About Me.',NULL,10,NULL,'2010-05-17 16:31:31','2010-05-19 09:52:07','','',0,'',NULL,1,'','none',0,'',0),(13,'Blog',NULL,1,NULL,'2010-05-18 13:17:26','2010-05-18 14:58:12',NULL,NULL,1,'/blog','^/blog(/|/.+?|)$',0,NULL,'none',0,NULL,0),(14,'Search',NULL,11,NULL,'2010-05-18 15:05:42','2010-05-19 09:52:07','','',0,'/search',NULL,1,'','none',0,'',0),(15,'Tree roots',1,0,NULL,'2010-05-18 20:42:00','2010-05-18 21:36:24','','',1,'',NULL,1,'','none',0,'',0),(16,'Pets',NULL,4,NULL,'2010-05-18 21:35:59','2010-05-19 09:52:07','','',1,'',NULL,1,'','none',0,'',0),(17,'Outdoor cinema',1,3,NULL,'2010-05-19 09:51:34','2010-05-19 09:52:30','','',1,'',NULL,1,'','none',0,'',0),(18,'Wonka (dog)',16,11,NULL,'2010-05-19 09:53:26','2010-05-19 09:56:29','','',1,'',NULL,1,'','none',0,'',0),(19,'Barney (dog)',16,11,NULL,'2010-05-19 09:54:10','2010-05-19 09:54:10','','',1,'',NULL,1,'','none',0,'',0),(20,'Mystic meg (cat)',16,11,NULL,'2010-05-19 09:54:57','2010-05-19 09:54:57','','',1,'',NULL,1,'','none',0,'',0),(21,'Photos',1,11,NULL,'2010-05-19 12:47:12','2010-05-19 12:47:49','','',1,'',NULL,1,'','none',0,'',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_settings`
--

DROP TABLE IF EXISTS `refinery_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `refinery_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `value` text collate utf8_unicode_ci,
  `destroyable` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_refinery_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `refinery_settings`
--

LOCK TABLES `refinery_settings` WRITE;
/*!40000 ALTER TABLE `refinery_settings` DISABLE KEYS */;
INSERT INTO `refinery_settings` VALUES (1,'image_thumbnails','--- !map:HashWithIndifferentAccess {}\n\n',1,'2010-05-13 14:13:16','2010-05-13 14:13:16'),(2,'refinery_menu_cache_action_suffix','misterstocks_site_menu',1,'2010-05-13 14:13:33','2010-05-16 14:09:28'),(3,'down_for_maintenance','false',1,'2010-05-13 14:13:33','2010-05-13 14:13:33'),(4,'use_resource_caching','false',1,'2010-05-13 14:13:33','2010-05-13 14:13:33'),(5,'site_name','mister-stocks',1,'2010-05-13 14:13:33','2010-05-13 14:15:28'),(6,'use_google_ajax_libraries','false',1,'2010-05-13 14:13:33','2010-05-13 14:13:33'),(7,'show_firebug_lite','false',1,'2010-05-13 14:13:33','2010-05-13 15:50:42'),(8,'activity_show_limit','15',1,'2010-05-13 14:14:37','2010-05-13 14:14:37'),(9,'default_page_parts','--- \n- Body\n- Side Body\n',1,'2010-05-13 14:16:01','2010-05-13 14:16:01'),(10,'new_page_parts','false',1,'2010-05-13 14:16:01','2010-05-13 14:16:01'),(11,'pages_advanced_options_include_seo','true',1,'2010-05-13 14:16:01','2010-05-13 14:16:01'),(12,'page_title','--- !map:HashWithIndifferentAccess \npage_title: !map:HashWithIndifferentAccess \n  wrap_if_not_chained: false\n  class: \n  tag: \nancestors: !map:HashWithIndifferentAccess \n  class: ancestors\n  tag: span\n  separator: \" | \"\nchain_page_title: false\n',1,'2010-05-13 14:18:41','2010-05-13 14:18:41'),(13,'show_submenu_on_content_pages','true',1,'2010-05-13 14:18:41','2010-05-13 14:18:41'),(14,'menu_hide_children','true',1,'2010-05-13 14:18:41','2010-05-16 21:43:36'),(15,'group_resources_by_date_uploaded','true',1,'2010-05-13 14:19:52','2010-05-13 14:19:52'),(16,'site_name','Company Name',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(17,'new_page_parts','false',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(18,'activity_show_limit','18',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(19,'preferred_image_view','--- :grid\n',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(20,'analytics_page_code','UA-xxxxxx-x',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(21,'theme','misterstocks',0,'2010-05-13 15:46:24','2010-05-16 14:09:27'),(22,'image_thumbnails','--- \n:dialog_thumb: c106x106\n:medium: 225x255\n:side_body: 300x500\n:preview: c96x96\n:thumb: 50x50\n:grid: c135x135\n',0,'2010-05-13 15:46:24','2010-05-13 15:46:24'),(23,'show_contact_privacy_link','false',1,'2010-05-13 15:57:33','2010-05-13 15:57:33'),(24,'slogan','I\'m the most awesome person in the world!',1,'2010-05-16 14:25:34','2010-05-16 14:25:34'),(25,'slagin','You slagan here',1,'2010-05-16 21:34:29','2010-05-16 21:34:29'),(26,'slagon','You slagan here',1,'2010-05-16 21:35:34','2010-05-16 21:35:34'),(27,'group_images_by_date_uploaded','true',1,'2010-05-17 09:04:55','2010-05-17 09:04:55'),(28,'image_views','--- \n- :grid\n- :list\n',1,'2010-05-17 09:04:55','2010-05-17 09:04:55'),(29,'refinery_enable_backend_reordering','true',1,'2010-05-17 21:57:30','2010-05-17 21:57:30'),(30,'tld_length','1',1,'2010-05-18 21:30:37','2010-05-18 21:30:37');
/*!40000 ALTER TABLE `refinery_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL auto_increment,
  `content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `filename` varchar(255) collate utf8_unicode_ci default NULL,
  `size` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'image/jpeg','firefox-gray.jpg',3550,NULL,'2010-05-17 21:58:33','2010-05-17 21:58:33');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20091109012126'),('20091130040711'),('20091207033335'),('20100114092849'),('20100127004649'),('20100202034802'),('20100204011654'),('20100223211536'),('20100301212444'),('20100305023036'),('20100305023037'),('20100307055735'),('20100312155331'),('20100312160327'),('20100315203301');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `slugs` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `sluggable_id` int(11) default NULL,
  `sequence` int(11) NOT NULL default '1',
  `sluggable_type` varchar(40) collate utf8_unicode_ci default NULL,
  `scope` varchar(40) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_slugs_on_name_and_sluggable_type_and_scope_and_sequence` (`name`,`sluggable_type`,`scope`,`sequence`),
  KEY `index_slugs_on_sluggable_id` (`sluggable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'im-awesome',1,1,'Page',NULL,'2010-05-13 14:18:24'),(3,'tutorials',3,1,'Page',NULL,'2010-05-13 15:23:13'),(4,'refinery',4,1,'Page',NULL,'2010-05-13 15:27:40'),(6,'about-us',6,1,'Page',NULL,'2010-05-13 15:46:24'),(7,'contact-us',7,1,'Page',NULL,'2010-05-13 15:46:24'),(8,'privacy-policy',8,1,'Page',NULL,'2010-05-13 15:46:24'),(9,'thank-you',9,1,'Page',NULL,'2010-05-13 15:46:24'),(10,'page-not-found',10,1,'Page',NULL,'2010-05-13 15:46:24'),(11,'down-for-maintenance',11,1,'Page',NULL,'2010-05-13 15:46:24'),(13,'common-xhtml-elements',5,1,'Page',NULL,'2010-05-17 09:04:21'),(14,'about-me',12,1,'Page',NULL,'2010-05-17 16:31:31'),(15,'blog',13,1,'Page',NULL,'2010-05-18 13:17:26'),(16,'artistic-projets',1,1,'Page',NULL,'2010-05-18 14:58:56'),(17,'need-me',6,1,'Page',NULL,'2010-05-18 15:01:07'),(18,'contact',7,1,'Page',NULL,'2010-05-18 15:02:12'),(19,'search',14,1,'Page',NULL,'2010-05-18 15:05:42'),(20,'geek-stuff',3,1,'Page',NULL,'2010-05-18 20:28:41'),(21,'home',5,1,'Page',NULL,'2010-05-18 20:29:23'),(22,'tree-roots',15,1,'Page',NULL,'2010-05-18 20:42:00'),(23,'pets',16,1,'Page',NULL,'2010-05-18 21:35:59'),(24,'outdoor-cinema',17,1,'Page',NULL,'2010-05-19 09:51:34'),(25,'wonka-dog',18,1,'Page',NULL,'2010-05-19 09:53:26'),(26,'barney-dog',19,1,'Page',NULL,'2010-05-19 09:54:10'),(27,'mystic-meg-cat',20,1,'Page',NULL,'2010-05-19 09:54:57'),(28,'photos',21,1,'Page',NULL,'2010-05-19 12:47:12');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `tagger_id` int(11) default NULL,
  `tagger_type` varchar(255) collate utf8_unicode_ci default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `context` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,1,NULL,NULL,'Blog','categories','2010-05-18 13:24:11'),(2,1,1,NULL,NULL,'Blog','tags','2010-05-18 13:24:11'),(3,2,1,NULL,NULL,'Blog','tags','2010-05-18 13:24:11'),(4,3,1,NULL,NULL,'Blog','tags','2010-05-18 13:24:11'),(5,4,1,NULL,NULL,'Blog','authors','2010-05-18 13:24:11');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'testing'),(2,'blog'),(3,'theming'),(4,'Oliver Stocks');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_plugins`
--

DROP TABLE IF EXISTS `user_plugins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_unique_user_plugins` (`user_id`,`title`),
  KEY `index_user_plugins_on_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_plugins`
--

LOCK TABLES `user_plugins` WRITE;
/*!40000 ALTER TABLE `user_plugins` DISABLE KEYS */;
INSERT INTO `user_plugins` VALUES (1,1,'Dashboard',0),(2,1,'Images',1),(3,1,'Inquiries',2),(4,1,'Pages',3),(5,1,'Resources',4),(6,1,'Settings',5),(7,1,'Users',6),(8,1,'Blog',7);
/*!40000 ALTER TABLE `user_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) collate utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) collate utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `superuser` tinyint(1) default '0',
  `perishable_token` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_users_on_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mrstocks','stocks.oliver@gmail.com','48573117b581ea21481a3ae3c8dc39e716b6673d','MW6jLG0Fkp4qTad3rJv2','04bbac90af04e2d3e47e3356055ac74134f66cd11d05a2003ca38f2cf3853b1c2edf8924aa4d4d16c05353997f870c84f474804154e3d0d90022ae28458fda20','2010-05-13 14:14:36','2010-05-16 14:08:21',1,'ZSNGTMolPjIpQaHm75Vh');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-19 14:15:36
