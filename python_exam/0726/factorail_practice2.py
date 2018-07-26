def fact(n):
    result = 1
    for i in range(int(n)):
        result = result * (i + 1)
    return result


num = input("정수를 입력하시오 : ")

print(str(num) + "!은" + str(fact(num)) + "이다.")
