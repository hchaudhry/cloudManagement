CREATE TABLE user (
  id int auto_increment,
  login varchar(30) NOT NULL,
  lastname varchar(20) NOT NULL,
  firstname varchar(20) NOT NULL,
  email varchar(80) NOT NULL,
  motDepasse varchar(50) NOT NULL,
  isSupAdmin boolean NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE product (
  id int NOT NULL AUTO_INCREMENT,
  reference varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  description varchar(250) NOT NULL,
  quantity int(11) NOT NULL,
  price double NOT NULL,
  seuil_active tinyint(1) NOT NULL,
  seuil_value int(11) DEFAULT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE client (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  society varchar(50) DEFAULT NULL,
  adress varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  cp  varchar(10) NOT NULL,
  phone varchar(20) NOT NULL,
  email varchar(80) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE supplier (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  society varchar(50) DEFAULT NULL,
  adress varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  cp varchar(10) NOT NULL,
  phone varchar(20) NOT NULL,
  email varchar(80) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE product_supplier (
  id int NOT NULL AUTO_INCREMENT,
  id_product int NOT NULL,
  id_supplier int NOT NULL,
  price double NOT NULL,
  PRIMARY KEY (id,id_product,id_supplier),
  FOREIGN KEY (id_product) REFERENCES product(id),
  FOREIGN KEY (id_supplier) REFERENCES supplier(id)
);

CREATE TABLE product_client (
  id int NOT NULL AUTO_INCREMENT,
  id_client int NOT NULL,
  id_product int NOT NULL,
  PRIMARY KEY (id,id_client,id_product),
  FOREIGN KEY (id_product) REFERENCES product(id),
  FOREIGN KEY (id_client) REFERENCES client(id)
);
