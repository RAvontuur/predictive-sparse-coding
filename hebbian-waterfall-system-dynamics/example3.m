Nsteps = 400;
Ninputs = 25;
Nneurons = 5;

deltaT = 0.05;

% set give input traject (noisy input)
U = zeros(Nsteps, Ninputs);
for(t=1:Nsteps-1)
  T = t * deltaT;
  if (T > 10)
    % repeat
    T  = T - 10;
  end
  if (T < 3.0)
Ut = [1 0 0 0 0
      0 1 0 0 0
      0 0 1 0 0
      0 0 0 1 0
      0 0 0 0 1];
  else if (T< 5.0)
Ut = [0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0];
  else if (T<7.5)
Ut = [0 0 0 0 1
      0 0 0 1 0
      0 0 1 0 0
      0 1 0 0 0
      1 0 0 0 0];
  else
Ut = [0 0 0 0 0
      0 0 0 0 0
      1 1 1 1 1
      0 0 0 0 0
      0 0 0 0 0];
  end end end
  U(t,1:Ninputs) = vec(Ut)';
end

% simulate

[U, V, W, X] = network(U, Nneurons, deltaT);

% output

disp('V firing rates')
V(Nsteps-1,:)
disp('X (vmin)')
X(Nsteps-1,:)
disp('W weights')
reshape(W(Nsteps,:), Ninputs, Nneurons)

plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')
