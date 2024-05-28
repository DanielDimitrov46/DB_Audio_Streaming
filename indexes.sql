-- simple index
CREATE INDEX idx_username ON Account(Username);

-- Composite index
CREATE INDEX idx_firstname_email ON Account(FirstName, Email);

-- Prefix
CREATE INDEX idx_email_prefix ON Account(Email(10));