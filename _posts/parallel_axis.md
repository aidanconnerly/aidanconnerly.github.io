---
title: 'Generalizing the Parallel Axis Theorem'
date: 2024-04-12
permalink: /posts/2024/04/parallel-axis-theorem/
tags:
  - physics
---

This post mainly serves to test of the LaTeX functionality of my website.

# Generalized Parallel Axis Theorem
## The (easier) Parallel Axis Theorem

To derive the parallel axis theorem, let's consider the kinetic energy of a rotating rigid object of mass $M$ about some axis. By definition, the kinetic energy of the object is

$$
T_{sys} = \frac{1}{2} \int dm (\mathbf{\omega} \times \mathbf{r})^2
$$

where $$\mathbf{r}$$ denotes the position of each infinitessimal mass element $$dm$$, and $$\mathbf{\omega}$$ is the object's angular momentum.

Let $$\mathbf{r}_{cm}$$ denote the position of the object's center of mass and $$\mathbf{r}'$$ denote the position of the mass element with respect to the center of mass. In general, I will use the prime to denote with respect to center of mass. Therefore, we can rewrite $$\mathbf{r}$$ as:

$$
\mathbf{r}' = \mathbf{r} - \mathbf{r}_{cm} \implies \mathbf{r} = \mathbf{r}' + \mathbf{r}_{cm}
$$

Substituting our expression for $$\mathbf{r}$$ into $$T_{sys}$$:

$$
\begin{aligned}
 T_{sys} &= \frac{1}{2} \int dm (\mathbf{\omega} \times \mathbf{r})^2 \\ 
 &= \frac{1}{2} \int dm (\mathbf{\omega} \times \mathbf{r}_{cm})^2 + \int dm (\mathbf{\omega} \times \mathbf{r}_{cm}) \cdot (\mathbf{\omega} \times \mathbf{r}') + \frac{1}{2} \int dm (\mathbf{\omega} \times \mathbf{r}')^2\\
 &= \frac{1}{2} (\mathbf{\omega} \times \mathbf{r}_{cm})^2 \int dm + (\mathbf{\omega} \times \mathbf{r}_{cm}) \cdot \int dm  (\mathbf{\omega} \times \mathbf{r}') + T_{sys}' \\
 &= \mathbf{v}_{cm}^2 M + T_{sys}'
 \end{aligned}
$$

Therefore, we're left with the expression

$$
\begin{aligned}
T_{sys} &= \frac{1}{2}M \mathbf{v}_{cm}^2 + T_{sys}' \\
&= \frac{1}{2}M \mathbf{\omega}^2 \mathbf{r}_{cm}^2 + \frac{1}{2}I' \mathbf{\omega}^2
\end{aligned}
$$

