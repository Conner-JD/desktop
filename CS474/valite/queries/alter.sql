ALTER TABLE division ADD PRIMARY KEY (num, name);
ALTER TABLE division ADD FOREIGN KEY (num) REFERENCES school(div_num) DEFERABLE INITIALLY DEFERRED;

ALTER TABLE school ADD PRIMARY KEY (num, name, div_num);
ALTER TABLE school ADD FOREIGN KEY (div_num) REFERENCES division(num);

ALTER TABLE Instruction_Education_Expenditures ADD PRIMARY KEY (div_name, year);
--ALTER TABLE Instruction_Education_Expenditures ADD FOREIGN KEY (div_name) REFERENCES division(num);
--WE WILL ADD FOREIGN KEYS LATER. WE NEED TO EDIT THE div_names to match

ALTER TABLE AAH_Education_Expenditures ADD PRIMARY KEY (div_name, year);
--ALTER TABLE school ADD FOREIGN KEY (div_num) REFERENCES division(num);
--WE WILL ADD FOREIGN KEYS LATER. WE NEED TO EDIT THE div_names to match
ALTER TABLE Transportation_Education_Expenditures PRIMARY KEY (div_name, year);
--ALTER TABLE school ADD FOREIGN KEY (div_num) REFERENCES division(num);
--WE WILL ADD FOREIGN KEYS LATER. WE NEED TO EDIT THE div_names to match
ALTER TABLE OM_Education_Expenditures PRIMARY KEY (div_name, year);
--ALTER TABLE school ADD FOREIGN KEY (div_num) REFERENCES division(num);
--WE WILL ADD FOREIGN KEYS LATER. WE NEED TO EDIT THE div_names to match
ALTER TABLE FSNI_Education_Expenditures PRIMARY KEY (div_name, year);
--ALTER TABLE school ADD FOREIGN KEY (div_num) REFERENCES division(num);
--WE WILL ADD FOREIGN KEYS LATER. WE NEED TO EDIT THE div_names to match
-- for GP2, don't create primary/foreign keys for VLDS data sets

SELECT count(*) AS div_cnt FROM division;
ANALYZE VERBOSE division;

SELECT count(*) AS sch_cnt FROM school;
ANALYZE VERBOSE school;

