-- INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024

-- Total Seats

select count(Parliament_Constituency) as Total_seats
from constituencywise_results;

-- What is the total number of seats available for elections in each state

select s.state as State_name, count(cr.Parliament_Constituency) as No_of_seats
from constituencywise_results as cr
join statewise_results as sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states s on s.State_ID=sr.State_ID
group by s.State
order by s.State;


-- Total Seats Won by NDA Allianz (update the partywise_results table for this query)

select sum(Won) as Total_Seats_won_by_NDA_Alliance
from  partywise_results
where Alliance = "NDA";

 -- OR

SELECT 
    SUM(CASE
        WHEN
            Party IN ('Bharatiya Janata Party - BJP' , 'Telugu Desam - TDP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Janata Dal  (United) - JD(U)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'AJSU Party - AJSUP',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Shiv Sena - SHS',
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM',
                'United People’s Party, Liberal - UPPL')
        THEN
            Won
        ELSE 0
    END) AS Total_Seats_won_by_NDA_Alliance
FROM
    partywise_results;
 
-- Seats Won by NDA Allianz Parties

select Party, Won as Seats_won_By_NDA_Alliance
from partywise_results
where Alliance = "NDA"
order by 2 desc;

-- OR

SELECT Party as Party_name, Won as Seats_won_By_NDA_Alliance
FROM partywise_results
where Party in (
                'Bharatiya Janata Party - BJP' , 'Telugu Desam - TDP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Janata Dal  (United) - JD(U)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'AJSU Party - AJSUP',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Shiv Sena - SHS',
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM',
                'United People’s Party, Liberal - UPPL')
                order by 2 desc;

-- Total Seats Won by I.N.D.I.A. Allianz

select sum(Won) as Total_seats_Won_By_INDIA_Alliance
from partywise_results
where Alliance="I.N.D.I.A";

-- OR

SELECT 
    SUM(CASE
        WHEN
            Party IN ('Indian National Congress - INC' , 'Samajwadi Party - SP',
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
                'Revolutionary Socialist Party - RSP')
        THEN
            Won
        ELSE 0
    END) AS Total_seats_Won_By_INDIA_Alliance
FROM
    partywise_results;

-- Seats Won by I.N.D.I.A. Allianz Parties

select Party, Won as Seats_won_by_INDIA_alliance
from partywise_results
where Alliance = "I.N.D.I.A"
order by 2 desc;

-- OR

select Party, Won as Seats_won_by_INDIA_alliance
from partywise_results
where Party IN ('Indian National Congress - INC' , 'Samajwadi Party - SP',
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
                'Revolutionary Socialist Party - RSP')
order by 2 desc; 

-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

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


-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

select Alliance, sum(Won) as Seats_won
from partywise_results
group by Alliance
order by 2 desc;

-- OR

select pr.Alliance, count(cr.Parliament_Constituency) as Seats_won
from constituencywise_results cr
join partywise_results pr
on cr.Party_ID=pr.Party_ID
group by 1
order by 2 desc;

-- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
/*(Had a problem with this query the state column data had a trailing space in each value. 
So got rid of it using trim function, updated the column again and proceeded further with the query*/

select cr.Winning_Candidate, pr.Party, cr.Total_Votes, cr.Constituency_Name, cr.Margin, s.State
from constituencywise_results cr
join partywise_results pr on cr.Party_ID=pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states s on sr.State_ID=s.State_ID
where s.State='Tamil Nadu' and cr.Constituency_Name = 'ARANI';


-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select cd.Candidate , cd.Party, cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes, cr.Constituency_Name
from constituencywise_details cd
join constituencywise_results cr
on cd.Constituency_ID = cr.Constituency_ID
where cr.Constituency_Name = 'ARANI'
order by 5 desc;

-- Which parties won the most seats in a specific State, and how many seats did each party win?

select pr.Party, count(cr.Parliament_Constituency) Seats_won
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on s.State_ID=sr.State_ID
where s.State='Uttar Pradesh'
group by 1
order by 2 desc;

-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select s.State, 
sum(case when pr.Alliance = "NDA" then 1 else 0 end) as NDA_seats_won,
sum(case when pr.Alliance = "I.N.D.I.A" then 1 else 0 end) as INDIA_seats_won,
sum(case when pr.Alliance = "OTHERS" then 1 else 0 end) as OTHERS_seats_won
from constituencywise_results cr
join partywise_results pr on cr.Party_ID = pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
group by 1
order by 1;

-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?

SELECT 
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr 
    ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC
LIMIT 10;

-- OR

WITH MaxVotes AS (
    SELECT 
        Constituency_ID, 
        MAX(EVM_Votes) AS Max_EVM_Votes
    FROM 
        constituencywise_details
    GROUP BY 
        Constituency_ID
)
SELECT 
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr 
    ON cd.Constituency_ID = cr.Constituency_ID
JOIN 
    MaxVotes mv ON cd.Constituency_ID = mv.Constituency_ID AND cd.EVM_Votes = mv.Max_EVM_Votes
ORDER BY 
    cd.EVM_Votes DESC
LIMIT 10;

-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

with Candidate_rank as (
		select  cd.Constituency_ID,
				cd.Candidate,
				cd.Party,
                cd.Total_Votes,
                row_number() over (partition by cd.Constituency_ID order by cd.Total_Votes desc) as Voter_Rank
		from constituencywise_details cd
        join constituencywise_results cr on cd.Constituency_ID=cr.Constituency_ID
        join partywise_results pr on cr.Party_ID=pr.Party_ID
        join statewise_results sr on cr.Parliament_Constituency=sr.Parliament_Constituency
        join states s on sr.State_ID=s.State_ID
where s.State = 'Tamil Nadu')

select cr.Constituency_Name,
max(case when rc.Voter_Rank = 1 then rc.Candidate end) as Winning_Candidate,
max(case when rc.Voter_Rank = 2 then rc.Candidate end) as Runnerup_Candidate
from constituencywise_results cr
join Candidate_rank rc on cr.Constituency_ID=rc.Constituency_ID
group by 1;

/* For the state of Maharashtra, what are the total number of seats, 
total number of candidates, 
total number of parties, 
total votes (including EVM and postal), and 
the breakdown of EVM and postal votes?*/

select s.State,
		count(distinct cr.Constituency_ID) as Total_number_of_seats,
		count(distinct cd.Candidate) as Total_number_of_Candidates,
        count(distinct cr.Party_ID)  as Total_number_of_parties,
        sum(cd.EVM_Votes) as Total_EVM_votes,
        sum(cd.Postal_Votes) as Total_Postal_Votes,
        sum(cd.Total_votes) as Total_Votes
from constituencywise_results cr 
join constituencywise_details cd on cr.Constituency_ID=cd.Constituency_ID
join partywise_results pr on cr.Party_ID=pr.Party_ID
join statewise_results sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states s on sr.State_ID=s.State_ID
where s.State='Tamil Nadu';
