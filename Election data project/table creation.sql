create table `constituencywise_details`
(
`S.N.` int default null,
`Candidate` text default null,
`Party` text default null,
`EVM Votes` int default null,
`Postal Votes` int default null,
`Total Votes` int default null,
`% of Votes` double,
`Constituency ID` varchar(10) default null
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - India Elections Result Analysis 2024\\constituencywise_details.csv'
INTO TABLE 2024ls_election_results.constituencywise_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

SELECT * FROM 2024ls_election_results.constituencywise_details;

SHOW VARIABLES LIKE 'secure_file_priv';

select @@secure_file_priv;

create table `constituencywise_results`
(
`S.No` int default null,
`Parliament Constituency` varchar(40),
`Constituency Name` text,
`Winning Candidate` text,
`Total Votes` int default null,
`Margin` int default null,
`Constituency ID` varchar(10),
`Party ID` int default null
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - India Elections Result Analysis 2024\\constituencywise_results.csv'
into table 2024ls_election_results.constituencywise_results
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

select * from constituencywise_results;

create table `partywise_results`
(
`Party` text,
`Won` int DEFAULT NULL,
`Party ID` int DEFAULT NULL
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - India Elections Result Analysis 2024\\partywise_results.csv'
into table 2024ls_election_results.partywise_results
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table `states`
(
`State ID` varchar(5) default null,
`State` text
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - India Elections Result Analysis 2024\\states.csv'
into table 2024ls_election_results.states
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table `statewise_results`
(
`Constituency` text,
`Const. No.` int default null,
`Parliament Constituency` varchar(40), 	
`Leading Candidate` varchar(60),
`Trailing Candidate` varchar(50),	
`Margin` int,
`Status` int,
`State ID` varchar(5),	
`State` text
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - India Elections Result Analysis 2024\\statewise_results.csv'
into table 2024ls_election_results.statewise_results
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

ALTER TABLE `2024ls_election_results`.`statewise_results` 
CHANGE COLUMN `Status` `Status` TEXT NULL DEFAULT NULL;

alter table `partywise_results`
add column Alliance text default null;

update partywise_results
set Alliance = "NDA"
where Party in ("Bharatiya Janata Party - BJP",
"Telugu Desam - TDP",
"Janasena Party - JnP",
"Janata Dal  (Secular) - JD(S)",
"Janata Dal  (United) - JD(U)",
"Lok Janshakti Party(Ram Vilas) - LJPRV",
"AJSU Party - AJSUP",
"Apna Dal (Soneylal) - ADAL",
"Asom Gana Parishad - AGP",
"Hindustani Awam Morcha (Secular) - HAMS",
"Shiv Sena - SHS",
"Nationalist Congress Party - NCP",
"Rashtriya Lok Dal - RLD",
"Sikkim Krantikari Morcha - SKM",
"United People’s Party, Liberal - UPPL");

update partywise_results
set Alliance = "I.N.D.I.A"
where Party IN ('Indian National Congress - INC',
'Samajwadi Party - SP',
'All India Trinamool Congress - AITC',
'Dravida Munnetra Kazhagam - DMK',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Communist Party of India  (Marxist) - CPI(M)',
'Rashtriya Janata Dal - RJD',
'Aam Aadmi Party - AAAP',
'Indian Union Muslim League - IUML',
'Jharkhand Mukti Morcha - JMM',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Jammu & Kashmir National Conference - JKN',
'Viduthalai Chiruthaigal Katchi - VCK',
'Bharat Adivasi Party - BHRTADVSIP',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP');

update partywise_results
set Alliance = "OTHERS"
where Alliance IS NULL;

-- Getting rid of Trim Trailing Spaces or Non-Printable Characters(like carriage returns or newlines)

update constituencywise_details
set Constituency_ID = trim(replace(replace(Constituency_ID,'\r',''),'\n',''));

-- or

UPDATE constituencywise_details
SET Constituency_ID = TRIM(REPLACE(REPLACE(Constituency_ID, CHAR(13),''),CHAR(10),''));


/*Notes:
After running the above query, you can verify that the unwanted characters have been removed by checking the data:

SELECT Constituency_ID, LENGTH(Constituency_ID) FROM constituencywise_details;

Always back up your table before running update queries, especially if they modify a large number of rows.
If you’re unsure of the presence of these characters, you can first identify affected rows:

SELECT * 
FROM constituencywise_details
WHERE Constituency_ID LIKE '%\r%' OR Constituency_ID LIKE '%\n%';*/