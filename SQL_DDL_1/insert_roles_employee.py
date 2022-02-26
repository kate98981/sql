import random

import psycopg2
# Наполнить таблицу roles_employee 40 строками
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
        employee_id = str(i + 1)
        role_id = str(random.randint(1, 20))
        q_values = "'" + employee_id + "'" + ',' + \
                   "'" + role_id + "'"
        insert_query = 'insert into roles_employee(employee_id, role_id) values(' + q_values + ')'
        cursor.execute(insert_query)
        print(cursor.description)
        con.commit()
    con.close()