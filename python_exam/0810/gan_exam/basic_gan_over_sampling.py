# -*- coding: utf-8 -*-
"""
Date 2018.08.09
over sampling

"""

# 필요한 라이브러리를 불러들임
import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt

# 그래프 재설정
tf.reset_default_graph() 

#----------------------------------------------------------------
# 가짜 데이터를 생성하기 위한 기본 GAN 
#----------------------------------------------------------------
def GAN(Xr,z_size=100,z_n=20,learning_rate=0.001,batch_size=100,epochs=500, 
    d_hidden_size=128,g_hidden_size=128):

    sample_size = Xr.shape[0] 
    input_size = Xr.shape[1]
    keep_prob = tf.placeholder(tf.float32,name='keep_prob')
    
# 판별자 모형 설정: 은닉층 2개 
    X = tf.placeholder(tf.float32,shape=[None,input_size],name='X')
    D_W1 = tf.get_variable('D_W1',shape=[input_size,d_hidden_size], 
    initializer=tf.contrib.layers.xavier_initializer())
    D_b1 = tf.Variable(tf.random_normal([d_hidden_size]),name='D_b1')
    D_W2 = tf.get_variable('D_W2',shape=[d_hidden_size,1], 
    initializer=tf.contrib.layers.xavier_initializer())
    D_b2 = tf.Variable(tf.random_normal([1]),name='D_b2')
    theta_D = [D_W1, D_W2, D_b1, D_b2]

# 생성자 모형 설정: 은닉층 2개  
    Z = tf.placeholder(tf.float32,shape=[None,z_size],name='Z')
    G_W1 = tf.get_variable('G_W1',shape=[z_size,g_hidden_size], 
    initializer=tf.contrib.layers.xavier_initializer())
    G_b1 = tf.Variable(tf.zeros(shape=[g_hidden_size]),name='G_b1')
    G_W2 = tf.get_variable('G_W2',shape=[g_hidden_size,input_size], 
    initializer=tf.contrib.layers.xavier_initializer())
    G_b2 = tf.Variable(tf.zeros(shape=[input_size]),name='G_b2')
    theta_G = [G_W1, G_W2, G_b1, G_b2]

# 생성자 정의
    alpha=0.1    
    def generator(z):
        h1 = tf.matmul(z,G_W1) + G_b1        
        h1 = tf.maximum(alpha*h1,h1) 
        h2 = tf.matmul(h1,G_W2) + G_b2
        out = tf.nn.tanh(h2) 
        return out

# 판별자 정의     
    def discriminator(x):
        h1 = tf.matmul(x,D_W1) + D_b1        
        h1 = tf.maximum(alpha*h1,h1)    
        h1 = tf.nn.dropout(h1,keep_prob)
        h2 = tf.matmul(h1,D_W2) + D_b2
        h2 = tf.nn.dropout(h2,keep_prob)
        prob = tf.nn.sigmoid(h2)
        return prob, h2

    G_z = generator(Z)
    D_real,D_logit_real = discriminator(X)
    D_fake,D_logit_fake = discriminator(G_z)

# 판별자, 생성자의 비용함수 및 최적화 방법 정의하기
    D_loss_real = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(logits=D_logit_real, 
    labels=tf.ones_like(D_logit_real)))
    D_loss_fake = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(logits=D_logit_fake, 
    labels=tf.zeros_like(D_logit_fake)))
    D_loss = D_loss_real + D_loss_fake
    G_loss = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(logits=D_logit_fake, 
    labels=tf.ones_like(D_logit_fake)))

    D_solver = tf.train.AdamOptimizer(learning_rate).minimize(D_loss,var_list=theta_D)
    G_solver = tf.train.AdamOptimizer(learning_rate).minimize(G_loss,var_list=theta_G)

# 텐서플로 그래프 생성 및 학습 
    sess = tf.Session(); sess.run(tf.global_variables_initializer())
    losses = []
    for epoch in range(epochs):
        total_batch=np.max((1,int(sample_size/batch_size)))
        avg_loss=0
        for ii in range(total_batch):
            if ii!=total_batch:
                 batch_images=Xr[ii*batch_size:(ii+1)*batch_size]
            else:
                 batch_images=Xr[(ii+1)*batch_size:]           
            batch_images = batch_images*2 - 1   
            batch_z = np.random.uniform(-1, 1, size=(batch_size,z_size)) 
            D_loss_curr,_ = sess.run([D_loss,D_solver], feed_dict={X: batch_images, 
            Z: batch_z,keep_prob:0.9})
            G_loss_curr,_ = sess.run([G_loss,G_solver], feed_dict={X: batch_images, 
            Z: batch_z,keep_prob:0.9})               
            losss = D_loss_curr+G_loss_curr
            avg_loss += losss/total_batch
            losses.append((D_loss_curr,G_loss_curr,avg_loss))

    sample_z = np.random.uniform(-1,1,size=(z_n,z_size))
    G_z = sess.run(G_z,feed_dict={X:Xr, Z:sample_z})

    return G_z,losses

#----------------------------------------------------------------
# 기본 GAN을 이용한 iris 데이터의 오버샘플링 
#----------------------------------------------------------------
from sklearn import datasets

# iris 데이터 읽기  
iris = datasets.load_iris()
X, y = iris.data, iris.target

# iris 데이터를 Setos와 Versicolor, Virginica 두 그룹으로 분할  
X0 = X[:50]; y0 = y[:50]; y0GAN = np.concatenate((y0,y0),axis=0)
X1 = X[50:]; y1 = y[50:]; 
for i in range(100):
    y1[i] = 1 

# Setosa 입력변수의 min-max 표준화  
dX = np.max(X0,axis=0)-np.min(X0,axis=0)
dX = dX.reshape(1,4)
sdX = (X0-np.min(X0,axis=0))/np.dot(np.ones((50,1)),dX)

# GAN을 이용하여 "z_n=50"개의 가짜 Setosa 데이터 만들기
GANout = GAN(sdX,z_size=10,z_n=50,batch_size=10,epochs=200)
X0gen = GANout[0] 
X0gen_nsd = 0.5*(X0gen+1)*np.dot(np.ones((50,1)),dX)+np.min(X0,axis=0)

# 가짜 데이터를 포함한 100개의 Setosa 데이터 만들기
X0aug = np.concatenate((X0,X0gen_nsd),axis=0)

# 가짜 데이터를 포함한 100개의 Setosa 데이터의 산점도
f,axes = plt.subplots(figsize=(7,7),nrows=1,ncols=2,sharey=True,sharex=True)
f.suptitle("Data Set generated by GAN")
for ii in range(2):
    plt.subplot(1,2,ii+1)
    plt.scatter(X0aug[:,2*ii],X0aug[:,2*ii+1])
    
# 50개의 원래 Setosa 데이터의 산점도
f,axes = plt.subplots(figsize=(7,7),nrows=1,ncols=2,sharey=True,sharex=True)
f.suptitle("Original Data Set")
for ii in range(2):
    plt.subplot(1,2,ii+1)
    plt.scatter(X0[:,2*ii],X0[:,2*ii+1])
    
    
    
#----------------------------------------------------------------
# 오버샘플링 데이터와 원래 데이터의 신경망 분류 결과  
#----------------------------------------------------------------
# 필요한 라이브러리를 불러들임
from sklearn.neural_network import MLPClassifier  
from sklearn.cross_validation import KFold
from sklearn.cross_validation import train_test_split
from sklearn.metrics import accuracy_score, auc, confusion_matrix, roc_auc_score

# 입력 데이터와 출력 데이터를 하나로 합치기
X_GAN = np.concatenate((X0aug,X1),axis=0)
y_GAN = np.concatenate((y0GAN,y1),axis=0)
X_Org = X
y_Org = np.concatenate((y0,y1),axis=0)

# “n_itr=100”번 반복 실험하여 분류 정확도 비교하기  
n_itr = 100
accuracies = np.zeros((n_itr,2))
for ii in range(n_itr):

# 오버샘플링 데이터를 훈련데이터와 검정데이터로 분할하고 분류
# 신경망 학습
    X_train_GAN, X_test_GAN, y_train_GAN, y_test_GAN = 
    train_test_split(X_GAN,y_GAN,test_size=0.3,random_state=ii)
    mlpGAN = MLPClassifier(hidden_layer_sizes=(10))
    mlpGAN.fit(X_train_GAN,y_train_GAN)

# 신경망 예측
    y_test_pred_GAN = mlpGAN.predict(X_test_GAN) 
    accuracy_GAN = accuracy_score(y_test_pred_GAN,y_test_GAN) 
    
# 원래 데이터를 훈련데이터와 검정데이터로 분할하고 분류 
# 신경망 학습
    X_train_Org, X_test_Org, y_train_Org, y_test_Org = 
    train_test_split(X_Org,y_Org,test_size=0.3,random_state=ii)
    mlpOrg = MLPClassifier(hidden_layer_sizes=(10))
    mlpOrg.fit(X_train_Org,y_train_Org)

# 신경망 예측
    y_test_Org = mlpOrg.predict(X_test_Org) 
    accuracy_Org = accuracy_score(y_test_Org,y_test_Org) 
    
    accuracies[ii,:] = (accuracy_GAN,accuracy_Org)
 
print("Accuracy Scores for Oversampling and Original Data: ", accuracies)
np.mean(accuracies,axis=0)       