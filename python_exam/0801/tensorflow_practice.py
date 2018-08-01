# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import tensorflow as tf

matrix1 = tf.constant([[3., 3.]])
matrix2 = tf.constant([[2.], [2.]])

product = tf.matmul(matrix1, matrix2)

sess = tf.Session()

result = sess.run(product)
print(result)

sess.close()

# 값이 0인 스칼라로 초기화된 변수를 만듭니다.
# Create a Variable, that will be initialized to the scalar value 0.
state = tf.Variable(0, name="counter")

# 'state'에 1을 더하는 작업(op)을 만듭니다.
# Create an Op to add one to `state`.

one = tf.constant(1)
new_value = tf.add(state, one)
update = tf.assign(state, new_value)

# 그래프를 한 번 작동시킨 후에는 'init' 작업(op)을 실행해서 변수를 초기화해야
# 합니다. 먼저 'init' 작업(op)을 추가해 봅시다.
# Variables must be initialized by running an `init` Op after having
# launched the graph.  We first have to add the `init` Op to the graph.
init_op = tf.global_variables_initializer()

# graph와 작업(op)들을 실행시킵니다.
# Launch the graph and run the ops.
with tf.Session() as sess:
    # 'init' 작업(op)을 실행합니다.
    # Run the 'init' op
    sess.run(init_op)
    # 'state'의 시작값을 출력합니다.
    # Print the initial value of 'state'
    print(sess.run(state))
    # 'state'값을 업데이트하고 출력하는 작업(op)을 실행합니다.
    # Run the op that updates 'state' and print 'state'.
    for _ in range(3):
        sess.run(update)
        print(sess.run(state))

# output:

# 0
# 1
# 2
# 3

W = tf.Variable([.3], dtype=tf.float32)
b = tf.Variable([-.3], dtype=tf.float32)

x = tf.placeholder(tf.float32)

linear_model = W * x + b

y = tf.placeholder(tf.float32)
loss = tf.reduce_sum(tf.square(linear_model - y))

optimizer = tf.train.GradientDescentOptimizer(0.01)

train = optimizer.minimize(loss)

x_train = [1, 2, 3, 4]
y_train = [1, -2, - 3, - 4]

init = tf.global_variables_initializer()
sess = tf.Session()
sess.run(init)

for i in range(1000):
    sess.run(train, {x: x_train, y: y_train})
curr_W, curr_b, curr_loss = sess.run([W, b, loss], {x: x_train, y: y_train})
print("W: %s b: %s loss: %s" % (curr_W, curr_b, curr_loss))
