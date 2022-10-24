function [S,T] = aligned(Z,c)
numview = length(Z);
S = Z{1};
T{1} = eye(size(S,1));
for nv = 2:numview
    K = Z{1}*Z{nv}';  %%% Ò»½×ÏàËÆ¶È
    S1 = Z{1}* Z{1}';
    S2 = Z{nv}* Z{nv}';
    T{nv} = DSPFP(S1,S2,K,c);
    S = S+T{nv}*Z{nv};
end
S = S/nv;