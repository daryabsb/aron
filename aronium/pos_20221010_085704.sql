------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "ApplicationProperty"
-- ------------------------------------------

CREATE TABLE "ApplicationProperty"(
	"Name" Text NOT NULL PRIMARY KEY,
	"Value" Text );


BEGIN;

INSERT INTO "ApplicationProperty" ("Name","Value") VALUES 
( 'Application.Api.BaseUrl', 'https://api.aronium.com/api' ),
( 'Application.Id', '68dd0920-fe74-4e21-b040-e2f396537fd0' ),
( 'Application.User.Email', 'daryabsb@gmail.com' ),
( 'GuidedTour.Management.Products', '1' ),
( 'GuidedTour.Management.Customers.Add', '1' ),
( 'Database.Backup.Version', '1.38.1.1' ),
( 'Account.RefreshToken', 'c64887bb1cf14c7bbceef0e85d346731' ),
( 'GuidedTour.Management.Products.Add', '1' ),
( 'GuidedTour.Layout.SearchBox', '1' ),
( 'MovingAveragePrice.Enabled', 'False' ),
( 'Application.OnboardingStatus', '2' );



COMMIT;

-- ------------------------------------------
-- Dump of "Barcode"
-- ------------------------------------------

CREATE TABLE "Barcode"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"Value" Text NOT NULL,
	CONSTRAINT "Barcode_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_Barcode_Product" ON "Barcode"( "ProductId" );

BEGIN;

INSERT INTO "Barcode" ("Id","ProductId","Value") VALUES 
( 1, 1, '2209121633021' );



COMMIT;

-- ------------------------------------------
-- Dump of "Company"
-- ------------------------------------------

CREATE TABLE "Company"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Address" Text,
	"PostalCode" Text,
	"City" Text,
	"CountryId" Integer NOT NULL,
	"TaxNumber" Text,
	"Email" Text,
	"PhoneNumber" Text,
	"Logo" BLOB,
	"BankAccountNumber" Text,
	"BankDetails" Text,
	CONSTRAINT "Company_Country_NO ACTION_NO ACTION_CountryId_Id_0" FOREIGN KEY ( "CountryId" ) REFERENCES "Country"( "Id" )
 );


-- ------------------------------------------
-- Dump of "Counter"
-- ------------------------------------------

CREATE TABLE "Counter"(
	"Name" Text NOT NULL PRIMARY KEY,
	"Value" Integer NOT NULL );


BEGIN;

INSERT INTO "Counter" ("Name","Value") VALUES 
( 'Document.200.2022', 5 ),
( 'Receipt', 10 );



COMMIT;

-- ------------------------------------------
-- Dump of "Country"
-- ------------------------------------------

CREATE TABLE "Country"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text );


BEGIN;

INSERT INTO "Country" ("Id","Name","Code") VALUES 
( 1, 'Afghanistan', 'AF' ),
( 2, 'Albania', 'AL' ),
( 3, 'Algeria', 'DZ' ),
( 4, 'American Samoa', 'AS' ),
( 5, 'Andorra', 'AD' ),
( 6, 'Angola', 'AO' ),
( 7, 'Anguilla', 'AI' ),
( 8, 'Antarctica', 'AQ' ),
( 9, 'Antigua And Barbuda', 'AG' ),
( 10, 'Argentina', 'AR' ),
( 11, 'Armenia', 'AM' ),
( 12, 'Aruba', 'AW' ),
( 13, 'Australia', 'AU' ),
( 14, 'Austria', 'AT' ),
( 15, 'Azerbaijan', 'AZ' ),
( 16, 'Bahamas', 'BS' ),
( 17, 'Bahrain', 'BH' ),
( 18, 'Bangladesh', 'BD' ),
( 19, 'Barbados', 'BB' ),
( 20, 'Belarus', 'BY' ),
( 21, 'Belgium', 'BE' ),
( 22, 'Belize', 'BZ' ),
( 23, 'Benin', 'BJ' ),
( 24, 'Bermuda', 'BM' ),
( 25, 'Bhutan', 'BT' ),
( 26, 'Bolivia', 'BO' ),
( 27, 'Bosnia And Herzegovina', 'BA' ),
( 28, 'Botswana', 'BW' ),
( 29, 'Bouvet Island', 'BV' ),
( 30, 'Brazil', 'BR' ),
( 31, 'British Indian Ocean Territory', 'IO' ),
( 32, 'Brunei Darussalam', 'BN' ),
( 33, 'Bulgaria', 'BG' ),
( 34, 'Burkina Faso', 'BF' ),
( 35, 'Burundi', 'BI' ),
( 36, 'Cambodia', 'KH' ),
( 37, 'Cameroon', 'CM' ),
( 38, 'Canada', 'CA' ),
( 39, 'Cape Verde', 'CV' ),
( 40, 'Cayman Islands', 'KY' ),
( 41, 'Central African Republic', 'CF' ),
( 42, 'Chad', 'TD' ),
( 43, 'Chile', 'CL' ),
( 44, 'China', 'CN' ),
( 45, 'Christmas Island', 'CX' ),
( 46, 'Cocos (keeling) Islands', 'CC' ),
( 47, 'Colombia', 'CO' ),
( 48, 'Comoros', 'KM' ),
( 49, 'Congo', 'CG' ),
( 50, 'Congo, The Democratic Republic Of The', 'CD' ),
( 51, 'Cook Islands', 'CK' ),
( 52, 'Costa Rica', 'CR' ),
( 53, 'Cote D''ivoire', 'CI' ),
( 54, 'Croatia', 'HR' ),
( 55, 'Cuba', 'CU' ),
( 56, 'Cyprus', 'CY' ),
( 57, 'Czech Republic', 'CZ' ),
( 58, 'Denmark', 'DK' ),
( 59, 'Djibouti', 'DJ' ),
( 60, 'Dominica', 'DM' ),
( 61, 'Dominican Republic', 'DO' ),
( 62, 'East Timor', 'TP' ),
( 63, 'Ecuador', 'EC' ),
( 64, 'Egypt', 'EG' ),
( 65, 'El Salvador', 'SV' ),
( 66, 'Equatorial Guinea', 'GQ' ),
( 67, 'Eritrea', 'ER' ),
( 68, 'Estonia', 'EE' ),
( 69, 'Ethiopia', 'ET' ),
( 70, 'Falkland Islands (malvinas)', 'FK' ),
( 71, 'Faroe Islands', 'FO' ),
( 72, 'Fiji', 'FJ' ),
( 73, 'Finland', 'FI' ),
( 74, 'France', 'FR' ),
( 75, 'French Guiana', 'GF' ),
( 76, 'French Polynesia', 'PF' ),
( 77, 'French Southern Territories', 'TF' ),
( 78, 'Gabon', 'GA' ),
( 79, 'Gambia', 'GM' ),
( 80, 'Georgia', 'GE' ),
( 81, 'Germany', 'DE' ),
( 82, 'Ghana', 'GH' ),
( 83, 'Gibraltar', 'GI' ),
( 84, 'Greece', 'GR' ),
( 85, 'Greenland', 'GL' ),
( 86, 'Grenada', 'GD' ),
( 87, 'Guadeloupe', 'GP' ),
( 88, 'Guam', 'GU' ),
( 89, 'Guatemala', 'GT' ),
( 90, 'Guinea', 'GN' ),
( 91, 'Guinea-bissau', 'GW' ),
( 92, 'Guyana', 'GY' ),
( 93, 'Haiti', 'HT' ),
( 94, 'Heard Island And Mcdonald Islands', 'HM' ),
( 95, 'Holy See (vatican City State)', 'VA' ),
( 96, 'Honduras', 'HN' ),
( 97, 'Hong Kong', 'HK' ),
( 98, 'Hungary', 'HU' ),
( 99, 'Iceland', 'IS' ),
( 100, 'India', 'IN' ),
( 101, 'Indonesia', 'ID' ),
( 102, 'Iran, Islamic Republic Of', 'IR' ),
( 103, 'Iraq', 'IQ' ),
( 104, 'Ireland', 'IE' ),
( 105, 'Israel', 'IL' ),
( 106, 'Italy', 'IT' ),
( 107, 'Jamaica', 'JM' ),
( 108, 'Japan', 'JP' ),
( 109, 'Jordan', 'JO' ),
( 110, 'Kazakstan', 'KZ' ),
( 111, 'Kenya', 'KE' ),
( 112, 'Kiribati', 'KI' ),
( 113, 'Korea, Democratic People''s Republic Of', 'KP' ),
( 114, 'Korea, Republic Of', 'KR' ),
( 115, 'Kosovo', 'KV' ),
( 116, 'Kuwait', 'KW' ),
( 117, 'Kyrgyzstan', 'KG' ),
( 118, 'Lao People''s Democratic Republic', 'LA' ),
( 119, 'Latvia', 'LV' ),
( 120, 'Lebanon', 'LB' ),
( 121, 'Lesotho', 'LS' ),
( 122, 'Liberia', 'LR' ),
( 123, 'Libyan Arab Jamahiriya', 'LY' ),
( 124, 'Liechtenstein', 'LI' ),
( 125, 'Lithuania', 'LT' ),
( 126, 'Luxembourg', 'LU' ),
( 127, 'Macau', 'MO' ),
( 128, 'Macedonia, The Former Yugoslav Republic Of', 'MK' ),
( 129, 'Madagascar', 'MG' ),
( 130, 'Malawi', 'MW' ),
( 131, 'Malaysia', 'MY' ),
( 132, 'Maldives', 'MV' ),
( 133, 'Mali', 'ML' ),
( 134, 'Malta', 'MT' ),
( 135, 'Marshall Islands', 'MH' ),
( 136, 'Martinique', 'MQ' ),
( 137, 'Mauritania', 'MR' ),
( 138, 'Mauritius', 'MU' ),
( 139, 'Mayotte', 'YT' ),
( 140, 'Mexico', 'MX' ),
( 141, 'Micronesia, Federated States Of', 'FM' ),
( 142, 'Moldova, Republic Of', 'MD' ),
( 143, 'Monaco', 'MC' ),
( 144, 'Mongolia', 'MN' ),
( 145, 'Montserrat', 'MS' ),
( 146, 'Montenegro', 'ME' ),
( 147, 'Morocco', 'MA' ),
( 148, 'Mozambique', 'MZ' ),
( 149, 'Myanmar', 'MM' ),
( 150, 'Namibia', 'NA' ),
( 151, 'Nauru', 'NR' ),
( 152, 'Nepal', 'NP' ),
( 153, 'Netherlands', 'NL' ),
( 154, 'Netherlands Antilles', 'AN' ),
( 155, 'New Caledonia', 'NC' ),
( 156, 'New Zealand', 'NZ' ),
( 157, 'Nicaragua', 'NI' ),
( 158, 'Niger', 'NE' ),
( 159, 'Nigeria', 'NG' ),
( 160, 'Niue', 'NU' ),
( 161, 'Norfolk Island', 'NF' ),
( 162, 'Northern Mariana Islands', 'MP' ),
( 163, 'Norway', 'NO' ),
( 164, 'Oman', 'OM' ),
( 165, 'Pakistan', 'PK' ),
( 166, 'Palau', 'PW' ),
( 167, 'Palestinian Territory, Occupied', 'PS' ),
( 168, 'Panama', 'PA' ),
( 169, 'Papua New Guinea', 'PG' ),
( 170, 'Paraguay', 'PY' ),
( 171, 'Peru', 'PE' ),
( 172, 'Philippines', 'PH' ),
( 173, 'Pitcairn', 'PN' ),
( 174, 'Poland', 'PL' ),
( 175, 'Portugal', 'PT' ),
( 176, 'Puerto Rico', 'PR' ),
( 177, 'Qatar', 'QA' ),
( 178, 'Reunion', 'RE' ),
( 179, 'Romania', 'RO' ),
( 180, 'Russian Federation', 'RU' ),
( 181, 'Rwanda', 'RW' ),
( 182, 'Saint Helena', 'SH' ),
( 183, 'Saint Kitts And Nevis', 'KN' ),
( 184, 'Saint Lucia', 'LC' ),
( 185, 'Saint Pierre And Miquelon', 'PM' ),
( 186, 'Saint Vincent And The Grenadines', 'VC' ),
( 187, 'Samoa', 'WS' ),
( 188, 'San Marino', 'SM' ),
( 189, 'Sao Tome And Principe', 'ST' ),
( 190, 'Saudi Arabia', 'SA' ),
( 191, 'Senegal', 'SN' ),
( 192, 'Serbia', 'RS' ),
( 193, 'Seychelles', 'SC' ),
( 194, 'Sierra Leone', 'SL' ),
( 195, 'Singapore', 'SG' ),
( 196, 'Slovakia', 'SK' ),
( 197, 'Slovenia', 'SI' ),
( 198, 'Solomon Islands', 'SB' ),
( 199, 'Somalia', 'SO' ),
( 200, 'South Africa', 'ZA' ),
( 201, 'South Georgia And The South Sandwich Islands', 'GS' ),
( 202, 'Spain', 'ES' ),
( 203, 'Sri Lanka', 'LK' ),
( 204, 'Sudan', 'SD' ),
( 205, 'Suriname', 'SR' ),
( 206, 'Svalbard And Jan Mayen', 'SJ' ),
( 207, 'Swaziland', 'SZ' ),
( 208, 'Sweden', 'SE' ),
( 209, 'Switzerland', 'CH' ),
( 210, 'Syrian Arab Republic', 'SY' ),
( 211, 'Taiwan, Province Of China', 'TW' ),
( 212, 'Tajikistan', 'TJ' ),
( 213, 'Tanzania, United Republic Of', 'TZ' ),
( 214, 'Thailand', 'TH' ),
( 215, 'Togo', 'TG' ),
( 216, 'Tokelau', 'TK' ),
( 217, 'Tonga', 'TO' ),
( 218, 'Trinidad And Tobago', 'TT' ),
( 219, 'Tunisia', 'TN' ),
( 220, 'Turkey', 'TR' ),
( 221, 'Turkmenistan', 'TM' ),
( 222, 'Turks And Caicos Islands', 'TC' ),
( 223, 'Tuvalu', 'TV' ),
( 224, 'Uganda', 'UG' ),
( 225, 'Ukraine', 'UA' ),
( 226, 'United Arab Emirates', 'AE' ),
( 227, 'United Kingdom', 'GB' ),
( 228, 'United States', 'US' ),
( 229, 'United States Minor Outlying Islands', 'UM' ),
( 230, 'Uruguay', 'UY' ),
( 231, 'Uzbekistan', 'UZ' ),
( 232, 'Vanuatu', 'VU' ),
( 233, 'Venezuela', 'VE' ),
( 234, 'Viet Nam', 'VN' ),
( 235, 'Virgin Islands, British', 'VG' ),
( 236, 'Virgin Islands, U.s.', 'VI' ),
( 237, 'Wallis And Futuna', 'WF' ),
( 238, 'Western Sahara', 'EH' ),
( 239, 'Yemen', 'YE' ),
( 240, 'Zambia', 'ZM' ),
( 241, 'Zimbabwe', 'ZW' );



COMMIT;

-- ------------------------------------------
-- Dump of "Currency"
-- ------------------------------------------

CREATE TABLE "Currency"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text );


-- ------------------------------------------
-- Dump of "Customer"
-- ------------------------------------------

CREATE TABLE "Customer"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Code" Text,
	"Name" Text NOT NULL,
	"TaxNumber" Text,
	"Address" Text,
	"PostalCode" Text,
	"City" Text,
	"CountryId" Integer,
	"DateCreated" DateTime NOT NULL DEFAULT (DATETIME('now')),
	"DateUpdated" DateTime NOT NULL DEFAULT (DATETIME('now')),
	"Email" Text,
	"PhoneNumber" Text,
	"IsEnabled" Integer NOT NULL DEFAULT 1,
	"IsCustomer" Integer NOT NULL DEFAULT 1,
	"IsSupplier" Integer NOT NULL DEFAULT 1,
	"DueDatePeriod" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "Customer_Country_NO ACTION_NO ACTION_CountryId_Id_0" FOREIGN KEY ( "CountryId" ) REFERENCES "Country"( "Id" )
 );


BEGIN;

INSERT INTO "Customer" ("Id","Code","Name","TaxNumber","Address","PostalCode","City","CountryId","DateCreated","DateUpdated","Email","PhoneNumber","IsEnabled","IsCustomer","IsSupplier","DueDatePeriod") VALUES 
( 1, NULL, 'Unknown', NULL, NULL, NULL, NULL, NULL, '2016-03-27 10:15:55', '2016-03-27 10:15:55', NULL, NULL, 1, 1, 1, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "CustomerDiscount"
-- ------------------------------------------

CREATE TABLE "CustomerDiscount"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"CustomerId" Integer NOT NULL,
	"Type" Integer NOT NULL DEFAULT (0),
	"Uid" Integer,
	"Value" Real NOT NULL DEFAULT (0),
	CONSTRAINT "CustomerDiscount_Customer_CASCADE_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Cascade
,
CONSTRAINT "UK_CustomerDiscount" UNIQUE ( "CustomerId", "Type", "Uid" ) );

CREATE INDEX "IX_CustomerDiscount_CustomerId" ON "CustomerDiscount"( "CustomerId" );

-- ------------------------------------------
-- Dump of "Document"
-- ------------------------------------------

CREATE TABLE "Document"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Number" Text NOT NULL,
	"UserId" Integer NOT NULL,
	"CustomerId" Integer,
	"OrderNumber" Text,
	"Date" Date NOT NULL,
	"StockDate" DateTime NOT NULL,
	"Total" Numeric NOT NULL,
	"IsClockedOut" Integer NOT NULL DEFAULT (0),
	"DocumentTypeId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"ReferenceDocumentNumber" Text,
	"DateCreated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')),
	"DateUpdated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')),
	"InternalNote" Text,
	"Note" Text,
	"DueDate" Date,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"PaidStatus" Integer NOT NULL DEFAULT 0,
	"DiscountApplyRule" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "Document_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" ),
	CONSTRAINT "Document_Customer_NO ACTION_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" ),
	CONSTRAINT "Document_DocumentType_NO ACTION_NO ACTION_DocumentTypeId_Id_0" FOREIGN KEY ( "DocumentTypeId" ) REFERENCES "DocumentType"( "Id" ),
	CONSTRAINT "Document_Warehouse_NO ACTION_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
 );


BEGIN;

INSERT INTO "Document" ("Id","Number","UserId","CustomerId","OrderNumber","Date","StockDate","Total","IsClockedOut","DocumentTypeId","WarehouseId","ReferenceDocumentNumber","DateCreated","DateUpdated","InternalNote","Note","DueDate","Discount","DiscountType","PaidStatus","DiscountApplyRule") VALUES 
( 1, '22-200-000001', 1, 1, '3', '2022-09-12 00:00:00', '2022-09-12 16:40:26.2010575', 3500, 0, 2, 1, NULL, '2022-09-12 16:40:26.2010575', '2022-09-12 16:40:26.2010575', NULL, NULL, '2022-09-12 00:00:00', 0, 0, 2, 0 ),
( 2, '22-200-000002', 1, 1, '6', '2022-10-05 00:00:00', '2022-10-05 15:53:43.9106534', 0, 0, 2, 1, NULL, '2022-10-05 15:53:43.9106534', '2022-10-05 15:53:43.9106534', NULL, NULL, '2022-10-05 00:00:00', 0, 0, 2, 0 ),
( 3, '22-200-000003', 1, 1, '7', '2022-10-08 00:00:00', '2022-10-08 10:35:34.075068', 3000, 0, 2, 1, NULL, '2022-10-08 10:35:34.075068', '2022-10-08 10:35:34.075068', NULL, NULL, '2022-10-08 00:00:00', 0, 0, 2, 0 ),
( 4, '22-200-000004', 1, 1, '8', '2022-10-08 00:00:00', '2022-10-08 10:36:54.9011191', 3000, 0, 2, 1, NULL, '2022-10-08 10:36:54.9011191', '2022-10-08 10:36:54.9011191', NULL, NULL, '2022-10-08 00:00:00', 0, 0, 2, 0 ),
( 5, '22-200-000005', 1, 1, '9', '2022-10-08 00:00:00', '2022-10-08 13:26:04.7311885', 3000, 0, 2, 1, NULL, '2022-10-08 13:26:04.7311885', '2022-10-08 13:26:04.7311885', NULL, NULL, '2022-10-08 00:00:00', 0, 0, 2, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "DocumentCategory"
-- ------------------------------------------

CREATE TABLE "DocumentCategory"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"LanguageKey" Text );


BEGIN;

INSERT INTO "DocumentCategory" ("Id","Name","LanguageKey") VALUES 
( 1, 'Expenses', 'Document.Category.Expenses' ),
( 2, 'Sales', 'Document.Category.Sales' ),
( 3, 'Inventory', 'Document.Category.Inventory' ),
( 4, 'Loss', 'Document.Category.Loss' );



COMMIT;

-- ------------------------------------------
-- Dump of "DocumentItem"
-- ------------------------------------------

CREATE TABLE "DocumentItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"DocumentId" Integer NOT NULL,
	"ProductId" Integer NOT NULL,
	"Quantity" Numeric NOT NULL DEFAULT (0),
	"ExpectedQuantity" Numeric NOT NULL DEFAULT (0),
	"PriceBeforeTax" Numeric NOT NULL DEFAULT (0),
	"Price" Numeric NOT NULL,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"ProductCost" Numeric NOT NULL DEFAULT 0,
	"PriceBeforeTaxAfterDiscount" Numeric NOT NULL DEFAULT (0),
	"PriceAfterDiscount" Numeric NOT NULL DEFAULT (0),
	"Total" Numeric NOT NULL DEFAULT (0),
	"TotalAfterDocumentDiscount" Numeric NOT NULL DEFAULT (0),
	"DiscountApplyRule" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "DocumentItem_Document_CASCADE_NO ACTION_DocumentId_Id_0" FOREIGN KEY ( "DocumentId" ) REFERENCES "Document"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "DocumentItem_Product_NO ACTION_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
 );


BEGIN;

INSERT INTO "DocumentItem" ("Id","DocumentId","ProductId","Quantity","ExpectedQuantity","PriceBeforeTax","Price","Discount","DiscountType","ProductCost","PriceBeforeTaxAfterDiscount","PriceAfterDiscount","Total","TotalAfterDocumentDiscount","DiscountApplyRule") VALUES 
( 1, 1, 1, 1, 0, 3500, 3500, 0, 0, 3000, 3500, 3500, 3500, 3500, 0 ),
( 2, 2, 1, 0, 0, 3000, 3000, 0, 0, 3000, 3000, 3000, 0, 0, 0 ),
( 3, 3, 1, 1, 0, 3000, 3000, 0, 0, 3000, 3000, 3000, 3000, 3000, 0 ),
( 4, 4, 1, 1, 0, 3000, 3000, 0, 0, 3000, 3000, 3000, 3000, 3000, 0 ),
( 5, 5, 1, 1, 0, 3000, 3000, 0, 0, 3000, 3000, 3000, 3000, 3000, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "DocumentItemTax"
-- ------------------------------------------

CREATE TABLE "DocumentItemTax"(
	"DocumentItemId" Integer NOT NULL,
	"TaxId" Integer NOT NULL,
	"Amount" Real NOT NULL DEFAULT 0,
	CONSTRAINT "DocumentItemTax_DocumentItem_CASCADE_NO ACTION_DocumentItemId_Id_0" FOREIGN KEY ( "DocumentItemId" ) REFERENCES "DocumentItem"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "DocumentItemTax_Tax_NO ACTION_NO ACTION_TaxId_Id_0" FOREIGN KEY ( "TaxId" ) REFERENCES "Tax"( "Id" )
,
PRIMARY KEY ( "DocumentItemId", "TaxId" ) );


-- ------------------------------------------
-- Dump of "DocumentType"
-- ------------------------------------------

CREATE TABLE "DocumentType"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text NOT NULL,
	"DocumentCategoryId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"StockDirection" Integer NOT NULL DEFAULT (0),
	"EditorType" Integer NOT NULL DEFAULT (0),
	"PrintTemplate" Text,
	"PriceType" Integer NOT NULL DEFAULT (0),
	"LanguageKey" Text,
	CONSTRAINT "DocumentType_DocumentCategory_NO ACTION_NO ACTION_DocumentCategoryId_Id_0" FOREIGN KEY ( "DocumentCategoryId" ) REFERENCES "DocumentCategory"( "Id" ),
	CONSTRAINT "DocumentType_Warehouse_NO ACTION_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
 );


BEGIN;

INSERT INTO "DocumentType" ("Id","Name","Code","DocumentCategoryId","WarehouseId","StockDirection","EditorType","PrintTemplate","PriceType","LanguageKey") VALUES 
( 1, 'Purchase', '100', 1, 1, 1, 0, 'Purchase', 2, 'Document.Category.Expenses.Purchase' ),
( 2, 'Sales', '200', 2, 1, 2, 0, 'Invoice', 1, 'Document.Category.Sales.Sales' ),
( 3, 'Inventory Count', '300', 3, 1, 1, 1, 'InventoryCount', 0, 'Document.Category.Inventory.InventoryCount' ),
( 4, 'Refund', '220', 2, 1, 1, 0, 'Refund', 1, 'Document.Category.Sales.Refund' ),
( 5, 'Stock Return', '120', 1, 1, 2, 0, 'StockReturn', 2, 'Document.Category.Expenses.StockReturn' ),
( 6, 'Loss And Damage', '400', 4, 1, 2, 2, 'LossAndDamage', 0, 'Document.Category.Loss.LossAndDamage' ),
( 7, 'Proforma', '230', 2, 1, 0, 0, 'Proforma', 1, 'Document.Category.Sales.Proforma' );



COMMIT;

-- ------------------------------------------
-- Dump of "FiscalItem"
-- ------------------------------------------

CREATE TABLE "FiscalItem"(
	"PLU" Integer NOT NULL PRIMARY KEY,
	"Name" Text NOT NULL,
	"VAT" Text NOT NULL );


-- ------------------------------------------
-- Dump of "FloorPlan"
-- ------------------------------------------

CREATE TABLE "FloorPlan"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Color" Text NOT NULL DEFAULT 'Transparent' );


BEGIN;

INSERT INTO "FloorPlan" ("Id","Name","Color") VALUES 
( 1, 'Main floor', 'Transparent' );



COMMIT;

-- ------------------------------------------
-- Dump of "FloorPlanTable"
-- ------------------------------------------

CREATE TABLE "FloorPlanTable"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"FloorPlanId" Integer NOT NULL,
	"PositionX" Real NOT NULL DEFAULT (0),
	"PositionY" Real NOT NULL DEFAULT (0),
	"Width" Real NOT NULL,
	"Height" Real NOT NULL,
	"IsRound" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "FloorPlanTable_FloorPlan_CASCADE_NO ACTION_FloorPlanId_Id_0" FOREIGN KEY ( "FloorPlanId" ) REFERENCES "FloorPlan"( "Id" )
		ON DELETE Cascade
 );


BEGIN;

INSERT INTO "FloorPlanTable" ("Id","Name","FloorPlanId","PositionX","PositionY","Width","Height","IsRound") VALUES 
( 1, 'A1', 1, 10, 10, 120, 120, 0 ),
( 2, 'A2', 1, 160, 10, 120, 120, 0 ),
( 3, 'A3', 1, 320, 10, 120, 120, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "LoyaltyCard"
-- ------------------------------------------

CREATE TABLE "LoyaltyCard"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"CustomerId" Integer NOT NULL,
	"CardNumber" Text,
	CONSTRAINT "LoyaltyCard_Customer_CASCADE_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_LoyaltyCard_CustomerId" ON "LoyaltyCard"( "CustomerId" );

-- ------------------------------------------
-- Dump of "Migration"
-- ------------------------------------------

CREATE TABLE "Migration"(
	"ID" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Version" Text NOT NULL,
	"Description" Text,
	"FileName" Text NOT NULL,
	"Module" Text,
	"Date" DateTime );


BEGIN;

INSERT INTO "Migration" ("ID","Version","Description","FileName","Module","Date") VALUES 
( 1, '1.0', 'Add customer discount', '1_0__Add_customer_discount.sql', NULL, '2022-08-06 10:50:25' ),
( 2, '2.0', 'Add printers table', '2_0__Add_printers_table.sql', NULL, '2022-08-06 10:50:25' ),
( 3, '3.0', 'Add email and phone columns', '3_0__Add_email_and_phone_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 4, '4.0', 'Add ApplicationProperty table', '4_0__Add_ApplicationProperty_table.sql', NULL, '2022-08-06 10:50:25' ),
( 5, '5.0', 'Add product margin fields', '5_0__Add_product_margin_fields.sql', NULL, '2022-08-06 10:50:25' ),
( 6, '6.0', 'API base url', '6_0__API_base_url.sql', NULL, '2022-08-06 10:50:25' ),
( 7, '7.0', 'Add loyalty table', '7_0__Add_loyalty_table.sql', NULL, '2022-08-06 10:50:25' ),
( 8, '8.0', 'API SSL base url', '8_0__API_SSL_base_url.sql', NULL, '2022-08-06 10:50:25' ),
( 9, '9.0', 'Add discount column', '9_0__Add_discount_column.sql', NULL, '2022-08-06 10:50:25' ),
( 10, '10.0', 'Add promotions tables', '10_0__Add_promotions_tables.sql', NULL, '2022-08-06 10:50:25' ),
( 11, '11.0', 'Extend promotions tables', '11_0__Extend_promotions_tables.sql', NULL, '2022-08-06 10:50:25' ),
( 12, '12.0', 'Document releations', '12_0__Document_releations.sql', NULL, '2022-08-06 10:50:25' ),
( 13, '13.0', 'Add Stock table', '13_0__Add_Stock_table.sql', NULL, '2022-08-06 10:50:25' ),
( 14, '14.0', 'Add external document number', '14_0__Add_external_document_number.sql', NULL, '2022-08-06 10:50:25' ),
( 15, '15.0', 'Alter Document date and customer columns', '15_0__Alter_Document_date_and_customer_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 16, '16.0', 'Add PaymentType Enabled And QuickPayment columns', '16_0__Add_PaymentType_Enabled_And_QuickPayment_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 17, '17.0', 'Add Document notes columns', '17_0__Add_Document_notes_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 18, '18.0', 'Barcode table', '18_0__Barcode_table.sql', NULL, '2022-08-06 10:50:25' ),
( 19, '19.0', 'Add Document DueDate column', '19_0__Add_Document_DueDate_column.sql', NULL, '2022-08-06 10:50:25' ),
( 20, '20.0', 'Add User IsEnabled column', '20_0__Add_User_IsEnabled_column.sql', NULL, '2022-08-06 10:50:25' ),
( 21, '21.0', 'Add Customer IsEnabled and IsSupplier flags', '21_0__Add_Customer_IsEnabled_and_IsSupplier_flags.sql', NULL, '2022-08-06 10:50:25' ),
( 22, '22.0', 'Add Refund document type', '22_0__Add_Refund_document_type.sql', NULL, '2022-08-06 10:50:25' ),
( 23, '23.0', 'Add ZReport table', '23_0__Add_ZReport_table.sql', NULL, '2022-08-06 10:50:25' ),
( 24, '24.0', 'Add CashDrawer columns', '24_0__Add_CashDrawer_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 25, '25.0', 'Add Stock ProductId Index', '25_0__Add_Stock_ProductId_Index.sql', NULL, '2022-08-06 10:50:25' ),
( 26, '26.0', 'Add Product Image column', '26_0__Add_Product_Image_column.sql', NULL, '2022-08-06 10:50:25' ),
( 27, '27.0', 'Add Payment type shortcut', '27_0__Add_Payment_type_shortcut.sql', NULL, '2022-08-06 10:50:25' ),
( 28, '28.0', 'Add DiscountType column', '28_0__Add_DiscountType_column.sql', NULL, '2022-08-06 10:50:25' ),
( 29, '29.0', 'Add Document discounts', '29_0__Add_Document_discounts.sql', NULL, '2022-08-06 10:50:25' ),
( 30, '30.0', 'Add PosOrder and PosOrderItem tables', '30_0__Add_PosOrder_and_PosOrderItem_tables.sql', NULL, '2022-08-06 10:50:25' ),
( 31, '31.0', 'Footer and header alignment column', '31_0__Footer_and_header_alignment_column.sql', NULL, '2022-08-06 10:50:25' ),
( 32, '32.0', 'Add DocumentItem Total columns', '32_0__Add_DocumentItem_Total_columns.sql', NULL, '2022-08-06 10:50:25' ),
( 33, '33.0', 'Add ItemPriceView', '33_0__Add_ItemPriceView.sql', NULL, '2022-08-06 10:50:25' ),
( 34, '34.0', 'Add product and group Color column', '34_0__Add_product_and_group_Color_column.sql', NULL, '2022-08-06 10:50:26' ),
( 35, '35.0', 'Add printer formatting enabled column', '35_0__Add_printer_formatting_enabled_column.sql', NULL, '2022-08-06 10:50:26' ),
( 36, '36.0', 'Add A4 Printer settings columns', '36_0__Add_A4_Printer_settings_columns.sql', NULL, '2022-08-06 10:50:26' ),
( 37, '37.0', 'Printer CodePage and Charset', '37_0__Printer_CodePage_and_Charset.sql', NULL, '2022-08-06 10:50:26' ),
( 38, '38.0', 'PaymentType and document paid field', '38_0__PaymentType_and_document_paid_field.sql', NULL, '2022-08-06 10:50:26' ),
( 39, '39.0', 'Add User email column', '39_0__Add_User_email_column.sql', NULL, '2022-08-06 10:50:26' ),
( 40, '40.0', 'Company logo', '40_0__Company_logo.sql', NULL, '2022-08-06 10:50:26' ),
( 41, '41.0', 'Add Customer due date column', '41_0__Add_Customer_due_date_column.sql', NULL, '2022-08-06 10:50:26' ),
( 42, '42.0', 'Payment date', '42_0__Payment_date.sql', NULL, '2022-08-06 10:50:26' ),
( 43, '43.0', 'Add PurchaseReturn document type', '43_0__Add_PurchaseReturn_document_type.sql', NULL, '2022-08-06 10:50:26' ),
( 44, '44.0', 'Add DocumentType PriceType column', '44_0__Add_DocumentType_PriceType_column.sql', NULL, '2022-08-06 10:50:26' ),
( 45, '45.0', 'Add company bank account', '45_0__Add_company_bank_account.sql', NULL, '2022-08-06 10:50:26' ),
( 46, '46.0', 'Add PosPrinterSelectionSettings table', '46_0__Add_PosPrinterSelectionSettings_table.sql', NULL, '2022-08-06 10:50:26' ),
( 47, '47.0', 'Add StartingCash table', '47_0__Add_StartingCash_table.sql', NULL, '2022-08-06 10:50:26' ),
( 48, '48.0', 'Add printer margins columns', '48_0__Add_printer_margins_columns.sql', NULL, '2022-08-06 10:50:26' ),
( 49, '49.0', 'Add PosOrderItem Bundle column', '49_0__Add_PosOrderItem_Bundle_column.sql', NULL, '2022-08-06 10:50:26' ),
( 50, '50.0', 'Add ProductComment table', '50_0__Add_ProductComment_table.sql', NULL, '2022-08-06 10:50:26' ),
( 51, '51.0', 'Add Loss and Damage document type', '51_0__Add_Loss_and_Damage_document_type.sql', NULL, '2022-08-06 10:50:26' ),
( 52, '52.0', 'Add Tax table', '52_0__Add_Tax_table.sql', NULL, '2022-08-06 10:50:26' ),
( 53, '53.0', 'Add PrintBarcode column to printer settings', '53_0__Add_PrintBarcode_column_to_printer_settings.sql', NULL, '2022-08-06 10:50:26' ),
( 54, '54.0', 'Add ProductGroup Image column', '54_0__Add_ProductGroup_Image_column.sql', NULL, '2022-08-06 10:50:26' ),
( 55, '55.0', 'Add DiscountApplyRule columns', '55_0__Add_DiscountApplyRule_columns.sql', NULL, '2022-08-06 10:50:26' ),
( 56, '56.0', 'Add Proforma document type', '56_0__Add_Proforma_document_type.sql', NULL, '2022-08-06 10:50:26' ),
( 57, '57.0', 'Add font size column to printer settings', '57_0__Add_font_size_column_to_printer_settings.sql', NULL, '2022-08-06 10:50:26' ),
( 58, '58.0', 'Add product age restriction column', '58_0__Add_product_age_restriction_column.sql', NULL, '2022-08-06 10:50:26' ),
( 59, '59.0', 'Add language key to document type', '59_0__Add_language_key_to_document_type.sql', NULL, '2022-08-06 10:50:26' ),
( 60, '60.0', 'Add Product LastPurchasePrice column', '60_0__Add_Product_LastPurchasePrice_column.sql', NULL, '2022-08-06 10:50:26' ),
( 61, '61.0', 'Use cost as default last purchase price', '61_0__Use_cost_as_default_last_purchase_price.sql', NULL, '2022-08-06 10:50:26' ),
( 62, '62.0', 'Add Rank column', '62_0__Add_Rank_column.sql', NULL, '2022-08-06 10:50:26' ),
( 63, '63.0', 'Add floor plan color column', '63_0__Add_floor_plan_color_column.sql', NULL, '2022-08-06 10:50:26' ),
( 64, '1.0', 'Add PrintStations tables', '1_0__Add_PrintStations_tables.sql', 'Aronium.Pos.Print.Stations', '2022-08-06 10:50:26' ),
( 65, '1.0', 'Add StockControl table', '1_0__Add_StockControl_table.sql', 'Aronium.Pos.StockControl', '2022-08-06 10:50:26' );



COMMIT;

-- ------------------------------------------
-- Dump of "Payment"
-- ------------------------------------------

CREATE TABLE "Payment"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"DocumentId" Integer NOT NULL,
	"PaymentTypeId" Integer NOT NULL,
	"Amount" Numeric NOT NULL DEFAULT (0),
	"Date" Date,
	CONSTRAINT "Payment_Document_CASCADE_NO ACTION_DocumentId_Id_0" FOREIGN KEY ( "DocumentId" ) REFERENCES "Document"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Payment_PaymentType_NO ACTION_NO ACTION_PaymentTypeId_Id_0" FOREIGN KEY ( "PaymentTypeId" ) REFERENCES "PaymentType"( "Id" )
 );


BEGIN;

INSERT INTO "Payment" ("Id","DocumentId","PaymentTypeId","Amount","Date") VALUES 
( 1, 1, 1, 3500, '2022-09-12 00:00:00' ),
( 2, 2, 1, 0, '2022-10-05 00:00:00' ),
( 3, 3, 1, 3000, '2022-10-08 00:00:00' ),
( 4, 4, 1, 3000, '2022-10-08 00:00:00' ),
( 5, 5, 2, 3000, '2022-10-08 00:00:00' );



COMMIT;

-- ------------------------------------------
-- Dump of "PaymentType"
-- ------------------------------------------

CREATE TABLE "PaymentType"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text,
	"IsCustomerRequired" Integer NOT NULL DEFAULT (0),
	"IsFiscal" Integer NOT NULL DEFAULT (1),
	"IsSlipRequired" Integer NOT NULL DEFAULT (0),
	"IsChangeAllowed" Integer NOT NULL DEFAULT (1),
	"Ordinal" Integer NOT NULL DEFAULT (0),
	"IsEnabled" Integer NOT NULL DEFAULT (1),
	"IsQuickPayment" Integer NOT NULL DEFAULT (1),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"ShortcutKey" Text,
	"MarkAsPaid" Integer NOT NULL DEFAULT 1 );


BEGIN;

INSERT INTO "PaymentType" ("Id","Name","Code","IsCustomerRequired","IsFiscal","IsSlipRequired","IsChangeAllowed","Ordinal","IsEnabled","IsQuickPayment","OpenCashDrawer","ShortcutKey","MarkAsPaid") VALUES 
( 1, 'Cash', '', 0, 1, 0, 1, 1, 1, 1, 1, NULL, 1 ),
( 2, 'Credit Card', '', 0, 1, 0, 0, 2, 1, 1, 1, NULL, 1 ),
( 3, 'Debit Card', NULL, 0, 1, 0, 0, 3, 1, 1, 1, NULL, 1 ),
( 4, 'Check', NULL, 0, 1, 0, 0, 4, 1, 1, 1, NULL, 1 ),
( 5, 'Voucher', NULL, 0, 1, 0, 0, 5, 1, 1, 1, NULL, 1 ),
( 6, 'Gift Card', NULL, 0, 1, 0, 0, 6, 1, 1, 1, NULL, 1 );



COMMIT;

-- ------------------------------------------
-- Dump of "PosOrder"
-- ------------------------------------------

CREATE TABLE "PosOrder"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"UserId" Integer NOT NULL,
	"Number" Text NOT NULL,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"Total" Numeric,
	CONSTRAINT "PosOrder_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" )
 );


BEGIN;

INSERT INTO "PosOrder" ("Id","UserId","Number","Discount","DiscountType","Total") VALUES 
( 6, 1, '10', 0, 0, 3000 );



COMMIT;

-- ------------------------------------------
-- Dump of "PosOrderItem"
-- ------------------------------------------

CREATE TABLE "PosOrderItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PosOrderId" Integer NOT NULL,
	"ProductId" Integer NOT NULL,
	"RoundNumber" Integer NOT NULL DEFAULT (0),
	"Quantity" Numeric NOT NULL,
	"Price" Numeric NOT NULL,
	"IsLocked" Integer NOT NULL DEFAULT (0),
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"IsFeatured" Integer NOT NULL DEFAULT 0,
	"VoidedBy" Integer,
	"Comment" Text,
	"DateCreated" Date NOT NULL,
	"Bundle" Text,
	CONSTRAINT "PosOrderItem_PosOrder_CASCADE_NO ACTION_PosOrderId_Id_0" FOREIGN KEY ( "PosOrderId" ) REFERENCES "PosOrder"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "PosOrderItem_Product_NO ACTION_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" ),
	CONSTRAINT "PosOrderItem_User_NO ACTION_NO ACTION_VoidedBy_Id_0" FOREIGN KEY ( "VoidedBy" ) REFERENCES "User"( "Id" )
 );


BEGIN;

INSERT INTO "PosOrderItem" ("Id","PosOrderId","ProductId","RoundNumber","Quantity","Price","IsLocked","Discount","DiscountType","IsFeatured","VoidedBy","Comment","DateCreated","Bundle") VALUES 
( 7, 6, 1, 1, 1, 3000, 0, 0, 0, 0, NULL, 'No comment', '2022-10-08 13:26:31.7305966', NULL );



COMMIT;

-- ------------------------------------------
-- Dump of "PosPrinterSelection"
-- ------------------------------------------

CREATE TABLE "PosPrinterSelection"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Key" Text NOT NULL,
	"PrinterName" Text,
	"IsEnabled" Integer NOT NULL DEFAULT (0),
CONSTRAINT "UK_PrinterKey" UNIQUE ( "Key" ) );


BEGIN;

INSERT INTO "PosPrinterSelection" ("Id","Key","PrinterName","IsEnabled") VALUES 
( 1, 'ReceiptPrinter', NULL, 0 ),
( 2, 'Estimate', NULL, 0 ),
( 3, 'KitchenTicket', NULL, 0 ),
( 4, 'Service', NULL, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "PosPrinterSelectionSettings"
-- ------------------------------------------

CREATE TABLE "PosPrinterSelectionSettings"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PosPrinterSelectionId" Integer NOT NULL,
	"PaperWidth" Integer NOT NULL DEFAULT (32),
	"Header" Text,
	"Footer" Text,
	"FeedLines" Integer NOT NULL DEFAULT (0),
	"CutPaper" Integer NOT NULL DEFAULT (1),
	"PrintBitmap" Integer NOT NULL DEFAULT (0),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"CashDrawerCommand" Text,
	"HeaderAlignment" Integer NOT NULL DEFAULT 0,
	"FooterAlignment" Integer NOT NULL DEFAULT 0,
	"IsFormattingEnabled" Integer NOT NULL DEFAULT 1,
	"PrinterType" Integer NOT NULL DEFAULT 0,
	"NumberOfCopies" Integer NOT NULL DEFAULT 1,
	"CodePage" Integer NOT NULL DEFAULT -1,
	"CharacterSet" Integer NOT NULL DEFAULT -1,
	"Margin" Integer NOT NULL DEFAULT 0,
	"LeftMargin" Numeric NOT NULL DEFAULT 0,
	"TopMargin" Numeric NOT NULL DEFAULT 0,
	"RightMargin" Numeric NOT NULL DEFAULT 0,
	"BottomMargin" Numeric NOT NULL DEFAULT 0,
	"PrintBarcode" Integer NOT NULL DEFAULT 1,
	"FontName" Text,
	"FontSizePercent" Numeric NOT NULL DEFAULT 100.0,
	CONSTRAINT "PosPrinterSelectionSettings_PosPrinterSelection_CASCADE_NO ACTION_PosPrinterSelectionId_Id_0" FOREIGN KEY ( "PosPrinterSelectionId" ) REFERENCES "PosPrinterSelection"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "PosPrinterSettings"
-- ------------------------------------------

CREATE TABLE "PosPrinterSettings"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PrinterName" Text NOT NULL,
	"PaperWidth" Integer NOT NULL DEFAULT (32),
	"Header" Text,
	"Footer" Text,
	"FeedLines" Integer NOT NULL DEFAULT (0),
	"CutPaper" Integer NOT NULL DEFAULT (1),
	"PrintBitmap" Integer NOT NULL DEFAULT (0),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"CashDrawerCommand" Text,
	"HeaderAlignment" Integer NOT NULL DEFAULT 0,
	"FooterAlignment" Integer NOT NULL DEFAULT 0,
	"IsFormattingEnabled" Integer NOT NULL DEFAULT 1,
	"PrinterType" Integer NOT NULL DEFAULT 0,
	"NumberOfCopies" Integer NOT NULL DEFAULT 1,
	"CodePage" Integer NOT NULL DEFAULT -1,
	"CharacterSet" Integer NOT NULL DEFAULT -1,
CONSTRAINT "UK_PrinterName" UNIQUE ( "PrinterName" ) );


-- ------------------------------------------
-- Dump of "PrintStation"
-- ------------------------------------------

CREATE TABLE "PrintStation"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL );


BEGIN;

INSERT INTO "PrintStation" ("Id","Name") VALUES 
( 1, 'epson darya' );



COMMIT;

-- ------------------------------------------
-- Dump of "PrintStationPosPrinterSelection"
-- ------------------------------------------

CREATE TABLE "PrintStationPosPrinterSelection"(
	"PrintStationId" Integer,
	"PosPrinterSelectionId" Integer,
	CONSTRAINT "PrintStationPosPrinterSelection_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "PrintStationPosPrinterSelection_PosPrinterSelection_CASCADE_NO ACTION_PosPrinterSelectionId_Id_0" FOREIGN KEY ( "PosPrinterSelectionId" ) REFERENCES "PosPrinterSelection"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "PrintStationId", "PosPrinterSelectionId" ) );


-- ------------------------------------------
-- Dump of "Product"
-- ------------------------------------------

CREATE TABLE "Product"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"ProductGroupId" Integer,
	"Name" Text NOT NULL,
	"Code" Text,
	"PLU" Integer,
	"MeasurementUnit" Text,
	"Price" Real NOT NULL DEFAULT 0,
	"IsTaxInclusivePrice" Integer DEFAULT (1),
	"CurrencyId" Integer,
	"IsPriceChangeAllowed" Integer NOT NULL DEFAULT 0,
	"IsService" Integer NOT NULL DEFAULT 0,
	"IsUsingDefaultQuantity" Integer NOT NULL DEFAULT 1,
	"IsEnabled" Integer NOT NULL DEFAULT (1),
	"Description" Text,
	"DateCreated" DateTime NOT NULL DEFAULT (DATETIME ('now','localtime')),
	"DateUpdated" DateTime NOT NULL DEFAULT (DATETIME ('now','localtime')),
	"Cost" Numeric NOT NULL DEFAULT 0,
	"Margin" Numeric NOT NULL DEFAULT 0,
	"Image" BLOB,
	"Color" Text NOT NULL DEFAULT 'Transparent',
	"AgeRestriction" Numeric,
	"LastPurchasePrice" Numeric NOT NULL DEFAULT (0),
	"Rank" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "Product_ProductGroup_CASCADE_NO ACTION_ProductGroupId_Id_0" FOREIGN KEY ( "ProductGroupId" ) REFERENCES "ProductGroup"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Product_Currency_NO ACTION_NO ACTION_CurrencyId_Id_0" FOREIGN KEY ( "CurrencyId" ) REFERENCES "Currency"( "Id" ),
	CONSTRAINT "Product_ProductGroup_CASCADE_NO ACTION_ProductGroupId_Id_0" FOREIGN KEY ( "ProductGroupId" ) REFERENCES "ProductGroup"( "Id" )
		ON DELETE Cascade
 );


BEGIN;

INSERT INTO "Product" ("Id","ProductGroupId","Name","Code","PLU","MeasurementUnit","Price","IsTaxInclusivePrice","CurrencyId","IsPriceChangeAllowed","IsService","IsUsingDefaultQuantity","IsEnabled","Description","DateCreated","DateUpdated","Cost","Margin","Image","Color","AgeRestriction","LastPurchasePrice","Rank") VALUES 
( 1, 2, 'Broccoli', '1258', 1, 'kg', 3000, 0, NULL, 1, 0, 1, 1, NULL, '2022-09-12 16:37:52', '2022-09-12 16:37:52', 3000, 0, X'ffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc00011080120012c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a2800a28a2800a28a2800a28a2800a2a0bcbcb6d3ed24babb9d21823197773802bca35df8a1a9cf773c5a3ac16f66ae123b865dd2b73f7b0dc007f3e6937613925b9eba48552cc40006493dab1f51f15e83a586fb5eab6aaea7698d5c3be7d368c9af147f1b7886fe06b4b9d5277464f2e78cc683702a7764819c0f6f515cf398a4945b9643be22c2363fbcda412071db1dfdb14b98cdd4ec7d27a66bfa3eb4a0e9ba95add12376d8a50580ce395ea3f1ad2af943478f56d335ab7d5a265b6b8f319d7cb456f2cedc839e7731191cf1d7ad6deade21d57579e5b8bdd4a5995240c447232a0e836955e31dfeb8cd1cc87ed11ed9a8fc41f0e69b7135bc978d2cb09daeb0465f0d9c638e335c66a3f192e629e46b3d157ecd1f199e421d8fb638f6c7eb5e66630d712bef0f260a6e1f79b19057df3dcfafd2aadc398ca3e448ccdf2ee20fce39653ef803fc9a5ce8973676adf16bc4897233756c159b0b1b5b839e9c0c73c03c1cf51cd6be89f192f62223d6f4f8e785199a4bbb56c1099c0f93b907af238fd7cb5d4c2c63756f20e63c82768dc472ddd472a0773eb4ac00b36b70b193149e539076aa91c807dfae3a925475a2e0a4cfa4746f1f785f5fb9fb369fabc0f71921637cc6cf8eea1b191f4ae9010ca1948208c823bd7c6fa9c7fd9d6d0b22ed0b2b02593ab2e3b7b82083d7daba1d2fe20f8af4d8adad74cd5a558444592295124083d06471d3819e3b555cb533ea8a2bc83c1df1ad756f10be99aec367630b0c4372acc17cc181b5b77af3cf1e95eb724f0c3019e596348546e323300a07ae7d29949dc928aab06a761733490dbdf5b4b2c670e91caacca7dc03c55aa0614514500145145001451450014514500145145001451450014514500145145001451450014563f883c4da6f86acc5c6a129cb10a90c783239f619e9ef5e7d7bf18e77729a668cb8f300579e6ce477c81d0903d4e33409c92dcf59a2bc7e4f8bdaab4d12c7a5d9c69bb2c5a567de00e40c63faf381deb2b5cf89979e24d3e48859bd8451cc43a2cc73c01f2be0727383c1a4dd8973468fc41f1a47abdd3693652674fb760d2c8aa0895c138193c6d047e35c13b925e3e885791c82a33c8fae0fe60d54594bc8d2ac4c113319465ef9c9c8eea4838f738c53a2912e77ddc7233243fbc50a3a46cb8dcc4f3b8608c7078c567295cc9ddbbb224b5792408adba38d9de69d8f0c59412a00c6305793ed56a464fb4baa2846963667618dcccb8c0fc013c541a1ddf9fa2cb732b2c627949d88df2818c703f87d79f6f5a9cf9802a838773b9cab63712304648e3276f3fe14ef65764b7a956494421047e63c92380d1a8daa4050719e3e55041aa46f92491c8748911996494676027b9f7707827a104d3ae64796fff00704e6e9bcb424e79e43019e839e7e955efa03a8d9c9134d15bdb59a059aee671b1d80c611719773d87a0acb9eeeccd144d433d98b41e436f600aa7967259f80a0679040e738c726922b6be3792c62687c860ac245ce0b1196d84f5c639e79ed597e108c25a7988aeaccae3731e0f3d40c7f9c1adeb986e094658806c79a8d96dac546307d475e3f0a3dd869264bdec8ab7768d344d119498b76e9762fcd8c03f293c01918f6c81cd579de56b79a4990b3c23ca3f3b33a28da7238f99c104939f6cd59b8866b7854dd655a31970a76ee6c039519ce0e4e49f5cfad54914c659c0449c2e5b233e610e01e09e40ce01e7246456b169ec0ae65ea1a8c6f631c2d0c8b73960e04654aa7639e849e09c7b0a92dcb5d5b4444223bb8376f500293c7041ee001cf3d7dcd429e55b5f2cf306f3620ccdbc672481ce3fbc339ee2b62e53cdb416eaca222bbf96ec4679c8ebf293c7f78629e8b4299813dbc6d71b229c3b64ef2170abf4cf5183d7dea5bc92e8d9468b3ccd00215119d800472c0a938ea3ff001dfa5425e289ccb1b3cb22b863230e703d3d739ea7daa49ef96e1519fa06dd804e07a8c678e7273df34ee56a57824280346c55fef2ed7da413ff00ebe2bd4fc13f17b53d105ae9fac7fa6e9aa029948266897ebfc78f43cfbf15e43114720c450852095c753db8ec6a68a6d88d8272c7857f4fe5de9dc67dada6ea569abe9d06a1613acf6b3aef8e45e847f8fb55aaf9bfe0e78aeeb48f128d36e2e2da2d2ef159a56b9976796ca32bb49e0124f4eff5ebf487514ca4ee145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ae67c69e2d8bc2fa5ee4db25f4c0882323238c659b9e00cd747348b0c324ad9da8a58e3d057cebe24d5ee7c43abb6a138dab363cb858965441d81ed9fe64d26ec44e563227bfbad5efe5d46f266b9ba93092bb30c0c10719e83ae00181c8eb505bdc6f460a92071284627919e49e7d39efed5338905d25b44a4391970c31f2e48c8f53d38f4e94c999e48ee8b7cf88fe73b383807b77e70791ce47a54dd9886e5df29dd8621a4704632b81f77db0003f5154b4e8ee9a01279de55ab1c32aafcea0e38391d38fe54f32b16018bbc236acca47ef0a927827f84038cfe35a3310e15588429bd5f61e63f4ffd0770cf4f7e295ee3d8a52fda620a968ccdb1c2b8ddb647db83943dc9ddd7d4f6a759612de3b98203134b1346c8cf805892467f2207a66ad8b3895a4596e0bae197017276eec92c7ae4923238cf61cd32646b98a1495c2ab9d8e78cf42a40c74e9d7eb52e317a0ae54b2912ced1e597cb8a269bcd436f8eb8c1dc7fdef4f5a75c23dcbdbfd9d91c9389a32e098c3f761df19c8f7aaf73e435de5d5444aaaf338623036e1463b0fbc31d7d6ab4374f6b3adc5b3c30db1dc02ede648c720e4f2b8058e72393c0a1ab8d2bea6ac169a75b5a89ee619ae95b3f3f1b33db9f4ebcfd6b88f10cd24f3224d17905065221c0553c8c0f7eb5bb757b26af2dbd9e9e81ede3982ccae998d54e00e46090d839e3b66b663b2b5b394ba450f9f3365dc800ede0fe38c81c753c9ace11e47cccbe6b2333c2d1cf69a4b2dca4a86473e4a9ea4e0f6edd3f99abf75abccb9213718d718da3a1c8c9079f4e7daa69a382e56de660772481f6838dae3b1c1c8ed9c75e0fb5528e2f2ee3ed32a4ab315dd19908c64af2c3b0e0e3039c2fa9a4f964eec9eb724bb58dad6d677b8599a40f189376d0ccc30178ff00f57154ede5b68f4db98e71b44aa123c301b15703706eb82c791f88f5aa12d979d776ea8d209198310ac1b18eac4839e4e79c8ea3d6896fbcbd55648e2b6d88ceff002e0acbf2f4cfbe4e29a85958a2084ac974b1b150ae4223b2f0879cf4ef90467deb66eae20568e39564123dbee8c818da70770c7009e31f41c566c923dd583ac28248e602467551f280b8c103eeff003345ba036d197cc9736d0abf6c30ddc066ea381f51d38ad2f7134519de4fed099a68bcb62c7ccc6708c4703f03818e9552292249940271192ac36f07deaebc724b7922dac68eef852225394cf61c751ce7e948b61108b2cc0295c83c72f9da406ce3df3d3ad5f4d4ab957c850cea114e0865c01dc76cff009e952796bb3017e5403381ebdff3a9f7989d91996454c26e5c120647ebefdf14f30b8880382c570401cb0191d3a64734d85c8f70488c770aacacdf7704ff0091debe8cf839e2f935bd164d1ef2546b9d351162624ef962e818e4e490463818e9eb5f3a97768d369c918ea31ec7fcf5af5cf80504afe20d66ea3917ecf1db2472267277b312bdfd15bf3a51bdc6b73dee8a28ab2c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a1ada349a16a08afb09b6906e2338f94d7ce2e4183cc52170307bf046707d3a57d01e30d4a7d27c3179756ca4ca136ab80088c9e371cf6ff001af00694c970b180bb7a038e49ec33ebc1f63fa5268c2abd4a1e7335e6d7c858edfcc2319f315880548e9c1c1c7af7a65c3294923b82fba2552e76f2f97c023ae33b79c027eb8ab823568a60a0ee2fe76d03396e980a7a648fd79aa12c8f1cd1ac60b47c0925563c8ce36e7a96e41e3ee9e6a494576b8b99a5bab2b5b78d98616595c87cee380547420753d8106b5adad37dbb332b4c536af972b7ccce9904b1e849ec7b002abc0915bea0bf668c031a0589564c97f9b3f367b6ecf3d78248e6a746118b78c3c82ea4539e4739dc46e2782473f5c74a86ec86c924b92097591910364b30c72385ebefc67fdae2a1b869ade3d871e5ed65cee51819276e4f73923f0c8a856f3cdbfba83cbded085883a1c07ddf79bd1474cf1d298d0efb606d9918427246700a8e415ce46ec1e7ae32462a6eba8ac23dc2a2f9b1981912550a256ea8c77609ea30dce47af5f4c0d4a69ae206b55dd1c2f215325caeddcc0976da48f95413f773deaf4cd135bc696e0202498de593e645180643cfa0c01dc74aa9ab3095cb6fb8333a4aa638d0166cb7f177c1f979eb81ed5716ae52373c31a608f4782e103b5c5ca6599bd376768fe79ab97d3c1f66de13cb2bf32b2f3b77fca401ebec78ebce0572fe14d69bfb4059dd4c45b13b940e36e3d0e4600ce71f8d74be643a88315a176925058172020524a9627fe0479e86b9ea26a7a8dc5dc89ede5794a4622460d21dfdb2c3191ea4853dc8e7daa5bb4496e56de0532641509b033003b9cf6ce0718e4d5744642913068c467cb54cf1b73c631d39f5e7b53a19a48e66b886431657a91ce47bf6ea7b739149c64ddc158c4d4d24b39a6848d91e0301904e32381db9c60fd3dab3e519b7f29312360cbf2ff0291f967d7f0ad3b8b45d4eeaee15015428da483c65be52093c647af6e958b6b67777729b7b3ba4dec31202080173807dfb574413b6a52b1444ac1e428c56328030638048a9aca5696e247de40910a904f1823ffadfcab722f0dd9a5a867def23a000ee3b55d4fcde879ed91d3f3a9069da7da00c9082a3825a43f3023233ef823a0ab6d039226b78a151e50f33eccd1fccea4eede4e06d03dc13d79eb4dbf8a585658ad63dd15b48177850589c0ea7a7734d12089360711c0a8312124b313c0da73dbd7eb8c5457b7ad2cdf6575062519f2d3f8f07208e0e3af4f4a877b92914276118f2fcf491f972a1402b818ebfe356bcb117950cd288a403e656e0a2e46777a7b2d34dabca7cd908c32feecb20e7e8075fad55bb6cc5875559a3fbccbc02339e9ffeba69df42ac4b03a473eede18e376c2b92b938193fe7a5773f093591a2f8fed6292e9a2b5be06de5451c3c87ee6efc7bfbfa579d9f9c0c8064da727772475079e054f05d484accac1a489b70e31b883c1fd29f5b81f6d51585a1f8af4bd620b18c5edb2ea17368972d6a24f9d43019e3af07f1addad0d028a28a0028a28a0028a28a0028a28a0028a28a0028a2b1bc41e29d2bc310c32ea73b279efb235442ecdea703b0f5a01bb1e55f10b5bb9bff16b5a19245b3b63e4a41d3320e4b707b8e067f4ae4e4b8445494ec48e30d919e46411ce3bff008549ad5c4dad6a579a948c67499d9a304ec2e09cc7f423000f4e6a1924ddb8725d81db9272ad83dbbfa7af4a94ee724b5773327f2a48f6485e4006704f50307e661ed81c75350c972a96e904caafbcb4616460bc13928d8e98007ae727f0b86426dedd76ca918002b02df2a91f37cd8ea7200f7aa1f684b65f294c7b6dd59d7e62db0e7ef703239381edbbbd4329176d5c2471f9797758d0bb39c3eec10531cfb64f7c0a6ceecd682e0ab94ddbcc4ac76332e1475eb93b7f01c6726b22cd9e3b169af64c2ce1673288db2df3905481c31f4f4cd6b5ccb0dbdbdfcc58961f2f96ac7f77b480071fc58239c77ace574f41bdcacc5dae2e514b45282a0488bb980207eecf4c819c13db031de993df416864dafbe2b7449199108323391b948272a7b1208cf4a4b5beb686f6ea192579268a20c0f771b7e7073d4e7a0edce314b61691dec93dcdef972c09209235f2bf89873b8919f971cfa1a514dcacc7a2455586ee49208ad43f93265a4711edc21e3cb3f82f4fcaa5fecb64791fce66889658edd13261c671ce781cb707e87ad6f4ff00be4915be462cdb961ef9ce07d7041fc7f1a85a1db112aa65cc610c6add54649c76dc78e7fdaef5a21731c75df875913edb6b32c702a87df21e189c636e07279e98c715d278656fa21fda525ca949e1fb3a2a9dfc6ec96c37424a823153436cbf66b70655b9633f9ccc7a2e173803a70368c63bfbd57d32e0e9f3b595ec9f7d3cc855c8f90004e0f4e7d077fca9b77d18dc9db434c04f2e72d93b738933cf52bcfae0f3ec579e055591d46d882b4a51c48a00f99caf391ed93ce4f3db34b7539874a7f3125562870bb86f5e839cf7c1e2a91797ecf3c8d2a24a46d52f260282bb8e307973c73d8f14ae4a295f6a536f85ff00750cd7c9b325f7208c9c02fc6411c7e757ec2c62b1b044f2c1b82cdbe4c79640241049ed8caf155f45fb34b1cb241098fe74837162d903243124600dd8ce2b41c0f3034a03abab6f008ce76820609cff007b1ebc556c86df42bdedd2111b321917781b58727180718ce7e6e99ea2b2ef1e79d64721d5a30498881f2c6393bbd3078038383cf5ab7770e23f982a8564740e49e338646c72006edef55aee64901b40a37852ed2f1b5b233d3b0e7193d87e3490d114f6a1ff0077e6c92c92ec2ea2652189ce00ff00c7b9aad349bbcc5b67db0c673b72d9dbf53838078c5685bba4114291c6d298d137796a3e5c90703773bcf1d38f97deaa7d93cbd51a3da0cc24de1c0c84183b8371c60d34f5d4a2aacaf1c85964d80215214e720fad437ad2061305077e075ce47bd25c5b9866c89772a9c4815f208cf5cf4c7b54af87568d807dd805b1ce33fa9a7a5ee514d64f9973232abe4027b7e35269ccb06ab6e08c80d955ce455492550446f1b2ed6e7d688be4955c364e78cfd2aada0ec75a6e73811a827ccc2b37de2c3a1c8f4af47f0dfc5ad7749b16b4bf89756011bc896493648a704aef6c723b7af1debc8f487325fb32cb90016c90064f4e3f3ae814048639a33f201b7cc7393c72727d876eb8ac9b71d111b33e84f0cfc51f0ef892586d44d2595f48c116dae9769772325548c83e9ef5dad7c617371899423bf97193890ae09607afb6315ea9e0af8cf7f6534361e260d796f248b1ade0004916481f3f40cbce73d7af5ad232b9a267bdd14d4749115d19591864329c8229d5430a28a2800a28a2800a28a2802b6a17d0699a75c5f5cb1582de3323903270057cdbe21d6efbc57abcf7d3cc4c61995117ac499e107d31c9ef5ec5f15e6b88bc1a040cea1eea24976f74e783e83205782db096c56e760ca13be3ff00641ed4aeba98d56f62e23c96f137df2cc0000b72c7b0ea38a59584d68ca6e76498211dd42a924753f8e4e07b5562f7174f2411c461f2d951e6947deee428ea6a265916581a39833a175dbb493f7b04803b8e39e9c76ac9efa19a4c26b880ac500c3b3ae579237b2ede39e474c003a914d11258d92091d1a5588901e266c1f333d3f1ebfecd564bfb4b6d44c11ce6168e479649666076b91db1d71cfd09a862bf4bd9bcb4bc489274f34b3050c581cf9618f4e7d719c54c936524457f24262ba942197ec6cab1f98c54e09186c719ddc673d7ad497b789a869374f6a56184ed1e6b10199b1960d8ea7dfe9541afa037324726f1e746c267de0ac9bb9047a773cfad4ba4583c5a96d49321e3247192ac307a7427838aae55d4a3a2d0bc2cb2e80d3deaefb8911a61bbd723ef1ea4f5c7d4d5a69e67699325557e5f31bf83182493df39f4c7156e6b87fb2b436b14ae2266631a3ee624fa71c004e48edcd552ab142d24815655513b956046fe841ce70bce3e9f4aca9c9caedb26440c91476eb711c812365c2b310a2356c63a1ea78e4fbf4a5f3858ab17dbb635445893ee9030483904e796ef8000cd46d710dbdc0b590ac76f0111a91f30073cf3fde1c703a6ecf4159f225c6abf6ab7b766b68599849b9b0ccd8e411ce06fe33df3ed5b26248d18365a59caed2431cc24c4a3ccce1f93d41c93d3eef6e9dea29a616f048f346f2a46d88a10a373e32ebcf5201c8217d296d74eb2b736e311ff00a3c7f3338c2c87041cfbf04f1939fcaa721de7fb4c8c564452ab10500be57183d4f058647bfa0a5a5c7739d975abd8a694158ae0a2b9f37392a49cee3ea4671cd4912c7aa409670c5710c5219249249d7072707209386240cffc0bf1a964d396fb5b338b82ac6390cac8a1846c876918f4c11cfeb5a1a9cf1dec96b29668a7802845493960abf2bf190385c9039e686d26915a74261125b5a5bc16ebe5aa7cc3a613e5dd93df191dfd6a02a827b90257323ba6d12b60a120a8c73bb80c3a9eb4906ad14b1493daa3b15c868d9be74006d1b81e0fff00afbd5478a282f258e266f337ac12c8ec0845033c6395393d69b96a425dc92568d2de412c84948f74ad12e37302012c060639c60e79078a8dad88bc854dba5bc922c922166ca821bfd61c6073d36f6e38a8e68afe1b65b6964b5804b232f96e599c03d8e3a1c0e0f5c1a827d4aced6554496e2e2e96625e4dbe5bc79c0c027ae318e9dcd46ff096911492ccd348970934d7136d9f31a615472081e8bce476e7d8551be864def20dc36b90a2462ef83d8d681b9b87d3bcdd8fe6f99ba42a7018118186f4c6383eb556eaea0b5904167e4ca3cb5ddba4c306c7239f7abbbe852dc758da33596c10c8662095558c95e3d7b13daa931f2599250d1b90000463f0f5e95a5a46b73e9e6599a758481b56349325b3eb83803deb2aed9afaf5a58959da6427e519da73cfd688ddb771f529dc44d3c8f2c641cf382793ff00d7aaaaa49eb83e86ba286c2544324be588c93f316c1000ce4ff3e6aea682d2cc82465d853787f2c90c3e527e830d9cfb55f30f98c3b0d41ad636882e637606423ef119ff003f9d74be589a38e21b176ab33e3e618030071df23823a0faf21b782da6f200470cc76b6dcee1d09e3a2f07afa548b692dacf3ce27dd1c598d5390141c7e1938031efcd4369ea4377294d02045b811c8a8ec4a0618600e0e08e99f4f5e7daa95c793148f1c6cde58ece3a7e03a75e95a97b7b0dd1629bda7666dbbcf0179c9c0e0000f5fc3b564aef7dd18c9c0240f5c93c1ff3de9a2a27d0df037c4715f78624d0a4957ed3a7b931a17cb342c72081e80923f2f5af55af8c3c33afcde1bd7acb578635796d6404c4c71b81fbca7f0fd4035f5f687aee9de23d2a1d4b4cb959ede41d41e50f7561d88f4ab459a345145300a28a2800a28a28039cf1ce912eb5e12bcb582379660be6471a3052ccbc8ec73eb8ee4015f3ee1edffe3e6223cb3831b0c156ff00eb73ef9afa96bc6be29f847ec53c9ae59a84b49ce6e02f1e5cbfdfe9d1ba7b1fad44d686738df53ce8858e4462f9ddf31054e0923b7b703dbbf359daa5f2d95b3fcc892ed711e01c29e78cf627a81ed525e4f14c81addb31631f3b6ddc7f8403d7039e9ea6b135257b88243196772230cbe59cb30ea7d14f5fa83d79a8b6d7212d4c7b833dc86b916e113003346081f5fa9352d968ef779208f5c1ad5b2d32eef22c481204645da58f25719e07d08eb57ada04d3ee7c98a369e4f97765f1b013c138f5fc6b49376b229484b5f0d5a2a0371238ce32179207ad6ae96ba2db093eced728aaa7cb96452cb2301cae072bc773f8d57bcbc8a0189d23123b823e6c9e08c741dcf4fad50fed1dd782196d24846c2db5f821fee92076c8e33d79352a9b7b9376ce9f47b8b75b191e0b8f3646e1d5508dbb4e4824f00f41cd352589fccb336732a4d1099c63a9607e5cfa8e3f3fa5673ac51444c2aab6d1a67683c6d1dff3ef564492218e432198e372efe046831f901c9c77e9592a3cb2e644b95d5889ec96e5c19d07971b05452b813923ef9c8fba0647bf7cf1537931c31c8a23964f25446986c6f2083819c1edfa1a950b44a76232a850e99382d939639e9df207e86a382190451c42465d9211f3f183bb938ea49008edd49ef8a725d8570fb2485636936b6e759584641daea33d49e72323fc6ab9bc79ae240032b458577504e1b3c228eafc310471d01f4ab32446591479aea89209982747c03bb9e723a0c1c0e3f0ac75796196e19136dac8e5cc8df31f55518e31953d7b13e9427d0a456b0b913493a2f978f3888d8c7b4b9c7caa703eef041527b8ad7b9682cd577c801f2846d9e005da772af4e7001efdba038aced22e252b773b48ab1bc85a28e4038cf270bfed1f41d80ef4fbcb659e195e2c167864004aa1ca8fe1192701ba271532779d8a68c7d404297962f2b08913cb492153b5803cb13c70318ef91915a8af18b89a58edb6a88c95800cabaf182071c373839acfbc502345999026c8cbc7b725881821b69e08c648eb9eb5168da9d9d98b9b5959d0170e2676c90a01c018ef939ad24af1d076d0d49a58625202b2c4ed2a332b7cdd8292718183ee47159b241109de69228da49432e483b72463701d8f7a7c17f6d3c72c7b89595c2101324273f32e780738e3dea49564dbe587e991bc2e3764e7271df151f0f90d26675ddcb5b5a10b239fe15c9eb5824e793c9ad1d59c35cf9609d91f1f5359bc56f05a168b7690f9cc5630c4e3e6c0ce07bd757a7e95e5dcc7e537960316519cee38f9777a2e7fa560f87a4b482ee49aedc050a15539cb127d3bd7a05cc12d88904a8ade63ae14380e72cb8c76159559b4f95132b98663b67fb2db6c0b6ececafd7f7dc7cce7d0657bf7c1ad59ddc09962b765f29c0c49c86c28c0c6063b0038ef9a491966ba8d01c456ebb9b0308aa73b988f523800e71c13d6a09b506b77b34cc52c73445d648f2589da36fcbd8707e627b9e9de6eda33dca575194c8481a7ba660c03fdd88f39191d4f2481efde9ff6a99e320807cc9510ba2866793ab63fbd8e9cfad457f24519921b37965291309a30df772472cdd08dc074f4c52c62dac2d92663e64b1658e17e57c9c1d99e0608c73c9e4d357b1456bd8a202e248614f2e17f2df69181c0e460fb9fad54313070587047009ab96e24b7db2bdbaad8c96cd97c72fef83c8fbdf5e38a87698b4e883302e0811a90436de5bbfe1cf4e78eb54ae8a467c9084919d490ac47d4638ce6ba1f09f8b750f09eb56f7b6b34ad6eb26e9ed0c85126f94839ed9c138383d056196758f6b313b806e47414c24a4dc2e17ee8e6b4b947d63e11f88ba178c669adec5a586e631bbc9b850accbc72304e7938f5aeb6be26b79a4b6ba49e2959268d83a329da55c1c860476fa7bd7d73e0bf14c1e30f0c5aead12ac72382b3c21f779520e0aff51ec4534c674145145300a28a2800acbd7f52d274ed324fed99635b59818cc6ebb8c99eaa14727f0a5d775cb3f0fe9925ede380141d9183f348dfdd5f7af9db56d5ee75dd5e7d42e8bac93bef0a09211785daa3ae0023eb49bb1139db4135e8f47bed7a69343b736da7c78f22363f289075c80491df81d062abc10471b341044f86503a7df038cb1fc3f1fc28f2461b01114a800646d5c73f89ff00eb7a1a9e20a89b981c1cef278231c1e7b0e2b2b98bd4a920612c8b1c78918663561819f5f7e4633d39154a78b10aca170e873b11b24fccbc74e7819e7b1ab32ce6185885596f65240ce0b3e09271ec38e38e99a492de331cfe6a6e2d990aa3105d402bb8e3af1b89c601c0aa4c362ade2cb650b4b0c91398a419f33918ce4e00e777cc7af63c74ac0bc8a192f7cd679e79a599e4118870dc3630dcf03bf4ae9becc6e65133ec181ba350871bb1f29c753fde033c0159d0b9935e77408f15ba30ba9c37133303b8fa6ec7403d2ae2ee34cd005d2ce2bb9722245defb39c8381e9c8c761562171359918910a0c8b6003b024e7691cfb1c9ec78aae82316b1491488e9330f2c3363722e09e3ae3b85ee3f4aeb7724317950dc34d751a92c838de1be6fa0032403938c1a5357449ad2831420a5c22a20f946fc6dcf1b79e899c7e5e9512c3346caf1963b99a4db1e14499c8cf5e7f87038c0a861be8efc5cac50b294237c80001d793c67b02303afa8a5b99654b1f2379408aa241b0923703cfd464e39ae6726b41db5228642d0297bd458e362972cec4ee6c12a4377ea383e954e7b75df159ac6d1322e0ee6397071c673d083faf6e69d06b09ba15668c80a91aa326e2caaa7f7a54f01b00023e954356bff3b525992462c002bf360a48303247ae38fd685cce45a44b34f6b6f3c11c53a0495007c06755518f94e4e4e08e9d39a82eafc450cd1c7ba58d63d914ae801c673c8ec7248ce6a948a2428fb4865e1ff1ef5304061d8ca71d33db9abd3a95ca57bbd412e2005632b193bcc65c93e61ead9ef9f7ac9b38d67b830bb151203f36338356268cc70edf51c54fa059b4f765f1f2a8ad6ea316ca5a13da5b6c9fa702af16024919c809102dcf4f6abc6dd604690e33d8d739aa4cc5440adcb9dcdf41d2b08bf692032e676925624e72739a88823b5588e124e4f619a7b2298d81ec3b575d8771fa3308b56b69995584520721ba706bd32e750b7d4904e41682521f7952509ed93d700f047f2af37d2ad259649a548d9bca8f80075663851f8935ea90e9f25a6970d82ae6554e840da7039cfb67f0ae5af249a64cd5cccbfb76bc11082161198a4139ce18c8cb8ddc0e79e2b2ef9612825f385ac715af97b637cb48db47cbc76da7a9f715b6c9ba59165f96296dff00d4939773d473d8f3590618db52bd1771f9723c65ade42418cc9d09c719cf38e7b77cd67091085d3de33a3c0ae159844c72d9c2a75da71d40c1c74e78aab1993ecdf69bafb34d1dd33b6766dd84800e4631dfb0fbd8ec6a48a379ad95a549156440be520cb86694072a3a609e06ee833c669e42c0c6610aaf96ef14677008b1b36c04727a12d924f38eb5b596e0547797ce64276c166eb18d84b382a4ed619e33818271d2923b52d0bc53480ba4b9690b6ecb29e460fdee18638ed4a505dc8604420e18cbb38670700ed00e3273c8ec00aa1fda4fe7dd4d2c109bb93fd5c9e800c30c74248ee6a96bb144772fb6e5e1608b263690af9c301cf6ff0039a6212d136fe33ce3a648e9f85315a59ae1a466f324673918c9e71cfd79eb4b0c321531066ce09041e41e847355b16468cc50aa7ccc075cff0087b7f2af73fd9fb5794ff6be8f2347e58d9750f003367e56f72385fa67debc44acd34a1d9d430e415ed9ae9fe1ff008c3fe10df1447a94f019adde278e58e3037ed3cfcb938ce429fce9a047d6f4561f863c5ba478bb4f6bbd2a72e10ed962906d9223db72f6cf63d0d6e550c28a2b03c4de2cb1f0dda3991965bcda0c76c1b0cc09c027fd9e0f3ed409bb6e79a7c51bf8e6f172c693c6eb6b678281cb6d62c4b71d01c019f5e2bcfede18e58a3f343633b194be4390778607a9ce73c76fa55bbe95eeb509276de24924769428e3e6c93c9edd875e71ef51d9ce8d24c9090f1c4f8063c0404f2557d473db819ace473b7777164f92e163555c0cb723ee7520b1e98278f6f4a851bed2cabe64fbdf6bb71f36470323f87a52cd7705bea915adc3001f009c12aad8c63038c9cf24fb517b716f688b70164b9ba95fcb08a7e6014fde23b0c03d47ad62e4f44348af750a5b96f2e2900dbb6360773609c92a33c7cd81cfd29b0bac76b1907008f2e31c6d2ca3041cf2464b7b647b8acfd56e565b868a18e72aac046aa814bb0f99b3cfddc723eb59f6f7d7f6a5aeaee196584e244daf85419c6ec7a1c639f4ab8a690ed7376466b59d94226f2c115582eec7451e80e490727818c532dac36d94dff3c848eb1c8000cd17183cfd09cfb71556d641a8c88cd2068e2218c4a7024e720b64f63cd6c4acb2d819d86d8802c848e4386391f8e00cf248fad5c1f725e9a150c90c624baf2bcd462707a12ac1896cf704281d477aa497a22bb77959161817cb1b9465cb60e7007dd000ebdbaf5ab7736eb04335c3fef2420fcaa9ff002cfa053c80141c1f53d3a66b2137c5049a949323cd30cc64a93c9e304ff7b1db3de86d0d21ff0069c5b92eca96f6aa1e0627ccf95b388df1d4f5c67a62b00ea572b0c919959a3908e1989c63a60fb74adbbb5b7d3570551ee50866490e557d463ea4fe06b9e9363f231cf3803814e3665c51661d462253ed4808424818c839fd456c6996706a57e6582e8dc79d80f0c87e71e9f5ae49b39ad0f0fce21d7acdf794fde01b87519ef4a70d1d8bb1d74ba57d9c93b7214fa751dc1a9869be541248df70e00f73d462b72f1184ff00bcf9bcc5c93ea7d6a8ea81c692801e10e2bcfe79376625638bd5570dc81bba1ad4f0ac47ca99b6f538cd50d623ccaae3a30cd74fe15b6034846c75258d74d49da887520d5b1141b738f5ae41206ba59af09e37602e39dbeb5bde2bb82b9853966f9463deab1b38ed2d12df762464da09c81bbaf3e95787568dc1bb199142ade64606597033f5351ddc6215e401dbeb5a16d0b45670cae0066958b3377e8292ef4bb9bd76f24719f9727ef1ae84ee4df53adf86fa3b496d25ecc07d9da60517bb150707e809fd2bbf874e57924b89b88d4100377ffeb5737e00bcb47d0a0b459144d0677c7dfad74975335cfee14958bf888ef5e7569373656e6235a4bbd5f4f4ddf650499113a60823db19eb8ed5ccea90bde996f6e5e5f2402eca8800460c15800ddb2d9cf4cd77315c5e4a7ecda7a08234eadd00f73ef556f34ed3d7cc69cbcf7858399241f2f1c743dab2849261b1ce4924b358a3f951961dd584824ec7e65fa861cf18358ede5242b34d22b662646dca00e33f7b181b80ce07700f526ba3b8d4a4812e2d448acb1afcc400a13ae39f4c7f215cdea3f67b49aeca26d67271904613186dc3d4e783d3ad74c3b322f765569ffb2ae6da53e4dccea58a249cc7106006e2bfdf23b1e9c560dc4af2b19651cee258e077cf7edd3815a132bc20453468ca583f9aa097c11c0c9e98cf4ac965916690248aea72991c67e99ade09168954aa0dce5c000b1507ae48e9e957e79608ef1800a5186cdb8db9f7c738aad379906db2954265fcc6564fbbdb208e7d38a8ee331c48e06e68df7b8279fd3a555ae3257906e023ce578018e719c71f81cd3300b0da48046ecfe9d7a7b543249210403b9491f36ec14cf51464618027a903dba718f4aab0cdff0009f8c354f076ac9a869ccace630934123379720eb82077eb83d8d7d6fa16b16daf68969a9da4b1c915c461b31b6e01bf8973ec723f0af8a0b8f301f970b8cfd6be91f829ab6a0de0130b58dc5c4505e491c2ca5170b85623923f899a9a19e8fadead0e87a35cea338cac2b90a0f2cc7803f135f3aea1abdd5f5c9d42fdfce9a59b2e43138edb547a64f41d00af4bf8b3aa483ec5a4c6ebb1819e4518ce41c2fd3bfd7f0af2b9598f9213738ce4e0f5cfca473dbbe7b63de9dec73d495e5623651731dd402772d306c94c0c28206d040e993dfd3bd3d556da2d9b422ab84554fe1c67a63d867f0f5a8b4f9adda5bcdb2a9e369557c00304e3181820ee1ffeacd5c9f20290db48c6dde78c6093fd33ec71c564f5276d0a7716d6f77014b9897c958c48033630c07e78fafa77a7a4ac6f277f2198ce8997651f7b9c71fddebc9ef8f5a7e222db55958445439c821b8e55bb01f972718e7229e0c0625790bac70f969d705d8839f7edcf6f738a996835a9664b60f2ba3466356521b60ebc1183b7920e07e9c73597a879a9a7491bc76f0c52afdf914ee1d30880724a7a9f5f4ab3abf8812c75c8acb06398603cbb832ae4676f4195c9c1fa5737e2abd91e58e2960b566310d9247297d8031c05c1c2fa60f6ace0e7292b9a28233edae9aca7475cab038c6319aed6d65b9bb8e19228a58f6c6369700f2c40dc3e983f4fad737a46866e638eeae252e3682b927824e00f639ff26baaba74b51147018e32bf22e5817db8272dedbb24903e95acd76264d5ec862c6f2db913a12249046985e840e58703bee1eff5ac9b389ccf2a45112f8fdd5acca5551b703c367191d7deb49ae10c12b9986e289b0a8670b9c0c8f524824fae79f4aa97368d75a6a825bcf3288a581461636e49249ce0e3d38c54a496e257393bf732f9ccca033b6ec03900f7eb54e3c18c126b46f6010a10bbb18e8d8e3d39efeb59c8c555d7395ce47d6ba23b1aad88e5ff005993e94c4664915d782a411f5a927c657fdde6a30deb4147b4f175a3db5d82321558fd08e959f7ebbb4c751d8e6b43408bed5e16b609d1ed8019efc7f88acd91f7d9b8da72477af193f79aecc94ac7317d107d3a27c7284a9fc2baff000fdb18bc3d149eab5ccb0ff8973a30ce65e3dabd1e3d38da78420908c621cf35ad56dc2de651e49e22b829aa46fb51807c95719047bd68dd69a250d2427e47519c9e39e841fd2b2354963fed90d3a19234e4ae719aeb21d4126b650638b63004ed3ce2bbe9af712329b6b633b53b716d6b6be67cc982cdcf5e4715963c4127ccbe5c657a670791dc574de20897ec7a7a71b1d245e9f88ae720d32d6e6d1bc972268ce597d47a8342972ddb1249ee59f094130d50dcc5298a35c8ebd47a57a4bea305bc2649a50aa0649af32b190d94bdf62f26a86adaccf7f214de4443a01deb1707527a6c59da6a1f1222b7220b1b6f3a356f9c96da1bd791cd3fc39aa4ba97f696a6f6ab10940488162c30324f39dd9cf7e9e95e6f04267902f415dc69d7b2c3a7a43f20d88ab1855e73d33f976c739aaa94a2a365b899d35fe9b1c965f6885e34b88a42edb72aae3a6e20f5c0278f715c6dede5cc13de98ed6576f39a3791c8677574e54fd0027f1aeb03c7c0672d260f980ae1495078e7ae075ed5cededc3dbe09490c876958b00173bb904e3ef0c9ce7ae7f3ca8f696a0deba197e688f4fb9bb323c92c98460c066120657fe05c0e9c7ad624f752901a450189f95c20c9cf5e7bd6f5d451416f70409fece363c21f1bcab0c92a31eb8c9f4079ac6be79243bd6311c6dfbd4453b9467f13fad754122931bb999dd9b79218940f8cf4e868255634f9c1dc0abf1c11eb4f9368b48e5fe2dc7e5c9dc533dbb0f4a8c81b8143fc79fc335432ba92b32a9059c1dad8ef9ee2acb18c4e048c54b039c0ce4d57794acace73cb00001d477fe94e74c32a920a925bd4647f9e940c060c8f82080307debe9af82ba5c2bf0f229a4b128f3dccb2191df3e6f2177e38c0f9718e7a673cd7cccb1f9ae23da37b90a06475278fe7d6bec6f02e813f863c17a6691753b4d71045fbc62721598962a3d81381f4a6811e65f13ae639bc632246f23bc30c6a63031961f3103d78615c74d19961937ee4540c04aadc9e3038f6fe95bbe3ab5b9b2f1a6a0d2179c17568c48417208519ddfc38fcf0056286b979250768e701d9b276f524fa74352d9ccd7bc41676eab1dd6608bcf04479192a4751ff00a11cf526a4bb7585fcc3f71b023f9f92c4f3ce781d07d09a8523fb3cd1b5b4464595899c1ff58c4630fcf24f5e381834b7f0a9b6da913b8957ca64524e031cf007bfe1c52b0751762e614678d524c6f00fcae480d851d97824fae39ce6b3659bc8927691774b2803630daaabb7e5503b907a923f87ad4fa63b79f025d5cab3c91b805802b321e4f4fbb83c63a62b3efbcab7952eee22391c7958237a92dc67dbfcf352d9496a72fab412adeb5c6fdc5db2c7dea3919ef2ee295620f8c6e18e3f1ab525d2ce8436c19ec3a8fc0d3f428026aa09cb614b201d09f4ea2ae374b5e86add91d9c93c9696e891408b311c967ee081f5fd3b0a80adc2ddc4f70c8fbe22a411c819c9c9f6dbc019c807be6ad2dbbf91348e06e90ee52b850bdf00f7ea0d5596586e65861489d902ab6e41b46c39c91c7246ecf4c0c7bd66dbb98a45bb5b59b0d234914abd304724939247619ce38e3bd65df5c2c1a73c50b88638e20ab281b77bab7203756cab13565e0925204f2315236bc68405e73f3640e070303af5c55496d8cb0132bf976aa046d0af0cdc0e4fd724f3fad3497519ccc9219ad1970309d31f5ace0aa173bc83fddc7f5adafb3ac697108dbb876524e39e9590ea17393d0e0d6906aed1aa219b82ade9c6299bf730a9a51f3943e9915142fe45c23ec570a73b5c641f635451f41780f4f6b8f0b6952edc2342bd7eb83fcab98920d9e72760cc3f235dff0085752b53a3d845670fd9e0f214c71750a0f3807f1ae32fc62e6f463959a41ff8f1af16f1e66e3dc47356d0fdab50b7b68c7df9b691ebd2bd535f961b1d2a3b594ab45b06d04fa0efea2bcdfc3aa3fb7ad9c8e2394b7e95d178caf16e1232c31b570403d456b37b47b81e6be2ad41350d5814501224da081d6b73486925d3e179adc2600c103961eb5c7de96b8d4d9107cf2305500773c015d2d9cfe4582da938788143b8f4209cfe19af460946292339ec6a788981834c1e596532150b9c6739148d6f6f676af840ac0019f6ab36d6516b10d821bd68dd6dda585dbf8a41d0107923af1e9cd66de92ba5cd0491993520013e5216c73c1cff0077ad669a69c494ad639bd4aef7b18a33c7f1115981198f4ab50db4934fb0fca49c1ddc62b461d3834bb0caab0a825e45193c761ea4d689a82d0d2e3741d1afb57bd5b5b08b7bf5673c2a0f527b57a9dae8363e18b3f3049e7ea4460dcb8ff57c73e5afafb9e6b9bf0eeb375a5e9b32d8dac51c6401e63739619e4772718cf6cd4d79ad5cdfa6d588cd7247ce01e07d4d7257a9293e588588dd82585cb49e64e7cc1b66d81422e3a13d49ce4d5596dda6118ba57f9252d93c98d3018f404e003d7ae6a8dd2446e122b9b896fee18e23b5b6076e7d028e58d77da3782bc51aa59b5d5d69674e5d8ec5eee61193ee472c38cfa63154a126ae82c79bcf6e96f7bfda11ccd716d20745746fbb90463d87a76ac278c411001195988c367ae7d7debb9d5e536d0cf6be42cb2444c6162390e082370f61ea7af15c95f27da638d845860aaae1472c7bbe3dc7eb9ad69c9f504522db5150bbaece5403d3d14feb4c059c827e6f98a82a39c7a5288d590ed00397c618fcc78241fa0af48f845e0b87c51af3dcde5a2dce916ca56e527dcbb99812b823a90473c8ad8a3cd3798a68db0071fc5ce47a8cd34619f11311b492a4fa77fc4d7d5be3bf8690f8b347b2d3f4fba8b4c8acd08489200564c2e23527a85539e07626bcca1fd9ff005efb5470cfa9598468f7bcc8a4aa9dc079633ce7692738c718ef4ec3b1ccfc24b11a87c4cd257c912c516f95d02ef08aa8704e7dcaf3ee2beb2ae73c25e0bd23c1fa6456b6102bcea0896f2445f36527939603a7a0e82ba3a686789fc4c308f19c8b1950ef145bc15e37004f38e49db8ebfd2b8c1b7ca91dca8da4ccdb47dec1cf3ebc0fcff5ecbe2640e9e35f35a00a1e0520a1c9938c03db6f4c63d0035c4e316d2e3efe4165f5c8fbabdc8ce300e3241f5acdee733dd935b71f6a92262246f98b9ce4e4641e7b6074f61505eb33c522468c5fe6405b8006d39240ff007ba7a91dea596e103ed6257e65dc8983bc3679e7d4f3cfa1aa53288e478de52dbb2c153e5f938e4b0ce304751e9d32d52d85b52b931a43b5488a38400ac8d925380428ebd33ef93927b522e87aa788a2b7d374ab05babcfbef202aacdd39eb803e6049e3ad5f10e9f3d887789a491815ce0aa05538041e98c0e31cf7ac7baf12df68bab457fa54cd6d750b8659508600952bc8390c71c1ec3a54466e4ec5a5667aa699f05b4af1068c65d5b47b8f0eeaa8c6365b4ba12c52631f3856dd807d3358777f037c41a05dfdaf47bcb6d5211c147411cc17bed0c7693f52299a4fed05ae5bac69aa693677aa3ef490b342c7f0f9867f2aeff44f8e3e10d536a5e4b71a5cc7a8ba8f299ff7d723f3c574dcd346ac78e4d633dba62face6b3bb1f28b69c9574dbc7caa3fbc00f5fca921fb4c512b948e22c642b19c0dbce7181ea30303fd9afa1b54d23c33f102c236fb45bde2c4731dc5a4cacc87ae323231ec6bc43c5de02d67c277dbee2e3ed5613498b5be51b4ab1fe09076279c1e9fcab19c5ee8cf92c605b092486437059a6dacbb02a964ce081ee4e473f5aa22ed16cc98996499360db2f738233800648f5269d3daee72c7f772c272d8caf23fbc3b7d471579f4d8ae2333ac430a30ea3d0f7ac653b6e0ac72b6b28f31c30fbc4ab0155e5801bb30b67e7e98f51d2adea568fa7df152080dc8cf7a75d5b9b8b68ee62077019e3b1ada3249a6ba9463dd46c8cac460814d483cc391c83dab7350b26b8d3ecee6252cd2261801dfbfea0d47a45a1fde2c8a508fef7155ed128dc77d0f5ef08e5748d2d370245baa923e959faa8ff0048bc6231999ff99ad3f08460dad846a3848c8fd6a96ac371b9723ef4ac7f535e2276a8fd4ae86078763ceab9c12371e9db8a97c512e42ae79cd58f09a7fa6dcb7fb26b37c48fbee82d745af55311c04ae63d5449cfc8fbbf2ae8746d4229ae2eef3510a2d93323855c9624fdd033d4e6b16ee1ff00489bfdee3e95d0697a29b8f0db4c61322f9c19c28c9c60d7a775a112d8bd7bab5a6bd7d67ba136ea31fba3d3ca2a40e9dc03546db59d55a77891e356b6431cade582ee17a0cfa1ebf8d1244f6baa59ddb45b51bf848c6d1d307f035d847e1a8f49c6a779287b99a10bb3031c1c83ee71c573d59c237ea812380bb1797771f6dbd555ba9f1b551768200c648edfd6b634fd1e3f2775c4ccca79651c2fff005eac4d09babe321f9803c66ad7292c56b6d13dc5d4ac1638621b8b13d001512a9292b44696a466de28adc166f26051ce0f2dec2ba7f0b780358f1522cbe59d33486e44cebf3483fd95eff53c7d6bb2f05fc2e313c7aaf8a5527ba07745659dd1c5eedd99bdba0f7af520000001803a0ad69d0eb22ec60f873c1ba1f8560d9a65922cc461ee64f9a57fab75fc0607b56dcf179f6f2425dd048a577c6d865c8c641ec6a4a2ba86791f8afe1a0b4b396ead35013f984acafa93e7629cf3b872cc4ed001ea715e52fe06f10cda8a5b5ae957b974291068197900649271c0cf538e315f58900f500f7e696b3f66af742b1c0783be17695a068260d42082eb52b881e1b8b954da423801914f5c0ec7ad769a5e9969a36996fa758c222b5b74091a0f41ebea7d4f7ab7456830a28a2800a28a2803ccbe31dac834bd36fc1630c5318a503a26e190ff00815af20b880b6f0de62296f2dd4757f94649ff00681191f4f615f50ea5a6da6afa74d637b1096de65c329fe63d08af9e3c67e199fc2fa94fa74b305b19007b5b97272cbb8e4367ab03b7a75cfbd6735d4c671d6e6239cdf184952aca4797b46010b839ff0067e61efd79a892fa0b79c2e790fe6bbb0c2e0e4b8563d76900f1f8531ae566791a172e62cf9aa06c18c825b9e48383d78f6aa97da46a33e9f67aa5c4463d3e795e3b7b96191273b89c771cf5f63e9509df7252b9afe19d0351f19eb1268b6af15acf647ed01a672d194dc724af527e6181d31f5aea354f813e211249259ea5a6dd2b12763ab427f0ea3f5af4df87de0ab2f0d6971dd9891f52b88f325c14dafb0e1821e4838e991d702bb4ad5451b28a47c8fabfc33f1668aacf71a1dd18d79325b626503d7e5c9ae7ad6dc34ccb329f97839cf1f87635f6cd616bbe0dd03c46a4ea5a6c2f31e93a0d928ff810e68946eb40e5ec7ca30336917315cda5e4f69331c2490b946fcc76aead3c5baf6a969f60bed726bbb6c82d1c855b3839192064f23d6baef13fc15bc8434da3cc3518472209f0b328ff0065ba37e95e63fd829a7df3c17114f05ca1f9a099763afe7584af15ab21a674fa8e8efaa598bcd3c85be84670072ebe9ffd6a4d0808ede2970876b1825407846ea07d3afe55474ef3eddc7d9ef6e60707230430fc88ab32de6b2d799b9b3b59a398aacb77045b5db1f77760e323dc66b9dfbd171256e73de268bcdb8cb1cb0c8fcaa2f0faadc4725bbf38e31ed5b9af69ed2e258c7cc3e6c7ad60692e2cb5a8d9862373b587b1aa84b9a9d91674fa24d278665b5be55ded6377e685c7df8d87cc3f2ddf9d7d1a961a26b3630dcfd86caeade741246ed0ab0652320f22bc5752d210695f68dca41c74f4aeb7e0ff00880b59dc7862eb89acb32da927efc2c7903fdd27f2615786a9ccdc6438ef622d5e2b3d13c4b7cb676e905bc2abb638d70aa4a82702b8fd4751b3bb8d822f925fe6552739cd751e259b7f88f526ce7f7e07fdf2a0571d7be1e8cbb3894aab72086e95e6b7175657ee58ba0c06de499c1e190f6ed5ceea84cda99ee14d6fd8a9b50c1646903020b31e6b224877dcbb1cf5e6b583f79b068e4ee60325f5d0f42147e35dbdbc9f63d2e1b484e37000e38cd7353c422bc91c8fbf38fc80ae934d81f52d41020e0f03d87735d1524dc5116d4a7a85e42ec6c9003220dca7b6e1d47f2abbe24925d5dadf507b9640f1061183f28c8e6b475af0b5aade49abc2f228180b1606d0c46188f5cf15cdc89717f6b69a7dac6f2dcb4a608e24eac49e07eb50acda5012dc4d2a2bed52f62d334b81ee2ee638503f524f603b935eff00e08f87f65e13805ccdb2eb57917f7b7247099eaa9e83dfa9fd29df0ffc0d6fe0dd2007db2ea93a8373381ff8e2ff00b23f53cfd3b0aeea749475ea5a41451456c30a28a2800a28a2800a28a2800a28a2800a28a2800aa3aa68da76b56eb06a56715cc4ac182c83a1abd45007091fc23f0aacb049241713345746e4f9b31224ce708dea809ce3db9c8aec974eb24861856cedd6283fd4a08942c7c11f28c71c1238f5ab34502492000018030051454572f325b48d6d12cb301f22336d04fb9e702818f7912300c8eaa09c02c71935c77883e28786bc3d7535a4d712dcdd4240922b68f76d279c12703a7bd2ea1e015f10ca25f126b17d7aa1f7a5a40c20b78cff00b200dc782464b1356ecfe1d7842c4868740b3661fc52a990ff00e3d9a5a89dfa1cce97f1bfc3f7d3797756b7766319de70e339f6e7deb47c45ad7c3bf11db3dbea9aae9f318a3f31658e4fde460ff71877ff006467dc57636fa5e9f68bb6dac2d611d311c2abfc85733e2df87da47886dccd1dba5bdec4ac6378502f9871c06f5e7bf6a1ec27cd63cabc43e0fbcf0fc6b7f05c0d4345970d15ec5fc00f40e074faf43edd2ab69f76b090f9c646194f46ac59352d4bc2ba84ba724f7105ca8d8e8e3a13d990f0ca7b8208355219b51b5b89679ad87d989de620a53cb079c007903d2b8aa52fb5132ba675b756d95c83ba3932627fe87dc5715ade9ed1b9963041fbdc7ad75ba3ea36ba840f6e93019e541fe16ec7fc7eb55efe11286475c30c8607b1ae68c9c24517fc31afc77ba3476d2aab6d1b5d08ce6abdd4f2f87bc4d65afe9392f6cff3419e1d0f0c99f71fd2b98b4074cd41b6b6c0dd4763ee2b7ede7171032bbfef3ae4f73572972b5288d2d4eaef647b9966b975daf33b4aca7b16e7158b7f3622033daad5aead1df288a5754bb54398cf1bb1dc7ad66dfe59c2815c318be7f78bb85a0cc793eb51bc2021623a9ad1b5b722dc7ad175094408a017638519ea6ab9bded0b4709ab02f7890a766c9c7d6bbef08586e40c303761727f5ac89b48b7d2ac669f52d8da9dc3fca81b3e420f5ff689fd2b7749d4adf4fd3331ca9b997d6ba5cf44912d5c9bc4b708b1b40a4ed030a33deb43e0f697652eb3aa6a32a86bcb7545833d11581dc47b9c63e9f5ae52fa496faf17018808d231c7418c0fd48aeb3e0e2c9ff0906b04fdd10203f5dc71fd6b4c2ab4c9ea7b1514515e99414514500145145001451450014514500145145001451450014514500145145001451450014514500145145005792c6ce5bb4ba92d607b98c6d499a305d47a03d4543aae9367ac593dade44aeac301b0372fb8357ab92f1bf8b6e7c330dac7696f1c93dceedaf3676285c678041279a4da4b513b25a9e2bad782b5af0ceaef74b6452d4dd3c70dcc657cb917395dc013b491fa8c5589245d4223208da3ba8c7ef633fc63d47b8fe54eff0084b358b39ee136402cee3264b5890888e7938524e3d6b327b9b59ef9a7b78a5b725701039207b8f4e7b579f5a3ccee8cd497420d42cbed50fc9c38e558557d2e67c79720c4d19c1f715a561399a56b79b1e61e558746fa7f853a6d39a3b813aae197a8f5158735bdd65ad4afab5a3cb025cdb92b2c78746ee08aee2dbc39ff00094787e1d7b4021c38db7164cdf3c320fbcaa4f51e99e70475ae6c46cc83232a4703d2b4fc0baf37847c4e629d88d2efc849b3d237e8affd0fb7d2ae9384bdc90ed61f21fb1db94914ac89f2b211f36ef43e98acfbbd767861090623603f8473f9d75de20b38afa699d9479cb2b8f30753f31ea7bd703aa69d731b1651bfb02a2b0549465a9473f773cb7523348e4f3927d4d6858433c6826f3800391b874aa1736d247711c654919f98e2ba1d274c935bd6b4ed1a207fd26402423f8631cb9fc81ae9dec97511d47847c15aa6bebfda6f22c1672aed4965c96979e582f71c7527e95ea1e17f0959785a09c5bbbcd7170c1a699fbe3a003b0193f9d6e430c76f0470c281228d4222a8e140180053ebba14610775b80514515a8051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005657887c3f65e24d2dec6f54e0f31cabf7a36f5535ab4501b9e09a8f80bc4763793db416125e449b9925006d7407af5e0e3b75ac43a58b69bcbbeb69ed27c06314ca57af438ed5f4b5606bde0ed27c453adc5e24ab70aa104b13e0e0678c723bfa5652a49ec64e9f63c124d330fe7c206e2d91b1b8247735af617f15dc82d2e90417606143747f5c5769a87c2e9ed92e27d2effcc20968ede45da48feeeecf27df03f0ae03edf10616f7b0bc643eddc576b2303efdc11ed5c75a95fe2428f340bb2ddda46be4c68c1c1c73cf3552ea032c6c2650197a6053d1218ae4dd4a7ed1093f79072a7dc54923c7292c8fb94f208ae16b95e86c9dcab0eb375a3842774b69f7593fb9e8456d7da6cf52b7f36da4ce472bdc7e159f6f66b32b090031b02a41ac493c3faa698be7d94ad37ef5d422824ed0320f1c93dab68b525a83352eed5171ec4f5aee7e12e8ead3ea3ae48bf306fb2407d14619cfe2768fc2bcda1d5a47c477b0bc2e47f1a11f8f35edff000d60583c1169b4105de473918cfce79fa600ae9c342d500eb68a28af40028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002bccfe23785c297d6ece31b5f02e900e33d03fe3d0fe07d6bd32a2b8b78aeeda5b79d03c52a14753dc118351520a71e56268f9d2df2920f2b084f057f84d5b4b48ee0b3c24c5329f9a3f5a9759d266d1759b8d3e407f76d98dcff00129fba7f1fe74d453b86410e0704578b5138bb31264b6731859a3993923b55e8b5492cf57b5b8b41c5ab8217fe7a1fe2cfd471505adb3b079981206393f5aae6320cbce181ce7d2b35269a65a3dd2de4b5d4eca1ba5449629503aee50783568000600c015cef81ed2e6cfc296ab75912485a50a7f8558923f4c1fc6ba2af7a0db8a6c4145145580514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401c878fb415d474c1a8451eeb8b453903ab47dff2ebf81f5af3cb5b51245b9810ebd7debdc5943a95600ab0c107b8af374d02e2dafa7b416b3b2a31d8ca84865cf0735e7e2e9fbca4909a31ec532ad1b770456a786bc2e355d4daf6e0ff00a0c0f8db8ff5ce3b7d077fcab7ac7c1e4babdcbec4ee8a7e63f8f6aeaadada1b3b7482de358e24fbaab4a8e15b6a535b0225e831451457a230a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd9', 'Transparent', NULL, 0, 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "ProductComment"
-- ------------------------------------------

CREATE TABLE "ProductComment"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"Comment" Text NOT NULL,
	CONSTRAINT "ProductComment_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade
 );


BEGIN;

INSERT INTO "ProductComment" ("Id","ProductId","Comment") VALUES 
( 1, 1, 'No comment' );



COMMIT;

-- ------------------------------------------
-- Dump of "ProductGroup"
-- ------------------------------------------

CREATE TABLE "ProductGroup"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"ParentGroupId" Integer,
	"Color" Text NOT NULL DEFAULT 'Transparent',
	"Image" BLOB,
	"Rank" Integer NOT NULL DEFAULT 0 );


BEGIN;

INSERT INTO "ProductGroup" ("Id","Name","ParentGroupId","Color","Image","Rank") VALUES 
( 1, 'Groceries', NULL, 'Transparent', X'ffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108012b012c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f6c66208e17ee8eaa3d29379f45ffbe450ff00787fba3f9532a6c324dc7d17fef9146f3e8bff007c8ae561f1e6952bec31dc261ca392a0ece78279aaf7fe3fb681ff00d0ad1ae23cedf359b60cfd319c567ed21dc8f6b0b5ee767bcfa2ff00df229c1cfa2ffdf22b3747d521d634e8ef20054312ae84f28c3a8ad1abbdcd134d5d10df6a09a7d8cb7732168e31921101279c5496d7915dda4775132989c6412a07e754f5987cfd0efa31d4c0e47d40c8fe55e5f7b24d77e1fb75323f970cc576ee38c3286538fc1856739b8b32a953919ec2b2ab8ca346c3d57069db8fa2ff00df22bc9fc2dadbe8569aa4891893309996266c02cbd7a7b64fe158f71e38f106a175213a8bc09bbe58e00100fea7f1a3da69723eb11e5bb3dc379f45ff00be451bcfa2ff00df22b83f87fafdf6a535e5a6a174d3b222c919739603386fe86bbaab4eeae6f09a9c7990bbcfa2ff00df2290b9f45ffbe4514d343280c87d17fef9147987d17fef914d3499a403bcc3e8bff7c8a4f31bd17fef9159726aeabe258746488b33dab5cc926784018281f89cd68d24ee31dbdbfd9ffbe452873e8bff007c8a652d002f987d17fef914173e8bff007c8a6d1400ede7d17fef9146e3e8bff7c8a6d02801c5cfa2ff00df2293cc3e8bff007c8a43494080c87d17fef9149bcfa2ff00df22931cd25002f987d17fef914c321f45ff00be45069868014ca7d17fef9150c971b464edff00be45473cc231c9ac1d4b55489492d4016eff005411a13951ff000115c26b9e26237221524fa0155f56d6da76db193e82b9830b492e598b13d78aa4805267be9b7bf393e95e93e0c22d74df2fe50c5c93902b95d374fdca3e5aeb74cd366e36656b96a5669f2a3d1a5848f273b66d6a130922d8a1493fec8a934fd091ed773a2ee27fba2adda6978219f93ef5bf6888b0e3a734e1ccddd9cf5d412491149f787fba3f9537a722aeb5a6e39ddd80e94dfb19fef8fcabb0e33c5fc57a68d27c4d7b281b2dee3121c74c377fc0e6b06c6764be9f4ebb3feb0e55bd4fff005ebd5fc7da279ba5c77fb438b73b2500758db83f91c7e66bc96f6ca458d88dcd716447cc3ac911e87ebfd4570545c93b77386a2e59b475be0bd6db47d60d8dd37fa34ec1189e8adfc2dfd0d7a1c9afe970ea91e9cd7686e643b428390a7d09e80fb578dbcbf69b38ef931bd46d93d0d450385c9edf78f3cfd6b48546958a8d79423647be140eac8dd18153f435e551db37d8753b171fbd853383eb13ff00f125abb8f06ebe9ae597d9e793fd36000367fe5a2f66ff001ffebd636ad6a9a778e5bcce2deec066ff0075c146fea6aaabd14fa7f99ad592945491c4249f672e36ee0e8d1b0f50ca57fad73b6adfbcc67a80735d1dec0d6f712dac9c3c6e51b8ee0e2b9cd9f67d43ca240ea07f31509e9638bc8ec7c1339b3f18da67eece1e13ff00025c8fd56bd7f38af0cd2276b6d6ac27fee5c467ff001e00fe95ef9f66e7ef7e95b52d99db8597bad15c506ac7d9c7f7bf4a5fb38fef1ad6c74dd1508a8f06affd997d4d27d997d4d4f2b0b9c65b2e7e25ea449c95d2e1503d06f26ba6c1ae7f455fb67c44f104ea0f9314115b03ee3afeb9aebbecebea6a20aeae849a296da31577eccbeb4dfb28fef55f2b2ae54c5255dfb2aff78d1f678c7f151cac2e52c5262aff00d9d3d4d1f664f53472b15ca18a2aff00d993d4d27d953d4d1cac2e51c534ad687d953d4d27d913d4d1cac2e676d34d61c5697d8d3fbc68365191d5a8e56174719ac4ed1a3115c15f3dd5d487a85fe55eb9a8e8314d133292c47506b9f7d1234fe01f953b0af73cd86932e06e04923938eb53c3a415604ad77874a5cf238a8e5b0555e17a535abb1baa5eeb932ae81a6abb72bd2bb5b6b244030a2b9ed15d6394a1aead1c6d18acaac1464542a4a501db42ad5749b1bb1eb52ca4942054705b9284fbd4a44cb635eb16efc57a2d95fad94d7a9e796dac106e087fda23a55dd409b8b09ede0b8f2659232ab201f7723ad78eeafe1ebed3640b7084a6711cca72a7db3fe34ebd5953b591c556728aba47b4cf0c37d6724320124332156c1e0a915e35a869b2d8de4d03a6eb9b125186399613ff00d6c11f8d5ef0cf8caeb43b85b3bcdd2d9938da7aa7b8ff000ae9bc590417d676fe20d39c48d00c4857f8e23fd54ff5ac2bcbdad3e686eba19c9aab1badd1e556cab63a9bd9939b6ba5dd09edcff9fe555e556b7b878bba9f97dc56feb9a409e11f6721779f36d9bfb927529f43dab1e7737d6315f052b321d92a770c3ad73d1aaa6ae8e76ac58d13529b4dd4a19e07d9221dd19ec7d41f635e95e24b88756d234dd72d47fab93cb9011cae7b1fa103f3af2688824291c673c5765e11be331b8d0ee1ff00777b194524f0241ca11fe7d2babe28b877084adee3ea41afecb8bd6980c48c8ae7dce307f95723a945b2fade6c637e338aecee93ccb28e5718688ec7fa1e3f438ae72fad24b811c69b7cc49063271c77ae6a35aeaf2f989c2529a51576c8cee16fe6a7de41bc63db9afa1ede513db4532f491038fc466bcc2cbc0f6ffd882696f8c970c99f2d13007d7bff002aecfc2faa2dc69a2d641892cc2c45874618e0fe42baa8d68fb4e5ee8f428e16a538b948e828a8fce8ff00bd4be747fde15d8511dd5dc16517993c8117a0f527dab90d5be21c3a7c173b74dbb0ea76c32ba8f298fa920e40fc2a5f13dda4fa9c3023644487763d4fff005ab3a6f266b6f224851908c36475af95c7e7b52862654a16e55f7f9fdc7a74f00a74549b69b26f867ba68354bb762e649c2ef27ef1c6e63f9b57795c0f82ed9347d526b5b695c59cea646858e42b8c723b8e38fcabbaf3a3fef57b796e229d7c3a9d3d8e0a942741f24b724a2a333c63f8a9bf698fd4fe55dd74662ccfb46077aaa58e739a92470c7713807a669b1ac72e46f1c7a1a6022cae3bfe552adcff007bf9544f185240607d699b58763401756646f6a7820f439acfc10338a164607ad0068d15512e1bbfeb528b81dc7e540135150fda13d0d06e140ce0d2ba0b135615e6039c0ef5a66e83fcaa08f7359d7037c9ec2a92b956e5d595a384cc7a714b7768ab01f5ad2b78c08c605437c07978aa8c2cc9ab88f76c8e46d818af481eb5d659e59066b9e5b72d76081deba4b442b18acf1095ee3c2c9f212b0a9adb1e59fad42e6a5b7ff567eb58475369ec5690fcc3fdd1fcaabcf1457503c13c62489c6195ba1153c9d7fe023f95475b331b1e6de24f0ecfa6ee970d3e9ffc33019921f67f51ef54b45d7e7d0a6d8ffbfb290624889cab29ee2bd5b0082080411820f7ae2f5ff0846aaf75a745fba3f34b6ca3eefab27f55fcab86a519537cf4f639aa5169f34372a4515b36fb2590c96538f32d65ee17b0f6653c7e1ef5cddfdb1d3efe49e5188e5223bb50380dfc320f6342dc4f60a006df0ab6f561d8fa8fc3afff005aba49e38759d345caa0918215913fbe87a8fa8ea2bc5a93787ad75f0cbf07d8cecaa46eb74713242d14cca47dc3fa54b6cd2ac824858acf110c9f51cd5b781816b791b74d6e37237fcf588f43f5ed5449d92878dc0743907fbc2bd8a72538e860d1db23477e6720011ddc5e681e9bc73f9367f2ae76e7cc54b7b98bef8383c64e4706af585e00f6cc9c4720381fdd39c91f9e4fe3515dc27cbd4a0008d8fe6c647a38ff001cd79939a8d69c1f5d7fcce9a727171a91e8757e1ad7a628fa7ac024948ce647daa07f33573428dad3529dae36c6d36554237c8707f9fa7e35e7b637d7b13c2d6b1bbcff00665499829246ee3f0ed5db68c867d2638a5dfbf60f2c373bb9391f857ad42946cbab4773c53a8dd95933b1c9a42fb4162780326b96b3f10ad94a60bdb988c692796c59c068cff51edd6b7352997fb1ee25460cad11daca720e78ae8a951420e5d95c23172925dce595ccf3c93bf25d8b7e7523e36920e68b741e4fb8a7ecf94f1c1afcb673729b93dcfa76d276ec58f0e67fb5252dd44476fb722ba82d5cbe88766af8fef44c3f9574ad5f7790b4f04bd59e3663fc7bf921dbaa2b8ba82d21f36e2558d338cb1a82fafe1d3ad1ee273f2af000eac7d05711777971a9dd7da2763b49c2a8fbb18f6af4ab5754fd4e7a341d4f437eefc4aaf337930b9880c2973b7f1a86d3c4b6a2589e58a58d01f99810e3eb8eb5853b15cc63036824639cfd69ab2472dbb0caa95c03c773d2b8a58baa9dd1dcb0f4ed63d067bf8a4b6596d0ace64fb850f5a8615d5f3fbc23cb23f85b915c8697a9ae937451f735b4a7e6e3ee1fef7f8d752b78f0b23a4a1d186ecab6548af428565563747254a2e0ec22ea4d6ee55a53c1c32b8c7f3ad5b7923ba8c491b020f500e706a8dd4167aac4cc311dc01d5bdbf98aabe1f2f1dc4d16dc2e327ea0f5adee44a0a516faa3782303ebf4a4e6ae02ae0645606a5a95dc5ac0b7b61118234cc8b2292598f6073c71fceb2c4626961a1ed2abb239e31727646916e7144992a187ae0d49198ae2d23b88f203a8383dbdaa199f66c4eec735bc5a9a4d6cc5b3248d02a963e959971788b2ed079cd6a49feaab027837dc83ef5d34a28c2b556f446d412e6318a64d1190536d908415795014a8bd999f2736e63adb0493a568a0c460535e3c3e6ac2292bd2b9ea7bcceca2b9558adb496ab76eb88cf1de8117ad4e830b8a88c2c5ce7733a489f3f71bee8eded51f9327f71bf2ad7a2b4b19191e4c9fdc3f953c5bcbfdc35a9451603cbbc6fe189ada19757b189bcb27373081f28ff6c0edeff9d735a06a6fa7cf196045bbf193dabdd5955d4ab00ca460823822bc97c55e156f0e5dbde5a4265d1e66cbc63936ec7d3dbd3f2af2331c1a9536d2d1efe5e66138b8be7890f8934c924852ef4e03ed11e6480766fef467d8d72718fed57b56b0519b9215158e36b1382a7d0835e95a33db5d6951aed12852307d3eb5caebbe1a974dd426bdb15c4370fe7845fe0907defcf00fd41af3f0553921694af6154a775ceb6296926586edecaee278678640c6271860c3a8c7b8aec6e8c2f60f75240aacd090588e4a804e2b76e74bb5f12e8f67adc10a1bf300657c7dee3953f8e71e95c66a97e24d2278583ee60547078c8e33e95be3a0e13526f466b420a1a339bf0ddab5f45aac64c9e7a69c93c187236b06cf183f4aded3d7edda5f9a93ce6585b782652783c83f81aade0d68ed35d8da62a8925b1898b1c63001e7f1156347dba7eaf75183bacc48d1b383c043d0d73cb10e497bd6bdd6ff0073fbcf4ed15a97b55d3e1d46ca3d4638834ac02cabfdf1dffe043d6a2d112f6ced6e74fdc058cbc8563feace41ca8ed9ee2a19c2cc99b799de1572a5437cb9f5fa1ab16a45aa61fe5881e79e95e7e231752ee51eaacff532a5885ed395ecbf43a4b286d1a311e58c83afcdd6ad358c6dc29603d38ae4e6d736dec690488850724f04fbe3d2af45aecefbe45e60ce03b1c64fa006b962a8c6369c6fe762e38fe66db36edf4efb35da5d2cbbb66729b719047ad5c3a92852cf11500649ddd05476f3acf0aba82038ce0f6ac6bb94c96d347316440e50ec192467f957d1606bd1c2d09745b8625b9ca329333750bf9b55b97b8914a5bc7c4287d3d4fb9a75adbb13e61e11461a365c93d39cd588a342aa91c8191b8e4720fbfa501da389519c6f19f942f4cd5539aa9fbcdee75c65171b43622bb8f65bab1c46ca0f03b0f7e6b9fb79268e379701dddc8da7818cf03dab5efe66b9408f1ed47386723f3c63f1aca95b165b226076a6cc95c609eb8ff1a73b5f4348a76d4745334b1b233279809e189fbbff00d6ad3d22f5ad66fb1ca77c6ed846ecadff00d7ae6ef9678d16eed977cb180ad1efdbe601df3d98638f5e953d8eaf0dfc46361243711be1c4a79cf5eb554a4e0d4d0a4b9972b3d0ac626f3e4b876610a236e627d462ae689704aba1dbf2af040e78f5acab6d605f686823037ab79722a8ea4739fc47357744db89f8c10bfd6bd88b4d5d1c13bf2bb9b9777c2d604d80199c7cbec3d6b2da13cc8e497639627b9a40ff006abd2fd541dabf41535db8488d7c9e655feb339393f763b7f99a528722496ecb1a4c83fb30213c46ec0fb0ce7fad554bd8afb512f048b242aa02ba1c83ea456769b34f35b5d40501b79491bbebc11f955bb78d6de781111515485000c003d2bd1c2e6d1a71a34ad7d126fb7432a9876dcd9bbb77a62ab35b00f9c55d8ce4538a64f4afa4e668f31c2e451c3c5580bc62955714eacdb355121f24139352e0014640ee2a9ddde244846e152ca2496754ef4b0dca32124f7ae4eff5b8e32d9907e758ebe2a54dc0377a4e490d26cf4637318e0e7a67a527dae2ff006bf2a635a331cee1d00fd299f626fef0a7a8897ed91fa37e54bf6b8bfdafcaa1fb13ff007852fd8dbfbc28d4097ed51fbfe54924d04d1b4722ef46186565c823d299f636fef8a3ec87fbe3f2a5a81c75c686ba1ddb5c58ee362c72633ff2ccfa7fbb566ecc3776865f95428c9cf418ef5d43596e52ac54a918208ea2b8cd72d27d163b85405a1910989bfa1fa57898dc1c69425282d1eafd4169b18fa6f8a5ecf4a8f4bb495e2f26e995a62a3843c8001f727f0151ea56f1dcc2ccd74ad2ca77e78193f4ae6a2fb44cac22252e18ee9235c1471d8e7a8c67b53d6d25566f999a7185cb1206ef519e7f0af1a7889c972cddec63ccd68134b259c8ccacaf2a9cc848c0c7a52595c4d7165786d44492a1df87618208e873dab26e2c6f8dd79a1c095b3b44841df8fbc707b66b025f25ee5bcf9995da428a106037527033d053a7878cd6e4ca727b9dbe9b3de6a77a96b6d285dc15aebc900aa81d573fa569deea51c080c9044648fe4f3436e3fe1e95c27852e66b6d5a484dfcd6f6aeacd8538576dbc1cd74da1c965a94a9a73c51060df3199895233d47afd2957a1c92e55aaff308f3743a0d2e686e58cb1888baa16cede49cd4ef65f6ad8e446c48c92adc0ed9f73ed543599a5d2ef6caded8430c31ee6959576f983a05f5ef542df53bed3a41e58b79cc992202d86fc3f3ae6745dec5a76dced5ee040fe479bb008f7361ba0c718fcab2a5df35dc91dacf14e8dfeb4f980b0ff1cd53b0ba9f505114f034326f236eece063b7b62badb1d36ded230b1c51a1c72caa066b96ad54a5c8d5dfa9dd084ab2e66ec8cb86cc5a5a921b19396dddfd0520443229dec00058807a1e8466b666815f041e41efd3f2acdbcb6fb3b79f1647aa8e83debd3c0e3e9c5aa3356bedea7652a6e0ac9dcc3d4415272a5762ef1cf1cf154521b8b968962877fcdd0738c0eb56a78e6d475816e1b0aca7cce7800671f5e6baed3ac21b481628570077ee7dcd6f8ec72a12e482bc9ff5a9d0dd95d9cac9a2dd18cacd16f46078dc3bfa8ae16e963b5bb36eab3c12248617322904818208f51e87dabdc9ad7e657e322b0b5ad16db55b67b79d0641dd1c80731b7a8ae5a599d4a4ff007eb47dbfa64f329ec60687a9bc36df669c4415d5572bc618743f97f3aeb34991624ba39c1119c0af378e316329b2b9f323686401a4cee047e3f5aedf4991a721c1382a09cf7afa258b50c34e77d969f3d8c6a53bc92ee747631ed4cfb605437df39083bf5fa55e4511c207a0aa48be75c163f7457cd558feed53ee11779391341188a1555180074a8a439b8840e73228fd6acc8c12326b222b75b894dcc85cb2b7eec6e385c7703d7de8a95634e515db5049b4d9d9aa2a8e053ab3ac350592d5cced89226dae4f7f43593aa78cacac72ab22ee1ef5f714ab46ad35523b33cb945c5f2b3a5775419620563df6b514008dc063debcfb53f882ce1845dfb935c66a1e299ee1896949fc69b9f61a8b3d46f3c670c0080f93f5ae4b54f1ac93642b0515c0bdfdc5d49b431e69b716d3a4659b7566e5aea5a87535aef5e92524ee26a88d45ce4efef586f311dcd356472323355ca173ec0a29bb47bfe746c1eff9d6a643a8a6f96beff9d1b07bfe7400ea29368ff268da3fc9a005ae07c75e26b686cded409408c93213191c81c633d41e79e95d9dfdeda69b6ad7375208e31c0c9e49f403b9af09d5f5bb6bbd42e1fe726790ab24aa4aa64f41f874af2335acd43d8c7aefe8293b2342c648efac3cfb72034a33ce372907e61c55e96e56248d15a6669ce0851b88f7071edf4ae034db936df6b64b498444e2296172aa39e4364f4e9fe15b62eb5dd426b7549596dee81c385d8d1a8206015e09e09c1c66be6eae15a95efa192969a172ea4769daf23796eae6220792acbb917dfb13deb06c21d7efa3b85ba115cce70e0ce550451e4ed6e39cfbf5e2b4aee09ac74fbafb36f2c859d64dbf7c83f79c7403b62ab5e6b12f9764444b6d76e98949560181e42e3a7a90339ada97372fba93bf5f4febfcc2317276ee551a35e59aa446dbed5a81258246db542b1ff0a96ff4cd4209a012ac36209e642093ff00d6ad4d375f8ac649a4b888cb3be00208014761576f5cdfe972dcbdbac8a46772ca1b60f522bd2a74af1e696acfb1a191d2a294aaae6f9f5f25fd5c46bd8356d2adaf6525de0cacc13a9c771f8d65c725bdadc457b6931334d9620805d4f4c9cf14dd3eda08e29825cb08dc7dddb9cff4a8cd8a35cac71e7cc618520739edc5671826dc5adce7cae9c39a586af465cade8dc765e6fa7aa3a3d2b539e3d4dae758fdd170123658cac6a3fc49ef5df5bdca9030410476af36b7babdd36ddacf5b8fcc818613233c7d6ac683ac496b9b595b7db127ecefbb247fb26bcdcc700a0fdbd17af547a188cb211a77a5a25e774fd0f4692789470467dab2352d4ad6dada496e240b1a839cd655c6b11c51162d8c0ea4d79debbadcdad5e0b78093006c003f8cfad7161707531b53ded228cb05973ab3b74ea751a2789ec96fd848b2ec71b166207032719fceba58bc52b0ca8a6359158f22339651fe7b56069ba1d9fd8215b98b7b63b71b6b3b52b74d22fe3b8b34fb428e5d33c8fc7fc6bddc4e5509d4f6cb72b1b808d67c984766ba3d9fcfa1eab1df24d1aba90518641f5a86e245d8718e6b96d1b535b8b5f3226fddbb1280f503ff00d75afe76e15f2f89a9522e54e5d0f321876ace4acfaa393f184d15ac86479362c908ce1739c37f3e6bb5f0fda32d9c6d30c39019b3eb5cc7d8c6b3e27595806b6b401003c877ce4f1e80ff002aeea16d91ed8c6e6fd3f1af5a955fdc53a2fa2bbfd1135b4d896e24c2ec5e59b80288a3f2d31f9d2a44776f63963d4d123845393572df9e472dfeca29ddbb37eed7a9e2a5862088147402a38d0bb176ea7a559e110e7a572c173c9d466b2765ca8e2fc7b7b73a7e9525c5acac9875126dee0f1fcebc926d6249092ccc4fa935ebfe26b53ab69f3db0e7cc20fe4735c75bfc3ddcdba5ce3d2be932ac446386b4bbb30af464e5747092dfc8f9eb55fcd776e0135eb49e05b758f0211f9533fe10e8227188c0e7d2bb5e3a982c24df5393f0e68d35c4c923a1dbef5d9dde848f6a576738ae9f4cd1a2b7b650aa06055892d864ae2b82be225297323aa8d38c5729e277be1e78ae8f04293e95a567e1b96483724395cf5aed75bb158d4c814161d056c787d62feca4e07de3d6ba638d6a9a7d4e7961d7358f43a299e6c63abafe749e7447a48bf9d7af73ce1ceea832d4cfb447ea7f2a73a091793f9543f634fef354bb8127da23f53f953925590e173517d8d3fbcd52470ac472093f5a350396f1fc6ada3c72798eaeaf8503a74e49fa63f5af1bd47524b8b368d3b921c424c5edc9ee3f5eb5ef1e29b1b9d47c3d756d67bbed0e005da704f23233f4cd784dde8535adccb0dc288e485ca38ce79f6f5af9fcca928e23da4b6762264961656ed6b6f6f730952615f2d143704724923f3153dededadacb32aabbf9602ac484a673c9e3a74c7e754ade2bb76055a56308e1f3f747b66b52c747babd7b50be4793002f2975f30efec0039c7ae7d857933714f9a6f432d6d6436c653130944b2ccfe6ec26627691d42e7b9ce467d3154759d4e396dae0131c4e87701b70ac7bb0c9273cd4dae78a74cb5d3a7b3b6693edc8e53ca208391d1891dab9eb8d4f4ed534e93ce9b33cf12a4d008c8c3f72a7ebdf35ad0c3ce52552517b8e15e14e49df62acc2e248964425811c815563b8b88d990174dc3e65c9191ef5a508315bac6acadb7a6e38aa927dbcce00b2568c9c165995881f4afa0853b4523ec68713e15c545545f376fccd3d1bc537ba721851d5a327215941c1a9f54f1436a11a3c89b6e233c328c002b17ec12a4d9586439ec14f1505d59ddb3623b4b86f53e59a971773da8e65827fbce68f377ba34e4f13ddcad26f21d1cfdd7e7159c3596b4b959f790a1b24678aa834fd44ff00cb8dc7fdfb3556e74ad4e7658c585ce0b0c9f28f4a4e929e925a1862334c3fb1946128ebe68e8ae75c9f518c70562f4cf5adcf0b5ac0b324f303e6eeca023b7b560c1a75e471211633fca31b7cb35766b9d496dd61862b8110fba0c27727e38a29d38d38da28eca7570f1a2a9c2697cd1dfdf6a90da467ca742edd159bad7333cf2e0e14b34a7a8ed5cb2c37e240ff0064b8620e7263279ad6d3a4d4a1903cd6d712827eeb4646dad56a65ed70b417bb5137ea8d98edb50d1ed0de5a4f94cee36ec33b8fb5747a5de5df88ad07d8992dd3a4b2372ca7b803d7dcd73173737e537f912393c2a63a55af045e4fa3ea33fdb87916b2ae49620e1bb7039af2f31cbe3563ed211f79791e46619860bd9394eac14bfc4b53d3749d12dac2dd635cb63a927ad6b808a3030315ca3f8cf4a88713c8fecb1ff8d509fe20d9a8222b699cff00b4c17fc6b86960eb45694ddfccf93ab9be093f7aaa7e977f91db493aa8aac434ad96e17d2b8293c7d72c4f916512fbb126a2ff0084cf59719530c43da3ff001ab796e26abf7ac97a9c92e22c0d3f86efe5fe763d1d576f3556fae30bb01e4f5fa571165e33d42d771bd3f6a473c630a57f215b1a5ead0ebd742dedcb899be660cbd00ea6b3af80c453f7231ba7d51d980cdf078a7a4acfb3d1ff0091bba3d979cb24f20e09dab9fd6b58d9c6a38514c8f16f1ac4830aa3029fe6e6bd8a14234a9a8763ba7294a572bcb122af00562de3aa1ad8b8939c561ea51b18c9159d4a6dbd0de94adb97acae9648c01561a3dc738ac2d1cb17db9ef5d5246025254dc8272517739fd4ec84d090456769e0c16e63e78635bfa848a14815802654661fed56b1a09ab19b9bbdcf4136513725474149f628d4e428cd5ba2bdae54798228c01c62a9dd6ad6766e12790ab1e9f29abb54af74e86f1959d41229bba5a0d5ba9620b88ae137c4d95fa54b505b5badbc7b17a0a9e857ea26211904648cfa579e6b3e04bd52f3584a2e9e4666612615b27f4c7d2bd128ae7c4e129e263cb504d5cf29d73c25aae8fa335cd93c7246114488c3e700afcc49e83073cd79ec9aade288ded672b3210c8e8d8c91d09ed5f41788f444f10e8d269ef279618860db73c8e47eb5cbe83f0c74fb0370dab7957c5f0114295550307a75ce78ebd2bcda996a5557b28d97f5f322516de8782dfc0d77af34fe5ba2cd87c39c9c91cf3df9a48f4c6f358c6395e4d7a17c41d3e3b3f1e32451ac7149046f1aa8c0002ede3fef9ae76d157ed52a1ea4f15dce0e3a33e5f175e54ea4a3dbfccc83e72f0508a165c1c38c7bd74ef68ac391546e3474957232a7b9a76670c7154e5a4b42940f1b1c16fd6b463418e18fe75932f87ef41cc732fb1c114f43a9698c05dc6248ff00be9da8d771ce309fc124df635c02a460e6a75209da49007b75aa9e6892359236c834e53230ef9fa51730b596a5c58537604adc7bd4bf62c8c873f9d67a8913d6aedb4edb82b8c67bd5c5ad9a39ea464b54c77d98af734d63e5f73f9d4b34c1411bba7b567493ee279ab765b1308ca5b8f9661555ee093c134c90ee38073562d6c831f9c13e959eb2764745a305765705e43deacc56e7b8ad08ed235fe1fd6a711205270071d6a951ee612c42d915a28e345e94d79374a10741d6964b885410118b7618a8630fcc8d1b11d950124d3d3644a8bf89924b1bbf93146a5e476daaa3924d7aaf8634287c3fa6ed7dad79300d3bff00eca3d8579a6857522f8974d6781e253310038ebc57a779b24aa701ab1a92b688fafe1bc1c1c1d796e9d979179a6467c039356228c30e6b1e28a7126761ad488cd8fbb59462efb1f552692dc9cdb47f788cd64ea70ef8caa2e4fb56b6db87e318ab1058a27ccff331add52bf432f69ca71fa7594f6ce5a44c0cd6d7da36a6339adb96d229570463e9558699167eed4fd56db0fdba7b9c95f4aeec554126b3d34fba972c233c9af424d3add79d833f4ab090c6830aa31f4aa861e4ba8de223d87d1476aad75318938aeab9c84924ea9c679aaad7a73c56734e59b93485fde988bdf6f60d57a3b8474dd902b9d91f8a23bcc2edcd4b958a8c5bd8e87ed5003832afe74d6beb651ccab583144b2c9b99f8f4cd59686045ca8cfd68e61b8d8d05bb33be23385f5a91e411ae59f3582f7c606f97f4aaf3dedddca911c6c33dcd2e642e5396f8970c7717da66a119194dd049f43caff5af3e2845cb3af635d978c229ada3b213be44f39047b0527fc2b921b7cf91474cf1584f5d4f92ce12862ddbb22ec3312a3356837418ed59f1e4679ab4bbfb629c5e8785522ae5a4da580a9e7862957e601811d2a9217dd8e338a6ac920e8c4569196863c8fa31d0e93044c4a86da79da4f02ae2dba01f7463deab89d94659b8aa53df3b92a84814bdd88f96a4deacd1967b5807cd866f45159b77a9175db146a83d7a9aae16463d28fb2166f98fe145dbd8de14e117a949e5763f78d3556563f2826b552c40ed56e3b655ec292a6dee6b2c4c22b428dad930c3375ad28e3da69e23dbda9c2b55151d0e39d5737a8ee31d38a6b74c1c63d69c48fad3723d053665d4aa89b8e08ab8479701c0ed514630e453e520a102a62ac8b93bb2c68d179fe23d1b3d3ed2a2bd9e2b38a318c035e39e1b04ebda692dc2dcaf1f8d7b25c5d470c2cc5c74a22afa9f63c3aff7135e64337931bf240a559edc0fbc2bcabc59e366b0bed88d9507922b9b7f897374456ad343dfd4f7c17701380c2a7570fd2bc93c2be289353219d87e75e876ba9c71a7cc6a35be83b686c48e2342ec78158ade20856e0a175183eb55f58d6a3168c148e95e21ae5f6a0fa8c8d6ef27cc7a29a6e49028b67be7fc24364065a44ffbea9d1f88b4d75c9b98d79c60b0af9a65fedb9073f68fccd57167abb64949fafa9a8f6912bd9c8fa797564da33fdd1fcaa9deea2aebf29eb5832b4d1e01c8e07f2a88dc93012dc1159295d5cd553573521977b55819acbd366123f15b1b40ada3aa319ab3b113ae54d51906c39ad06acebb271c54cd6855276902cb31fb80d588d6f251c90a3eb54a1ba0a39ed4b26b31c60839e3dab2bab6acd6706ddd17fe580e5c826a3975345180456579b26a1fead8a83deafc1a2800166c9f7ad13d343077bd8e37c6b726e67d2f232aaee7047b0ae48f172cd8c026bd17c69a191a5c57b16d26d5f2c3d55b8fe78af393ccefbbbd448f91ce23258b937b348ba17bd4e4f72453235c5bab1351bcbcf5a57d0f0fe26485f07b54467238a89a5ebd3f1a67ca684f43450ee5a85c5c1d8ee57dfd6adfd951471f99aca0843020f4abf05e03f248707b1ab835d4ceac1ad62585800e7d29eb02e7a8a5670dc0e83bfad377e0f5adf439b564a2351c63a53b2a2a2df4dcd171589770ce4d31dd7b0fca985bdea32fc7152d8d4494c83d08fad30cb8350993038e2a32e49eb52e468a99644e013c1c9a5f301ef54c1e3b53b9353ce374d17ecee7ecb7514a8df32b865c7a835ddcf737d7109568f008f5af32c32b86dc5707a8af678a21f658ce339407f4ac2bce715ee9f5fc2ea2bda465aecff33cc356f099bf90bca0e73591ff0008246a7a31af4fbd711b1c8aaa92a3293815c0b1552db9f67ec617d8f339b49b9d14f9968ed1b0f43d6a33e2af1104d8b229ed92b5d56b644ce5474ae6a455570a0726b7a58a9b5a8e7878761fa65d6bdab4e20926625bb01d2bd0347f0747128926fde487a922ab783b4c1047e730cb30aefa365440315729ba8b539f9541e862b6816e07dc5fca922d020da7e45ebe95b24976ab5085087a75ae79d1522bdab8a30356558a02d81c28fe55c3ff0069f9b23c4adc835db789bf7566fecbfd2bcbf48dd25f487d4d75518b516999a9272476fa4c822da58d6efdb233deb9f8a3da8369ed55e49a64908cd74a9d918548fbc748d7518e7355279d65181588d70ecbf7b9a6dbcf20930c72293a97262acee6e5bc43b8ab0d0c047cc8bf8d416f2fc8327ad3a687ce1f2b907da92b1729b637cf8a23848fa7a5588ef99fa230fa8aaf6f0189be67dd5ad1491041b80aab3e8669f731bc40ed3f876fd083fea49fcb9fe95e3f0dd3b4b22498639c838c57b76aeb1dce9579047c3c903aafd706bc2d0a2ea31a95c16183f5a5256b5cf9dcee09ce2edd1fe06e93fb941ed555864649fcead3afca07b55560768eb59ad8f98a63768e72ddbd29a02fad264e48e7a76a89890d4cdd26c9c3807eb46fe6a15dc734f1193cd3b03489926743956c54f1dc9fe23cfb554087bd395338e29a6d6c44a11669a4a1853f22b386f43c1a9d64200e6b45239e54fb164f4e6a166f4a4336462999cf34362517d453d39007d29b8e7a5380c8e83f0a7a81de958bb8c5424fb55a8e3503271510c3293c920f34e6978e002a7a0f4a6ec8969bdc86e641e70da176f6c77af6db65cda45fee2ff2af0e7064ba4191c9ef5ed62ee34882e7a002b9ea33eb786937ed1af2fd4c9d622e09ac8542b191eb5b176ff68240e6a9496b26dc85af36549b6ec7dbc2565a9cf5f400139ac9b7d3fcfb90c064035b77d6f3bcbb029e4f5adbd2f46115b82579c6734a1092349d4491a7a1db2c76ca318c0ad8f2b26b2ed67585b67a568fdb100eb5d5076d19c33bb7744fe59519aae1c8c8cf7a635fa15201e6a87da5b7375eb5a4acd682845df524f12c467b5655192ca07e95cae9de1d6b78b7ede4d7737f16e9157d87f2a71b511da96c76ae948e4bd8e221495a768c03c1c54f358b91c8e6b4ac210d712923f8aafc91a991462a3a1b6ece464b4962192bc5410b62700f7aeceeed50c278ed5cb35b62f381dea65a0e304cd882dc3400d432b4f0fdd1b855fb552b0006a3925456c362b589162ac21e6e58104d581652af2243f4ab10ed72368a9e4042f15ae862d5ccff002e40d927a5793f8934d161e2431eeda8640e831d41e457ac3dc61c822bccbc67379de2f503eea2c63f4cd4d4d8f2f37847d829754ff4646fcae2a346f9403d29ce6a1edc607e358c5e87c5c5684ad12b74507daa16b70471f91a951fb134b915a2b329368ae20239cd3c2903a8a971cd2629f295ccc8f68cd2e4f6a780334a48a2c2b8c3bb3cd19348cfd7148beb48761e0d2eea66e0290b8ec29dc56260fe8454c197b63711d0d540c71c7e54e0cddf9a5704922562cae7048ef40058e4d0a373127152f03a52665395b622519bf857d5947eb5ed971a31009526bc4d0edd4a062718753fad7d00d790ed386069a8c64b53ea78724e319dbcbf539e4b710b9ddce2ad288d97181497455d895ef55e3420f5af26a559426d25a1f6515cd1bb22bbb54df9500d4d1175888028322ab7cc6a44ba801c64576508fb457667566e3a1817b1de09f7448c7e94ab35da8fde46c07d2bb3b648644dd85a9dace171ca0fcab596154b664c312a3ba391b69d5860f5ad3b744319381d6b48e936e0ee082ac4367122636f7aa8e1dc55889574ddc8e584b4fbbd854d7099b665f6a9b028619522b748e6b9c6a334170ea01eb524b707cc5278ad492dd0ce7d6b3f518021561d8d6334ec745392b92caf988e7d2b2ad23592e5b23a1ab53cbfb9e3d2b374b98fdadb771cd44b745c3e167466dc08ab1eeed77673f7857450bac9162a8ddc7835b5b4304da312d5e4b77e7915a9f6c478f1c64d519541c8aa6dbe1391cad389495c9ae6173965e6bcc7c4793e2b9723905727fe022bd4e0b8575c1af2ff0011b06f18defa6f207e0b44fa1e3676ed412f3fd18d63f28a847a71d7b53c3128b511ebc7ad631d8f8e821e320f149bf8e31f852ad349f5e6a91490f0e314f183c8aadd051bc81907a555c3949d8e3914cc9c533ce6ef8a70753d452b859a1c303ad079e6814ec8ee334c43426ee334f118039a4dc7b6053724f534682d49942fa9c7d38a77cbdb15067dcd1ba8b89c49d48dc7a7e1526ef4aaea727f0a92a5b3394752294e2e14fa57af5a890c6877121941fd2bc7e6c7983ad7b369c37e956926725a043ff8e8ab84798fa6e1e959ce3e9fa933b2c71e5eb16f35d86d837cea3f1ab1aa190464231dc6b8cbdf0bdedf31732919ed4a78784b73eb695492441ab78d92362aadf9545a1f88e7d4f51448cb3283cd60eafe10b8b552e58b56d780123b491e39530fbb3b88eb5718c631e544d4e76eed1eb9a74a7622b020815b8082a08ae7e1ba5555dac0e2af0d4e3098381f8d384794ca6dc98cd57545b31f7854763ac2cd6fbf20f35c478d6fc3c2c2272adea0d51f0fc9a83e94ac64ce58e3f4ab9b6968898a4dea7af534b53ea275e6a5e8245268899cb565eaa1b66d0a7935d0a20eb50dc5a2cbdaa1aba294acce7a2b62f080476accb9b49639098d6bb35b50a9802a06b2566e454b8dcb5369987a735c6d01f22b55a3deb822ada5a2a7414ff280ed54912ddce7aead194e40e2a994ec45754f0061822b36e6c3072a2804ec61b59923747c1af29d49bcef105dcc4823cc7e7f1c57b04eed676f34ce0858919c9c7a0cd78aab97691c9f998e4fd4f34a5ba3c1cf6a7bb18fa96d1b31ad2609e41cf350c6e47ca6a4cfb9ebdeb247cc72d98e1d4669b9e7927f1a01c9a8cf5e98aa2921e4f18a6f5a4cd1d298c28a28c71400e0cc3a548ad9a8b8a78a04c79ce6947e3480f14bbbda910c3f0a01cd27520e334a3da980f5fbdf8549510e0e707a5399ce3149a21abb239b9607debd6f45bf55f0dd8138c88141e7d38af227e83eb5de698266f0f5a940c46c20607b9aa5271d8fa3e1d82956945bb69faa355efd66bd54c83935b6a221167a715e708d736f7de66c93839fba6ba55d65cdbf31b938fee9aa9393773eaa2ada22aebd7113c9e506049a6e97a743147b88e4f35cc6ad35d4d7e1e3864e0f6535bfa7cd7b240a0c2fd3ba9a89b76ba2e3369d8d89ae23863387c63deb989b55bb9af365bdc3000fad59d42cefa752b1452163ec69ba17862f566f32e01073d315742577762aadb564175633ddc599e4dc48a758cf71636fe422ee507838aec23d086d1b81356e0d0a1d8729dfb0aee75a9f630541f56749cfbf4a5cb7a51cfb5261bd4572921cfa52f3fdda6f3ddc52fcdd9c5002f3e94de68224fef0a4c49fde14863b9f4a3e6f4a4fde0fe21465875228010be3a8349bfda94e4d2153ed4b51e873be3abb36be0dd4587de910443fe0440fe59af094f95093fc449fe82bd9be26b797e10605c02d3a0033d7ad789a6044aa0e71fe359cb73e633977ae9764bf527dc09e2a71f76a9aa926ad21f9693478f24387dee6a33f78d3b193c537bd2121452d028a601c52e31de80296810829452519a04c78e94b9a68a5fc0d02141e47d69431cd03f0ebde8eb408767a1c5293c53718029793d299231feefe35ed9e06c9f06e9fc7f0bffe866bc4dd481c9ef5ed9e05c8f06d8738e1ff00f4334e3b9ede45fef0fd1fe68e8369feefe94bb7fd9fd29dcfa9a4c9f535763eaee26dff00647e546d3e9464fa9a377fb5458350da7d28da7d28c9fef52fcdeb4582e3707d2a58c614fd69987f5a7c79dbc9cf34d2d44f6219092460e38a6fcdfdfa85e319ff005c0703d7d298230c389d7f5a9bb1d8b1cff7c526707971f955528075987e74dda33c499fa52b8ec5cdf8fe3fd29779fef5544011b76e26a74990364e31e98a698589771fef8a42c3bbfe94bf688bfbb47da22fee8aaf9883771c30a42c47f17e952e57fba3f2a6b636e78fca8b0ae78bf8e35e6d6b5778518fd96d4b4718f53ddbf4ae262c6f207ad5a96522f25dc7ac8d9fcea9db328bb9236fbc3a5653dd1f155672a939ce5bb2e01818f5a781463e6a7803a52392e3475a18734ec529140ae478a96353d76e07a9a123dc4fb549ee3a81c0ec4508a435f680060e476cf4a8fd29719a181a096ee2514b8a31400514b46290807f5a5148334734c071edd2a45e9517f8d3d69a258921e07d6bd87c11700f84ecd430057783ff007d1af1e7eabc77af46f86b7ed3417962d822170e99ec0f5fd47eb5496a7ad91d451c4d9f54ff00cff43bdf33d645a5f31475953f3a7edf65a4dbfecad5599f5f719e727fcf64fce93ce8fbcf1fe752ed1dd57f2a4f2d7fb89f952b31e847e745ff003de2ff00bea8f3e21ff2f11ffdf552796bfdc4ff00be69362e3ee27fdf229ea1a111ba8fb4e9ff007d559b79e3319fdea1e7fbd50f969fdc4ffbe6ac41126c3f2275feed24989d8aada9d9e7e6473c0fe0a6ff006a597f75ff00ef8ace92ce6278790703f873dbe952db5a7def3b7c9c71918fe54b9d95ca8b4752b23fc2df8c749fda3643f81bfefdd37ec96dde16fccd06cad73cc6c3fe0469dd8b41ff006fb3feeb7fdf1486fecffb8dff007c53459db7fcf33ff7d9a5fb1db67fd537fdf668d434145fda7f71bfef8a7c7776d292aa98239e571519b4b6ef19ff00be8d27d92db39f2bff001f345d8685bf3d318151cb38dbc8a87ecb6c7a4449f690ff008d413db42913128c0fb48d45d8687cfdaa8f2f57bc1d3133ff00e846a9db64eabbbb3216fc7bd6a6b9b3fb6af162432ca6672235e76f27ef1edfcea9d958c915c9925776723b9e07d2b393d6c7c3ce518f35fccba17bd2e2a523b0a15371a0e1b9181cd49e49dcd9edfad4862c2e3ab0e690b6473d41e08a690efdc6b30c654fd00a8ce58e4f5a79c9e68c50272b8cc71d28c11daa4c5041a05723c134639e94fc518a2c17198e28c53f149482e371cd3b14b819a5c5306c695e3f1a728e697b7e34e031cd326e432b6d74e0939e80575ff0de7f2b54bddd905a21fceb9528c5f701d3a1ae8fc1534675895483bda2edec45099e8e5525f5ba7fd773d585d2e3ab7e541ba1fed7e5551557683823f1a47503eee73f5a7767dd5916bed3fef7e547da7ddff2aa05f07ee9a42ebfdc3f91a571f297fcf27f89bf2a3ce3fde6ff00be4d51f3917fe59b7e469c2ed07fcb294fd01a2e1ca5bf3ffdb3f9559b69c18cfce7afa5667db631ff002c26fc8ff855ab7bd8fcb3fe8f2f5f43fe14ee2e52e7daa3e328d9c03fa534df479e43f140890c6a48e4a8efed40b78b3f77f534b99936437edf1ff7587b934d377111c86f6e952fd9e2c01b7f534dfb3c47f83f5347330b21a2ed3eeed23df8a46b95231ce7f0a79b5873f73f534d36d083809fa9a3998591099b8ce47e3486e0f4f94fe153fd9a2c7ddfd4d27d9e2feefea695d8ec8863b8547ddce3a7151de5da342c02bfe953fd9e2c8f97f5348f6d0e3ee7eb429343b23c97c41e181777b25cda2bc32c84966438c9f5ac88fc37abc6b83725c7fb483fc2bd925b58370fdd8a8becb0edff00563ad3e65d8e496030f277704cf22ff847f55ff9e8bff7c539342d490e4c8bff007cd7ae7d8adf9fdd0fccd1f62b6627310fccd1ccbb13fd9d86ff009f6bee3c97fb1b5045ff005c0fa7cb50ff00636a3ff3dd3fef9af5ff00b05aff00cf21f99a058db7fcf21f99a7ccbb07f67e17f917dc78f1d1b505eb7083fe02293fb22fbfe7ea3ffbe457b1fd86db3fea87e6699f63b7ce3ca5a5ccbb0ffb3b0bff003ed7dc8f20fec7d43fe7e63ffbe450747d471ff1f29ff7c8af5ffb1dbffcf214a2d200388c7e668e7f20fecec2ff00cfb5f723c77fb1efcffcbd27fdf229d1e83a94adb52e54b7a0515ec22d20c7fab1f99a16d20072231f99a7cebb0ffb3f0dfc8bee47917fc231abff00cf63ff007c8a0f85f57ff9ee7fef915eca6da1cffab5a67d9e2cff00ab5fcaab9a3d85f51c3ff247ee478e7fc22dabff00cfc3fe43fc29ade14d5cf5bb97f038af643045ff003cd7f2a3ecf0e7fd5afe54af1ec3fa8e1ff917dc8f173e0fd54f5bb9ff00efb34dff00842f51ef7371ff007f5abda4dbc39ff56bf9537ecf0e09f2d68bc7b07d4a8ff22fb8f1d8bc25a844d9f3247f6691c8fe75d8f85f4596ca632b2aac8dc122bb01045fdc5fcaacc5146a784028ba1c30346135351571f1c4fb065bf5a53137ad4cb41eb4ae8ebb320f28ff007a831903ad480920134fef4ae82ccadb0fad0131fc556768c74a028268d02ccafb7fce6ae5b0fdd9e7bfad458ab36c3f747eb4ee84ee8fffd9', 0 ),
( 2, 'Vegetables', 1, 'Transparent', X'ffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108012c012c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f4dd2eefcc3b3206d5006547a55b9661665a73803b9da2b17439925be310238033f9574d75631dcdb346c382315e6e16556b51f75d99a55e58cb5464bf8b601b50491966e0702b66c6ff00cf8d5c80323fba2bcda2f054dff09224a6e1fc98df7e3d7d057a75bda24710c577d0a53847f78eece5751cde8ac875c5c0236f1cfb0a92161e58c81f90aa5f652d7249638ed53ccb22c0421f9ab6486df52e29f61f953f3f4acd89e654f9f935243761988f4a39414d17bf2fca8fcbf2a83cf19e4d481f8a5629487e7e9467e94ccd19a2c3b8fcfd29a5bd87e54d2d4d278a2c1714bfb0fca9aef819e07e02b80f1b7c4ab7f0d7fa3d9c42eaedfe54507396ae3e1d5b5cd448bad7f5091370dc2ced9b605ff79ab19d7844de9e1a73577a1ec135dc79c168f23e94c8ae94bf0e871ec2bca65f16d869d0656084381dcef3f99a860f1fb9b496fa77d90e0f951e00ce3f8bfc2b3fadc56acbfa8cbb9eb5a87882c74a80c9752a0c75000ae57fe169dade4c62d274e9ef08e0b227ca3f1e95e3d71af49e25d47cebcf366b753fbab540483eed8eb57e4f1a9d247d9d6136e500022d8548fc2b1962a6de9a1bd3c2c12f7b5f99ebf6fe30d5ae725745ce0e08dca08fd6ada78c268d7373a3ddaa83826340d8fcabc86c3c5f71a8c4ef39921b61c16070cdf4ff001ad197c777f05a2a59585cb81c6f00918f76a1625ad1b2e7868ae8b5f367b4596b16f7f08962dc808ce248f6ff003a97ed2a5b0190fe55e010f897c41a9c800d4e0b627808db8d6ed8693e2395fcd1e23b7763fc063603f3cd6b1c5dd688c6583b6f2b1ed41f03a0fca8f37e9f957963eb3e2ef0f47e65c599bcb55fbcf6ec64c0f5dbd6b5fc3bf10b4dd65b6c8df677ddb70e7f5f502b58d783d1e8652c2d48abc755e47a006e3b7e546ef6151238280820823208ef4bbab6b1cf724ddec28ddec2a3dd4b9a2c171fbbd85283f4a6514580933f4a33ec2a3cd3b3480767d85267e9f9527d28e680173f4fca9ebd2994f5e9401e77a358bdab07e777049aeb23b82c838ac6fb44498008e83f954f1df051c60d7cae5d8e5464f9b667655a6e4b42eb1449779c0cf7ab8b749b3820d735797ad21c014d82764e4920d7ab4f348caedec60f0e757130273529008ae7edf522a40639fa568aea3191d6bb69632954574cc9d3922eed1b6a110a86a8bed2586474a9212cfc9ae88d452d887120b8858bab0278ab31eedbcd3c8cd2e2b4b92a3660ac697269315e75f11bc6d77a6793a2e86ea351b96d8d2e33e58ef8f7a89ca305766b4e129be5477177abd9593ec9a7512019283923ebe95c478afe2047058c90591d8483ba463ce3be2bcdf52d69f49b15b38eede7bb91819269392cc7a93fe158d3c1a96bb7d1d969d6f2dd5e5c1e154676a8ee7d07b9ae1a9899cbdd8753d2a784843de9bd8a8baab3ea126a9747372e4f96a79f2d7b63deafdada7893c431bc9636573344a3970300fe278af52f097c1ed3f4b44bcd799750be3cf939fdd21ffd9bf957a1b5a2085628d15235185455c003e942c2e979133c6a5eed347ca4da46acd7821bab2ba8ceec15284935ec7e0cf04431db2dceab6d14d3301b2191772c4074c03debabd5a2f271e58c31e2a6d36ebca84230391df15cb4aa4557e59f432ad5a728686a5bda436c8161822887fb0817f9573fe28f0ee87af6d5d52d95e503e5990ed907e3fe35bb15df9ec47200ac5d713630995ba1c55e3f1328d3e6a6ae8c68ab3bec73707823c37612ab22dc5c39202accf955fc075abf2f849b6bbfdacc484e55225c63f1a567e3cc04020669971e294f2c46dc31e2b8a856a52938d576ec5d7e692bbd4ab0f856c84723c1334b3100324fb4a1fa8c5626a1a49d367db6776f113c8009299fa1e40fc6b6ace6791d9b78024e40cf53595a9ccd25e95497679232483d73c568f11074572c5aec63094a9bf7594f49f1fcd657a2cf53528fbb033d0fd0d76df62d235c8ccb25a44e5872db7047fc08735c35ed9c1a8a471c513433a213e73441d0ff00bc0f4f63525aff00c2476b692081e09d90298b79387fa7bfd6b68d74b491d90ad09aba7667a7f87164d397fb3dee5e783fe58990e593fd9cf715d15789e9b71e24d46d4ce9a922ddc6c736cd001d0fa83915d868fe399adae174fd7e1114f8e245e847afb8aeca789847dd9682ab849cbdf8ea7794a0d321963b8896585d5e36190ca7834fc5769c22d2d0052d21909936b1a950e40a8654ef446c47140ba96874a2917914ea43129c9d298dd29206250e7d69303c6ec35796f70c1fb0adb46b811ee04915e6de1bd543388829dd8e2bd434ab8596dbe65f9871835f211c3454b964ec7a5cda5d0c8272e7e6ea2ac193271bab1b5798d94cce8a4a91f9563c9addc91ba35523eb58bd2e8b4b996876f0155192d9abd14f09180413deb80b6d5aee75c00173ef5b56b692f12b48c588cf5ad70d3f652e796c67520f63b88e48fc918c55b8186deb5c7c776f1ae0b1cd598356995c2e38af729e62a4d2b1cd2a16d6e75d918a4120ce2b320ba32a8c9c66adc6bce735ea4657d4e7647ab5fae9da55cddb103cb425727a9ed5f3b6b17ecde27bab966c9822c6e3d8b724d777e39f142dfea716956f27ee95b2003f788fe23fd2bccef74cd4f57d46ea0d2ed2e2f6677f99614279e8013d00af3b1151d4a8a113d5c25254e9ba9330d279755d694aab390408d7fbcc4e057d57e16f0edbf87744b7b58e145b8f2d7ed1228e5df1ce4fa579f7c32f84936877516b3e20286f10ee86d51b708dbfbcc7a123b015ebe40c575d1a4a0eece3c456f6964866df6aa97930b788b55a6942753599a8b24d09008ad2ac9a8bb1ccad7397bfd4e32d23cad855f5a7687a8c774ac723af00d733e2689d54a8638cf22b1f49b89ac246f9ced3ef5f293af355b9a5d0ed5156b23d1f50d4458e1a31b893d01ae7afb559af5f0c36a2ff003aa36d78d7d200668f2c495ded826b3759d4a2b5281a742c324a46725bb60d6953dbe220edeec4c9d4a70f365cbcd4d624fbddbd6b99b8ba335c060dd0e47359da86b11cc48452a00e33552ca479ae762b6e2f93815853c2bdd994eb9afa8eaab142df60691e6c66491490147b56769b73248921924662536824e69f1de79676c3b41cfcdb9720fa8a4b5b4b3f266924de2491c85f2cf084f4e2bb9c1a8f2cb45d0e49c95ee9ea74fa24a04205ebc9242ce038193c0e80fb66bb69e48228d4e171fc3c5705a7dbb247f67fb5b6f75c33a0ff003cd6acc5a18157cc62aa300bb54d3c44a106ad736a51babb27f15dd1d2b51d3755b78408a6465b9641c9208c31fc0d5ed42c2cfc4fa6c4eea4cb11df1491b6d6527ae0fbfa548f225fe9714662f30c3f385c6772e30c3f2fe549a7d8ff0066a06b67f334f7e636073e5e7b1f6f435dd0973a3d5a13f756baa1ba06a7a87856f6186ea5371a5cefb3cc6e0c6c7b11d8fb8e0d7a9a15755753952320d79c5f470cabe4ca9be0b81b5c6781ee3dff00c2ba9f0f5dbc1a0430dc485a4b71e5976eac0743f88ae9c2d4717c8f6231904d2a9d7a9d054125c2c6f827ad320bb49812ac0d50d455a4742b9041aedbf53cf66a96cae6989f7a99064c433d69ccde5f24d36c0b39c530c80567cb7e8095cd0b70ad112a726b27515ec32e1b94391919a58ae515482475ae32f7557b3d4464931b1c115a90de79f187553835ccb1b072715ba2dc1a573e6cd235116376ac581008cd7a9695af5bcf1a947c3115e1f1b1de5bd6babf0aea2b1df2c3313b1abcac761af0735ba36a555a7667a7eaf791cf66e32338ef5c759dc813794e7be0735bbac401ac84a9c71915c934124a9e6c790ca7b5795858c654ddd9bca6d4b43bed3e085103100d6ec574a22c0c62bc9edb58d40b7d990b96efed5d8f87af58c4639d89607bd554a6e1ab6529a933a54990bf38abb6e2166eb5c96a3a8fd96e415c107b55ab6d4de58c329c7d2b6a7515b9991257d0ec14b440796dbbd00acbd7bc46d6d612dbc5228958624653f70771f5ac3d72fb575f0f1fecc9a28e695f6bcaf9ca2fb7bd735731b5bd9c563e697d89ba6918f2ddc935ebc2bca30bdfa1587c2c672bb39082ecddf8d99f0c72428fe95f467843448342d216de203cd918cb3c9dddcff415f37783c1bef14ac8a09433f53e99afa7349bb12c7ef5be1a7155dc5ef642c6c9f2a4b6d59b4060521e9403c5472481457a479c636bd3b5bdabba9c301c5717078904a8cc6556238651d53f0feb5d0f8b2f635b0932c0715e2f733c56d7bf6a8676ded9dc98edfd4579d8ba89496a43938ea777a8dd69f7506f92e5492db76ab6483f4ae5669228733473098162aa8bf7aa9e9f7d68f632cece4dd6f2238cf0abdb9f5eb556eb4eb48a38a2170de76082e0f058f7fa5707b3e6926d6ac99569b89a23ed06233348a8bd57b915cfebd78b2cf1cd1b02aeb8247661d6a67b89e3b165b84649633b1d471b87638feb5976964f722444944b0487729c731b8f51efd2953a7252973bd8516924c7da2f9ca770fc6aca6cb12adb4ab839dc3b5312dda09301fe5d85baf5a06af6ed6a52687cd72095e7a1aa4a6a57454b55a3255cadd34de5ef18f37681c15f5f6abedac43728ee902098aed210633efc77ac90f3dbdac90acdf38cb2b7fb254714595d2592b45240b26edacaf9c14f5faf153517b477664d23ad8dae2de6f326558e5701b601c8ff00239aa17bae9d922dc5e5abec7da151b38f426a9cad75a75f4687f796d2921999b903d3ea6b9602186ea66785e48c2b1010e3e63d3f0aa8538cd5ae55dec7770788ca46577092455cac91b118fa7ad5af0ef8aaea291a09d0989db088bd41f4af2b8a6314caedf30f7e95bda04d35c6ab6b01925533ca15244192ad9e0fe75afb29c2dcaca8549537789ed50ea5677b17d9e3650dd473f74f6ad632b269d22c836f183ed5e677ba2df3dd5c4d63708fac584cd1cbb0e167eff81e6baef0a6b69e26d2aeb4f9f743a9229468a4382ac071fad549b4f63da925528e85bd235d92dae4c329ca6700e6ba77d5e00d1095c2ef38524f15e537171342ed1bc6c92a3156523904536feeaf5b4696e0b39f2b1b7278ce6b930d8f9d2fddc95fb1e74a3eeb68f6d86e53cbe08e2b3b50bf23e54615c1e89e28b9bdb378dd999d79126cc0c63a7d6b6345d97b2ddfdb257dea998541e49af42a63a33b5387c4c88eab9ba0e9ef1ccbd4fe14f8b56309c6d241ebcd245a7b7dafcab9750e573b4354f796490e36a8af361edd273968cdfdd7a220b8b537e8240368ea2b4b4e5c5aed63ca9c5430ccb1db0523a555b7d43cb120ff006c9a22e10973df57b8db76b1f365b80c7935d178674d8efef15a47daaa7f3ab7369f03f879a2b480349248be56dfbd9cf19fc335b9e11f056a1a6dc5c5dea7243188e3cc7096c8de7a6e3ede9eb5d5564ead39723b33184d5eecd7d5af6ded2cfca91c1e30066aa69ab6cf18566186ad15bcd72290b7d9ac2e80fba5644e3fe027a56abc976f124b70621b7185541c9efcd7150ca1ce3caa4d79dbfe08e78a5cd7b19474cb786369a2450d8e4e3ad7177dafc969a8948d76a83cd7a2cbaaa7dc6818afdd3b4823eb835cceb3e15d335edd3d9dc7d92e8752a3284ffb49d47d47e55d54b259539372973213c5a6adb1cedc6b6f76cac73c7bd6b69bacb226037e15ccdf68fa9e8d288aeedced27092a1dc8ff0043fd0f35358dbdcc8e0ac6d81deb2ad868d356dac35559dfade3ea3e1bd5a18f266862f3900ef8209fe46b99d72ea53a14d73bb6c9729d3d0639fd2b734175b0960798616e0b42f9fee915ce6af0bdec2d616d93b1bece0e32460f240ef549fbb1b9ece1e5cb45ca5d84f85d63e63cb785788be5048fe23ffd6af64d2eede2955793ea2b8ff0ff0087afec348482d2d824712eedaed8773dc9f7ae97467986a02daee268e4033861dab28cea4f11ed21a26cf3aa4b997bc77315c6e8c1f6ac4d7759167113b80edc9adb58d5631b4718ae0bc5ce2491a34207635ec62aad4a54b991c8926735abdedf6a9318a3466e338cf5fa57117f14f15d791345e59230be68c64f715b527da74e3e6dd6acf0c393b523eff9d731abdec17d7926d9e628b1977924396623a7e75e7aa506b9db6d984e727a108f32c95e5fb4aac8e72b1118040e2aabeb524b6fe5796a54b64123953ec69f6765aa6bb731d859db4d7d36376c8d72507ab1e83ea6bac8be13eb9245199eeb4fb20bc95790b11ff7c8c66baa149b5cd27722c8a1a56a3673da326a77789030db230dcc17d3a556bfb992c2f0be9f782e6dc8ddbd3194f638ad96f85d31c88bc43601f3d363d51d7fc257fa35947f68483fb39caa4d796ac5ce49e32bd697b38cb4ba124f64559a7492de0ba6657d99776420f2c79e9502cda76ef99442ed190994254f3fcea086d61b2819530cbca3b0fbae39c122b385e309162320f2b7f0186703bd28270ba42362d87da257289cb0f2c67a64f71f952daf84fc43a9ed5b0b192e5770dcebc2af3dd8f15dff00817c24b7da5c7aa6ad194b067df6d6e7e579403c16ff0067f9d769ab6a2f6963b6de354441f2c6830aa3d850a0d3e7a9a2ec1152dd9c3cff000ef57be9a4f36fac2de3200504b3b0c77e054379f0a6ee68a458357b1594a6d1fba75c9f5279a6af8ca67b9789e46de84e467005751a0eba9a85bb1122c9b4f38cf1f8f7a7174da565b171d75479aeb3e03d4f43d21e29b49691a55de6ee27f323461d811c8cf27902b3fc3faadce8f736684c522dbb798471d073b7776af7cb5bc932c02fc878208ce6bcf7c7fe0db5b3b4975ad2add62b62737b6d12676e7a3a7a0cf51f8d67edd4db507a9528bb5ca7e1fd5239fc51a8dd4402417ae26d8640c55f1cf4edc54de2f964f0feada7f896c530b24863b8da3af0083fcc572fe14b3945d10f210e9119114f1b4023afbf35ea3e4c3a9f87640f189040caf823d0e0fe99a77ba6dea7af809b74d7dc2ea90d9ebda3daf88ac82ed9005b80bebd8ff9f6aaa21b4b9d2a4b399729290ae47a6727f4151699647c2daa3e91192fa2eb1131890ffcb1947551edce47ff005ab156fe5b8d3da6b55299728bbbe9d715c7592534ec638a8aa6f4d99afa36a56b7b6b3c314490ac52948a11d55074ad48e49ace39a5b650d208982823be2b8cd0ec668675796e04a8872d918c1f5f735dcd9be6262b8cb2e0135cf529fef5544ce6a526e1cacc7d0d27b426f267679dc10cd26738f6f4ad69753797ef75ed8ed58baeeab2584915bf9081b05c10725c7ae28b4bb6ba8c32afca7a36d2037d2b96752ac138df466d49c13e53721977ae19ba8a884716e6cf73d8d416f1c9b7773c74a9543107240e6aa84b969eaaecd651bb387b6b4fb3dd2c50ba6215123239c0623a28f7ac7d423d4dcc92ac1728abcb86e47e1ed46a3793c7aa9920976c8a0607518f7a7ffc276d042d05cc3b180c0dbd0e3eb5dd4a2e494ad7679f1bec4361733cf6c7ecec2599a403cb19de48e48fc856a47abcd191e5b18db18619ebf506b8b7ba94ea2f7a545bfcfb9760c6d3f4ad65d592ed47da1009307e71c7ff00ac7b57a7460a0b4227b9d37f6bacff0024e8a26c60b608fcc7ad233967f3a0768f04053b8139c7f23f9573935dc9e5ae6469a35fba73923f1f4a7dbea12440ec62ca3f415baa8d6e64d1d7d9eacb2836b7ab182fc7ce3e47f4fa1ab50d9c4d32c30809bce307a0fc6b958ae3ed871190e71ca31ebf4f4ef56ac35396dd8432b3bc59e18f057fcfa5675e9d3c42e59fde5c2a38b1de2dba5b18ed9227f944d853ebdb35b3e12d117ec96bacdc4e42ac8eeaa8324b67826b97f17d85d6a5a7a5cdb03234232c8a396039cafa91dc576de039edcf846da4131649198c9bcf11be73c0fcab871149d3823df8d6855a49436d0ecad2e85ddbacb19c49838c8e7f1156d5a29191a45076e76b8eab58e67de16ea37c0246fea73ee4ff004ab6274465323aed978e4e3b573d2a9252f74cea4636d4da97525b687e7395c70d8e0d79b7896f84972f206c1eb5da131bc4d6b2e5e3906300f38f53e86bcefc47a3dee9d20219ae6199b6c4e0739f423d6ba315899d4a692471ca9f23bf4389d6f5492e3f7448318f6a86df4f9bc47ac59e8f651244f201ba4038441d598fa015a31689637175e45f5d486e01dbf65b65dceede99e800ee6bb3f0e78466d2629eed606b5f346d2d2ca1db60fa74c9ed5b51a6e30e6dce5e494dda28e874bb1b5d2b4e6d3b481e45ac47f79263f7970ddd98ff004ed4c9239ae09859d40ed938cd47095b56c1bd04bf60b515ecd25b2898812464fdef4fad615a7ccaedea6b57055a10e7947430b55957494227dcb22b6724751526942e66bd8afee06ff28ee8613c88f3fc47b16c7e55a5fda9e6e149dd8ecc323e957ad1dda121142ae32001d2b0a75a8c25d99c8bc8e3bc6be0d7bbb6975ad0d194637dcd88ee3bb27f515c2f853468b5af1359c3724ad9a932dc1ff6179c7e2702bd5755d7ee3499948e01e38e95c469d716b6daeea1736f85172ab841fc073920576cb170e56e3ab15d6c7a6beb82f672a1765ac602468bc0503a7e94c92533868493b08215eb9786fa311e15b1f4a9a1d566814e1b2bdab9e35b9d734f72ae66bf822eff00b55af1751b71033659704b91e98e95d74452230c310db1aa85001fbb58b26b2654dbbbe618e957b4b93cd97731c63b7ad6388c6251e58845ddd8ecb4d8f72807bf7abd716f198e486640d1c8a5581ee0d3746846049fc23a559d418194e3a01c7d6b3b72d1f6a75a5a58f1bb6d0ae6cf57d72caddd7ce368c212c3818607f518aebfc1976b7ba5b798150cca43af5c1e4115c978c356fec0f1dd9df2ee64755f3d07395395e9f8575fa4c16d06a51dfe9e43e99a8fef0aa9e2273cfe44f35e852973d2523a30325c8e1d993de3452e811decc39d398c8083ce429523f3af37b7d7fed09047656256de0e5bcd900dfea33ef5e99e20b049bc2fe23802f58de4e3dbe6af075d66e229525b78bcb541850c38c7d3bd2f66e4ee679849b924b63d126d5a1bb92de3b78c42cec3746000abf435ba6e05ac5e645321841c02ce016fa7ad79c2f89659ec4343088e756e582820f6e0638aaf2add2c6b7a6699dd0e4a9f980f7f5ace504eea5b9cb19492ba3bbd72f21d52d6d595479a93001b1c807a8fa55b86136b265667280636f61f4ac8d33cbbbb3b69a28196461990eedcae7d7dab77ecf2cb11046dc579d3d74ea8e9a7693e7256d502465147358d36a176656c02076e2af69f0335d18e41923a13deba18f4c836fcca09ae6a52aa9bb1d5caa4aecf2af15e8d369f7ff69b7f9ed96dd4b9661924139c7e95c36a2e66f9b15deea92dfdcd93add2b99a65da8bb76a8c8071f960d71d796be49681d919d473b4e71ffd7f6af6b04e4a2b9f747910919d0971115dc4a9ea3fc3de9c93ec2724ededed5224400c76a8da319fbc01f7af414933468bf05cb088b02a549dbd473f51fd6acdbcca5cee041c67681f78d610628e72307afa7e553c77677020f5ec78c5321c4d892e4473f9ca02e3ef22e477e9f856ea5c7da11644c1e00dbef5caac82788b26370eb938ab16578d6d3657631c1077723f0a5cb721c4ebecef44456396460bc3237f70fb1f4cd6fe8328b092f12d846ad2b092580f0b9fef28f7e323f1ae26de3fb446d399a282255c9698ed53e9f5ff0026ba5b4478bf7be7a99202190c68ce153d0b607be3e9553a2eac3959a50ad2a52bad8ed6f354834db1179713c2b04a4284c6016feefe383cd79b697e2ad446bd359eab1cf35bdcca761553c0e7001f4e95b7ab5e497b118a5b4fb45bab026de2898b97c15de0f45e4f5c631f5ac79b5eb3b5959d9af0cb0ca02a80558b700c473ea391900727b8a8c360bd9c6f3dd9b626bfb597bbb1dddb6a46da22af219e04e779f95f1e8477e9dab51751b3d4ecd955dd44c9b47ca43723aaf6ae1595e7f3a38a49266704dbaf181ec0e4104120739e09e6a13aac96b0c102111c45092d10332c2c99ebdc64e073d79e98ad6a6120d69b9942bca3a742f359dbf87efae123606463859186582f5dbc7af7ab87589841b59bccf379ce7383fe3585abb35e482782e206b92885e33201c1039e7f0c7ad26d96da151387fb470cf1b30c01ed8edf4af3aa51a94d35d8faac0d5c2b842316afdbadcea6c76dc3a997612a7ab374ad89adc490f96ff344e30e056469f6f06d864562aaf1890727f977add80335a92c0e7d2b9945daccebad28b7a6c79ce26b5d465b76724c6e475eb5dcf878adc3c713360118ae53c4308b7d7431ff0096b18623dfa7f4ad3d26ff00c955627057a1af3e6d42a26f63e3ead254ab4a0b64caff00106d9523936745e457905adfb45ac0c938618af50f18ea66e2d5c9f422bc627948bc0c3b1af5b2f8aaaa7d999249b677c97fc70d8cd3d75098fc9b8ed15ccda5d798839e40adcb41b82eee9515292a644e29235ad199a70493c9e6badd271bf23a66b9bb550a076cf535d1e97fbbf9874cd79189770a71d6e7a2d8cde485d872857344f387ce7eb5896b70c23001a65fea31d8db49753c9b228d096cf403d6a278a94e2a0b63b2e923c73e2cde4bff000982470b91e5dba640fef64915d6e877d37863c3ba65d96792296259e7461f7039cf4ec31dabceaeeea4f13ebf35c3a9537b70153d40242a8fcabd967481bc491e98caa6284471143dd7181fcabe96943d9d08d37ba2f0294aa3933ad4f2f54d32e6e2021edafad1b63039192a4115f33c4cb35bc56974e4a8c98d8000a923d7d3dabde34184782b56d474c123cba39612984f2d6f1bff001aff00b20e411e9cf6af1df17786ae3c27aecb613e24b79bf796d3744963272083ea3bd5c76d031d069a7d09bc1771269d7be649024caa4a9475cfd08aee25d6bedb6d3456b676b691b366eae24fbdb7bf02b82b0d40a28457c1551b481d3dbdeafdad94b71248c5cac4ebc904853ec6b9a756576ba1e7abdcdcd1aeedc6a534d6d75b2dd9bfd411f2fd47a5779613c5750f1835e5c34d65941b6f9941c30520d779e12b494dd456f26e08d966fa015cca518ce30defa1d50692d0bd3c4b6f78a5054df6f2bc60fe06a8eb328b4bc2824566ea541cedf404fad53b79fcd883943cfbd7998883a55a4e32b5cec8cef157312e6ed7116d1e4ba61577744246075edef5c65e68baaddc73dddc4ed2cd01dae8f8c8e07031dbde9d06b5ac42d1c65cdcc7361523b8843ef1ec4f23a751d3ad5a93573a55fc13dba457881f708a43b81fa9e9806bd7c3d2a943dc4f73c28de2f433a0f0e6ab15aadfdc5818ecc7cc5ee5fca5917d173c9fa806bd5b425f065f69a92d9f872d4a8c46fe6c6490f819196ebd7ad7936bfe279f589da6ba792eae9b1bee246231807e5451c2af3d2a5835fbc4d222b7b794410c9c4c63f95f703d73ee31f957a12e78eb1d8eec3558424dd55747a46b7e03f0deb36ae2cac469d7073e5cb0b12a0fbafa578ceb3a35f683a8359df43e5caa32ae395917d54f715e8fa778e238f71d462fdcf3b648c92460703df27e957a4bcd0fc6ba5cb04c5df61c838c3dbb11d41e9f51d2946ab5ac8f55d0c3e257ee1fbc78fc7394e700fae7bd749a7693713dbdb4e2d62cdcb91119a418da1724eceadf4cd476fa0fd8ef659a4686f21b76ca79797593fba70072338e2b492e1237f32f2e1eeee36ffaa4cfc9f2927217ee9e48da3dc9aefa705bb3c59e8ec6a40a6de6437d746edc1df13a8da230c32729f7718ebcfa0eb42ddddc37db7ecef9c33a6e6f2caae7ef33063927a6381f91ac6b1b89cdf2978cc93dc2f9cc8a30a147f08cf008f5c13ed45bdfabdd5ba2c97375be42433bb164ef903f894770477fc2b4937d0848e974cd52582dee2d85a3c77b0a6e30b0f33cc249c1dcbd460e091ebf8d49aa5f4b058b5c5adb8ba2a435c477318c2f3b76e0f24f1c1e7a75e2b26ea59ad2f2df50b49a39a40cf2fd984e563640aa7728e3031b8fe18eb5aba2eaf16a3a72ea7e5a24d1940ecebbf23392723a0c93d71c7d33509a1d84b29add1649a20608731a98269032072a1880c381c7031c738f6a76a56d7c8f1cb6f78228a68c46e78660ebfc4724745ea7a8c8ed593f68b12b7cd2dc473b5accf1c09091be38df2431c02adb77103fbb923bd6fdb32db41bf5478a4b5942c6819470a5700b8cfce5946413d323d787d41a312c22934fb85827b848a2059182b952ed92793c8dc08ebd8b0cf6adcd36dda0d3d91d2e19e046da81b72be58fce33f37f2cf4a649e1d8ded1974e558e29cb7ee837c8f91800641da0e4e7d7039e2b9bb88249fc453ae9259a49616f2edd331881e31f2aa30247383953f8d4eb71a3d0e0b821ad2ce46e4a6cb7948da250416c63f848c743ea2b774f79becfe5b0ea3ae3ad79e443538af6c6496479da6fde5c2b8d84138520295e0600c1e3a13db35d058eaacd3c4f15e8791c846556de8982464e48e0f4c750735cb5708a6f993b1ea61f339538725457f3ebff0004c4f1dc8f6b7d63231da1d5d41cfa1159906b51a47f33e001eb5b5e35d26fbc4d6500d3cc22e6ce7712ac87cb5c63d4fd07b5737e10f094a6e9eefc450ba4503612d24e3cc61ddbfd9fe75e6d6c0c630bd432c438e26b3953ea66eb5ab3df2186d629a727a79685bf9572d65a0eadaaceeb6961348c8d86dcbb769f439c57d0773e33169666cf49b7852e861438501215eed81d481d07ad52b4d73469bf7ab745a5fe213c9f3b37a926b5a55a9d085a99cea0a2f94f169fc3de20f0fa09afb4bb98e0ff009e817728fa919c55ed3f5785d954c8a0fd6be92d36ca3b9b6493ed29b597fe599dca7db3de9ade13d126959e5d2ac998f5710af3fa56d5232aab58ebfd7a84a9a91e23f6c584ab6f1c8cf5addd2b56490044233deb6b5af82ffdade21fb6d86a31e9da63edf32d914b10475d9d803fa575ba4781bc37a2030a69c864d9cc92317661eb935c7572be78efa8a349a7a185677c9b5433804f6ae0be246bf2c9a92685e532c2803ca33cc87b2fe1debdc0e9167952b69026d23648a006fa5635e7c30f0b5dde1bf7b375bb690cad3acadb8b1ea4e783f952c2e57ec65cf277b6c54a2dab23c23c3fa7bc3e2ed35e4e163b85603a807ae0fbd7ac5fcf0c5e33d22e8c5208ef231134aab906457e87d0e1aa3d43e144a924afa76b416432acd08b88b0011d412bf4f4ad4d1ac9ef21bbd32f428bcb3b8127ca73b5978383e845774f992d4eac02e5bf30ed5de65f1236ab002c61b550f18fe34dcc48fcabceb50d597c41f0fefb4dd423266d32e566b0b823958d9c294fa61bf4f6af5b4549356be8f195f2154f1fecff00f5ebc21bce87c38b134a5a5bb98651c60b4684f73d413b7f235945c93ba3a71293a6f9b64bf1d2dfa8dbaf0dea9a7c37490bc0d6b0491acf33361b2ca09c7fb3cd416d25cdd4519b7b811c6a0aca87a37a1a9d1ae2e2ff00ec775a6cf2b2b2bcaa3e7620639c7e55b3a7f85e6d32cae27b9409e6fef2256fbc14e783ef5325251bf53c5d1bd87787a5586778a594988f4cfaf7aea61b9ba7716b672e6656c12a705d08e2bcf8dbddf9b20b78d9d14e4e380bf8d5ed3b503095ba79648d93e51b4f38ae6a90564dfe1b82972ab23635096e2d2e4c53e0499e50b6587d6afd81b892db7221c671c5476b6d646037923a832ae7cd9db73e3bed41d4d741a45de950d8058e4664dc4ab38c161eb8ae2c4d2a50b393d3ef3a2156e710f6b697d34f24916e2f188c0ce074ed8e9e99ae0585e47751d861cc7e66d40b901ce71919ebd6bb86bb8848cae4472050406f955811d41fe7f4aa31ea53dedf98a38a20b0a3b17701c9215b69523dff00a1af4f0ce74df2c97bbf91e6536d1cc7d92359e68d016dac46f38ed4b6913aef8501e87240ea0f6aa315c4e14b461fcbe074381f5ab567a83db868fca7698c80f3c6791c67e95ea2b3566747bc89a5b7585434ec5860058c3152e7b006ae5a6a5730c4c3cffb35b440a0820c65c919e4f05bd31d4f6acbd435592ed9a36063427e5555c11f5f7fa559b08e4bc91595f6dbda670c540dd29ebcfb0f7e82b7841455d151ba46d04b88ed6d65bb768a585b779309621c0c9e83ae7f123daaa6e5372d0449e506c1658c8209007cac3192477e7bf350c7768b731a234924d00c22127645938c8e464f23d075e94b7170a4c8bf694696460543a00760c9c138e57201e8073d4e735571244a9e63c61a7dc0c84158c8de4a7a918f56c01db9e39cd446f543c9fbd8d272e02ce4952bb79191ce78fe99a923b8b11149192f24b0b8c387387620676f279c0f7183504cf3ea374d288630ce80c4920180809cb05031d31dfaf3f42d7291634bbd5fed1b7b176dc595a35962601b2461771e9b475ebd866b7ed6449f5496eed2f6dedee52430a8dde5ef7dc0aac9cf43823200c1c13c1e79c8a49eda00b2441e28dd8acf1b00cb8c8c2b7704120835634db4bbb7944cd632066073010a1304f0ae4f0d9edd00e39cd2560d0acb7e97777753dbc12da969f6f12011280ff2ee2000a46472339c0e38aed6d1e79acc594d28561e6bb2c800f3620c0f04fb8383f538e41ac7b9bfb521522d38c4b34417ece93298c05624719ea3079ce4f1ed5afa3ea1f68b8b8285261020313348564900638049031d319f40077a99cd4637626cd2b99e5b2b35bbbf91858aaa9cc1f339009e1d318dac00e06304f5358f7b6e1bc457d6f77b56ca465b985a127120dbced7c637e36eef98707deb7a092dc5e7daad37c71ce9833a810b47b013951b7046187b7078a782e346582668811866c461530cc41dea4ed19f504fcc3b719575611cce95ac4b7b2d9452aee496666410bb2b02a09e727b06da18752bc8ab696c3fb36e24b68a421637921b594ec91ffbd8c6412403818e09ce6a8789f4e8b48b9be8903ac77c556d85b4436c2a5db71519e180e0283fc4c4547a28861f22676923bd9253004954a6576e738070320673d18a9e69496971b474ba46aa97da70bd99668e0dcd09696124ae4003ebcf1df920e3d1d7310b6d1c8fb63b983a4acc18b283b4e4f73c7d383491a46f0dc2866369932e14ed3f36179e70a7907d79f5156c4a971633b88e3fb2ac85ae22958f9d04c31f2600e0f033ec0fd6b1ace3ecfded8716e2ee8c5b282ced667174374cc37791196773fef10302afde69cf078834fb17d3ed22b7b84dd729e50762bb810377543c738f5ab565e331a6f87134dd32ce23aba652f5e360555c139c16e58e318cf1e9563c2dac5deab7852f6254688f3bf195f535e5e223ec62f5d7f0356d5d23a6b1f082e9577f69b2bdb936ccc4adb2ff0008ec0fa8adb13344cbb8baf192318c523dfdb46a0c5316da70c31c8351bea11df0f2a48fe4037649e0d76615c1c3dcfe99b4522e35e832c49006624740381560c266dad30c63918e959b16ad6f1b9deea8a3a567dbf8ef49bbd7bfb1adbcc76ff9ee17f77bbfbbebdff435d2e718fc4c7d4e8a4545076001c0f979fbd446f22a959475ee29651109a32dfeb3eefe1536cc2839248efed557ec16163659176e06471cd79ddeeb70d87c56640db55952de45e809da0e7f5c57a12008e553e6f5e6be72f8897d73078eaf35080131c370791f5c7f4ac6b36d25d4eac245733bed63db5e236faaea8d29da8c9e62b63809b7fa62be77d5b5db1d42f9da19736c542c10b47b0c21781cf7f5fc6be88f0f5fc1e26f0e595ee43f9b1f9330f5ec45792eb9f0bf50d37c4b2c1a7a5acba5c5f34525ef1c373b38e588f5ae77c908ba92d118635cda54ff00ad0e462ba50e5c4324b75b4072ae7e704763fd2bac1e28d35bc2d1ade4cef72cc123b74077228e3926a7d6b46b7f0ee8b049ab58c291ce3e49ed58edde3b67b1f4cd71dac5bb491db99e036cfb414f394abba1e879c647bd54649c799753cd69c5d9925edd113caf6fbd6164c0507381ea7dea6fb74772ce9190ce76ae71d3a1cfd6a2b60a18a6d8dd621b090719ff001ad1b0d1ece61b93cd11b39662edc827fa579f52708abc842c77f6e6f4493dc142bf289082064fa54b24165bcf997ab1fa08e42411eb5b29a15bb5b15cba9ce1646018d5cb1f0bd95bdbec0ca4ee24961939af3a78aa4b5bb2941b3cd6e25b94d624b3beda32a109cfcac3180ded516846586f92d647e19195e4539da707b7a71c9ae9bc49a6b7fc253a94569b4c5e66e88641dc4fde03e86b9a6096eb223a88a76caa80bcb1231c115efaf7d7277314d3f74874726c2ededa49e3595fe568f774f6fad696a525bda5a8124c620c3e5ca92ac7ebeb54f62ce1a09401801d641f7d73e9f9562ea9757bb85a4f29310c1518e1f1dfeb57ec1ceaeacb8c39a440976b25c1692252dbbe561c003e95737a4b6cfe702c0bef0a876ae71dc0f6fe758e4057e7a1a9d65656f98e7b81d726bd05a688df94d32ed1b476ec040b805ddc71bb07dbdf031535a013c59118f2150219dc1273c1c119e9c76ed59437c93b1e7249c331c0e9d6b6d18c12a47e7a858b70fdd9d9d7df93d79c1e6aafa8304b68fcb6f3a511364be58f7c1e7af5c607e9da974fb512dca62de3713446352065154705c83c918e00e39f4a633bf96f19b61110985c10ac49eb839e9eb9ef4594d1c6f26c31ed11b7f09dcf9e415e33c63a9aa4f4275b1a91dc0693cab26dd0c4bf3391824f5200e011c671ee2a36f123feed6db7243130738e92a1230b8c7181bb9ebcd609bc0d3794c19939565042965c64e48a58bcd4513477108f99a51838230303a8e959bd47cbdcecee6fe3921b5db37d9ed262d0895407f246480a50f4fbd8f9b9c0e3da5d1d2c2e2fe37ba89e1bc551224f6b20292b26e0db7fd83c36de3eeb560d8dbcb1d84d0dabc0fa74b32b94b9c0694ae08c03cb019c1e839f7ad88d16dee23fb201e7c0cb39b390109134b80a576f518c30e4e7a1e6b99ece29858d5b385a6b7b9b29a38e4b88b2ac1311860159bcc5033b5b271d082a46e15aa93ca74a863be4594450335c35b3fcaf13b04ca7aaf39e718c66a82471d8b178351732df40b71202876860c3855ce47098c1ef8fc25d309bf1726e12d55217292b6064465b760f1cedc0ce7ae1b918359aad16b9dedd04d11eaad7761e2082ca59663a15bdbb997cb8bcc4dff3601183c8c0c2b13c8ed9c52cb0e9d2cf0dd2161711985119640b2431e3760678da496214f046e1d401553c49ac4df67fecd2f6e6f6e2021a5e36852f8da99ea0edc633c639e4d41a27d9ce8c248a02ec22911409b6b5c45b4020b30e541381e84607beea4b96fb01ada7937734863680cbc83b57e47d8a55d65cf3c8195e380ded4fb64d44a5998ad764f1dc32dcbe0b46f115f90ffb5b718f652339aab692269fa34889138668125412c6bbc6173e793dc9fba09f626b4bc2d15c5adb09f5269a2ba326c2082c0927218edf7cafd2b9aa4df336c2da98161af5b3eafa92dbc3088f76e5657f3373f4660dd483d6b4ac7517b09e69ed9d4c922807cc50c40ce783d79f7cd79f5e5d795e27d49a164d9f6a93698feee371e9d38ae974ebcdfcf1d2b0c53696a7e8b966170d8ac3af6914dab6e7a158df6bda85ab4ad222db85ea200bc7b362a9eabaa5a3c7125db323606c1cfcc57bf1deb6a5f146971785974db390c93491056007dd6ee7dabcdfc4978ad2dbc6a72543163f53ff00d6acdcd53925077bad4785c242acdf3d2508df4d2da1d3582c37177e65b4c6352b87b767c6ff00f70ff7bdababd0bc3fa469b7d2de5a2b7da4b2f52475390706bca74ad4fc89577fcca4f39af5386cf517d361bdb49d6eedcaee01b974f6cf5c5734a152a49b5d0f2334c8e187973519594ba3fd1ff99d8df24cf347710b82a14865233b79ea2ac44c6448c6e6ce31bb3d6b1b45d51ee9036d650301ff00deef5726b816f7e1370552739cf03dabd88d48fc4ba9e1d4a5384b925ba3544614eefba579ce38c57856a3a7aea5a27886fa50bf2c32b96cf4209615dd78f3c7aba3cd6fa15a42f25e5eafcf283f2c487f993cd71f7f7096de06d7200bb5a7896318fe267207f2acabdb9e291d5848495394bbe833e08f8876c571a4cadf312268c1ff00c787f235ed17da7db5f2b19a3c9dbc383822be62f0c1b8f0df8eec125051242305b8cab706be9eb199ae34989d002e50801bb91c554542778495d3d4cf1706ad2f933890c8f77fd9f77b26b58d8b6c650db8ff000f5e2abfc4fd0a1d6bc226e1e511cda7c8b3a4ec32446dc30fa7f8555d3e0b993c45711491c8ae24cb6ee38cf5aeaf5a104be1bbf4b98c4b0b5ab2cb1e7195f4c8e9c5793875c916d69a9e7bf7ae8f03d160d1b722dd5dc480312cf21270074e95a327892c2d259a3b358a60df2f987a63d8573f2f87a18eea516b78971825a38482b2edcf1c1e18fd2a06d1e61b3798599c70a46d3ef9fa56f3c3d39bbc9b672dac742be299cb61993cb298c2f069f17882458955652428c659b935cccda6cd6ca1842581180d1648155b6cc9c23be3dc7353f53a325ee92d33567999b2ed349096181229c103be0f73fe35c95cdf5e5e448279cc8aa000587200e9cd749aadecd7da5471dc5c9f2e084792cc370098c05fa76f6ae7d208db4f59646c4865c100ff000e2bd2c3a508dfcc292495ca8d71704ef3331f9421c9ede951493348e58925bb96e4d58bb2a8aaaabf78e73ed54d811cf5aed8d9ea7446cf513249e4d6b5b2048802c013f788eb594832c2b59242ab85cee61b7919c0eb54c522eee0f74822ced19ea065828e319f53fca996e2791c2a6e91d199a3887215bd79ea7de9bba44dd233028848d831b474eb9e39e056ca18ec51983346eca5b8e5987623d064f3fa54ee45ec578b47bbbe9552ee5f2a23f3b2b483919ea7d7a8e78ab738b3b4b568d163924d9f79892ccbdb07d36f4c67159b72ccceeeb298ee0fcc3e6209e847d4f1d4f7a91ccd753c36db52365569b64e798c8c700f5c11d33eb9a529d8126cce9ad23f2a3312614a6ededd07e55b1e1e8a0646fb4b44fe502fc82c4807ae075000e9f5a5b658a6b791e7801923777418c611173b587f10271cf6c55e8f4db36b796e43ec8bc92461f903ef157c1c03b7240edd0e6a27272560e85a4b686d6e63f11c41fec36c4995d02ac26e10e57393905c63202f1938cd73b69a8dedcdf869a30666791a258e3f2f633924f4c641c903f0c715626b4bebb6d9a91dd35c95ba8225947942370c5987380463918eb5a1a769379a85f4d73708d7111b5782069c6c2a00f97231c607cc07b56327c9ab656963af78aced7fb3a79aee651708219adce7cc0e57e5248c12060e091f2e3ad574820d3e68b4db7b8fb530dfb161fde056660c18ff00794679cf38738ef4f9749bcbc9e5b6b530cf0feeda45971e63be1b0848c6dc8f403802b16cbc4324c6fbfb2ecfc89e35502e6e554c88e3824a8c6064b8c93c61062b9e14a76bdeff00d7e82d18789ac6e22b2bdfb74d03247f67823963019a6386043370541c16e783b4735b1a5c76b345a5c3753c9fda05d5e3466190188fbe7182a0e0e71cb0e2aa5d23eafa669d225b79767215963d8c76effe27c60e5c9c0c72a327383d294ba759c97fa8ddcb279256e8c11cc0b0108c7dd3e83fba79e41e82aef2946cdd9aec1a1b7658d4756772ef6af1aa5b169e328f2440901dbd093c638f979a6f8a7528340b03f646816436cd1229215f030b851df96ce7fd93cf7a960b2922b111fdb1ee27ba9de58eea5c3096e0a1c061f7594a8da3d371f4e3cbfc6370d2f8aaf904f2c904729f2d2490b793bb05907a61b231ed534b0ce5579dbd16c8d69da4ec55b05064515d7d8c6638f701ed5c9e916d7b7d70b1d959cf70e4e00890b57a8e8fe01d76e63437cd0d9467a866dcff0090e3f5a8c6464d9f7793e370f469bf68ec53b5740bb73818e4d606a77313df380d95401457ab5b781346b35dd7b7334e476326c1fa55f8b45f0569719ba7b3b28950e7ce979c1fab1c57252a6a32bb67462339a29feea2dfc8f29d1f43d5b5723ec5a7ccf19ff968c36a7e66bd4fc39e1cf11d8d8fd924d444103677244b93cfa1357ffe131f0b4516e8f5780203f784a303f2a8d3c71e18bbc45fdb71ee2a4928e7903e95d2a11bdd1e462735c4578723492f4bfe66f69da4dbe8d0106e8804ee667719cd39df46bbf3525be8d8c9f2b112819fc8d71b71e1b9bc596e26d4e78f4cd218feee38e5324b38ec4fa67d3f3aaf7fe1af0de8ba74b3cb1182cede16892e279b38ddd58263018fa8e6aefca968794e2ea4eedb6fab373c41e03d135b36729d46680dab978c210431200f9b3c9c01c73ebeb589e2ff000ddf43a25a41650fda214bb8e4b996320908a0e091d7ad78c41addcdbeb58d2b56bd8ac7b7ef4f4e7920f15e85e1af16f8ab57d69ecac2463a77005dcb66cf9c019e5703ae71daaa707bb5d0ba6dc57baeeae49f102c208d7c3332616e3ce68f23a91807f98af64d0e571a25a90049f26e201e7939af2ef1578535dd7b53d15ec634fb3d907694cf2856c923a000f615d2cb67a8e87125c6912392b832c13cd947e39dbfdd39f7c7d2a23270b4bcbf51d451ab1e4eb7fd0d9be491b556b8895939e8bd718e73f8d2df64e8da86f192613c1efc573167f1274ed6bce8a38de3d560c85b72bf348cbf797d33c1ad5d37c53a3f892de6b4498c3738db2c320d9221f706b0a90d5b8efbea71cf092b7344e52cbc1cb71031beb98f7364a84814ecfc4f5a3fe10a58254f3ee1648470b22c6016f5e3b1aea66b29ec5c1621e12789074fc7d28d4e48e3b162a7d3f3ae4588928cb9959a38654aceccc7b5f076890c4e90bdc22bfde55978fca961f052856c4b6f3296243491e081e956ed126701950e3f2ad8b77648f6b820e7a573ac6396b28680e94763e73f10ea564baa5d58e9ba6c76f6f1c2571202cccdc124e7b7d2b1bec92b58c77661f2a27242e0f071d7155a0b89a572acbe6332eddc7ef600e99ae82dae81b6b3b29d5111623b1cf4249e9f87f5afa6e554e36460d72ad0c5485d738c127b9aa7731247261999989c9f4e6acdc5dac534b129df186f95d4f38aa8cef312ced924633ed5ac534ee5453dc8932183638cd5f8a4559b383b7db9c7b55124aa6d1d29e92fcbb7deb492b94d5cd2b6994de289882acc1b6763ec6acc93113994876ddb77313c71cfe78ac36dcdf749fad6a5a4c26b4944974a8e1c1f29bac9c75cf6ace578ab8b9496dd1a7f2de4899999c31627682071f7bb6056a496df6eb86b892f236678f748a0e5a25e800cf70074ae7a1325c4ea93cf2ac783b39c84ee38f4cf6ae86cf42b99ed4dc0b889f6e33b5481d3231ffd7ae7af2e5d5bb17148ab6f330fb645b9f6b854894e023ed6ce1f1d47d3fa56c0bc86ecdb5aed88436f3330b1919d8321032b91ce38246391c67d6b2e4c225c25c465244c3c7b08fde0eff9543617e4de35c0926fb42a148843c00a4107713d073ce69465269b437189b6526d6acef174e6510d943e5ec59c069b927bf057ef1e3a922bad7f1044fa0c36cde5eeba6de6595015385e0ca09fba406e01c829900d727a3da9d3af122b8bd882c992e73d7eefcc3d4e4e3e83b5753acd85abafdb23782e04f0f926c5c0291edc101369cae3e562c3faf3c95ea42538c5edba054a5b96bc1f2deb5b4971771db3348eb24cb1af55da3e62dce72083ec0fb9ae66e74f73e3bd462814790b3b1680c60eeb7c6de31c1009fbbc918ec4559d0f51b9d1b4916b6ba3ddcb731c814b846586401f25bdb3c763d3a0cd56d17c3b74972d757135f890c8d3944899304e49c1c648e4f15a2a9ecdcdfdc5d3c2559bd1588bed9fd81f65b6b8898dda99645883b1f94748f68ce0316619c745ef5b76de1037a0cd6735f5ac72f125bcb9953638f9c0071c8ebc9eb8f4ad8b00aefbadada4b871c1214961ec58f4fa66b6a4967b3b1375a85e5a69f6ca7ef4f264fd38eb58baf26959599deb2c51d67233d7c37a847656f6711b30217ca48db81660bb55b1d41c7519f5aced27e10d98d425bdd76f0ea53bb991d106c42c4e79f5ab0bac6abad3f95e1c8eeaec33605dcd1f9308f71fc4df863eb5d0db7867c4505a35c6afe288add5065b642a8a3f135a46752cfa1a470b429bba66d58e84965188b4eb5b5b785170b1a71fad3aeedd6c236bad73508eced147cdb4e140f7635e47affc41d4e0d662d33c257b7b7f70a76c923461c487fd850338f7aeeb48d17c5de30d1bec7e2d36b6f66ffeb22897f7920eb8639217a76e7e94d527a392febd06ea59b49e88ce6f1e26a972fa6f80f4037d329c3ea174088633ebcf27f4addd3be1f0bb3fda3e30d45f559d46ef2e4f92da2ff75071f89ad3d4f53f0bfc3ed2e2b28e00d295c43656aa37bfbe3b0f735c56bb3eb9e30c47a896b5b36e63d3a0621303bcb20c6e3ec3007bd6ae2979110e79fc3f790f8c3c5161adc0de17f095a19e33f25ccb69003c7f750fdd5f763f8669be12f859a8c7790dd5c18aca0888616f1a8700fabb30f99bf41dab6ec351f0ff0081ac9a0bdb8b64988dcb6f1155183ec39fceab5dfc434d4c2237da7c865dc91dbc4caaca067ae39fc2a1d4b689686d1a52bff99d65d496da6c26d74d88ddce0fcc54f00f7258f4fa75f6ac3bff00039f16189b5bf3fcb519489242b1afd33dfdf19a834ff14ec877a42f676ea3ef496921c7d0600ab5078934ed744f1a788677f2d773f92cb1e17d45677d6e5ba6f96dbfe258d2fe1ff82bc34448f6d6a245e434e7cd7ffc7b8fd2ba94bdb178556d6d647403e5fe01f9715e78349f0e492978bc5da847213939ba56fe60d6bdb69366a5557c617449e99f2893fa55fb46ff00aff333742296b7fbbfc8e94fdb1a6fb9144bee49fe5597a9688da9fcb26b7750a03f325b22a06f624827159b3dadd31905beb9773f96719485383f80ae0e4f11ebda1ea139bad3a7d4aca1db96781d0b31ea178c1039e6a62eefdd45f2595dbb1dde97e0ff000f680b706d5089242d999df322eeebb4e38acaf10f81ad7539a3b9b4d4ae6c350886629c80ff0081c60d4d6be3af0e3c31b6a9a62580997747e6a7de1f51d0fd6b56d750f086a042d932063fc514bb73f8e68bbdee0aebddd7e465e9daeeb3e1e3158f89d629eda62238ef61e519bb06079527d0fe15b37ba25bea52dbde5a5d4a823cb2441ff7527d47ad45aa787b49d7f4c9f4c93549a2864c2e63994907391f7875c8a8cf84b56d274496db4ad6d669495688ddc78c303cf2bea3dba9aca7461523666751426ed25f327b69dd018dc6181c10474ad7b54768721b8cd600be13db0b8b85f2ae236f26e10ff0b56a5adf28878248cf615e2294a95474e4f6382b52e49599f333d8c91959c4837b1ce00c027d0543731acb1e0ee00125475c7b5598c5d3bed951d591370561c8191cff002a6246897891ca72be690c73d6beb136b57b9e7be6bebb99f046b6f3309e30c31f748e477a867d8ef98a32a87a0ce6af6a5198a66750de513f2e79e3bff9f7a86def20b7915d40638c1575c8c7b56ca4daba3a234dded2d0a71a3cafb1509357e2d02f66e768507b96ab312daddca378081bbaf6ab93e8f7f047e6d9ddc92c18ce3b81532aaf65a1d11a0b77afa11c7e14be31821e303dcf03f1a9e4f01eac1d406b7766190aaf924557b5bc503f7fab5c42e0fdd02a76f113d9b036da95d37f74951d7dab3f695af6fd0d3d950b5f6f995aebc39ae5ab15364de5e7eb5a7a6596acaaeaba843691b280e25ea47a7bd5bb0f1a788e35591ec649a1cfdf78f191f5a9eebc70ae1b3a74492f6dfc7f2a89f3cb469150a1477b8f8b43d3e7433ea9a999581fb88caabff8eff8d569ff00b1912582c4b246c00648d03648279ce33d0915acda9f83751b68bfb52148a72993716c31b0ff005fd6b07fb1b5fbdd566b7d1b335a06db1dd636232f6ff22b18a93eb6fc0eb74e8c7ecdff0012cade585a40aa963e546075740b9fcf9a8a2f17d85b4bb20b2dee78fdd2035bb6ff000df4fb4852ebc4babbccc7ef45192141f4c8e4d5c9fc4fe0ff000a2aa6956b04928ea238f731f624f4acdc69b76d64cd79e695eca2bcff00aff32b43e20d54c2b2c3a35da2fde0ce98151c3f14dec26613c2cccb8f949cfea2b2ee6fbc57e3a94456b6c6d6cd89c374c8faf7fc2b6b4af867a569412e75eb9fb4484f08cdb23cff005aa8d2a70d6a7dc852ad39e94d5fcdafe99d65af8de1f1a785ae2d34ad3ef22d4e405639f60548587462fd08cf61926a7f0ff80f4ab1c6b3e25d45f56bc8fe632dcb6638ff00dd53c0e7d6b32f7c5563a20fb1d9795261711c7689f7bdb18e3eb585777bae6a9756d7373e6c2229035b5ac630a1b3f7dcf5623b74c1aa4d2d76443a526acb567ab5ef88a0d1ad98c30c36c5c91123a9691bfdd8d793fa0f7ae5bfb175bf17dc79d7f77710400e40741e67fc057ee47f5f99bdc564ff0068d8e8f219b51b9371aa380ccca0963edd49fe74db9f883af4d1793a5e8b3c109fbaceb8fc727fad47b46fe12bd835ebfd7ccee6c744f0cf832d0bed86df77de62d9794fbb1e58d65ea7f10279d4c3a60fb25b9f97ce930187d0741f8d79e4abe29d45de5696c56563feb2e272ec3d800302b7747f08cda85bc6d7dab2da794d9967b5e5dcf40a09076af539a4f9df52a34a947595ddbc8d4d36c77992e63b36b99a53b9ae6e4f0c7d496e4d686a090cb6be56a1afc3046c305207099fc739fe55145a0e896a427d9f50d51bfbf3cb24a3f36207e42ae1b3b68232d6fa1585be3eeb4c635c7e84d65cbaeaee6bcedecac71f75a1fc3eb38249ee42c8b9fde4f2167ebefeb5d17833c4fa35a591b5d034ababcb346e046a3191df2c7358de24d324d6f4d9b4f9f5ad2ecad010cd1c237bb60e47ccc7d7dab47c31e1fd2b4dd0bec36fe229a2901f31a4b709e637a8efc7d39ad96c9f36a6524b54e3a7ebf236edfc66d75aa5c45fd877f6f6e9288de795308ac7851f892391c0cf3589e23f0eeb9abd8dc5ad8695a4daaca85448d292c3272780a075ad716456dd9436bd76832725704fd3819ae175f83c62b209b4a835b81777dc7512363d4e381fad118de5725b8c63a33474af006a5a5f82354d35ad2de4d52ee3f2d1d641b40247f11e9c66b4746f085fe91a000da65bdc5fc649f9997683d813e9f85675849e247b4cfdbef16ee28b2f1c9087dcc7a7ca47dd1cfd4fd2b4a6baf106856b68b04173a8ac842c96d1a04645233b8b9e9cf028776eccd358aba674967e22f10d8d862e74ab0dca3e58e0b8ebedca819ac7b9f8c76565782d354d26ead67270432865c7a823ad53bff15695656ab26ade1ed621da3e6649b785cf5ce0d7292ebbf0c353d461ba9ffb59658c8d8ceecc073e9cd691537e6bc8c251a6b75aff005e67a6df78c7c2fa8d934377e48f3147eea584f39fa8af3dd7bc336b656d2eb1e1bf2f317cef6bd51c77c7a1ad7bef891a7e9aa96fa45b2de478fbf7116003e9ea6b9c4f10ddebba8996fa48a388748a38c22fd38ebf8d62f99b3bf0d82935cc9597e251b1f1868f78cad35bcb6b3238dc8ae473eb9e99af47b5124f0a4d63afcb2a101bcb98e703f9d73f6da5787ee332368d632b1fbc766d27f2a9ed3c33a42ca0e8f777ba65c03c4658cf19ff00809e7f235752845fc2c254aaa5efabdbb7f90b6ebabc1e27d697538765adc8592de40db91f181c1f5f635d159ddc6906d2338359ca9ac68d130d5208eeec88c1b98012abf553caff009e6b1ee7c416f6f752451c4d2a29e1d5f83c578d8ea55555528ae963c9c5c7695ee8e4e5f0ee9fac6a18b59a5b79a4504f97cc7b7daaa4be11bb86e02cf711bef38ca0dc71ebe9567ed68b2226f63b1c29292ec0bf435a536aed1b2c867f9966e39c6efae01e2bdff79688f0b99f53913e1f9ace79adf56324288321d583c7ff007d0e39fad46f71e1cd3f6aa5b7da241f79874af44fb4db059da431796640aaa6dcf5c7f163af5acebcf0ae8f725aeaeb4cfb24dbb6b98be44cfa81d314d4eefdeb9d74f14946cd6bdcf3bbad685c131db5ac491fa15c9ad0d2e3d765c0b6070475906d5c7e35bfa8d849a0dbb4f63a4add41cfefe33b8a7d54722b973a86ada93ed8d8853c65982815aa69c745f79d5195ddd4bee3721f0e69b14c6e758d5adf7632d15b0c9cff00bc7fc2a5ff008497c3fa4be34bd3565957a4b20dc7f33580da3c69cdfea918e3252339a6cf71a3db458b6891dc0e1986e24fafa525ef68db6696b7bd64bd772e5ef8a757d76431db432bf60a8a4ff2a4b0f04eb7a91335d95b3871b8bccc01fcb35461f14dcdb1021f9631c84c0c0f71c75f7ab32ea379a92ab6a2d7c90c9ca3b3020fb856db91f4354a138e915625ce12f8e4d9d159e97e15f0fe24b89e2beb9539273b82ff004ad13e3c9ae41b7d26c1e638c2e3e54fc48e4fd2b895b148db7c734379cfcaaede5b8ff801ff00ebd74701d599624b26062e7cd11a118c74ed8e7d2b9aac15ef377f99e86194a7eed187e17ff808865b6d6f5dbef2b55bf68221c98c7c91a8f4e2ae69de1fd2ac6e4caccb7314432c5906c53db9cf27da922f0fdeddce27bb790c6dc9893233ff0002393562f7c37ab5e42a905f0b681321218a2d800eff00302589f7358baf0f879acbc91daf2eab17cce1ccfcdaff003668ea3e38b0b1b658349092380371c6d407d001d7f3ae5efbc43757ec1efb5403b848cedc0f41e959faae897360628efadde455e16618e7d89ebf9d63cb2dbd949b3c925875c356b0a5096b07739ea577465c95124fcdbfd11dce81ab5b5ddc9b5d2628eddc29669caee7240ce327924d4b61a678d35894c96fe1f7b7dfd65b993cbc03f5e7f4acbf0a6a7756f65733c6aa2cec83dd796141f9b009f9b83fc22a6b8f8afaa5eef79ef2e551784820db1a9cf5258724d0a97bcf955c99d79251e6928fa7fc333b587c0fa969b6c6e756d7f49d353ef31552ee7f12466b3f529f4eb7b70f6526bdaee4950618c42bb87e19c572da2f886e2eaf259f4ebb06e9ff00e5def27277fe2dc559bef197892c1ae56fe2834db8451b2196127ce07ba91c1fad4f236edca1ed2caee7bf628ff6378b353bdf36df4ebcb7858ffa9321ca7b92d5e9163f0eb5f9208a4b7d523d22dbca5f349ccb2b37727276afe15c0f86fc6be26d575886dfedec88ed8611a01c7e55d96a9a67c46ba563697fa6de5a0e635fb4738ed907009a727252e5692b10dde1cca4ecfef3a4b4d1f44b29161bdd5f52d6eeba1fde3b283ff01c2a8a8f53b391e365d23c3da4c730e925eb33e3f0039fc4d79ddcc5f136d25c476048c67f71b187e86b22efc41f10ad411736d7f17b9b56fe78a4a94a5b5bef27dac23bb7f71b7aa7c35f146ad379b79a8e9ce518900128ab9e4e005adf7f05f8905869ff0062d6a1d2ed6d2328ed165cc8c4f5c0c718c5797cbe30f12ccfe5dcdfcc9cf475db535d78fbc4975a5ff66bdf016e0f26240ae47a67d2b6f6551d93b69fd7621d7a766d37aff5dcf40b8d4f57d32016f1f8e524b9642c04b09c7071dbd6b9e3f13fc6b6b722d649eda462719dbc7e75c1437a2260c43170720b1cd69a5dcb7582e7a7418a6e9282bbd4ba52f6f514569fd7a1da7fc25fafea371f25ef91238dacf6ea11987bb75c535249ee2416ff006b91c87669646724b7200fd735cec533da8cae43e38a5d3af1a04dd2b85cf46fef726b9d4538bb9edfb5852af4e9ab25ab7f25a5fef3d16ce182d9016fdeae390c689bc31e17d6be716eb67783eecd10c60fb8e86b9fb6be6b884324f192780a1c64fe15afa7c33c9b59e365de72a5fe5ddf9d45e54dda28eba90a1561cf526b4eb74715af69577e1ad48417a15ade5e63993eeb7a11fc88abbe1d5b8babf48ed630ecdc73c8aee35bd20eada0cda7dd26580df0bf52ad5c168497ba2ac3e6298a466752483ce78c0fc07eb5a73c6493d99c74aaaa7295e4b91a6ef7d2fdbe7bfde6fcdadc36d72d0a21053866078c8eb8ad8d275786f18ed9655931f2aee0b91f85724fa29deb25c5d087ce7c727803a9fcc7ad7490cb65a0d9a4b04855a55fe151bf1ee4f3f856b87f8b99ec355a962a9fee93decbcedd4d3927d52d079d62662f9fba096c8a67da34cbb266d474006e8fdf64dd1eef7217033ef58d0f8ab5459098a762b9e15f9ad9b5f1e5f470ed96d637607a94ad25529cdeff007a3b2a65b39c52a94a32f9d9fe479d87416e5e68a48b6fcaf0b1e5b3c64934d8df119c05b6507f752c7d36f626b09750732c8d39dccea0386ce78a9a3bedd2050eeb6e08c44c401f4cfbd1c8d6e7e6ce26f5bde5e465d1d84d9391bdca9671dc62b4bfb7bed32421e2264ca8fb3a3614718e73d7d735cb4775640efb90f149d4056dc47e3523f9612490cdb571c30e49ff001aa51d49b1d8cd751e9fa8c51417290c2d908240c48383c7d3f9555d4f43d1f5798abacf6570bcf9d10c87048183d8e3f3ae660ba1b5d9ae7236e76c8c72df4f7abd657c463cdfdea646e88361b1fde18c648ab501a6e3b183a9f85752b12cf144d736db885963ebd7baf506b0704f63c57aa5bea169737663490820fc800e47d2b17c57a28317daad62549324b90b80feb5a464f66691aadbd4e3acada69ee904242b290dbbaedc77c575d63a61bbbbe4bcb33f2f2b9cbb7e3589a39080ef18663cd775a4a8862f3633f31e335c389a9273e5e87d865384a50a3ed5abc9fe05eb0f0cdb4132b5d6360e48f5f6ae89efa1b58424212351d150015cadc5f4de6aaaee77270aa3924fb536637b11cdcc2d1b138d84fcc3ea3a8fc6b9e553913e547b30c3fb592e797c8dff00b548cc5b9f2b80c3b0adcd3ec669f1b41208e2b8eb2bcfde47136e62583ec1d081d73edce3ea6bd6bc35b0dbc58519c0cd63469fb497bc73e635fd845a8ad8e6b51d116685a3b9801046391c1af20f15452f86b5354fb3432da4a09899933d3aa9fa7f5afa6b5e48e5b60a00dc83278ec6bc5bc73247069534ef6b6f73f67901f2e74dc0827071e87dfdab7e4542b28ee99e546b4b158694b671d7b98de1dd7d2ce07bebbf0f2bd82e04c21202b8240c6d230dc91c57433f8dfc13196dde02b75079fdf431a31fcc564689a9e832786664f11e89770e912c8a00b790ec771c8c1ce474e95a36fadf816ded1a2d2f4dd5d148e33780e3fe02ec57f315a276bbf339aac79e6972df4feb4d0921d4bc09a9da4be6f852c8bb03b5639e08dc67d082b8ac0b2bad76cb4d934eb8f0d5d6b161e7164b7ba293aa467a6d65e437b8aa126aed3305bff0ec77310e92db1557c7fba323f2c544b3f86fcd5940bfd3a4008c4f0b1519fc1c1ad126fccca518474dbfaf335b4c1a2e9da9fdba0f0eebb624021e1f29e455cff772320fe345bb781ad41d9aaf8beccaf55271fcd69ba56b7a769515c88f5482e0ccbb55bf7bb8fa0c2b0fe5556dfc54b1c2c92585b4acc4f986e3ed0b19078c05e49f5c93472bd5ea0dc5d95ed6febb9d15b5ee85790a9d3f58d7d9a36df1bdcdd5b82a7e8d822b2355f1778df4e99d2dee1eeed54fcb21894923df6920d725ac182f062dedb47b6f9b21ad8ba11f50ddab36f6c351d367542e8e1d03a343286565f51551a516efa19ceb34b96cfd7fe1cdcbaf1e6b375b9751b6b7947712c02b9d96f4de4fb62b61b9cfca88b93f80aecbc33f0ebc45e2011cd72cd6166ff3179b25d87a84fea715ec9a0786344f095b04b2b653391f3dc480191fea7fa0c0ae4c466387c37c3abf27a7de428d5aaacdfe078158f82fc5d70be65ae83a82c728c16f2b6923f1e456c43e0ef15c2d1433e973c2b23850f72a0264f4f989e3f3af7c5d4c3360629baa20bed1ee6365dd84dea3dd7e61fcabc8a9c452e7517156378517453d2f73c4353f0a6bda1db8967b09addf7645ce3cc808f5dc323f0359f67a719f6248e24b8965692591170a17d8741d7b57b2f8175fb8bb59a191dbca89cc6f83d076fad62f8afc15aaa6a973a86896f0cd6b70bc5b46423c7ce4e01e0827d3f2af5962e937694b95f9ff0099cd848539568f32d3cf63cff52d52db4a9becf6f6d1e420db260963d8e1bfc296dee757d53f736f14b26c5c945902ed1f9d646b11ea1a75c18750b3b8b697b2cf1953f867fa55bd2afef6cb4eb9b9b6407728466ea5475ce2ba3954dabec7acf0746a394a52bf6f2fccb2359beb46687ce9a2957ac5267ad755e1cbb9f6bdd6a136df2d7386eac4f5ae196e64b8788f94ccca43f98c72304649fc7bfa6056f69fa8c2d7caf72716e9f2863fe1dcff002ac953e5a8944f1a9e0beb737ecb65d7faeafb1a5a8453eace751b8805bdac64940c7e67f4247e1d3d0572f7376d2cdc9240e80d6ceb7acb6a571e5c6d88138503bd648b337126c41fbced5a559c63ee44fb6cbf052a5463d96dfd771f6d3b46438fe1e6bb1d274fbcd4ac45c22215c95e580c62b899ed6eac5fcbb88a48988ce186322b6f4ad7e1b1b2f24c4ec77124ef22b1868f53d0ab29ca1fbbdce3ef7c377f6f91b014c64b37cb8fae6b265d3afe3037c0c463391c8aef05e08955a791640ac3f791679fc3e9525d5eaa491ab8925576c10f8c0fc060feb5dd19cedad99f91a9b3cf15a485d5e580a81dca1a725e12aa731f0d9e95e95b6d4c41545b9e9b0af047ae71f5efe959f7da3585c42cf2c51963d08527db8239fceaf9b5d839d7639417b12463849240df2fcb91f8d4325d79cca5d14b8e9c703e95a97de1a112136936d2e3210b061f81eb5cf4f1dcd84be5dc2346c3a30e41fa1ab8ca2f62959ec6e412b055b98d3ca2870487079fe95d5e917706b72369f3cc914928c067e00c0ef5e622721f7ee3bc9e4fad5bb6d566b69372952a3f858645594a24d77fe85aa4b106042b7553906bacd1a5bb300454c1723048c91f8566691a5add4c97734599a5398d09c851ea7dcfe95e9a915869ba7ae150ca17e67f4fa5705592a92f77a6e7d965b4aa50a317575e6d97f99474d82d23bc9bcd738b64d934acdcf98c3ee0f4c0e4fd40abadfd8d15bc9280163452ccddbffaf5c3cf34f1dcbc5229dbe6b49191cacbbbe6cffbd83d3d3155aeb53b8bd96ded11b6a6fdd2b633c0f6f6009a97052972b5a14b151a78775f9ef36ed6f3e8be5fd6e767a3dbc37664bf96229f68c7963fb918ce07e7935da693a91d346d3929d8f51ffd6ae434a94c768865e3701b57fba3b0fcab62ddce70a7bd724a6e33e65a1d92c2da8fb39bbf77ddf57f79b7a978a5260d1ab1cf715e79e2ad4ae12c2ea4b452d7000da02ee23e61daba3d66d7fd18dd44b89231f301fc42bcc7c457d793b43159efdeee599876c741511e7ab5973741aa34a8e1272a6ba5b4deef437f48f196a1a2e911cb79a143a8fda1982ab29c02a3a95da79e6b76f3c5d142d672af8534196deee20e92cabb0ab63e64236f507f3ae574ebbd7ce8371a5ab987cf5daf3a290e075207d71d6ae4a6f74eb185af2e1eee252399a42e463a03ea3dabd18f2fc3d7f03c3ad87a917ed24b45bed7b75fbb71bac69f6faa5e437106976fa4a86dd33d85e12acbd48d84601f718aa36f0f89a6bdf305edbd8d813d37ef089db8fe26faf535b1ab5f99e0b358c431472a349e5a480b0e07de039ce0fea6a3d2635bdbc267575909ca0914a803db239a52728c55d26561e9d2ad564a0e565d56d6ebd37e849b35b8773d8697673a0e8eb30599fdcb15007d0607d6b2352f1c6bd6d29b4b8d161b5908c01302723d4763f857a340b15a6d0c413df9cd58bbd3b4ed66d1adee604746fc08f707b1ac94d276924ceaab83495e126bee678512750b9df751ab331cec8c607e75ea5e12f0c470a41797d0299954086161908b9c8ce7bfb76acfb5f058d17c46256944d66abba2ddf7b7760c3dbad7630dd85f73eb9af2f34c74adec693b2ebfe4542828c7dd5af7ea7471c823876af52793eb4d480dc3e1b3b7f88fa0aa5672f9bd7a56ec4cb0e9b70c08f9940fd6be7e32552a72bd926fee471d54e9fa9cd49982edd0138078cfa56cd9cea6162e46d0a739f4c573daf5d470cb6ccac3cc958263f1033fad6349e278e5d2afe3b770de51313c80f1bbd0547d5675e0a515a175a70e4d5ea5df873b14eb6fd57ce0467fcfb577505c6e04bb12c7a7b579ff008154db78667bb6e1ae66c1cd75305d738cd74e67526aada3d0e1c1d2e68397766c5ed8d9eb360f63a95b47756cc3052419c7b83d41f715e41acf80ee742d4992d2543a7c83f732ca791fec1f7fe62bd7ed65f994d5cd7746b6d57499207ff573a6323aa37623dc1e6af28c562209d4bf3463baf2eebd0d69d7fabd4b7467cc175686df5160d216914608078151dd131dbe17b0a9af6d6e34fd5eeed2effe3e219591fdc83d7f1a8efb6fd878fbc7ad7d57b4bc935b33e9214e0a8371f51b652961f31ae9ece08564b195a5014b6588ebd7a7e55c6da498e335a91dc14180cdb7d334a6ad2b9d787abcf452b9f426bda269fe25f0a1558a332f93bade403956c7635e012dbc96b34904f194911b0ca7b5767e13f1b4fa6bc36d77296b75ce01e95e936d65e10f11dba6a37905ab4ce30c5cf3fe79ae894557578bb33c8a352a656dc2a27283dac7cd30ea2e2401d1558b6060fcbf9d5a8f56995f01964c9da8abdb9e49355e3d3f5182309fd9e1b76005f30753ed9a53a4dce096b5f2198601122ff8d7572a3e0f42d45a834e921b98d1235ef193d3fa9a9a2d41608922b712146c95627a7f8d63b5addda2ee7472b8c92579ff00ebd575be77721c8009f4c55256172a7b1bd75aa88e1d8159dcf4620103eb5466b85b85c4c8181ec45557bf9187911ba4719fbcfb39aade60dc4c6e597d48c66b5514c144ad79662072d192573d3d2a4d26d23bfd4a0b72e8819b2cd213b401eb8a7c93891086ebef567c3e8a75090af5da00fc4d4566e14db47a180a4ab6221096d73d1b4cd226563289acdf030a52e93fc6af4f6d346a1678c88f05b38dc1877e959cf06cb55518185aa569656f34e5af0b1c9fef115e52492e5b1f6951d597bd0925f2ff0082477fa95887b6b68a4786240ca2475395ce480472782700e3201345d2dad9ddc768972d751ed13ee232e85bfe599c0c1c800fb67f3da4d234b92466b54977aa7432b30f6ebd39a93cbd3641e6cd6704922960a9b30a0e7e6240ea49f5f4adaf18c7c8f99580c454c5b4adcdf15ede7d8cd1ad2a0502da72b9fbc369feb5d2e89a8dbdd4a9b96740dc61a16ce7e8335806d2079331429183d91700577fe03b391352590e59139c9f5ae6e6a752a28a8fe27d26229e22861dce7553b74e54bf262f89213a6e94b71fc32a12a194ae7f03c8fc6bc5e19e78ef6416d2baf98fcbe7079ed5dffc5bf15bdcea6ba7452fc90e4b01ebdabcbacae77dc104f4ad3d9f2ca528ec461a49d1842b7c52d4ec0ccb6ebbdaf65966031b223c16ff0078f5fafeb503585c2c66f2765796e6410c10824fcc7bb1cf207f3aab685649831e76f4ad492e4aac7d02a38718f51453ab245e2b014aa495ff00cbf234f4bd16d34a6691d55a77397720658ff4ad09ef6371e5955da3a7b572efab9693a939f7a992e4cb820f359d5a9647661706a2959592ec74d6e1e620962d5d0e9fa7cd2fdc5358be1b6479e357e79e735eb1a55a471a2c8aaa063d2961a97b53cecd716f0ef952380d42c5dd195b8751c66b0ecf7cb26d032d9c11ef5ddf88e0517c4c5819ae3613e4eb57118eaaf9af2f32a4a0db1e16b7b4a5cde46fd9584aab92403e84d41ab6a69a75abbcdbd4004f4eb5bba7e26db9ee715a7a9e896b756ed0380cacb821866bc2a3879d672a91578c5ebad99e5cf1318d4b543e70d6efaff56d7c5b5eb18ad014902ab61b68e4723eb57af248ee23b6d3ade3091161848c600039e7eb563c51e1b92dee5ef20ded7364c229201f79a21d180ef81807e956740b7f2659259e1dd70aab26dc64e18e178ec0e6be965387b28ca9ad174f33cdab271a9253ddfe459f126ab3785ac7c3f042a05bc8d23cc87ab70303f535d258df7da218e5191b941c1ae33c4d736de30d4961b01bdacb2a15b827079080f5cfafb5753a5d95d476b1abdb98f031b7d2bcec6d28468439b49eb7fbee7a596372a72bec9e9fafe875b633920735d3dac9e66952a679420d71f62acb8041ae9ec5996da63d8802bc9c1cfd9d792e8e324fee646360ada1e17f14ed92dbc69e720c7da6dd246f761953fc8571974c3ecadf4aee3e344ab16bfa673c9b56ff00d0cd79a4b746540bd857d7657194f094a4fb7e47a3471718d0e47b8e864da6afc337cc3358a1ca9ab514dd39af4aa53b8b0b8ae5d0da327cabcd6be9faf5cd95b794bb586ece5864d730b71938278ab2b7031c57338347b10c4425bec5e92ee78594b3b82e022a2ae41fca912fee63204b1ab9036e4647cbe95966e2fb71603a1e407c9148fa9dd8e248dbea5735ec248fcc794dafb5c3220011a36ea41e47d6b26f228a604950fd4a903047e3553fb4a67608d90339e95ada74f13a4cb3260943b4b29218f6e9d2876128ea7253218662b9e3b1a0cc73dbf0153ea7198e5192a438dc30738acfcd34cdac4ed2122af68b398aed9bd40fe75964d4f6b2795329cf5a8ab1e68347560ea7b2af19f667aa5adfc7750062c01039aced46f6347c44e3f0ae5e3be654c06a8dee49392d5e6fb396c7d6ac4416a8ee74ed57ec1a0de5db366e2e585bdaf382b8e5dfe832a3ea7daa8daddb2a05078fad7311dd125416242f404f4ad282e06383595583b58edc0d4a7cd293ddff0048ebb4f983382dd0d7a6f85afedadb47ba977a86442fd6bc3d2f1d570b2119ea01a749ad5c416ef1acec15860e0f5ac68a9539dcd730a10af4dae6b193e26d49aff5bbbb82d9df2122b1ed27d9331cf5a8aea6df2b1cf5355e372af9af5a34fdcb1f2b5b176ae9ae875967a808b9ab336a6248f1fcab99497e5a944a715cce958f5238ce6d4d64b8cb75ad5b49b0460d7350cd835b16730e39ae7ad4f43d8c06214f4677ba0dc0494313fad7aa43ae2a69b1aa1c36de735e2da65c84606bad86ff0036e067a572d1aee95d18e678155a49b3a2b9d41679fe76fa935c67db95fc4176c1b80e07e429f7daba59dacb3b9c04524fbd711a7ea8c67695dbe6762c7ea6b1ab196222d93430f1a578f747b969170ae88738c1ae86e2f93188492e7ab9edf4af2bd1b5d215532315d9d95f094039af9b9cab612338c34bfdff0023c3c5e11f3f332cdff87a1d56da42cde5cc0122551f30ae2b5486f9f583042f088e34113318f395072075ea09eb5ea569099ac9a446192082b5c03c882ea62e7ac9935d6a3530f4a9c96d257ee73e1d46aca5ceaf62bd8786ede3bb7bc0374f2b6e76c0193eb81d2ba68230aa030aad6d708e005e957948c64d7998aab39cfde77379369589a1b512b80abf31e98ad1b8b75b3b558f765db96c54365751da866dbb98fddf6aab7b7a0472dcdc48163452cec4f0aa3926b58cb0f4b0aedef559e9fe15fe6ce2973ce7aec8f9e3e31ea26e7c78d02b656d2de38f1ee72c7ff4215c22cbbaae789b55fedbf12ea3a98276dc4ece99feef45fd00acb191debf45c161fd8e1a9d27ba4befea70fd624a6dad8b5ba9cb263bd5656cf069f9addc4e9857bea8b6b354e93fcbd6b3c1c53c3f159b823ae962a489e3ba48d3085c30e492683a8c98c6f3cd67e4e33495d091e05916cddbb1e5dbf3ab36baa5c5ab168642848233ec6b301c5049a61616790bb75e05454514c62e29c3f0a652d00598e5238cd4865cd53ef4f04e2b270573b2962256e565b49b06ae45747a66b2326a4563c7359ce9a677d0c64a0f436c5de075aa77779b8119aa6646c75a8198b1e4d4c28abdcd31398cdc2c2336e279a6d181474aeab58f139db7a93452e3835604bc55114f0c6b39411d74b1125a17d24c1ad2b3b8c1eb586ac7356617607835854a69a3d5c1e2e5092676b6375b4839adc4d516389999c2aaf2493802b8ab39df6673d2b0f52d4aeaee478a49311ab6022f03f1f5af3560bdad4b5ec7d163335a787c3aa928b6dec6bf883c51fda3702de027ecca72cdfdf3fe150d9dde3bd73caa093ec335345232b0da715e9bc2c230e589f294f35ad3acea4fafe1e47a1e97a9f94eb96ef5dee91ac8f97e6af18b4b89300e6ba1d3f50b88c8daf5e0e3b0119a3de8d45888ea8f73b7f1035b40cf1c98caf23b579edc6b61efe650dd5cd73da86bb7f1d9ed4900cf078ac6b5b8919b716e4d71e1b00d41f34ae96cbb134a842137a6acf5bd2751570326ba28ae4301cd7976937328c61aba25d42e11410c2bcbc560d73e82ab87bb3b913803ad7917c54f1ec735bcbe1cd2e657dc717932b7000ff9660ff3fcbd6b9ff1778eb5d6bb974d86e16da0208668410ec3d371248fc315e7fb457b59364518c9626abbf65fab3e7b1b5f95ba7110a9f51f9d2719e69db452851ef5f5c79600ae3af3416a916256ce49ab515844fb725f96c7069586aeb54520f4e0c2adb69d103c33f5f51fe15721d1ade44c99261cf623fc29389bc6ab5b9fffd9', 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "ProductGroupPrintStation"
-- ------------------------------------------

CREATE TABLE "ProductGroupPrintStation"(
	"ProductGroupId" Integer,
	"PrintStationId" Integer,
	CONSTRAINT "ProductGroupPrintStation_ProductGroup_CASCADE_NO ACTION_ProductGroupId_Id_0" FOREIGN KEY ( "ProductGroupId" ) REFERENCES "ProductGroup"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductGroupPrintStation_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "ProductGroupId", "PrintStationId" ) );


-- ------------------------------------------
-- Dump of "ProductPrintStation"
-- ------------------------------------------

CREATE TABLE "ProductPrintStation"(
	"ProductId" Integer,
	"PrintStationId" Integer,
	CONSTRAINT "ProductPrintStation_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductPrintStation_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "ProductId", "PrintStationId" ) );


-- ------------------------------------------
-- Dump of "ProductTax"
-- ------------------------------------------

CREATE TABLE "ProductTax"(
	"ProductId" Integer NOT NULL,
	"TaxId" Integer NOT NULL,
	CONSTRAINT "ProductTax_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductTax_Tax_NO ACTION_NO ACTION_TaxId_Id_0" FOREIGN KEY ( "TaxId" ) REFERENCES "Tax"( "Id" )
,
PRIMARY KEY ( "ProductId", "TaxId" ) );


-- ------------------------------------------
-- Dump of "Promotion"
-- ------------------------------------------

CREATE TABLE "Promotion"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"StartDate" DateTime,
	"StartTime" DateTime,
	"EndDate" DateTime,
	"EndTime" DateTime,
	"DaysOfWeek" Integer NOT NULL,
	"IsEnabled" Integer NOT NULL DEFAULT (1) );


-- ------------------------------------------
-- Dump of "PromotionItem"
-- ------------------------------------------

CREATE TABLE "PromotionItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PromotionId" Integer NOT NULL,
	"Uid" Integer NOT NULL,
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"PriceType" Integer NOT NULL DEFAULT (0),
	"Value" Numeric NOT NULL DEFAULT (0),
	"IsConditional" Integer NOT NULL DEFAULT (1),
	"Quantity" Numeric NOT NULL DEFAULT (0),
	"ConditionType" Integer NOT NULL DEFAULT (0),
	"QuantityLimit" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "PromotionItem_Promotion_CASCADE_NO ACTION_PromotionId_Id_0" FOREIGN KEY ( "PromotionId" ) REFERENCES "Promotion"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "SecurityKey"
-- ------------------------------------------

CREATE TABLE "SecurityKey"(
	"Name" Text PRIMARY KEY,
	"Level" Integer );


BEGIN;

INSERT INTO "SecurityKey" ("Name","Level") VALUES 
( 'Settings', 0 ),
( 'Order.Void', 0 ),
( 'Order.Item.Void', 0 ),
( 'Order.Estimate', 0 ),
( 'Order.Estimate.Clear', 0 ),
( 'Order.Transfer', 0 ),
( 'Payment.Discount', 0 );



COMMIT;

-- ------------------------------------------
-- Dump of "StartingCash"
-- ------------------------------------------

CREATE TABLE "StartingCash"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"UserId" Integer NOT NULL,
	"Amount" Numeric NOT NULL,
	"Description" Text,
	"StartingCashType" Integer NOT NULL DEFAULT (0),
	"ZReportNumber" Integer,
	"DateCreated" DateTime NOT NULL,
	CONSTRAINT "StartingCash_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" )
,
CONSTRAINT "unique_Id" UNIQUE ( "Id" ) );


-- ------------------------------------------
-- Dump of "Stock"
-- ------------------------------------------

CREATE TABLE "Stock"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"Quantity" Numeric NOT NULL,
	CONSTRAINT "Stock_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Stock_Warehouse_CASCADE_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_Stock_ProductId" ON "Stock"( "ProductId" );

BEGIN;

INSERT INTO "Stock" ("Id","ProductId","WarehouseId","Quantity") VALUES 
( 1, 1, 1, -4 );



COMMIT;

-- ------------------------------------------
-- Dump of "StockControl"
-- ------------------------------------------

CREATE TABLE "StockControl"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"CustomerId" Integer,
	"ReorderPoint" Numeric NOT NULL DEFAULT (0),
	"PreferredQuantity" Numeric NOT NULL DEFAULT (0),
	"IsLowStockWarningEnabled" Integer NOT NULL DEFAULT (1),
	"LowStockWarningQuantity" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "FK_StockControl_Product" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "StockControl_Customer_SET NULL_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Set NULL
 );

CREATE UNIQUE INDEX "IX_StockControl_Product" ON "StockControl"( "ProductId" );

BEGIN;

INSERT INTO "StockControl" ("Id","ProductId","CustomerId","ReorderPoint","PreferredQuantity","IsLowStockWarningEnabled","LowStockWarningQuantity") VALUES 
( 1, 1, NULL, 50, 0, 1, 5 );



COMMIT;

-- ------------------------------------------
-- Dump of "Tax"
-- ------------------------------------------

CREATE TABLE "Tax"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Rate" Numeric NOT NULL,
	"Code" Text,
	"IsFixed" Integer NOT NULL DEFAULT 0,
	"IsTaxOnTotal" Integer NOT NULL DEFAULT 0,
	"IsEnabled" Integer NOT NULL DEFAULT 1 );


-- ------------------------------------------
-- Dump of "User"
-- ------------------------------------------

CREATE TABLE "User"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"FirstName" Text,
	"LastName" Text,
	"Username" Text,
	"Password" Text NOT NULL,
	"AccessLevel" Integer NOT NULL DEFAULT (0),
	"IsEnabled" Integer NOT NULL DEFAULT 1,
	"Email" Text );

CREATE UNIQUE INDEX "UX_UserEmail" ON "User"( "Email" );

BEGIN;

INSERT INTO "User" ("Id","FirstName","LastName","Username","Password","AccessLevel","IsEnabled","Email") VALUES 
( 1, 'Darya', 'Ibrahim', NULL, 'EC22D087C9753EE9FB6C0904D2A51D5293485D9EDF0CBD25C81A2E46D144524B', 9, 1, 'daryabsb@gmail.com' );



COMMIT;

-- ------------------------------------------
-- Dump of "Warehouse"
-- ------------------------------------------

CREATE TABLE "Warehouse"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL );


BEGIN;

INSERT INTO "Warehouse" ("Id","Name") VALUES 
( 1, 'Warehouse' );



COMMIT;

-- ------------------------------------------
-- Dump of "ZReport"
-- ------------------------------------------

CREATE TABLE "ZReport"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Number" Integer NOT NULL,
	"FromDocumentId" Integer NOT NULL,
	"ToDocumentId" Integer NOT NULL,
	"DateCreated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')) );


BEGIN;

INSERT INTO "ZReport" ("Id","Number","FromDocumentId","ToDocumentId","DateCreated") VALUES 
( 1, 0, 0, 0, '2022-08-06 10:50:25' );



COMMIT;

CREATE VIEW PaymentsView AS SELECT P.DocumentId, GROUP_CONCAT(PT.Name) AS PaymentTypes FROM Payment P INNER JOIN PaymentType PT ON PT.Id = P.PaymentTypeId GROUP BY P.DocumentId;
CREATE VIEW DocumentItemPriceView AS SELECT 
    DI.Id AS DocumentItemId,
    -- If cart discount exist
    CASE WHEN D.Discount > 0 THEN
        -- Percentage discount on cart
        CASE WHEN D.DiscountType = 0 THEN
            -- Calculate cart percentage discount on previously calculated price with discount
            (DI.PriceAfterDiscount / ROUND(100,2)) * (ROUND(100,2) - D.Discount)
        ELSE 
            -- Cart fixed discount subtracted from price with tax
            DI.PriceAfterDiscount - (((D.Discount * ROUND(DI.Total,2)) / (ROUND(D.Total,2) + D.Discount)) / DI.Quantity)
        END
    ELSE 
        DI.PriceAfterDiscount
    END 
    AS Price
FROM     DocumentItem DI INNER JOIN
         Document D ON D.Id = DI.DocumentId;
