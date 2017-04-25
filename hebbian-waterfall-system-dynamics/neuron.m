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
function [v, deltaW, x] = neuron (U, W, x0, deltaT)

  [Ninputs] = size(U);

  eta = 1;
  alfa = 1;
  tau = 0.5;

  v = W' * U;
  deltaW = deltaT * eta * (v * U - alfa * v * v * W);

  % some threshold, below this threshold pass input to next neuron
  if (v > x0)
    x = (v + (tau/deltaT) * x0) / (1 + (tau/deltaT));
  else
    x = x0;
    v = 0;
    deltaW  = zeros(Ninputs);
  end
end
