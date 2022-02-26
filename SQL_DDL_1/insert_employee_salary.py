import random

import psycopg2
# Наполнить таблицу employee_salary 40 строками:
# - в 10 строк из 40 вставить несуществующие employee_id
con = psycopg2.connect(
    database="qa_ddl_26_50",
    user="padawan_user_50",
    password="123",
    host="159.69.151.133",
    port="5056"
)

cursor = con.cursor()
if con:
    for i in range(40):
        print('connected == !')
        if i < 30:
            employee_id = str(i + 1)
        if i >= 30:
            employee_id = str(71 + i)
        salary_id = str(random.randint(1, 16))
        q_values = "'" + employee_id + "'" + ',' + \
                   "'" + salary_id + "'"
        insert_query = 'insert into employee_salary(employee_id, salary_id) values(' + q_values + ')'
        cursor.execute(insert_query)
        print(cursor.description)
        con.commit()
    con.close()
