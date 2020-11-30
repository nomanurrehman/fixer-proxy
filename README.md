# Setting up

1. Clone this repository.
2. Copy the .env.example file and rename it to .env.development
3. Update the values in the .env.development file(They are pretty self-explanatory)
4. Run `docker-compose up` command at the root of the app.
5. Fixer proxy can be accessed at `http://localhost:2300/api/exchange-rates?start_date=2020-01-01&end_date=2020-01-15&base=EUR&symbols=USD,JPY`
