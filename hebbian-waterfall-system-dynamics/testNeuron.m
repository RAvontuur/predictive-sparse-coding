
for (k=1:20)

    V = [];
    X = [];
    W = [];

    u = [k];
    w = [0.1];
    x = [0];
    perc =  0.8;

    for (i=1:20)
        [v, w, x] = neuron(u, w, x, perc);
        V = [V; v];
        X = [X; x];
        W = [W; w];
    end

    k
    subplot(2,1,1)
    plot(V, 'r', X / perc, 'b');
    ylabel('V vs X/perc');
    subplot(2,1,2)
    plot(W);
    pause
end


