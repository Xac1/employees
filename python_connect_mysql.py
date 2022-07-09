import pandas as pd
from mysql.connector import connect

conn = connect(host = 'localhost', port = int(3306), user = 'root', password = 'server_password_here', db = 'employees' )

df = pd.read_sql('SELECT * from employees;', conn)
print(df)

