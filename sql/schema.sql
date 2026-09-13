create table customer(
    customer_id varchar(20) primary key,
    gender varchar(10),
    senior_citizen boolean,
    partner boolean,
    dependents boolean,
    tenure int
);

CREATE TABLE IF NOT EXISTS services (
    customer_id VARCHAR(20) PRIMARY KEY,

    phone_service BOOLEAN,
    multiple_lines VARCHAR(30),

    internet_service VARCHAR(30),
    online_security VARCHAR(30),
    online_backup VARCHAR(30),
    device_protection VARCHAR(30),
    tech_support VARCHAR(30),

    streaming_tv VARCHAR(30),
    streaming_movies VARCHAR(30),

    CONSTRAINT fk_services_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS billing (
    customer_id VARCHAR(20) PRIMARY KEY,

    contract VARCHAR(30),
    paperless_billing BOOLEAN,
    payment_method VARCHAR(50),

    monthly_charges NUMERIC(10, 2),
    total_charges NUMERIC(12, 2),

    CONSTRAINT fk_billing_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


create table churn_status(
    customer_id varchar(20) primary key,
    churn boolean not null,

    constraint fk_customer foreign key (customer_id) references customer(customer_id)
);