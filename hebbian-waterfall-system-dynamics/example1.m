Nsteps = 400;
Ninputs = 2;
Nneurons = 5;

% total duration
duration = 20;

% duration of integration step
deltaT = duration / Nsteps;

% set give input traject (no noise)
U = zeros(Nsteps, Ninputs);
for(t=1:Nsteps-1)
  T = t * deltaT;
  if (T > 10)
    % repeat
    T  = T - 10;
  end
  if (T < 3.0)
    Ut = [0.8;0.1];
  else if (T< 5.0)
    Ut = [0.1;0.8];
  else if (T<7.5)
    Ut = [0.3;0.3];
  else
    Ut = [0.3;0.6];
  end end end
  Ut = Ut / norm(Ut);
  U(t,1:Ninputs) = Ut';
end

% simulate

[V, W, X] = network(U, Nneurons, deltaT);

% output

disp('V firing rates')
V(Nsteps-1,:)
disp('X (vmin)')
X
disp('W weights')
W

plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')
