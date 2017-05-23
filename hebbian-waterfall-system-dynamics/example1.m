Ninputs = 2;
Nneurons = 15;
% thresholds
vmin = 0.1;
percMin = 0.50;
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

C = [1;2;3;4];

[nSamples, Ninputs] = size(U);


NrepeatsInner = 2;
NrepeatsOuter = 10;
Nsteps = nSamples * NrepeatsInner * NrepeatsOuter;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMin, percMax);
Vfinal = V(Nsteps: -NrepeatsInner: 1 + nSamples * NrepeatsInner * (NrepeatsOuter - 1), :);

W2 = classifier (Vfinal, C);

c1 = classifySample (Vfinal(1,:)', W2)
c2 = classifySample (Vfinal(2,:)', W2)
c3 = classifySample (Vfinal(3,:)', W2)
c4 = classifySample (Vfinal(4,:)', W2)


% output

disp('V firing rates')
Vfinal

disp('V firing rates')
V(nSamples * NrepeatsInner * (NrepeatsOuter - 1): -NrepeatsInner: 1 + nSamples * NrepeatsInner * (NrepeatsOuter - 2), :)

disp('V firing rates')
V(nSamples * NrepeatsInner: -NrepeatsInner: 1, :)

disp('X (vmin)')
X

plot(V(:,Nneurons), "r", V(:,Nneurons-1), "b", V(:,Nneurons-2), "g", V(:,Nneurons-3), "p")
ylabel('v')