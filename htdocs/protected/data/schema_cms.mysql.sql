CREATE TABLE `user` (
	`id`       int(10)      unsigned NOT NULL AUTO_INCREMENT,
	`username` varchar(45)           NOT NULL,
	`email`    varchar(60)           NOT NULL,
	`pass`     varchar(255)  DEFAULT NULL,
	`type`     enum('autor', 'editor', 'admin') NOT NULL,
	`date_entered` timestamp         NOT NULL DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (`id`),
	UNIQUE KEY `username_UNIQUE` (`username`),
	UNIQUE KEY `email_UNIQUE` (`email`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `page` (
	`id`      int(10)      unsigned NOT NULL AUTO_INCREMENT,
	`user_id` int(10)      unsigned NOT NULL,
	`live`    tinyint(1)   unsigned NOT NULL DEFAULT '0',
	`title`   varchar(100)          NOT NULL,
	`content` longtext,
	`date_updated` datetime DEFAULT NULL,
	`date_published` date   DEFAULT NULL,

	PRIMARY KEY (`id`),
	KEY `fk_page_user_idx` (`user_id`),
	CONSTRAINT `fk_page_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) 
		ON DELETE CASCADE 
		ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
	`id`         int(10)    unsigned NOT NULL AUTO_INCREMENT,
	`page_id`    int(10)    unsigned NOT NULL,
	`username`   varchar(45)         NOT NULL,
	`user_email` varchar(60)         NOT NULL,
	`comment`    mediumtext          NOT NULL,
	`date_entered` timestamp         NOT NULL DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (`id`),
	KEY `fk_comment_page_idx` (`page_id`),
	KEY `date_entered` (`date_entered`),
	CONSTRAINT `fk_comment_page` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
