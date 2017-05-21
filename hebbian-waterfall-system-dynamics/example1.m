Ninputs = 2;
Nneurons = 7;
% thresholds
vmin = 0.1;
percMin = 0.90;
percMax = 0.98;

% set give input traject (noisy input)
Ut1 = [0.7;0.3];
Ut2 = [0.1;0.8];
Ut3 = [0.3;0.3];
Ut4 = [0.4;0.6];

U = 2 * [vec(Ut1)'; vec(Ut2)'; vec(Ut3)'; vec(Ut4)'];

for (t=1:4)
  % add some noise
  n1 = (-0.5 + rand())/10;
  n2 = (-0.5 + rand())/10;
  U(t,1:Ninputs) = U(t,1:Ninputs) + [n1 n2];
end

[Nchanges, Ninputs] = size(U);


NrepeatsInner = 2;
NrepeatsOuter = 10;
Nsteps = Nchanges * NrepeatsInner * NrepeatsOuter;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMin, percMax);

% output

disp('V firing rates')
V(Nsteps: -NrepeatsInner: 1 + Nchanges * NrepeatsInner * (NrepeatsOuter - 1), :)

disp('V firing rates')
V(Nchanges * NrepeatsInner * (NrepeatsOuter - 1): -NrepeatsInner: 1 + Nchanges * NrepeatsInner * (NrepeatsOuter - 2), :)

disp('V firing rates')
V(Nchanges * NrepeatsInner: -NrepeatsInner: 1, :)

disp('X (vmin)')
X

plot(V(:,Nneurons), "r", V(:,Nneurons-1), "b", V(:,Nneurons-2), "g", V(:,Nneurons-3), "p")
ylabel('v')