---
title: 'A Quick Look at Neural Ordinary Differential Equations'
date: 2024-07-12
permalink: /blog/2024/07/looking-at-neural-odes/
tags:
  - machine-learning
---

*Exploring the basic ideas behind Neural ODEs*

We can describe many natural processes via differential equations: the motion of objects, population dynamics, and options prices. As a physics student, I've had my fair share of playing with differential equations in math models. The goal of creating models is to approximate nature, allowing us to make predictions and extract insights from (often complex) underlying processes. This goal closely aligns with the broader aim of machine learning: to develop algorithms that can learn patterns and make predictions from data.

 In (supervised) machine learning, we're given a data set $$\mathcal{D}$$ with $$n$$ data points:

$$\mathcal{D} = \{ (x_1, y_1), (x_2, y_2), \ldots, (x_n, y_n)\}$$

Goal: given an *unseen* data point $$x'$$, how do we build a model to predict the corresponding $$y'$$ ?

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/model_examples.png" alt="Possible Models" style="display: block; margin: auto;" />
    <figcaption>Which model do you think would make the best predictions on unseen data?</figcaption>
</figure>

The usual approach is to approximate nature's data-generating function $$f$$ with a machine learning model (say, a neural network) $$\widehat{f}$$. Assuming we're sophisticated enough to create a good approximation, then we expect for some unseen data point $$x'$$, 

$$f(x') \approx \widehat{f}(x')$$

To make good predictions requires building a sufficiently complex model and employing effective training methods such that generalize well to new data, accurately capturing patterns present in the data set.

## Training Neural Networks
Let's recall what the typical training loop of a neural network looks like:

**Forward pass**: make predictions with the neural network

Remember, neural networks are functions. That is, a neural network simply takes in a number/vector and spits out a number/vector as a prediction.

**Compute loss**: calculate neural network error

Loss quantifies the error between model predictions and true/expected outputs. We have numerous ways of calculating loss such as mean squared error (MSE) and mean absolute error (MAE):

$$\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2$$

$$\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} |y_i - \hat{y}_i|$$

where  $$y_i$$ is the "true value", $$\hat{y}_i$$ is the model's predicted value, and $$n$$ is the number of data points. The choice of loss function depends on the given problem (what types of errors should be penalized the most, and by how much?). Regardless of loss function, we want to adjust neural network parameters to minimize loss.

**Backward pass**: calculate gradients with respect to the loss

Machine learning now becomes an *optimization* problem: how do we tune our model's parameters to obtain the smallest loss?

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/grad-visualization.png" alt="Possible Models" style="display: block; margin: auto;" />
    <figcaption>Decreasing loss improves model accuracy</figcaption>
</figure>

Recall that the *gradient* of a function tells us the direction of steepest increase. In the context of optimization, we're interested in the steepest decrease, which happens to be the opposite direction. We can take the derivative (gradient) of the loss function with respect to the model parameters to decrease our loss

**Optimizer step**: update model parameters

After obtaining the gradient, we can move in the direction that best decreases our loss. The *optimizer* calculates how much and in which direction to adjust model parameters.

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/grad-desc.gif" alt="Animation of Gradient Descent" style="display: block; margin: auto;" />
    <figcaption>Minimizing loss with gradient descent</figcaption>
</figure>

## The Big Picture of NeuralODEs

Neural Ordinary Differential Equations (NeuralODEs) instead approximate something slightly different: rather than directly predicting outputs from inputs, they model the *derivative* of the data-generating function. 

Suppose we have a set of $$n$$ observations
$$\{ (t_0, \mathbf{z_0}), (t_1, \mathbf{z_1}) \ldots, (t_n, \mathbf{z_n})\}$$ governed by the system of ordinary differential equations:

$$\frac{d\mathbf{z}}{dt} = f(\mathbf{z}(t), t)$$ 

The core idea behind NeuralODEs is to replace $$f$$ with a neural network $$NN$$ using our observations as training data: 

$$\frac{d\mathbf{z}}{dt} = NN(\mathbf{z}(t), t)$$ 

ODEs are extensively studied because they frequently appear in many fields, so we have developed numerous methods to approximate their solutions.  We'll soon see how modeling derivatives of functions can yield better performance than other machine learning models.

## Connecting ResNets to Euler's Method

To understand the motivation behind NeuralODEs, we have to revisit Euler's method.

Recall that we can approximate the derivative (gradient) of some function $$z(t)$$ with

$$\frac{dz}{dt} \approx \frac{z(t+\Delta t) - z(t)}{\Delta t}$$

for some small value $$\Delta t$$, which we will call the **step-size**. A simple rearrangement yields:

$$z(t + \Delta t) \approx z(x) + \Delta t \frac{dz}{dt}$$

We use the expression above to approximate points of $$z(t)$$, denoted as $$z_i$$, assuming we have some starting point $$z_0$$ with the following recursive formula:

$$z_{n+1} = z_n + \Delta t \frac{dz}{dt}, \quad n = 0, 1, 2, \ldots$$

The gradient $$\frac{dz}{dt}$$ tells us in which direction to move, and $$\Delta t$$ tells us by how much (smaller $$\Delta t$$ gives better approximations at the cost of more computation since we take many more small steps to reach the same end point).

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/euler_method_animation.gif" alt="Animation of Euler's Method" style="display: block; margin: auto;" />
    <figcaption>Approximating a sine curve with Euler's method</figcaption>
</figure>

How does this relate to machine learning? Well, let's take another look at neural networks:

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/neuralnet-photo.png" alt="Neural Network" style="display: block; margin: auto;" />
    <figcaption>
    Example of a neural network with 4 hidden layers<br>
    <a href="https://alexlenail.me/NN-SVG/" target="_blank" style="color: #0066cc; text-decoration: none;">Source</a>
</figcaption>
</figure>

A neural network with hidden layers transforms inputs into *hidden states* as data passes through the network. Each hidden layer of the neural network is a function itself (a neural network is a *composition* of many functions). 

Let $$f$$ be the function that maps a hidden state $$h_i$$ to the subsequent hidden state $$h_{i+1}$$. As inputs, $$f$$ takes in outputs from the previous hidden layer $$h_t$$ and parameters (i.e weights and biases) $$\theta_t$$. We can write a recursive formula for how inputs propogate through the neural network:

$$h_{t+1} = f(h_t, \theta_t)$$

Now, consider a common neural network architecture called Residual Neural Networks (ResNets). ResNets introduce shortcut connections that allow information to bypass intermediate layers, meaning the output of a hidden layer can include contributions from multiple preceding layers. Part of the reason ResNets were developed was improve gradient stability during training. In the case where a layer takes in outputs from the previous two layers, we modify the above formula slightly:

$$h_{t+1} = h_t + f(h_t, \theta_t)$$

Hmm... this looks an awful lot like a recursive formula from Euler's method. What happens in the limit of more layers and smaller steps (the step size above is $$1$$)?

$$\frac{h_{t+1} - h_t}{1} = f(h_t, \theta_t) \to \frac{dh(t)}{dt} = f(h(t), t, \theta)$$

What does this mean? We can interpret a ResNet as an Euler's method approximation to a differential equation! Euler's method is one of the simplest ways to solve a differential equation. Can we come up with better architecture than ResNets in the same way that there are better numerical methods than Euler's? Let's rewrite the differential equation in terms of an integral equation (using $$t'$$ as a dummy variable of integration):

$$h_{t+1} = h_t + \int_{t}^{t+1} f(h(t'), t', \theta) dt'$$

Remember, the above equation is an *exact* solution to the hidden states differential equation. We approximate $$h_{t+1}$$ using a numerical integration scheme of our choice.

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/ode-vs-resnet.png" alt="Neural Network" style="display: block; margin: auto;" />
    <figcaption>
    Residual Network vs ODE Network from the
    <a href="https://arxiv.org/pdf/1806.07366" target="_blank" style="color: #0066cc; text-decoration: none;">original paper</a>
</figcaption>
</figure>

The key takeaway is to understand that NeuralODEs consist of 2 main components: 

1. The neural network as the underlying differential equation $$\frac{dz}{dt} = NN(z(t), t)$$
2. The numerical ODE solver, which acts as a continuous-depth, improved version of the ResNet architecture.

## Training NeuralODEs

But how does one train a NeuralODE?

*work in progress*

## Pros and Cons of NeuralODEs
Why would we want to do this in the first place? Well, there are a few advantages: 

* Efficiency: In some cases, NeuralODEs use less memory and fewer parameters to achieve similar results to architectures such as ResNet.

* Choose our tradeoffs: As we'll see later, utilizing NeuralODEs depends on our ODE solver which grants us more flexibility to trade-off between speed and precision

* Irregular time series: Fitting time series models especially with irregularly sampled data is difficult. By design, NeuralODEs can handle this much better.
