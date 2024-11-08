Welcome to your new dbt project!

There is now an [Exploration article in Medium](https://fithis2001.medium.com/exploring-the-imdb-dataset-with-dbt-11cd02c025aa)
and a more in depth one [Lateral joins article in Medium](https://fithis2001.medium.com/lateral-joins-in-duckdb-a024f3609405)

### schema-ingestor-article (In Progress)

Demo code for an article. Download to an `imdb_files` folder in the parent of the repository the files of
[IMDB NONCOMMERCIAL DATASET](https://developer.imdb.com/non-commercial-datasets/)

Also install depenencies in a virtual environment from `requirments.txt`. In my case

>  python.exe -m venv venv
>
>  venv\Scripts\activate.bat
>
>  pip3 install -r requirements.txt
>

Because of storage shortage the cleansed (or original) datasets are materialized as views

### Using the starter project

Try running the following commands:

- rm -rf database_files/dev.duckdb
- dbt clean
- dbt deps
- dbt seed
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
