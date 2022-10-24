function [C] = initialize(X,k)
    
s = RandStream('mt19937ar','Seed',0);
RandStream.setGlobalStream(s);
    
[IDX, C] = kmeans(X,k, 'MaxIter',200,'Replicates',30);
dimension = size(C,2);
%% numclass, 'MaxIter',100, 'Replicates',10
if dimension >= k
    C = orth(C');
    C = C';
else
    C = C;
end
% %returns the K cluster centroid locations in the K-by-P matrix C.