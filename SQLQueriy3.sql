CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    user_type VARCHAR(50)
        CHECK (user_type IN ('customer','shipment','invoice','claim','accounts','sales')),
    email VARCHAR(200) UNIQUE
);

CREATE TABLE templates (
    template_id INT PRIMARY KEY,
    template_body NVARCHAR(MAX) NOT NULL
);

CREATE TABLE created_messages (
    message_id INT PRIMARY KEY,
    sender_id INT NOT NULL,
    template_id INT NULL,
    manual_message NVARCHAR(MAX) NULL,
    final_message NVARCHAR(MAX) NOT NULL,
    module_type VARCHAR(50)
        CHECK (module_type IN ('shipment','invoice','claim')),
    created_at DATETIME2 DEFAULT SYSDATETIME(),

    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (template_id) REFERENCES templates(template_id),

    CHECK (
        template_id IS NOT NULL 
        OR manual_message IS NOT NULL
    )
);

CREATE TABLE message_recipients (
    mr_id INT PRIMARY KEY,
    message_id INT NOT NULL,
    recipient_id INT NOT NULL,
    delivery_status VARCHAR(20)
        DEFAULT 'pending'
        CHECK (delivery_status IN ('pending','sent','failed')),
    read_at DATETIME2 NULL,

    FOREIGN KEY (message_id) REFERENCES created_messages(message_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id),

    UNIQUE(message_id, recipient_id)
);

CREATE TABLE delivery_attempts (
    attempt_id INT IDENTITY(1,1) PRIMARY KEY,
    mr_id INT NOT NULL,
    attempt_status VARCHAR(20)
        CHECK (attempt_status IN ('pending','sent','failed')),
    attempt_time DATETIME2 DEFAULT SYSDATETIME(),

    FOREIGN KEY (mr_id) REFERENCES message_recipients(mr_id)
);

CREATE TRIGGER trg_auto_attempt_on_recipient
ON message_recipients
AFTER INSERT
AS
BEGIN
    INSERT INTO delivery_attempts (mr_id, attempt_status)
    SELECT mr_id, 'pending'
    FROM inserted;
END;

INSERT INTO users VALUES
(1,'Adithya','customer','adi@gmail.com'),
(2,'Dinesh','invoice','dinesh@company.com'),
(3,'Sujith','shipment','sujith@company.com'),
(4,'Jaideep','accounts','jaideep@company.com'),
(5,'Rahul','claim','rahul@company.com'),
(6,'Anita','sales','anita@company.com');

INSERT INTO templates VALUES
(1,'Shipment #{id} is delayed'),
(2,'Invoice #{id} payment confirmed'),
(3,'Claim #{id} cashback approved');

INSERT INTO created_messages
(message_id,sender_id,template_id,manual_message,final_message,module_type)
VALUES
(100,3,1,NULL,'Shipment SHP001 is delayed','shipment');

INSERT INTO created_messages
(message_id,sender_id,template_id,manual_message,final_message,module_type)
VALUES
(101,2,2,NULL,'Invoice INV101 payment confirmed','invoice');

INSERT INTO created_messages
(message_id,sender_id,template_id,manual_message,final_message,module_type)
VALUES
(102,5,3,NULL,'Claim CLM200 cashback approved','claim');

INSERT INTO created_messages
(message_id,sender_id,template_id,manual_message,final_message,module_type)
VALUES
(103,2,NULL,'Manual Invoice Reminder',
'Invoice INV102 is overdue','invoice');

INSERT INTO created_messages
(message_id,sender_id,template_id,manual_message,final_message,module_type)
VALUES
(104,3,NULL,'Manual Shipment Update',
'Shipment SHP002 will arrive tomorrow','shipment');

INSERT INTO message_recipients
(mr_id,message_id,recipient_id)
VALUES
(1,100,1),
(2,100,4),
(3,101,1),
(4,102,4),
(5,103,1),
(6,103,4),
(7,104,1),
(8,104,6);

UPDATE message_recipients
SET delivery_status='sent'
WHERE mr_id IN (1,3,4,5);

UPDATE message_recipients
SET delivery_status='failed'
WHERE mr_id IN (2,6);

UPDATE message_recipients
SET read_at = SYSDATETIME()
WHERE mr_id = 1;



select u.user_id,u.name,m.message_id,r.recipient_id,(select distinct u1.name from users as u1 join message_recipients as r1 on r1.recipient_id=u1.user_id where r.recipient_id=r1.recipient_id) as recipients_name ,m.final_message from users as u join created_messages as m on m.sender_id=u.user_id join message_recipients as r on r.message_id=m.message_id

select * from message_recipients where recipient_id=1