
def aa():
    a = "insert into system_account values('"
    b = "', '0', '2019-05-25', '2022-05-25');"

    for i in range(203):
        print(a + str(i) + b)

def bb():
    #coding:utf-8
    a = "insert into user_account values('"
    b = "', '"
    c = "', '1', 'なぶ太郎"
    d = "');"

    for i in range(203):
        print(a + str(i) + b + str(i) + c + str(i) + d)
