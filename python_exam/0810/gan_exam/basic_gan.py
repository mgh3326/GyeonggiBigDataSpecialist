# -*- coding: utf-8 -*-
"""
Date 2018.08.09
Basic GAN
"""

# 필요한 라이브러리를 불러들임 
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
import numpy as np
import matplotlib.pyplot as plt

# %matplotlib inline

# 입력 잡음신호의 차원: 100
# 생성자의 구조: 입력층(100개의 입력노드), 첫 번째 은닉층(150개의 은닉노드),
# 두 번째 은닉층(300개의 은닉노드), 출력층(784개의 출력노드) 
# 미니배치 크기: 256
in_dim = 100
h1_dim = 150
h2_dim = 300
batch_size = 256


# ------------------------------------------------
# 생성자 정의: 잡음신호를 입력으로 받아 이미지를 생성
# ------------------------------------------------
def generator(z_noise):
    w1 = tf.Variable(tf.truncated_normal([in_dim, h1_dim], stddev=0.1), name="w1_g",
                     dtype=tf.float32)
    b1 = tf.Variable(tf.zeros([h1_dim]), name="b1_g", dtype=tf.float32)
    h1 = tf.nn.relu(tf.matmul(z_noise, w1) + b1)
    w2 = tf.Variable(tf.truncated_normal([h1_dim, h2_dim], stddev=0.1), name="w2_g",
                     dtype=tf.float32)
    b2 = tf.Variable(tf.zeros([h2_dim]), name="b2_g", dtype=tf.float32)
    h2 = tf.nn.relu(tf.matmul(h1, w2) + b2)
    w3 = tf.Variable(tf.truncated_normal([h2_dim, 28 * 28], stddev=0.1), name="w3_g",
                     dtype=tf.float32)
    b3 = tf.Variable(tf.zeros([28 * 28]), name="b3_g", dtype=tf.float32)
    h3 = tf.matmul(h2, w3) + b3
    out_gen = tf.nn.tanh(h3)

    weights_g = [w1, b1, w2, b2, w3, b3]
    return out_gen, weights_g


# ------------------------------------------------
# 판별자 정의: 입력된 진짜 이미지와 가짜 이미지를 정확하게 분류
# ------------------------------------------------
def discriminator(x, out_gen, keep_prob):
    x_all = tf.concat([x, out_gen], 0)
    w1 = tf.Variable(tf.truncated_normal([28 * 28, h2_dim], stddev=0.1), name="w1_d",
                     dtype=tf.float32)
    b1 = tf.Variable(tf.zeros([h2_dim]), name="b1_d", dtype=tf.float32)
    h1 = tf.nn.dropout(tf.nn.relu(tf.matmul(x_all, w1) + b1), keep_prob)
    w2 = tf.Variable(tf.truncated_normal([h2_dim, h1_dim], stddev=0.1), name="w2_d",
                     dtype=tf.float32)
    b2 = tf.Variable(tf.zeros([h1_dim]), name="b2_d", dtype=tf.float32)
    h2 = tf.nn.dropout(tf.nn.relu(tf.matmul(h1, w2) + b2), keep_prob)
    w3 = tf.Variable(tf.truncated_normal([h1_dim, 1], stddev=0.1), name="w3_d",
                     dtype=tf.float32)
    b3 = tf.Variable(tf.zeros([1]), name="d_b3", dtype=tf.float32)
    h3 = tf.matmul(h2, w3) + b3
    y_data = tf.nn.sigmoid(tf.slice(h3, [0, 0], [batch_size, -1], name=None))
    y_fake = tf.nn.sigmoid(tf.slice(h3, [batch_size, 0], [-1, -1], name=None))
    weights_d = [w1, b1, w2, b2, w3, b3]
    return y_data, y_fake, weights_d


# ------------------------------------------------
# MNIST 데이터를 읽어 들임
# ------------------------------------------------
mnist = input_data.read_data_sets('MNIST_data', one_hot=True)

# ------------------------------------------------
# 텐서플로 연산 및 변수, 비용함수 및 최적화 방법 정의하기 
# ------------------------------------------------
# 플레이스홀더
x = tf.placeholder(tf.float32, [batch_size, 28 * 28], name="x_data")
z_noise = tf.placeholder(tf.float32, [batch_size, in_dim], name="z_prior")

# 드롭아웃 확률
keep_prob = tf.placeholder(tf.float32, name="keep_prob")

# 생성자 출력의 생성 및 가중치 정의
out_gen, weights_g = generator(z_noise)

# 판별자 출력 및 가중치 정의
y_data, y_fake, weights_d = discriminator(x, out_gen, keep_prob)

# 판별자, 생성자를 위한 비용함수 및 최적화
discr_loss = - (tf.log(y_data) + tf.log(1 - y_fake))
gen_loss = - tf.log(y_fake)
optimizer = tf.train.AdamOptimizer(0.0001)
d_trainer = optimizer.minimize(discr_loss, var_list=weights_d)
g_trainer = optimizer.minimize(gen_loss, var_list=weights_g)
init = tf.global_variables_initializer()
saver = tf.train.Saver()

# ------------------------------------------------
# 텐서플로 그래프 생성 및 학습 
# ------------------------------------------------
sess = tf.Session()
sess.run(init)
z_sample = np.random.uniform(-1, 1, size=(batch_size, in_dim)).astype(np.float32)
for i in range(60000):
    batch_x, _ = mnist.train.next_batch(batch_size)
    x_value = 2 * batch_x.astype(np.float32) - 1
    z_value = np.random.uniform(-1, 1, size=(batch_size, in_dim)).astype(np.float32)
    sess.run(d_trainer, feed_dict={x: x_value, z_noise: z_value, keep_prob: 0.7})
    sess.run(g_trainer, feed_dict={x: x_value, z_noise: z_value, keep_prob: 0.7})
    [c1, c2] = sess.run([discr_loss, gen_loss], feed_dict={x: x_value, z_noise: z_value,
                                                           keep_prob: 0.7})
    print('iter:', i, 'cost of discriminator', c1, 'cost of generator', c2)

# ------------------------------------------------
# 한 묶음의 가짜 이미지를 생성
# ------------------------------------------------
out_val_img = sess.run(out_gen, feed_dict={z_noise: z_sample})
saver.save(sess, "./newgan1/gan1", global_step=i)

# ------------------------------------------------
# 생성된 가짜 이미지 그리기
# ------------------------------------------------
imgs = 0.5 * (out_val_img + 1)

for k in range(36):
    plt.subplot(6, 6, k + 1)
    image = np.reshape(imgs[k], (28, 28))
    plt.imshow(image, cmap='gray')

yt1, yf1 = sess.run([y_data, y_fake], feed_dict={x: x_value, z_noise: z_value, keep_prob: 0.7})
