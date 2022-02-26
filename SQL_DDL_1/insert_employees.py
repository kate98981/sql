import psycopg2
# Наполнить таблицу employee 70 строками
# строка создана с помощью сайта randomus.ru
strName = 'Sarah Waters,Joseph Lee,Sylvia Manning,Richard Walker,Veronica Williams,Richard Brown,Greg Poole,' \
          'Marlene Wright,John Stewart,John Clark,Anthony Lambert,Lawrence Bradley,Stephen White,Steven Campbell,' \
          'Timothy Lane,Mildred Thomas,Linda Chapman,Susan Smith,Joshua Henry,Juan Flores,Robert Ward,Tammy Johnson,' \
          'Kevin Patterson,James Ross,Thelma Smith,Andrew Pearson,Shawn Perkins,Peggy Wise,John Snyder,Anthony Price,' \
          'Jennifer Ellis,Sara Butler,Matthew Taylor,Anna Martinez,Jeffrey Ford,John Oliver,Duane Summers,' \
          'Christine Taylor,John Tucker,David Hamilton,Gregory Nunez,Gregory Morales,Nellie Wright,Gloria Griffin,' \
          'David Graves,Joseph Powell,Michael Tucker,Wade Rogers,Angela Lopez,Melanie Santos,Scott Sullivan,' \
          'Bessie Taylor,Nancy Grant,Kevin Cook,Emma Figueroa,Michael Price,Laura Hughes,Christopher Johnson,' \
          'Carol Smith,Michael Foster,Carl Davis,Marie Gonzalez,Stanley Taylor,Thomas Johnson,Elmer Moore,' \
          'Michael Taylor,Elizabeth Davis,Michele Lewis,Ashley Young,April Harvey '
# разбиваем строку по запятой и получаем массив
arrName = strName.split(",")
arrNameNew = []
# отбираем только Имя!
for i in range(len(arrName)):
    arrNameNew.append(arrName[i].split()[0])
con = psycopg2.connect(
    database="qa_ddl_26_50",
    user="padawan_user_50",
    password="123",
    host="159.69.151.133",
    port="5056"
)
cursor = con.cursor()
if con:
    for i in range(len(arrNameNew)):
        print('connected == !')
        name = "'" + arrNameNew[i] + "'"
        insert_query = 'insert into employees(employee_name) VALUES(' + name + ')'
        cursor.execute(insert_query)
        print(cursor.description)
        con.commit()
    con.close()
