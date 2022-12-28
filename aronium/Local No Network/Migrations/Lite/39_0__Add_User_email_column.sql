ALTER TABLE User ADD COLUMN Email TEXT;
CREATE UNIQUE INDEX UX_UserEmail ON User(Email);

UPDATE User SET Email=(SELECT Value FROM ApplicationProperty WHERE Name='Application.User.Email') WHERE Id = (SELECT Id From User ORDER BY AccessLevel DESC, Id ASC LIMIT 1);