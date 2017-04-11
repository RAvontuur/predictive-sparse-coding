##  
## computes changes in V and G of a collection of neurons
## usage: [deltaV, deltaG] = neuron (U, V, G, deltaT, Vprev)
##
##  U inputs 
##  V firing rates of the neurons
##  G synaptic weights
## 
##  deltaT timespan of one integration step
##  Vprev  value of V at (t - deltaT)
function [deltaV, deltaG] = neuron (U, V, G, deltaT, Vprev)

  [Ninputs Nneurons] = size(G);

  % time constants
  tau1 = 0.0005;
  tau2 = 10000;

  % Prediction Error for U
  EPS = U - G*V;

  % Sparseness Constraint (scalar)
  gdot = sparse(Vprev, V, deltaT);

  % Recurrent Network Implemetation of Sparse Coding
  deltaV = (deltaT/tau1) * (G' * EPS + gdot);

  % Learning the Synaptic Weights 
  deltaG = (deltaT/tau2) * EPS * V';

end
