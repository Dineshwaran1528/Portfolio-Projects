# Election Data Exploration
## About the Data
The dataset consists of five interrelated files:

- constituencywise_details: Detailed information about candidates of different parties and votes secured by them.
- constituencywise_results: Results for candidates in each constituency.
- partywise_results: Performance of each party in terms of seats won.
- states: Details about states participating in elections.
- statewise_results: Aggregated results at the state level.

These files collectively provide detailed insights into election results, covering constituencies, states, political parties, and candidates.

## Skills Used
- Advanced Join Operations: Merging and querying across multiple interrelated tables.
- ETL Processes: Extracting, transforming, and loading real-world data for analysis.
- Advanced SQL Functions: Utilizing window functions, aggregate functions, and complex queries for data manipulation.

## Exploratory Data Analysis
The dataset was analyzed to answer key electoral questions and derive metrics:

##### Total Seats Analysis:
- Total number of seats contested across all states.
- Statewise distribution of seats.

##### Alliance Performance:

- Seats won by NDA, I.N.D.I.A bloc, and OTHER alliances.
- Identified which alliance won the most seats across states.

##### Winning Candidate Analysis:

Extracted winning candidate's name, party name, total votes, and margin of victory for specific states and constituencies.

##### Vote Distribution:

Distribution of EVM votes vs. postal votes for candidates in specific constituencies.

##### State-Level Insights:

- Which parties won the most seats in each state, along with the seat count for each party.
- Total number of seats won by each alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024.

##### Top Performing Candidates:

Identified the top 10 candidates who received the highest number of EVM votes in each constituency.

##### Constituency-Wise Analysis:

Determined the winner and runner-up for each constituency in a specific state for the 2024 elections.

##### State-Specific Analysis (Tamil Nadu):

- Total number of seats, candidates, and parties.
- Aggregated total votes, including a breakdown of EVM and postal votes.

## Conclusion
This analysis provided 

- Statewise and Constituency-Level Results: Highlighted performance at both granular and aggregated levels.
- Party and Alliance Trends: Analyzed party dominance and alliance performance.
- Candidate Insights: Explored individual performance metrics, including votes and margins.
