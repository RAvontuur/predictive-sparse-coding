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
function [v, deltaW, x , EPS] = neuron (U, W, x0, deltaT)

  [Ninputs] = size(U);
  EPS = zeros(Ninputs);

  eta = 1;
  alfa = 1;

  v = W' * U;
  deltaW = deltaT * eta * (v * U - alfa * v * v * W);

  % some threshold, below this threshold pass input to next neuron
  if (v > x0)
    x = (9 * x0 + v)/10;
  else
    x = x0;
    v = 0;
    deltaW  = zeros(Ninputs);
    EPS = U;
  end
end