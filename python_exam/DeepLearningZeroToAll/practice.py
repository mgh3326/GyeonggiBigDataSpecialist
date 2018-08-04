import tensorflow as tf


def hello():
    a = tf.constant('hello, tensorflow!')
    print(a)  # Tensor("Const:0", shape=(), dtype=string)

    sess = tf.Session()
    result = sess.run(a)

    # 2.x 버전에서는 문자열로 출력되지만, 3.x 버전에서는 byte 자료형
    # 문자열로 변환하기 위해 decode 함수로 변환
    print(result)  # b'hello, tensorflow!'
    print(type(result))  # <class 'bytes'>
    print(result.decode(encoding='utf-8'))  # hello, tensorflow!
    print(type(result.decode(encoding='utf-8')))  # <class 'str'>

    # 세션 닫기
    sess.close()


def constant():
    a = tf.constant(2)
    b = tf.constant(3)

    # with 구문을 벗어날 때, 종료 코드가 있다면 대신 호출해 줌
    # 예외가 발생한 경우에도 보장
    with tf.Session() as sess:
        result = sess.run(a + b)
        print(type(result))  # <class 'numpy.int32'>
        print(result)  # 5

        # int 자료형과 연산 가능
        print(result + 7)  # 12
        print(type(result + 7))  # <class 'numpy.int64'>


def placeHolder():
    a = tf.placeholder(tf.int16)
    b = tf.placeholder(tf.int16)

    add = tf.add(a, b)
    mul = tf.multiply(a, b)

    with tf.Session() as sess:
        # {a: 2, b: 3}는 딕셔너리
        # key로 'a'와 'b'를 사용하고, value로 2와 3  사용
        # free_dict를 사용하지 않을 경우 None 기본값 적용
        r1 = sess.run(add, feed_dict={a: 2, b: 3})
        r2 = sess.run(mul, feed_dict={a: 2, b: 3})

        print(type(r1))  # <class 'numpy.int16'>
        print(r1, r2)  # 5, 6


# hello()
# constant()
placeHolder()
#
# 출처: http: // pythonkim.tistory.com / 8?category = 573319[파이쿵]
