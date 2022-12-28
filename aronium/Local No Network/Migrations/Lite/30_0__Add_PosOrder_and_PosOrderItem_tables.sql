DROP TABLE IF EXISTS PosOrder;
DROP TABLE IF EXISTS PosOrderItem;

CREATE TABLE PosOrder 
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    UserId INTEGER REFERENCES User (Id) NOT NULL, 
    Number TEXT NOT NULL, 
    Discount NUMERIC NOT NULL DEFAULT (0), 
    DiscountType INTEGER NOT NULL DEFAULT (0),
    Total NUMERIC
);

CREATE TABLE PosOrderItem (
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    PosOrderId INTEGER REFERENCES PosOrder (Id) ON DELETE CASCADE NOT NULL,  
    ProductId INTEGER REFERENCES Product (Id) NOT NULL, 
    RoundNumber INTEGER NOT NULL DEFAULT (0), 
    Quantity NUMERIC NOT NULL, 
    Price NUMERIC NOT NULL, 
    IsLocked INTEGER (1) NOT NULL DEFAULT (0),
    Discount NUMERIC NOT NULL DEFAULT (0), 
    DiscountType INT NOT NULL DEFAULT (0), 
    IsFeatured INT (1) NOT NULL DEFAULT 0,  
    VoidedBy INTEGER REFERENCES User (Id), 
    Comment TEXT, 
    DateCreated DATE NOT NULL
);

INSERT INTO PosOrder (UserId, Number, Total) SELECT DISTINCT UserId, OrderNumber, SUM(Quantity * Price) FROM OrderItem GROUP BY UserId, OrderNumber;

INSERT INTO PosOrderItem 
(
    PosOrderId,
    ProductId,
    RoundNumber,
    Quantity,
    Price,
    IsLocked,
    Discount,
    DiscountType,
    IsFeatured,
    VoidedBy,
    Comment,
    DateCreated
)
SELECT  O.Id, 
        I.ProductId, 
        I.RoundNumber, 
        I.Quantity, 
        I.Price, 
        I.IsLocked, 
        I.Discount, 
        I.DiscountType, 
        I.IsFeatured,
        I.VoidedBy, 
        I.Comment, 
        I.DateCreated 
FROM    PosOrder O 
        INNER JOIN OrderItem I ON I.OrderNumber = O.Number AND I.userId = O.UserId
ORDER BY I.RoundNumber, I.DateCreated;     

DROP TABLE OrderItem;