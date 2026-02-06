The presentation is on https://onedrive.live.com/personal/993158f00c8c9940/_layouts/15/doc.aspx?resid=2cd77324-d85f-45d1-830e-bd648e787830&cid=993158f00c8c9940 
C2C E-Commerce Platform for African Cultural Fashion

Lushaka Urithi is a consumer-to-consumer (C2C) e-commerce website built to preserve, promote, and trade African cultural clothing and accessories through digital commerce. The platform connects buyers and sellers while celebrating South Africa’s diverse cultural heritage.

Lushaka (Tshivenda) = Nation / People
Urithi (Swahili) = Heritage / Inheritance
Lushaka Urithi → Heritage of the People
Project Overview

Lushaka Urithi is designed as a culturally driven marketplace where individuals can buy and sell traditional and pre-loved African fashion items. The system supports three user roles: Buyer, Seller, and Admin, each with dedicated dashboards and functionality.

The project was developed for academic purposes and runs locally using XAMPP.

Features
-Buyer
-Register and login
-Browse products by culture and category
-Add products to cart
-Checkout and place orders
-View order history
-Message sellers

Seller
-Seller dashboard
-Upload products with images
-Edit and delete products
-View orders from buyers
-Communicate with buyers

Admin
-Admin dashboard
-Manage users
-Manage products
-Manage categories
-Monitor platform activity

***Technology Stack***
Frontend
-HTML5
-CSS3
-JavaScript

Backend
-PHP (server-side logic, sessions, authentication)

Database
-MySQL

Development Environment
-XAMPP
-Apache Web Server
-phpMyAdmin

**System Architecture**
Client (Browser)
   ↓
Apache Server (XAMPP)
   ↓
PHP Backend Logic
   ↓
MySQL Database


Installation

Follow these steps to run the project locally:
-Install XAMPP
Download XAMPP from the Apache Friends website
Install with Apache and MySQL enabled

- Start Required Services
Open XAMPP Control Panel
Start Apache and MySQL
Clone or Copy the Project
Place the project folder inside:
C:\xampp\htdocs\lushaka-urithi

- Set Up the Database
Open your browser and go to:
http://localhost/phpmyadmin
Create a new database (e.g. lushaka_urithi)
Import the provided .sql file

-Configure Database Connection

Edit db.php:

$host = "localhost";
$user = "root";
$password = "";
$database = "lushaka_urithi";
Usage
Access the Website

Open your browser and navigate to:
http://localhost/lushaka-urithi/

Test Login Credentials
Role	Username	Password
Buyer	Kutloano	Shandu
Seller	Tali	Shandu
Admin	Talifhani	Shandu

Use these accounts to explore different system roles.
