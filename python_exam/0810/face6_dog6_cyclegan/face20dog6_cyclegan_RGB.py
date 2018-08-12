import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
from PIL import Image as Im
tf.reset_default_graph() #reset the graph

# data 불러오기
import glob   
target_dir='./face20/'
files=glob.glob(target_dir+"*.png")
print(len(files))

img=[]        
for file in files:
    a=Im.open(file); 
    a1=np.array(a)
    a1=a1[:,:,0:3]/255. # RGBA to RGB
    img.append(a1)        
    
#len(img)=20
#plt.imshow(img[1])

f,axes =plt.subplots(figsize=(7,7), nrows=2, ncols=3, sharey=True, sharex=True)
for ii in range(6):
    plt.subplot(2,3,ii+1)
    plt.imshow(img[ii])



xr=np.asarray(img)
nr=np.prod(xr.shape[1:4]) # 40*45*3=5400
Xr=np.reshape(xr,[len(img),nr]) 
XA=Xr[0:2,:]
X_trainA=Xr[2:,:]




target_dir='./dog6/'
files=glob.glob(target_dir+"*.png")
print(len(files))

imgB=[]        
for file in files:
    b=Im.open(file); b=b.resize((40,45))
    b1=np.array(b)
    b1=b1[:,:,0:3]/255. # RGBA to RGB
    imgB.append(b1)        
    
#len(img)=20
#plt.imshow(img[1])

f,axes =plt.subplots(figsize=(7,7), nrows=2, ncols=3, sharey=True, sharex=True)
for ii in range(6):
    plt.subplot(2,3,ii+1)
    plt.imshow(imgB[ii])



xrB=np.asarray(imgB)
nrB=np.prod(xrB.shape[1:4])
XrB=np.reshape(xrB,[len(imgB),nrB]) #=[20,5400]
XB=XrB[0:2,:]
X_trainB=XrB[2:,:]
#################################################

# set paramerters
sample_size= X_trainA.shape[0] #8 
X_dim = X_trainA.shape[1] #=1800
learning_rate = 0.001
batch_size = 2
epochs =1000 # no. of epochs
h_dim = 128
alpha=0 # parameter for Leaky ReLu, alpha=0 ~ ReLu

X_A = tf.placeholder(tf.float32, shape=[None, X_dim])
X_B = tf.placeholder(tf.float32, shape=[None, X_dim])


# Discriminator Net
D_A_W1 = tf.get_variable('D_A_W1',shape=[X_dim, h_dim],initializer=tf.contrib.layers.xavier_initializer())
D_A_b1 = tf.Variable(tf.zeros([h_dim]))
D_A_W2 = tf.get_variable('D_A_W2', shape=[h_dim, 1],initializer=tf.contrib.layers.xavier_initializer())
D_A_b2 = tf.Variable(tf.zeros([1]))

D_B_W1 = tf.get_variable('D_B_W1', shape=[X_dim, h_dim],initializer=tf.contrib.layers.xavier_initializer())
D_B_b1 = tf.Variable(tf.zeros(shape=[h_dim]))
D_B_W2 = tf.get_variable('D_B_W2', shape=[h_dim, 1],initializer=tf.contrib.layers.xavier_initializer())
D_B_b2 = tf.Variable(tf.zeros([1]))

#Generator
G_AB_W1 = tf.get_variable('D_AB_W1', shape=[X_dim, h_dim],initializer=tf.contrib.layers.xavier_initializer())
G_AB_b1 = tf.Variable(tf.zeros([h_dim]))
G_AB_W2 = tf.get_variable('D_AB_W2', shape=[h_dim, X_dim],initializer=tf.contrib.layers.xavier_initializer())
G_AB_b2 = tf.Variable(tf.zeros([X_dim]))

G_BA_W1 = tf.get_variable('D_BA_W1', shape=[X_dim, h_dim],initializer=tf.contrib.layers.xavier_initializer())
G_BA_b1 = tf.Variable(tf.zeros([h_dim]))
G_BA_W2 = tf.get_variable('D_BA_W2', shape=[h_dim, X_dim],initializer=tf.contrib.layers.xavier_initializer())
G_BA_b2 = tf.Variable(tf.zeros([X_dim]))
G_L = tf.Variable(tf.ones([1])) # lambda

theta_DA = [D_A_W1, D_A_W2, D_A_b1, D_A_b2]
theta_DB= [ D_B_W1, D_B_W2, D_B_b1, D_B_b2]
theta_G = [G_AB_W1, G_AB_W2, G_AB_b1, G_AB_b2,
           G_BA_W1, G_BA_W2, G_BA_b1, G_BA_b2, G_L]


def D_A(X):
    h1 = tf.nn.relu(tf.matmul(X, D_A_W1) + D_A_b1)
    return tf.nn.sigmoid(tf.matmul(h1, D_A_W2) + D_A_b2)


def D_B(X):
    h1 = tf.nn.relu(tf.matmul(X, D_B_W1) + D_B_b1)
    return tf.nn.sigmoid(tf.matmul(h1, D_B_W2) + D_B_b2)


def G_AB(X):
    h1 = tf.nn.relu(tf.matmul(X, G_AB_W1) + G_AB_b1)
    return tf.nn.sigmoid(tf.matmul(h1, G_AB_W2) + G_AB_b2)


def G_BA(X):
    h1 = tf.nn.relu(tf.matmul(X, G_BA_W1) + G_BA_b1)
    return tf.nn.sigmoid(tf.matmul(h1, G_BA_W2) + G_BA_b2)


# Discriminator A
X_BA = G_BA(X_B)
D_A_real = D_A(X_A)
D_A_fake = D_A(X_BA)

# Discriminator B
X_AB = G_AB(X_A)
D_B_real = D_B(X_B)
D_B_fake = D_B(X_AB)

# Generator AB
X_ABA = G_BA(X_AB)

# Generator BA
X_BAB = G_AB(X_BA)


# Discriminator loss
DA_loss = 0.5 * (tf.reduce_mean((D_A_real - 1)**2)+ 0.5*tf.reduce_mean(D_A_fake**2))
DB_loss = 0.5 * (tf.reduce_mean((D_B_real - 1)**2)+ 0.5*tf.reduce_mean(D_B_fake**2))

#Generator loss
GAB_loss = 0.5 * tf.reduce_mean((D_A_fake - 1)**2)+0.5 * tf.reduce_mean((D_B_fake - 1)**2)
C_loss=tf.reduce_mean(tf.abs(X_A-X_ABA))+tf.reduce_mean(tf.abs(X_B-X_BAB))
G_loss=GAB_loss+G_L*C_loss


# Solvers
DA_solver = tf.train.AdamOptimizer(learning_rate).minimize(DA_loss, var_list=theta_DA)
DB_solver = tf.train.AdamOptimizer(learning_rate).minimize(DB_loss, var_list=theta_DB)
G_solver = tf.train.AdamOptimizer(learning_rate).minimize(G_loss, var_list=theta_G)



sess=tf.Session(); sess.run(tf.global_variables_initializer())


losses = []
for epoch in range(epochs):
    total_batch=int(sample_size/batch_size)
    avg_loss=0
    for ii in range(total_batch):
        if ii!=total_batch:
              XrA=X_trainA[ii*batch_size:(ii+1)*batch_size]
              XrB=X_trainB[ii*batch_size:(ii+1)*batch_size]
        else:
              XrA=X_trainA[(ii+1)*batch_size:]           
              XrB=X_trainB[(ii+1)*batch_size:]         
        DA_loss_curr,_ = sess.run([DA_loss,DA_solver], feed_dict={X_A: XrA, X_B: XrB})
        DB_loss_curr,_ = sess.run([DB_loss,DB_solver], feed_dict={X_A: XrA, X_B: XrB})
        G_loss_curr,_ = sess.run([G_loss,G_solver], feed_dict={X_A: XrA, X_B: XrB})    
        losss=DA_loss_curr+DB_loss_curr+G_loss_curr
        avg_loss+=losss/total_batch
    print('Epoch: %d' %(epoch+1),'DiscriminatorA Loss= %f,DiscriminatorB Loss= %f, Generator Loss= %f, Avg Loss=%f' %(DA_loss_curr, DB_loss_curr,G_loss_curr, avg_loss))   
    losses.append((DA_loss_curr, DB_loss_curr,G_loss_curr,avg_loss))
    if (epoch+1)%50==0:  
        samples_A = sess.run(X_BA, feed_dict={X_B: XB})
        samples_B = sess.run(X_AB, feed_dict={X_A: XA})
#row 1: real data from domain B, row 2 is its domain A translation
#row 3: real data from domain A, row 4 is its domain B translation        
     
        f,axes =plt.subplots(figsize=(7,7), nrows=1, ncols=2, sharey=True, sharex=True)
        f.suptitle(epoch+1)
        f.tight_layout()
        for ii in range(2):
            plt.subplot(1,2,ii+1); #plt.suptitle('data B') 
            gs=XB[ii].reshape(xrB.shape[1:4]); gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
            plt.imshow(gs)
                   
        f,axes =plt.subplots(figsize=(7,7), nrows=1, ncols=2, sharey=True, sharex=True)     
        for ii in range(2):
            plt.subplot(1,2,ii+1);#plt.suptitle('sample A from data B') 
            gs=samples_A[ii].reshape(xr.shape[1:4]); gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
            plt.imshow(gs)   
                
        
        f,axes =plt.subplots(figsize=(7,7), nrows=1, ncols=2, sharey=True, sharex=True)
        for ii in range(2):
            plt.subplot(1,2,ii+1); #plt.suptitle('data A') 
            gs=XA[ii].reshape(xr.shape[1:4]); gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
            plt.imshow(gs)
                        

        f,axes =plt.subplots(figsize=(7,7), nrows=1, ncols=2, sharey=True, sharex=True)      
        for ii in range(2):
            plt.subplot(1,2,ii+1); #plt.suptitle('sample B from data A') 
            gs=samples_B[ii].reshape(xrB.shape[1:4]); gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
            plt.imshow(gs) 
            


fig, ax = plt.subplots(figsize=(7,7))
losses = np.array(losses)
plt.plot(losses.T[0], label='Discriminator')
plt.plot(losses.T[1], label='Generator')
#plt.plot(losses.T[2], label='Avg Loss')
plt.title("Training Losses")
plt.legend()



f,axes =plt.subplots(figsize=(7,7), nrows=2, ncols=4, sharey=True, sharex=True)
f.tight_layout()
for ii in range(4):
    plt.subplot(1,4,ii+1); f.suptitle('data A')
    gs=X_trainA[ii].reshape(xr.shape[1:4]);  gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
    plt.imshow(gs)

    
f,axes =plt.subplots(figsize=(7,7), nrows=2, ncols=4, sharey=True, sharex=True)
for ii in range(4):
    plt.subplot(1,4,ii+1); f.suptitle('data B') 
    gs=X_trainB[ii].reshape(xrB.shape[1:4]);  gs=(gs-np.min(gs))/(np.max(gs)-np.min(gs))
    plt.imshow(gs)
   



