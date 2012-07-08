SET SQL_MODE="TRADITIONAL";
START TRANSACTION;



#-- Category : represents a Category in the database
#-- HasMany Product
CREATE TABLE yc_category
(
	#-- Key
	id		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	
	#-- Attributes
	name		VARCHAR(255) NOT NULL,
	
	#-- Constraints
	PRIMARY KEY (id),
	UNIQUE KEY fk_category_name(name)
	
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#-- Product : represents a product to sell in our application
#-- BelongsTo Category
CREATE TABLE yc_product
(
    #-- Key
    id            INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,

    #-- Attributes
    name          VARCHAR(40) NOT NULL,
    price         DECIMAL(6, 2) NOT NULL,
    description   TEXT,
    
    #-- Relationships
    category_id	INTEGER UNSIGNED NOT NULL,

    #-- Constraints
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES yc_category(id),
    UNIQUE KEY uk_product_name (name)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



#--
#-- Test Data
#--

INSERT INTO yc_category (id, name)
VALUES
	(1, "Electronics"),
	(2, "Clothes"),
	(3, "Sporting Goods");
	
INSERT INTO yc_product (id, name, price, description, category_id)
VALUES
	(1, "Laptop", 1200.00, "A stunning little laptop.", 1),
	(2, "Smartphone", 299.99, "The most powerful smartphone yet.", 1),
	(3, "White Shirt", 12.50, "Comfortable, cotton, and plain.", 2),
	(4, "Football Helmet", 68.75, "Authentic NFL helmet.", 3);


COMMIT;