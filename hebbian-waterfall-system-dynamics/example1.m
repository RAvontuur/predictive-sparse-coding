Ninputs = 2;
Nneurons = 7;

% set give input traject (noisy input)
Ut1 = [0.7;0.3];
Ut2 = [0.1;0.8];
Ut3 = [0.3;0.3];
Ut4 = [0.4;0.6];

U = 2 * [vec(Ut1)'; vec(Ut2)'; vec(Ut3)'; vec(Ut4)'];

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

plot(V(:,Nneurons), "r", V(:,Nneurons-1), "b", V(:,Nneurons-2), "g", V(:,Nneurons-3), "p")
ylabel('v')