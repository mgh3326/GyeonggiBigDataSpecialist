import tensorflow as tf
import math

x = tf.placeholder(tf.float32, )

# hidden1
W1 = tf.Variable(tf.truncated_normal([784, 100], stddev=1.0 / math.sqrt(float(784))))  # 좋은 초기값 제공
# W1 = tf.Variable(tf.zeros([784,100]))
b1 = tf.Variable(tf.zeros([100]))
y1 = tf.nn.tanh(tf.matmul(x, W1) + b1)

# hidden2
W2 = tf.Variable(tf.truncated_normal([100, 20], stddev=1.0 / math.sqrt(float(100))))  # 좋은 초기값 제공
# W2 = tf.Variable(tf.zeros([100,20]))
b2 = tf.Variable(tf.zeros([20]))
y2 = tf.nn.tanh(tf.matmul(y1, W2) + b2)

W = tf.Variable(tf.zeros(20, 10))
b = tf.Variable(tf.zeros([10]))

