# -*- coding: utf-8 -*-
"""
Created on Wed Dec 13 10:06:04 2017

@author: student
"""

import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))

matrix1 = tf.constant([[3., 3.]])

# 2x1 행렬을 만드는 constant op을 만들어봅시다.
# Create another Constant that produces a 2x1 matrix.
matrix2 = tf.constant([[2.],[2.]])

# 'matrix1'과 'matrix2를 입력값으로 하는 Matmul op(역자 주: 행렬곱 op)을
# 만들어 봅시다.
# 이 op의 결과값인 'product'는 행렬곱의 결과를 의미합니다.
# Create a Matmul op that takes 'matrix1' and 'matrix2' as inputs.
# The returned value, 'product', represents the result of the matrix
# multiplication.
product = tf.matmul(matrix1, matrix2)
sess = tf.Session()
print(sess.run(product))

###########################
import tensorflow as tf

W = tf.Variable([.3], dtype=tf.float32)
b = tf.Variable([-.3], dtype=tf.float32)
# Model input and output
x = tf.placeholder(tf.float32)
linear_model = W*x + b
y = tf.placeholder(tf.float32)
# loss
loss = tf.reduce_sum(tf.square(linear_model - y)) # sum of the squares
# optimizer
optimizer = tf.train.GradientDescentOptimizer(0.01)
train = optimizer.minimize(loss)
# training data
x_train = [1, 2, 3, 4]
y_train = [0, -1, -2, -3]
# training loop
init = tf.global_variables_initializer()
sess = tf.Session()
sess.run(init) # reset values to wrong
for i in range(1000):
  sess.run(train, {x: x_train, y: y_train})
# evaluate training accuracy

sess.run([W, b, loss], {x:x_train, y:y_train})
curr_W, curr_b, curr_loss = sess.run([W, b, loss], {x: x_train, y: y_train})
print("W: %s b: %s loss: %s"%(curr_W, curr_b, curr_loss))

