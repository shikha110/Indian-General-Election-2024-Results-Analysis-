--  Total seats.
select 
distinct count (parliament_constituency) as total_seats
from constituencywise_results;

--  Total number of seats available for election in each state.
select
    s.State as State_Name,
    count(cr.Constituency_ID) as Total_Seats_Available
from 
    constituencywise_results cr
join 
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join 
    states s on sr.State_ID = s.State_ID
group by 
    s.State
order by 
    s.State;


-- Total Seats Won by NDA Allianz
select
    sum(case 
            when party in (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) then (Won)
            else 0 
        end) as NDA_Total_Seats_Won
from 
    partywise_results;


-- Seats Won by NDA Allianz Parties
select
    party as Party_Name,
    won as Seats_Won
from
    partywise_results
where 
    party in (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
order by Seats_Won desc;



--  Total Seats Won by I.N.D.I.A. Allianz

select 
    sum(case 
            when party in (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) then (Won)
            else 0 
        end) as INDIA_Total_Seats_Won
from 
    partywise_results;


--  Seats Won by I.N.D.I.A. Allianz Parties
select 
    party as Party_Name,
    won as Seats_Won
from
    partywise_results
where
    party in (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
				'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
order by Seats_Won desc;



-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

select * from partywise_results; 

alter table partywise_results
add party_alliance VARCHAR(50);

-- I.N.D.I.A Allianz
update partywise_results
set party_alliance = 'I.N.D.I.A'
where party in (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

-- NDA Allianz
update partywise_results
set party_alliance = 'NDA'
where party in (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

-- OTHER
update partywise_results
set party_alliance = 'OTHER'
where party_alliance IS NULL;

	


--  Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
select
    p.party_alliance,
    count(cr.Constituency_ID) as Seats_Won
from
    constituencywise_results cr
join 
    partywise_results p on cr.Party_ID = p.Party_ID
where 
    p.party_alliance in ('NDA', 'I.N.D.I.A', 'OTHER')
group by
    p.party_alliance
order by 
    Seats_Won desc;



--  Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
select 
cr.Winning_Candidate,
p.Party,
p.party_alliance,
cr.Total_Votes, 
cr.Margin,
cr.Constituency_Name, 
s.State
from constituencywise_results cr
join partywise_results p on cr.Party_ID = p.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
where s.State = 'Uttar Pradesh' and cr.Constituency_Name = 'AMETHI';


--  What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select 
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
	cd.Candidate,
    cr.Constituency_Name
from 
    constituencywise_results cr join constituencywise_details cd 
	on cr.Constituency_ID = cd.Constituency_ID
where
    cr.Constituency_Name = 'AMETHI';



--  Which parties won the most seats in s State, and how many seats did each party win?
SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
	JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE 
    s.state = 'Andhra Pradesh'
GROUP BY 
    p.Party
ORDER BY 
    Seats_Won DESC;



--  What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
select
    s.State as State_Name,
    sum(case when p.party_alliance = 'NDA' then 1 else 0 end) as NDA_Seats_Won,
    sum(case when p.party_alliance = 'I.N.D.I.A' then 1 else 0 end) as INDIA_Seats_Won,
	sum(case when p.party_alliance = 'OTHER' then 1 else 0 end) as OTHER_Seats_Won
from
    constituencywise_results cr
join
    partywise_results p on cr.Party_ID = p.Party_ID
join 
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join
    states s on sr.State_ID = s.State_ID
where
    p.party_alliance in ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
group by
    s.State
order by
    s.State;



--  Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

with RankedCandidates as (
    select
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes as Total_Votes,
        row_number() over (partition by cd.Constituency_ID order by cd.EVM_Votes + cd.Postal_Votes desc) as VoteRank
    from 
        constituencywise_details cd
    join
        constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
    join
        statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
    join
        states s on sr.State_ID = s.State_ID
    where 
        s.State = 'Maharashtra'
)

select
    cr.Constituency_Name,
    max(case when rc.VoteRank = 1 then rc.Candidate end) as Winning_Candidate,
    max(case when rc.VoteRank = 2 then rc.Candidate end) as Runnerup_Candidate
from
    RankedCandidates rc
join 
    constituencywise_results cr on rc.Constituency_ID = cr.Constituency_ID
group by 
    cr.Constituency_Name
order by
    cr.Constituency_Name;



-- For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
select
    count(distinct cr.Constituency_ID) as Total_Seats,
    count(distinct cd.Candidate) as Total_Candidates,
    count(distinct p.Party) as Total_Parties,
    sum(cd.EVM_Votes as cd.Postal_Votes) as Total_Votes,
    sum(cd.EVM_Votes) as Total_EVM_Votes,
    sum(cd.Postal_Votes) as Total_Postal_Votes
from 
    constituencywise_results cr
join 
    constituencywise_details cd on cr.Constituency_ID = cd.Constituency_ID
join 
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join 
    states s on sr.State_ID = s.State_ID
join 
    partywise_results p on cr.Party_ID = p.Party_ID
where 
    s.State = 'Maharashtra';


