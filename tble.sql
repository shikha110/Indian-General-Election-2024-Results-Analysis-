CREATE TABLE constituencywise_details(
    S_N INT,
    Candidate VARCHAR(100),
    Party VARCHAR(100),
    EVM_Votes INT,
    Postal_Votes INT,
    Total_Votes	INT,
    Perc_of_Votes FLOAT,
    Constituency_ID	VARCHAR(50)
);

select * from constituencywise_details;


CREATE TABLE constituencywise_results(
    S_No INT,
    Parliament_Constituency	VARCHAR(100),
    Constituency_Name VARCHAR(100),
    Winning_Candidate VARCHAR(100),
    Total_Votes	INT,
    Margin	INT,
    Constituency_ID	VARCHAR(100),
	Party_ID INT,
	primary key(Parliament_Constituency,Constituency_ID)    	
);

select * from constituencywise_results;


CREATE TABLE partywise_results(
    Party	VARCHAR(150),
    Won	INT,
    Party_ID INT
);

select * from partywise_results;


CREATE TABLE statewise_results(
    Constituency VARCHAR(100),
    Const_No INT,
    Parliament_Constituency	VARCHAR(100) primary key,
    Leading_Candidate	VARCHAR(100),
    Trailing_Candidate	VARCHAR(100),
    Margin	INT,
    Status	VARCHAR(100),
    State_ID	VARCHAR(100),
    State VARCHAR(100)
);

select * from statewise_results;


CREATE TABLE states(
    State_ID	VARCHAR(100) primary key,
    State	VARCHAR(100)
);

select * from states;


