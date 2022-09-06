ALTER TABLE Payment ADD COLUMN Date DATE;
UPDATE Payment SET Date = (SELECT Date FROM Document WHERE Id = Payment.DocumentId);