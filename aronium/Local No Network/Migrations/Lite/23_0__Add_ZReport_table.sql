CREATE TABLE ZReport (Id INTEGER PRIMARY KEY AUTOINCREMENT, Number INTEGER NOT NULL, FromDocumentId INTEGER NOT NULL, ToDocumentId INTEGER NOT NULL, DateCreated DATETIME NOT NULL DEFAULT (datetime('now', 'localtime')));

INSERT INTO ZReport (Number, FromDocumentId, ToDocumentId) SELECT 0, 0, IFNULL(MAX(Id), 0) FROM Document WHERE IsClockedOut = 1;