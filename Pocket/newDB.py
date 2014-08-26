import sqlite3;
from datetime import datetime, date;

DB_name = "pocket" #give a DB name

conn = sqlite3.connect(DB_name+'.sqlite') 
c = conn.cursor()
c.execute("drop table if exists journeys")
c.execute("create table journeys(id integer primary key autoincrement, name text, country text, companies text)")
c.execute("insert into journeys values(NULL, ?, ?, ?)", ["graduation party", "Bali", "Bocard, Ian"])
c.execute("SELECT * FROM journeys")
rows = c.fetchall()

for row in rows:
    print row