# -*- coding: utf-8 -*-
"""
Created on Tue Jun 27 23:54:53 2017

@author: apple01
"""
import tensorflow as tf
x1_data = [73., 93., 89., 96., 73.]
x2_data = [80., 88., 91., 98., 66.]
x3_data = [75., 93., 90., 100., 70.]
y_data = [152., 185., 180., 196., 142.]

x1 = tf.placeholder(tf.float32)
x2 = tf.placeholder(tf.float32)
x3 = tf.placeholder(tf.float32)

Y = tf.placeholder(tf.float32)

w1 = tf.Variable(tf.random_normal([1]), name = 'weight1')
w2 = tf.Variable(tf.random_normal([1]), name = 'weight2')
w3 = tf.Variable(tf.random_normal([1]), name = 'weight3')
b = tf.Variable(tf.random_normal([1]), name = 'bias')

hypothesis = x1 * w1 + x2 * w2 + x3 * w3 + b

cost = tf.reduce_mean(tf.square(hypothesis - Y))

optimizer = tf.train.GradientDescentOptimizer(learning_rate=1e-5)
train = optimizer.minimize(cost)

sess = tf.Session()

sess.run(tf.global_variables_initializer())

for step in range(2001):
    cost_val, hy_val, _ = sess.run([cost, hypothesis, train],
                                   feed_dict={x1:x1_data, x2:x2_data, x3:x3_data, Y:y_data})
    if step % 10 == 0 :
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)
        
        
        
### Version 2
import tensorflow as tf
x_data = [[73., 80., 75.],[93., 88., 93.],
          [89., 91., 90.], [96., 98., 100.], [73., 66., 70.]]
y_data = [[152.], [185.], [180.], [196.], [142.]]

X = tf.placeholder(tf.float32, shape=[None, 3]) 
Y = tf.placeholder(tf.float32, shape=[None, 1])

W = tf.Variable(tf.random_normal([3,1]), name='weight')
b = tf.Variable(tf.random_normal([1]), name = 'bias')

hypothesis = tf.matmul(X, W)+b


cost = tf.reduce_mean(tf.square(hypothesis - Y))

optimizer = tf.train.GradientDescentOptimizer(learning_rate=1e-5)
train = optimizer.minimize(cost)

sess = tf.Session()

sess.run(tf.global_variables_initializer())

for step in range(2001):
    cost_val, hy_val, _ = sess.run([cost, hypothesis, train],
                                   feed_dict={X:x_data, Y:y_data})
    if step % 10 == 0 :
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)
        
### Version 3, load-file
import tensorflow as tf
import numpy as np
tf.set_random_seed(777)

xy = np.loadtxt('data-01-test-score.csv',delimiter=',', dtype=np.float32)
x_data = xy[:, 0:-1]
y_data = xy[:,[-1]]

print(x_data.shape, x_data, len(x_data))
print(y_data.shape, y_data)

X = tf.placeholder(tf.float32, shape=[None, 3]) 
Y = tf.placeholder(tf.float32, shape=[None, 1])

W = tf.Variable(tf.random_normal([3,1]), name='weight')
b = tf.Variable(tf.random_normal([1]), name = 'bias')

hypothesis = tf.matmul(X, W)+b


cost = tf.reduce_mean(tf.square(hypothesis - Y))

optimizer = tf.train.GradientDescentOptimizer(learning_rate=1e-5)
train = optimizer.minimize(cost)

sess = tf.Session()

sess.run(tf.global_variables_initializer())

for step in range(2001):
    cost_val, hy_val, _ = sess.run([cost, hypothesis, train],
                                   feed_dict={X:x_data, Y:y_data})
    if step % 10 == 0 :
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)
 
## Ask my score
print("Your score will be ", sess.run(hypothesis, feed_dict={X:[[100, 70, 101]]}))
print("Other scores will be ", sess.run(hypothesis, feed_dict={X:[[60,70,110],[90, 100, 80]]}))

## exam 
nums = range(5)
print(nums)
print(nums[2:4])
print(nums[2:])
print(nums[:2])
print(nums[:])
print(nums[:-1])
nums[2:4] = [8,9]
print(nums)
