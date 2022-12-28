DROP TABLE IF EXISTS LoyaltyCard;

CREATE TABLE LoyaltyCard 
(
	Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
	CustomerId INTEGER REFERENCES Customer (Id) ON DELETE CASCADE NOT NULL, 
	CardNumber TEXT 
);

CREATE INDEX IX_LoyaltyCard_CustomerId ON LoyaltyCard (CustomerId);
CREATE INDEX IX_CustomerDiscount_CustomerId ON CustomerDiscount (CustomerId);