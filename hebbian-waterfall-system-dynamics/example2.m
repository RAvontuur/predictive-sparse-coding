Nsteps = 400;
Ninputs = 2;
Nneurons = 5;

% total duration
duration = 20;

% duration of integration step
deltaT = duration / Nsteps;

% set give input traject (noisy input)
U = zeros(Nsteps, Ninputs);
for(t=1:Nsteps-1)
  T = t * deltaT;
  if (T > 10)
    % repeat
    T  = T - 10;
  end
  if (T < 3.0)
    Ut = [0.7;0.3];
  else if (T< 5.0)
    Ut = [0.1;0.8];
  else if (T<7.5)
    Ut = [0.3;0.3];
  else
    Ut = [0.4;0.6];
  end end end
  Ut = Ut / norm(Ut);
  % add some noise
  n1 = (-0.5 + rand())/10;
  n2 = (-0.5 + rand())/10;
  U(t,1:Ninputs) = Ut' + [n1 n2];
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

subplot(2,1,1)
plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')
subplot(2,1,2)
plot(W(:,1), "r", W(:,2), "b", W(:,3), "g", W(:,4), "p")
ylabel('W')