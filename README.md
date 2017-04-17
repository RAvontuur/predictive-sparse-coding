# predictive-sparse-coding
Coursera Course Computational Neuroscience,  lecture 7.3 Sparse Coding and Predictive Coding

How to use:
```
 >octave
 >cd <dir> 
 >cd regression-analysis
 >network
 >
 >cd ..
 >cd system-dynamics
 >network
```

## Regression analysis model type

Number of differential equations: ( N * S + N * M)
where: N = number of neurons, M = number of inputs, S = number of samples

The results clearly show convergence to sparseness.

Issues:
+ The implemented sparseness constraint is different from that in the lecture.
+ It is not a system dynamics model, it does not model the physics of neurons in a network 

Typical results:

![alt text](https://github.com/RAvontuur/predictive-sparse-coding/blob/master/system-dynamics/result-plot.jpg "Result plot of a simulation run")


## System dynamics model type

Number of differential equations: ( N + N * M)
where: N = number of neurons, M = number of inputs

Issues:
+ It is not clear what this algorithm is doing
+ The learning capability of this algorithm is not clear
+ The effect of the sparseness constraint is not clear
+ The neurons are modelled as one single system with multiple outputs, the neurons seem to share each others hidden state 


Typical results:

![alt text](https://github.com/RAvontuur/predictive-sparse-coding/blob/master/system-dynamics/result-plot.jpg "Result plot of a simulation run")
