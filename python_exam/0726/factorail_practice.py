num = input("정수를 입력하시오 : ")
result = 1
for i in range(int(num)):
    result = result * (i + 1)

print(str(num) + "!은" + str(result) + "이다.")
