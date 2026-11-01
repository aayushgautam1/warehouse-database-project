-- Database Creation
CREATE DATABASE WarehouseDB;
USE WarehouseDB;

-- 1. Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

-- 2. Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(150) NOT NULL,
    ContactName VARCHAR(100),
    Phone VARCHAR(30),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

-- 3. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductCode VARCHAR(50) NOT NULL,
    ProductName VARCHAR(150) NOT NULL,
    UnitCost DECIMAL(10,2) NOT NULL,
    SalePrice DECIMAL(10,2) NOT NULL,
    Weight DECIMAL(8,2),
    CategoryID INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- 4. Warehouses Table
CREATE TABLE Warehouses (
    WarehouseID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    ManagerName VARCHAR(100)
);

-- 5. Stock_Inventory Table 
CREATE TABLE Stock_Inventory (
    StockID INT PRIMARY KEY AUTO_INCREMENT,
    QuantityInStock INT NOT NULL,
    ReorderLevel INT NOT NULL,
    LastRestockedDate DATE,
    ProductID INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);