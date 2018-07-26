class Car:
    speed = 0

    def upSpeed(self, value):
        self.speed += value
        print('현재속도(슈퍼클래스): %d' % self.speed)


class Sedan(Car):
    def upSpeed(self, value):
        self.speed += value
        if self.speed > 150:
            self.speed = 150
        print('현재속도(슈퍼클래스): %d' % self.speed)


class Truck(Car):
    def upSpeed(self, value):
        self.speed += value
        if self.speed > 80:
            self.speed = 80
        print('현재속도(슈퍼클래스): %d' % self.speed)


sedan1, truck1 = None, None
sedan1 = Sedan()
truck1 = Truck()
print('트럭 --> ', end="")
truck1.upSpeed(200)
print('승용차 --> ', end="")
sedan1.upSpeed(200)
