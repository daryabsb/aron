ALTER TABLE Document ADD COLUMN DueDate DATE;
UPDATE Document SET DueDate = DATE(Date);