class Car:
    color = ''  # 인스턴스 변수
    speed = 0  # 인스턴스 변수
    count = 0  # 클래스 변수


def __init__(self):
    self.speed = 0


Car.count += 1
myCar1, myCar2 = None, None
myCar1 = Car()
myCar1.speed = 30
myCar2 = Car()
myCar2.speed = 60

myCar2.count += 1
print('자동차1의 현재 속도는 %dkm, 생산된 자동차는 총 %d대 ' % (myCar1.speed, Car.count))

print('자동차1의 현재 속도는 %dkm, 생산된 자동차는 총 %d대' % (myCar2.speed, Car.count))
