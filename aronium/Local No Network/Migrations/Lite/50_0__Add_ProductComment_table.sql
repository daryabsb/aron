CREATE TABLE ProductComment (Id INTEGER PRIMARY KEY AUTOINCREMENT, ProductId INTEGER REFERENCES Product (Id) ON DELETE CASCADE NOT NULL, Comment TEXT NOT NULL);