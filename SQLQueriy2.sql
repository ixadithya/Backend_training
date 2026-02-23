CREATE TABLE users (
    u_id INT PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
	u_type varchar(50),
    email NVARCHAR(255) UNIQUE
);

CREATE TABLE templates (
    t_id INT PRIMARY KEY,
    body_template NVARCHAR(MAX) NOT NULL
);

CREATE TABLE notifications (
    n_id INT PRIMARY KEY,
    template_id INT NULL,
    module_type NVARCHAR(50) NOT NULL,
    body NVARCHAR(MAX) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT template
        FOREIGN KEY (template_id)
        REFERENCES templates(t_id)
        ON DELETE SET NULL
);

CREATE TABLE send_message (
    m_id INT PRIMARY KEY,
    n_id INT NOT NULL,
    recever_id INT NOT NULL,
    delivery_status NVARCHAR(20) NOT NULL DEFAULT 'pending',
    read_at DATETIME2 NULL,

    FOREIGN KEY (n_id) REFERENCES notifications(n_id),
    FOREIGN KEY (recever_id) REFERENCES users(u_id),

    CHECK (delivery_status IN ('pending','sent','failed')),
    UNIQUE (n_id, recever_id)
);


CREATE TABLE notification_attempts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    message_id INT NOT NULL,
    status NVARCHAR(20) NOT NULL,
    attempt_time DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_attempts_recipient
        FOREIGN KEY (message_id)
        REFERENCES send_message(m_id)
);

INSERT INTO users (u_id, name, u_type, email) VALUES
(1, 'Adithya', 'customer', 'adithya@email.com'),
(2, 'dinesh', 'sales', 'dinesh@company.com'),
(3, 'sujith', 'delivery', 'sujith@company.com'),
(4, 'jaideep', 'accounts', 'jaideep@company.com');


INSERT INTO templates (t_id, body_template) VALUES
(1, 'Shipment update: your order is on the way'),
(2, 'Invoice confirmation: payment received'),
(3, 'Claim update: cashback approved');


INSERT INTO notifications (n_id, template_id, module_type, body)
VALUES
(100, 1, 'shipment-track', 'Shipment #SHP001 is out for delivery');


INSERT INTO send_message (m_id, n_id, recever_id, delivery_status)
VALUES
(1001, 100, 2, 'pending'),   -- sales
(1002, 100, 3, 'pending'),   -- delivery
(1003, 100, 4, 'pending');   -- accounts


INSERT INTO notification_attempts (message_id, status)
VALUES
(1001, 'sent'),
(1002, 'sent'),
(1003, 'failed');

UPDATE send_message
SET read_at = SYSDATETIME(),
    delivery_status = 'sent'
WHERE m_id = 1001;

select * from send_message

INSERT INTO templates (t_id, body_template) VALUES
(4, 'Delivery delayed due to weather conditions'),
(5, 'Invoice overdue reminder'),
(6, 'Claim rejected — contact support');

INSERT INTO notifications (n_id, template_id, module_type, body) VALUES
(101, 2, 'invoice-confirm', 'Invoice #INV1001 payment confirmed'),
(102, 3, 'claim-cashback', 'Claim #CLM500 approved — cashback issued'),
(103, 4, 'shipment-track', 'Shipment #SHP002 delayed due to weather'),
(104, 5, 'invoice-confirm', 'Invoice #INV1002 is overdue'),
(105, 6, 'claim-cashback', 'Claim #CLM501 rejected');


INSERT INTO send_message (m_id, n_id, recever_id, delivery_status) VALUES
-- Invoice confirmation sent to accounts + sales
(1004, 101, 2, 'pending'),
(1005, 101, 4, 'pending'),

-- Claim approval sent to customer + accounts
(1006, 102, 1, 'pending'),
(1007, 102, 4, 'pending'),

-- Shipment delay sent to delivery + sales
(1008, 103, 3, 'pending'),
(1009, 103, 2, 'pending'),

-- Invoice overdue sent to accounts
(1010, 104, 4, 'pending'),

-- Claim rejected sent to customer
(1011, 105, 1, 'pending');


INSERT INTO notification_attempts (message_id, status) VALUES
(1004, 'sent'),
(1005, 'sent'),
(1006, 'sent'),
(1007, 'sent'),
(1008, 'failed'),
(1009, 'sent'),
(1010, 'sent'),
(1011, 'sent');


select * from notification_attempts
select * from notifications
select * from send_message
select * from templates
select * from users

UPDATE send_message
SET delivery_status = 'sent'
WHERE m_id IN (1007, 1008, 1010, 1005);
