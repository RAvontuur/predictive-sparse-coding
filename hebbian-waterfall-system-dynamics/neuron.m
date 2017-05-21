##
## usage: [v, W, X] = neuron (U, W, X)
##
##  U inputs (for each timestep)
##  W synaptic weights
##  X state
##
##  results:
##  v firing rate
##  W new synaptic weights
##  X new state

function [v, W, x] = neuron (U, W, x, perc)

  [Ninputs] = size(U);

  eta = 0.05;
  beta = 0.2;

  v = W' * U;
  if (v > 1.0)
    W = W/v;
    v = 1.0;
  end

  % some threshold, below this threshold, neuron does not fire and does not change itself
  if (v < x)
    v = 0.0;
  else
    W = W + eta * v * U;
    % limit firing rate to a maximum of one
    v = W' * U;
    if (v > 1.0)
      W = W/v;
      v = 1.0;
    end
    x = beta * v + (1-beta) * x;
    if (x > perc)
      x = perc;
    end
  end
end
