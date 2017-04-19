##  
## computes changes in V and G of a collection of neurons
## usage: [deltaV, deltaY, deltaG] = neuron (U, V, Y, G, deltaT)
##
##  U inputs 
##  v firing rates of the neuron
##  W synaptic weights
## 
##  deltaT timespan of one integration step
##
function [v, deltaW] = neuron (U, W, deltaT)

  [Ninputs] = size(U);

  eta = 1;
  alfa = 1;

  v = W' * U;
  deltaW = deltaT * eta * (v * U - alfa * v * v * W);

end
