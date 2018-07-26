# 1. total을 0으로 설정
# 2. answer를 ‘yes’로 설정
# 3. answer가 ‘yes’인 동안에 반복
# 3-1. 숫자를 입력
# 3-2. 숫자를 total에 더함
# 3-3. 계속? Yes/no 묻기
# 4. total의 값을 출력

total = 0
answer = 'yes'

while answer == 'yes':
    num = int(input('숫자를 입력하시오: '))
    total += num
    answer = input('계속?(yes/no): ')
print("합계는:", total)
