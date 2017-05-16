##  
## computes changes in V and G of a collection of neurons
## usage: [v, deltaW, x] = neuron (U, W, x0)
##
##  U inputs (for each timestep)
##  W synaptic weights
##  x0 state after previous timestep
##
##  results:
##  v firing rate
##  deltaW change in weights
##  X new state

function [v, deltaW, x] = neuron (U, W, x0)

  [Ninputs] = size(U);

  eta = 0.1;
  alfa = 0.1;
  beta = 0.1;
  perc =  0.9;

  v = W' * U;
  deltaW = eta * (v * U - alfa * v * v * W);

  % some threshold, below this threshold pass input to next neuron
  if (v > (perc * x0))
    x = beta * v + (1-beta) * x0;
  else
    x = x0;
    v = 0;
    deltaW  = zeros(Ninputs);
  end
end
