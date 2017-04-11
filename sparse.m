##
## sparse constraint penalty
##
##
function gdev = sparse(V1, V2, deltaT)


g1 = sum(-log10(1+V1.^2));
g2 = sum(-log10(1+V2.^2));

gdev = (g2 - g1) * deltaT;

end
