-- MASTER TABLE

CREATE TABLE PaymentTypes (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    payment_name VARCHAR(32) NOT NULL
);

CREATE TABLE AdminRoles (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    role_name VARCHAR(32) NOT NULL
);

CREATE TABLE TrashTypes (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    type_name VARCHAR(32) NOT NULL,
    price_per_100g DECIMAL(8) NOT NULL,
    price_per_kg DECIMAL(8) NOT NULL
);

-- MASTER YANG PERLU DIGENERATE

CREATE TABLE Customers (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    username VARCHAR(32) NOT NULL,
    password VARCHAR(32) NOT NULL,
    name VARCHAR(64) NOT NULL,
    phone_number VARCHAR(16),
    balance DECIMAL(8) NOT NULL
);

CREATE TABLE Admins (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    username VARCHAR(32) NOT NULL,
    password VARCHAR(32) NOT NULL,
    name VARCHAR(64) NOT NULL,
    phone_number VARCHAR(16),
    admin_role_id INT NOT NULL FOREIGN KEY REFERENCES AdminRoles(id)
);

CREATE TABLE TrashCollectors (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    username VARCHAR(32) NOT NULL,
    password VARCHAR(32) NOT NULL,
    contact_name VARCHAR(64) NOT NULL,
    contact_phone VARCHAR(16) NOT NULL,
    contact_address VARCHAR(128) NOT NULL
);

CREATE TABLE Locations (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    location_name VARCHAR(32) NOT NULL,
    address VARCHAR(128) NOT NULL
);

CREATE TABLE GarbageCenters (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    location_name VARCHAR(32) NOT NULL,
    address VARCHAR(128) NOT NULL
);

-- TRANSACTION TABLE

CREATE TABLE Transactions (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    datetime DATETIME2 NOT NULL,
    admin_id INT NOT NULL FOREIGN KEY REFERENCES Admins(id),
    customer_id INT NOT NULL FOREIGN KEY REFERENCES Customers(id),
    location_id INT NOT NULL FOREIGN KEY REFERENCES Locations(id),
    total_weight_g FLOAT DEFAULT 0,
    total_cost DECIMAL(8) DEFAULT 0
);

CREATE TABLE TransactionItems (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    transaction_id INT NOT NULL FOREIGN KEY REFERENCES Transactions(id),
    trash_type_id INT NOT NULL FOREIGN KEY REFERENCES TrashTypes(id),
    total_weight_g FLOAT NOT NULL,
    total_cost DECIMAL(8) NOT NULL
);

CREATE TABLE TrashSales (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    datetime DATETIME2 NOT NULL,
    admin_id INT NOT NULL FOREIGN KEY REFERENCES Admins(id),
    trash_collector_id INT NOT NULL FOREIGN KEY REFERENCES TrashCollectors(id),
    garbage_center_id INT NOT NULL FOREIGN KEY REFERENCES GarbageCenters(id),
    total_weight_kg FLOAT DEFAULT 0,
    total_price DECIMAL(8) DEFAULT 0
);

CREATE TABLE TrashSaleItems (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    trash_sale_id INT NOT NULL FOREIGN KEY REFERENCES TrashSales(id),
    trash_type_id INT NOT NULL FOREIGN KEY REFERENCES TrashTypes(id),
    total_weight_kg FLOAT NOT NULL,
    total_price DECIMAL(8) NOT NULL
);

CREATE TABLE Reports (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    datetime DATETIME2 NOT NULL,
    location_id INT NOT NULL FOREIGN KEY REFERENCES Locations(id),
    garbage_center_id INT NOT NULL FOREIGN KEY REFERENCES GarbageCenters(id),
    total_weight_g FLOAT DEFAULT 0
);

CREATE TABLE ReportItems (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    report_id INT NOT NULL FOREIGN KEY REFERENCES Reports(id),
    trash_type_id INT NOT NULL FOREIGN KEY REFERENCES TrashTypes(id),
    total_weight_g FLOAT NOT NULL,
);

CREATE TABLE Withdrawals (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    datetime DATETIME2 NOT NULL,
    customer_id INT NOT NULL FOREIGN KEY REFERENCES Customers(id),
    payment_type_id INT NOT NULL FOREIGN KEY REFERENCES PaymentTypes(id),
    total_withdrawal DECIMAL(8) NOT NULL
);

-- LOG TABLE

CREATE TABLE RegistrationLog (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    datetime DATETIME2 NOT NULL,
    registered_username VARCHAR(32)
)
