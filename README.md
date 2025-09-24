# Online Bookstore

An **Online Bookstore** web application built with **Java Servlets, JSP, and MySQL**.  
This project allows customers to browse books, manage their cart, place orders, and enables the admin to manage books and view all orders.

---

## 🚀 Features

### Customer
- Register and login  
- Browse books by category  
- Add books to the cart with quantity selection  
- View cart and total price  
- Place orders  
- View past orders  

### Admin
- Login as admin  
- View all orders placed by customers  
- (Optional) Manage books (add, update, delete)  

### Common
- Session-based login/logout  
- Simple and responsive UI with CSS styling  
- Proper data validation and error handling  

---

## 🛠 Technology Stack
- **Frontend:** JSP, HTML, CSS  
- **Backend:** Java Servlets  
- **Database:** MySQL  
- **Server:** Apache Tomcat  

---

## 💾 Database Tables

### `register1` (Users)
| Column   | Type |
|----------|------|
| fullname | VARCHAR(100) |
| email    | VARCHAR(100) PRIMARY KEY |
| password | VARCHAR(50) |
| gender   | VARCHAR(10) |
| city     | VARCHAR(50) |
| role     | VARCHAR(10) DEFAULT 'customer' |

### `books`
| Column      | Type |
|-------------|------|
| id          | INT AUTO_INCREMENT PRIMARY KEY |
| title       | VARCHAR(100) |
| author      | VARCHAR(100) |
| category    | VARCHAR(50) |
| price       | DOUBLE |
| stock       | INT |
| description | TEXT |
| image       | VARCHAR(255) |

### `cart`
| Column          | Type |
|-----------------|------|
| id              | INT AUTO_INCREMENT PRIMARY KEY |
| customer_email  | VARCHAR(100) FOREIGN KEY REFERENCES register1(email) |
| book_id         | INT FOREIGN KEY REFERENCES books(id) |
| quantity        | INT |
| added_at        | TIMESTAMP DEFAULT CURRENT_TIMESTAMP |

### `orders`
| Column          | Type |
|-----------------|------|
| id              | INT AUTO_INCREMENT PRIMARY KEY |
| customer_email  | VARCHAR(100) FOREIGN KEY REFERENCES register1(email) |
| book_id         | INT FOREIGN KEY REFERENCES books(id) |
| quantity        | INT |
| total_price     | DOUBLE |
| order_date      | TIMESTAMP DEFAULT CURRENT_TIMESTAMP |

---

## ⚙️ Setup Instructions

1. **Clone the repository**
```bash
git clone https://github.com/PKpavankalyan-byte/OnlineBookStore.git
Database Setup

Create a MySQL database named register.

Run SQL scripts to create the tables: register1, books, cart, orders.

(Optional) Insert sample books for testing.

Deploy on Apache Tomcat

Copy the project folder to webapps directory of Tomcat.

Start Tomcat server and access:

http://localhost:8080/OnlineBookStore


Admin Login

Add an admin manually in the register1 table:

INSERT INTO register1 (fullname, email, password, gender, city, role)
VALUES ('Admin User', 'admin@example.com', 'admin123', 'Male', 'Hyderabad', 'admin');

🎨 Screenshots

(Add screenshots of key pages like Customer Dashboard, Cart, Orders, Admin Dashboard here)

📝 Future Enhancements

Full book management (CRUD) for admin

Search and filter books by category, author, or price

Email notifications for orders

User profile update and password reset

📌 Author

Pavan Kalyan – Computer Science Engineering Student
GitHub: https://github.com/PKpavankalyan-byte



