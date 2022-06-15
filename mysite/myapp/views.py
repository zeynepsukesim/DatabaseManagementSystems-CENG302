from django.shortcuts import render
from django.db import connection
from django.http import HttpResponse
from myapp.models import Users

def index(request):
    return render(request, 'myapp/index.html')


def q1(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT d.disease_code, dt.description, ds.first_enc_date "
            "FROM myapp_Disease d, myapp_DiseaseType dt, myapp_Discover ds "
            "WHERE d.disease_code = ds.disease_code_id "
            "AND d.disease_type_id_id = dt.id "
            "AND d.pathogen = 'bacteria' "
            "AND ds.first_enc_date < '1990-01-01'; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q1.html', context)


def q2(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT u.name, u.surname, dr.degree "
            "FROM myapp_Users u, myapp_Doctor dr, myapp_Specialize s, myapp_DiseaseType dt "
            "WHERE u.email = dr.email_id "
            "AND dr.email_id = s.email_id "
            "AND u.email = s.email_id "
            "AND s.disease_type_id_id = dt.id "
            "AND dt.description not in ('infectious diseases') "
            "group by u.name, u.surname, dr.degree; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q2.html', context)


def q3(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT u.name, u.surname, dr.degree "
            "FROM myapp_Users u, myapp_Doctor dr, myapp_Specialize s, myapp_DiseaseType dt "
            "WHERE u.email = dr.email_id "
            "AND s.email_id = dr.email_id "
            "AND u.email = s.email_id "
            "AND s.disease_type_id_id = dt.id "
            "group by u.name, u.surname, dr.degree "
            "having count(*) > 2; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q3.html', context)


def q4(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT cn.cname,  avg(u.salary) as avg_salary "
            "FROM myapp_Country cn, myapp_DiseaseType dt, myapp_Specialize s, myapp_Users u, myapp_Doctor dr "
            "WHERE s.email_id = dr.email_id "
            "AND s.disease_type_id_id = dt.id "
            "AND dr.email_id = u.email "
            "AND u.cname_id = cn.cname "
            "AND s.email_id = u.email "
            "AND dt.description = 'virology' "
            "group by cn.cname, dt.description; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q4.html', context)


def q5(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT ps.department, count(*) as number_workers "
            "FROM myapp_PublicServant ps "
            "WHERE ps.department in ( "
            "    SELECT ps.department "
            "    FROM ( "
            "        SELECT r.email_id, count(*) "
            "        FROM myapp_Record r "
            "        WHERE r.disease_code_id = 'Covid-19' "
            "        group by r.email_id "
            "        having count(*) > 1 "
            "    ) AS nw, myapp_PublicServant ps "
            "    WHERE ps.email_id = nw.email_id "
            "    ) "
            "group by ps.department; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q5.html', context)


def q6(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT r.email_id "
            "FROM myapp_Record r "
            "WHERE r.disease_code_id = 'Covid-19'"
            "group by r.email_id "
        )
        rows = cursor.fetchall()
        cursor.execute(
            "UPDATE myapp_Users  "
            "SET salary = salary*2 "
            "WHERE email in ( "
            "    SELECT r.email_id "
            "    FROM myapp_Record r "
            "    WHERE r.disease_code_id = 'Covid-19' "
            "    group by r.email_id "
            "    having count(*) > 3) "
        )
    context = {'rows': rows, 'data': "users with above emails successfully updated"}
    return render(request, 'myapp/q6.html', context)


def q7(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT u.name, u.surname "
            "FROM myapp_Users U "
            "WHERE u.surname ILIKE '%alp%' "
        )
        rows = cursor.fetchall()
    Users.objects.filter(surname__icontains='alp').delete()
    context = {'rows': rows, 'data': "above users are deleted"}
    return render(request, 'myapp/q7.html', context)


def q8(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "CREATE INDEX IF NOT EXISTS idx_pathogen "
            "ON myapp_Disease(pathogen) "
        )
    context = {'data': "successfully generated"}
    return render(request, 'myapp/q8.html', context)


def q9(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT ps.email_id, u.name, ps.department "
            "FROM myapp_PublicServant ps, myapp_Users u "
            "WHERE ps.email_id = u.email "
            "AND ps.email_id in ( "
            "    SELECT r.email_id "
            "    FROM myapp_Record r "
            "    WHERE r.total_patients BETWEEN 100000 AND 999999 )"
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q9.html', context)


def q10(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT cn.cname, sum(r.total_patients) as total_patients "
            "FROM myapp_Country cn, myapp_Record r "
            "WHERE r.cname_id = cn.cname "
            "group by cn.cname "
            "order by total_patients desc "
            "limit 5; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q10.html', context)


def q11(request):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT sum(r.total_patients - r.total_deaths) as treated_patients, r.disease_code_id "
            "From myapp_Record r "
            "group by r.disease_code_id; "
        )
        rows = cursor.fetchall()
    context = {'data': rows}
    return render(request, 'myapp/q11.html', context)