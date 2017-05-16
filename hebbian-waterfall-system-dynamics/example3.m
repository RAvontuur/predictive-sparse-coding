Nsteps = 400;
Ninputs = 25;
Nneurons = 5;

% set give input traject (noisy input)
Ut1 = [1 0 0 0 0
      0 1 0 0 0
      0 0 1 0 0
      0 0 0 1 0
      0 0 0 0 1];
Ut2 = [0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0];
Ut3 = [0 0 0 0 1
      0 0 0 1 0
      0 0 1 0 0
      0 1 0 0 0
      1 0 0 0 0];
Ut4 = [0 0 0 0 0
      0 0 0 0 0
      1 1 1 1 1
      0 0 0 0 0
      0 0 0 0 0];

U = [vec(Ut1)'; vec(Ut2)'; vec(Ut3)'; vec(Ut4)'];
[Nchanges, Ninputs] = size(U);


NrepeatsInner = 5;
NrepeatsOuter = 5;
Nsteps = Nchanges * NrepeatsInner * NrepeatsOuter;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter);

% output

disp('V firing rates')
V(Nsteps,:)
disp('X (vmin)')
X
disp('W weights')
W

plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')
