
# E-Shop: Customer-to-Customer (C2C) E-Commerce Platform

Welcome to **E-Shop**, a full-featured Customer-to-Customer (C2C) e-commerce platform. This application allows users to buy and sell products directly with one another. The platform supports three user roles: **buyers**, **sellers**, and **administrators**, each with dedicated features and interfaces.

---

## 🌐 Live Preview
*To use locally, launch via XAMPP or any PHP-enabled local server.*

---

## 📦 Project Structure

```
/e-shop/
├── index.html
├── productspage.html
├── shoppingcartpage.html
├── loginpage.html
├── registerpage.html
├── profile.html
├── myorders.html
├── sellerdashboard.html
├── sellitem.html
├── admin_dashboard.html
├── viewitempage.html
│
├── contactpage.html
├── faqpage.html
├── helppage.html
├── privacypage.html
├── returnpolicypage.html
├── shippingpolicypage.html
├── termsandconditionspage.html
│
├── style.css
├── navigation.js
├── footer.js
│
├── db.php
├── login.php
├── register.php
├── change_password.php
├── update_password.php
├── profile_update.php
│
├── create_item.php
├── update_item.php
├── delete_item.php
├── get_item.php
├── get_seller_items.php
├── get_seller_stats.php
│
├── place_order.php
├── get_orders.php
├── get_seller_orders.php
├── update_order_status.php
│
├── submit_review.php
├── get_reviews.php
├── get_seller_reviews.php
├── get_all_reviews.php
├── delete_review.php
│
├── submit_report.php
├── get_all_reports.php
├── delete_report.php
│
├── get_all_users.php
├── delete_user.php
│
├── get_all_items.php
├── get_random_items.php
├── get_categories.php
│
├── get_all_orders.php
├── get_all_orders_stats.php
├── delete_order.php
```

---

## 🚀 Features

### 👤 User Authentication
- Register and login
- Profile update and password reset
- Session-based login persistence

### 🛍️ Buyer Capabilities
- Browse products by category and keyword
- Add items to cart
- Checkout and place orders
- View order history
- Submit reviews and report issues

### 📦 Seller Capabilities
- Upload, update, and delete items
- View items sold and statistics
- Respond to buyer messages (manual via email)

### 🛠️ Admin Capabilities
- View and manage all users, items, orders, reviews, and reports
- Remove inappropriate or fraudulent content
- Track total stats (orders, sales, items, users)

### 📚 Informational Pages
- Help Center
- FAQs
- Shipping Policy
- Return Policy
- Privacy Policy
- Terms and Conditions
- Contact Page

---

## ⚙️ Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Backend**: PHP (MySQLi)
- **Database**: MySQL (configurable via `db.php`)
- **Session Management**: JavaScript `sessionStorage`
- **API Communication**: `fetch()` and JSON-based REST endpoints

---

## 📝 Installation & Setup

### Prerequisites
- PHP 7.4+
- MySQL 5.7+
- Apache Server (e.g., XAMPP, WAMP, MAMP)

### Instructions
1. Clone or extract this project to your `htdocs` (XAMPP) or web root folder.
2. Import the SQL database (`e-shop.sql`) into MySQL (use phpMyAdmin or CLI).
3. Update `db.php` with your database credentials.
4. Start Apache and MySQL via your control panel.
5. Open your browser and navigate to:  
   ```
   http://localhost/e-shop/index.html
   ```

---

## 🛡️ Notes

- **Payments & shipping are handled outside the platform.** Users must coordinate via email after placing an order.
- This is a **C2C platform**: E-Shop is not a seller or payment processor.
- Ensure directory permissions are set appropriately if hosting online.

---

## 📧 Contact

For queries, feedback, or technical issues, please contact the project maintainer.

**Project Author**: Kieran Stadler  
**Email**: [stadlerkeiran@gail.com]

---

## 📄 License

This project is open-source and free to use for educational and non-commercial purposes.
