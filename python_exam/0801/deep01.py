# -*- coding: utf-8 -*-
"""
Created on Wed Dec 13 15:14:08 2017

@author: student
"""

import tensorflow as tf
import math

from tensorflow.examples.tutorials.mnist import input_data

mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

########################
## input
#######################

x = tf.placeholder(tf.float32, [None, 784])

########################
## hidden 1
#######################

W1 = tf.Variable(tf.truncated_normal(
    [784, 100],
    stddev=1.0 / math.sqrt(float(784))))
# W1 = tf.Variable(tf.zeros([784, 100]))
b1 = tf.Variable(tf.zeros([100]))
y1 = tf.nn.tanh(tf.matmul(x, W1) + b1)

####################
## hidden 2
####################

W2 = tf.Variable(tf.truncated_normal(
    [100, 20],
    stddev=1.0 / math.sqrt(float(100))))
# W2 = tf.Variable(tf.zeros([100, 20]))
b2 = tf.Variable(tf.zeros([20]))
y2 = tf.nn.tanh(tf.matmul(y1, W2) + b2)

##################################
## output layer
##################################
W = tf.Variable(tf.zeros([20, 10]))
b = tf.Variable(tf.zeros([10]))

y = tf.nn.softmax(tf.matmul(y2, W) + b)
y_ = tf.placeholder(tf.float32, [None, 10])

cross_entropy = tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(y), reduction_indices=[1]))
train_step = tf.train.GradientDescentOptimizer(0.1).minimize(cross_entropy)  # 그래디언트 디센트
# train_step = tf.train.AdamOptimizer(0.1).minimize(cross_entropy) 아담
init = tf.global_variables_initializer()

sess = tf.Session()
sess.run(init)

for i in range(20000):
    batch_xs, batch_ys = mnist.train.next_batch(100)
    sess.run(train_step, feed_dict={x: batch_xs, y_: batch_ys})

correct_prediction = tf.equal(tf.argmax(y, 1), tf.argmax(y_, 1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

print(sess.run(accuracy, feed_dict={x: mnist.train.images, y_: mnist.train.labels}))
print(sess.run(accuracy, feed_dict={x: mnist.test.images, y_: mnist.test.labels}))
print(sess.run(tf.argmax(y, 1), feed_dict={x: mnist.test.images, y_: mnist.test.labels}))
