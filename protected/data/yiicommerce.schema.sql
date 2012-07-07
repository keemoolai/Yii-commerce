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




COMMIT;