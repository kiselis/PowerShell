# Simple example for testing Postgres DB connection from PowerShell command prompt

# Assigning connection string to a variable
$dburl = "postgresql://username:password@localhost:5432/DB_name"

# Assigning SQL query to another variable to test if expected result is returned
$query = "SELECT version();"

# Testing connection
$query | & "C:\Program Files\PostgreSQL\15\bin\psql.exe" $dburl
