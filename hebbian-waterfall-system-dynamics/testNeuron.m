
for (k=1:20)

V = [];
X = [];
W = [];

    Ut = [k];
    w = [0.1];
    x = [0];

    for (i=1:20)
        [v, deltaW, x] = neuron(Ut, w, x);
        V = [V; v];
        X = [X; x];
        w = w + deltaW;
        W = [W; w];
    end

    perc =  0.9;

    k
    subplot(2,1,1)
    plot(V, 'r', X * perc, 'b');
    ylabel('V vs X*perc');
    subplot(2,1,2)
    plot(W);
    pause
end


