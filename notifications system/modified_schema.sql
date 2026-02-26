CREATE TABLE delivery_attempts (
    attempt_id INT PRIMARY KEY,
    mr_id INT NOT NULL,
    attempt_status VARCHAR(20),
    attempt_time DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_attempt
    FOREIGN KEY (mr_id) REFERENCES message_recipients(mr_id)
);
CREATE TABLE message_recipients (
    mr_id INT PRIMARY KEY,
    message_id INT NOT NULL,
    recipient_id INT NOT NULL,
    delivery_status VARCHAR(20) DEFAULT 'PENDING',
    read_at DATETIME2 NULL,

    CONSTRAINT FK_msg
    FOREIGN KEY (message_id) REFERENCES created_messages(message_id),

    CONSTRAINT FK_recipient
    FOREIGN KEY (recipient_id) REFERENCES customer(user_id)
);
CREATE TABLE old_versions (
    message_id INT PRIMARY KEY,
    final_message NVARCHAR(MAX),
    time_modified DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_old_msg
    FOREIGN KEY (message_id) REFERENCES created_messages(message_id)
);
CREATE TABLE created_messages (
    message_id INT PRIMARY KEY,
    sender_id INT NOT NULL,
    template_id INT NULL,
    manual_message NVARCHAR(MAX),
    final_message NVARCHAR(MAX) NOT NULL,
    channel_id INT,
    module_id INT,
    created_at DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_sender
    FOREIGN KEY (sender_id) REFERENCES staff(user_id),

    CONSTRAINT FK_template
    FOREIGN KEY (template_id) REFERENCES templates(template_id),

    CONSTRAINT FK_channel
    FOREIGN KEY (channel_id) REFERENCES sent_channel(channel_id),

    CONSTRAINT FK_module
    FOREIGN KEY (module_id) REFERENCES module(module_id)
);
CREATE TABLE sent_channel (
    channel_id INT PRIMARY KEY,
    sent_through VARCHAR(100)
);
CREATE TABLE module (
    module_id INT PRIMARY KEY,
    module_name VARCHAR(50)
);
CREATE TABLE templates (
    template_id INT PRIMARY KEY,
    template_body NVARCHAR(MAX) NOT NULL
);
CREATE TABLE customer (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    customer_type VARCHAR(50),
    email VARCHAR(200)
);
CREATE TABLE staff (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    staff_type VARCHAR(50),
    email VARCHAR(200)
);
