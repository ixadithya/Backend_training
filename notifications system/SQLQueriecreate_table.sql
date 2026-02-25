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
