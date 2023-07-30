CREATE TABLE `user` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`email` varchar NOT NULL,
	`password` varchar NOT NULL,
	`phone_number` bigint NOT NULL,
	`forget_password` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_password_change` (
	`user_id` INT NOT NULL,
	`OTP` bigint NOT NULL
);

CREATE TABLE `product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_name` varchar NOT NULL,
	`product_image` blob NOT NULL,
	`product_description` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_item` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
	`price` DECIMAL NOT NULL,
	`SKU` numeric NOT NULL,
	`discount` numeric NOT NULL,
	`quantity` numeric NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cart` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cart_item` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`cart_id` INT NOT NULL,
	`product_item_id` INT NOT NULL,
	`quantity` numeric NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shipping_method` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`price` DECIMAL NOT NULL,
	`shipping_available` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_line` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_item_id` INT NOT NULL,
	`order_id` INT NOT NULL,
	`quantity` numeric NOT NULL,
	`price` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shop_order` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`order_date` DATE NOT NULL,
	`shipping_address` varchar NOT NULL,
	`shipping_method_total_order` INT NOT NULL,
	`order_status` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_status` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`available` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `address` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`unit_number` numeric NOT NULL,
	`street_number` numeric NOT NULL,
	`address_line` varchar NOT NULL,
	`city` varchar NOT NULL,
	`state` varchar NOT NULL,
	`pin_code` bigint NOT NULL,
	`phone_number` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_address` (
	`user_id` INT NOT NULL,
	`address_id` INT NOT NULL
);

CREATE TABLE `Notification` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`order_status_id` INT NOT NULL,
	`product_item_id` INT NOT NULL,
	`shipping_method_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `user_password_change` ADD CONSTRAINT `user_password_change_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `product_item` ADD CONSTRAINT `product_item_fk0` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `cart` ADD CONSTRAINT `cart_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk0` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`id`);

ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk1` FOREIGN KEY (`product_item_id`) REFERENCES `product_item`(`id`);

ALTER TABLE `order_line` ADD CONSTRAINT `order_line_fk0` FOREIGN KEY (`product_item_id`) REFERENCES `product_item`(`id`);

ALTER TABLE `order_line` ADD CONSTRAINT `order_line_fk1` FOREIGN KEY (`order_id`) REFERENCES `shop_order`(`id`);

ALTER TABLE `shop_order` ADD CONSTRAINT `shop_order_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `shop_order` ADD CONSTRAINT `shop_order_fk1` FOREIGN KEY (`shipping_address`) REFERENCES `address`(`id`);

ALTER TABLE `shop_order` ADD CONSTRAINT `shop_order_fk2` FOREIGN KEY (`shipping_method_total_order`) REFERENCES `shipping_method`(`id`);

ALTER TABLE `shop_order` ADD CONSTRAINT `shop_order_fk3` FOREIGN KEY (`order_status`) REFERENCES `order_status`(`id`);

ALTER TABLE `user_address` ADD CONSTRAINT `user_address_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `user_address` ADD CONSTRAINT `user_address_fk1` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `Notification` ADD CONSTRAINT `Notification_fk0` FOREIGN KEY (`order_status_id`) REFERENCES `order_status`(`id`);

ALTER TABLE `Notification` ADD CONSTRAINT `Notification_fk1` FOREIGN KEY (`product_item_id`) REFERENCES `product_item`(`id`);

ALTER TABLE `Notification` ADD CONSTRAINT `Notification_fk2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method`(`id`);














