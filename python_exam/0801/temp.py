import tensorflow as tf

x1_data = [73., 93., 89., 96., 73.]
x2_data = [80., 88., 91., 98., 66.]
x3_data = [75., 93., 90., 100., 70.]
y_data = [152., 185., 180., 196., 142.]

x1 = tf.placeholder(tf.float32)
x2 = tf.placeholder(tf.float32)
x3 = tf.placeholder(tf.float32)

Y = tf.placeholder(tf.float32)

w1 = tf.Variable(tf.random_normal([1]), name='weight1')
w2 = tf.Variable(tf.random_normal([1]), name='weight2')
w3 = tf.Variable(tf.random_normal([1]), name='weight3')
b = tf.Variable(tf.random_normal([1]), name='bias')

hypothesis = x1 * w1 + x2 * w2 + x3 * w3 + b

# loss
cost = tf.reduce_mean(tf.square(hypothesis - Y))  # mse사용
# optimizer
optimizer = tf.train.GradientDescentOptimizer(cost)  # gradientdescent 변경가능
train = optimizer.minimize(cost)

sess = tf.Session()
sess.run(tf.global_variables_initializer())
for i in range(2001):
    sess.run(train, {x1: x1_data, x2: x2_data, x3: x3_data, Y: y_data})

print(sess.run([w1, w2, w3, b, cost], {x1: x1_data, x2: x2_data, x3: x3_data, Y: y_data}))

curr_W1, curr_W2, curr_W3, curr_b, curr_loss = sess.run([w1, w2, w3, b, cost],
                                                        {x1: x1_data, x2: x2_data, x3: x3_data, Y: y_data})
print("W1: %s W2: %s W3: %s b: %s loss: %s" % (curr_W1, curr_W2, curr_W3, curr_b, curr_loss))
