from sqlalchemy import create_engine
from sqlalchemy.sql import text
engine = create_engine('postgresql+psycopg2://root:12345678@localhost/Project_302')
conn = engine.connect()


def query1():
    q = text(
        "SELECT D.diseaseCode, DT.description, DS.firstEncDate "
        "FROM Disease D, DiseaseType DT, Discover DS "
        "WHERE D.diseaseCode = DS.diseaseCode "
        "AND D.id = DT.id "
        "AND D.pathogen = 'bacteria' "
        "AND DS.firstEncDate < '1990-01-01'; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query2():
    q = text(
        "SELECT U.name, U.surname, DR.degree "
        "FROM Users U, Doctor DR, Specialize S, DiseaseType DT "
        "WHERE U.email = DR.email "
        "AND DR.email = S.email "
        "AND U.email = S.email "
        "AND S.id = DT.id "
        "AND DT.description not in ('infectious diseases') "
        "group by U.name, U.surname, DR.degree; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query3():
    q = text(
        "SELECT U.name, U.surname, DR.degree "
        "FROM Users U, Doctor DR, Specialize S, DiseaseType DT "
        "WHERE U.email = DR.email "
        "AND S.email = DR.email "
        "AND U.email = S.email "
        "AND S.id = DT.id "
        "group by U.name, U.surname, DR.degree "
        "having count(*) > 2; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query4():
    q = text(
        "SELECT CN.cname,  avg(U.salary) as avg_salary "
        "FROM Country CN, DiseaseType DT, Specialize S, Users U, Doctor DR "
        "WHERE S.email = DR.email "
        "AND S.id = DT.id "
        "AND DR.email = U.email "
        "AND U.cname = CN.cname "
        "AND S.email = U.email "
        "AND DT.description = 'virology' "
        "group by CN.cname, DT.description; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query5():
    q = text(
        "SELECT PS.department, count(*) as number_workers "
        "FROM PublicServant PS "
        "WHERE PS.department in ( "
        "    SELECT PS.department "
        "    FROM ( "
        "        SELECT R.email, count(*) "
        "        FROM Record R "
        "        WHERE R.diseaseCode = 'Covid-19' "
        "        group by R.email "
        "        having count(*) > 1 "
        "    ) AS NW, PublicServant PS "
        "    WHERE PS.email = NW.email "
        "    ) "
        "group by PS.department; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)

"****** database patladı çok büyük olasılıkla boş dönüyor salary isteyince :S"
def query6():
    q = text(
        "UPDATE Users "
        "SET salary = salary*2 "
        "WHERE email in ( "
        "    SELECT R.email "
        "    FROM Record R "
        "    WHERE R.diseaseCode = 'Covid-19' "
        "    group by R.email "
        "    having count(*) > 3 "
        ") "
    )
    with conn.execution_options(autocommit=True) as conn2:
        conn2.execute(q)



"******"
def query7():
    q = text(
        "DELETE FROM Users "
        "WHERE Surname ILIKE '%alp%'; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)

"*****"
def query8():
    q = text(
        "CREATE INDEX idx_pathogen "
        "ON Disease(pathogen) "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query9():
    q = text(
        "SELECT PS.email, U.name, PS.department "
        "FROM PublicServant PS, Users U "
        "WHERE PS.email = U.email "
        "AND PS.email in ( "
        "    SELECT R.email "
        "    FROM Record R "
        "    WHERE R.totalPatients BETWEEN 100000 AND 999999 "
        "); "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query10():
    q = text(
        "SELECT CN.cname, sum(R.totalPatients) as total_patients "
        "FROM COUNTRY CN, Record R "
        "WHERE R.cname = CN.cname "
        "group by CN.cname "
        "order by total_patients desc "
        "limit 5; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


def query11():
    q = text(
        "SELECT sum(R.totalPatients - R.totalDeaths) as treated_patients, R.diseaseCode "
        "From Record R "
        "group by R.diseaseCode; "
    )
    q_result = conn.execute(q).fetchall()
    for row in q_result:
        print(row)


while True:
    print(" ")
    print("1-Listing the disease code and the descriptions that are caused by bacteria "
          "and were discovered before 1990.")
    print("2-Listing the name, surname and degree of doctors who are not specialized in “infectious diseases.")
    print("3-Listing the name, surname and degree of doctors who are specialized in more than 2 disease types.")
    print("4-For each country list the cname and average salary of doctors who are specialized in “virology”.")
    print("5-List the departments of public servants who report “covid-19” cases in more than one country and "
          "the number of such public servants who work in these departments.")
    print("6-Double the salary of public servants who have recorded covid-19 patients more than 3 times.")
    print("7-Delete the users whose surname contain the substring “alp”. ")
    print("8-Create an index namely “idx pathogen” on the “pathogen” field.")
    print("9-Listing the email, name, and department of public servants who have created records where the number of"
          " patients is between 100000 and 999999.")
    print("10-Listing the top 5 counties with the highest number of total patients recorded.")
    print("11-Group the diseases by disease type and the total number of patients treated.")
    print("12-Break")
    print("Enter a value between 1 to 12")
    inp = int(input())
    if inp == 1:
        query1()
    elif inp == 2:
        query2()
    elif inp == 3:
        query3()
    elif inp == 4:
        query4()
    elif inp == 5:
        query5()
    elif inp == 6:
        query6()
    elif inp == 7:
        query7()
    elif inp == 8:
        query8()
    elif inp == 9:
        query9()
    elif inp == 10:
        query10()
    elif inp == 11:
        query11()
    elif inp == 12:
        break


