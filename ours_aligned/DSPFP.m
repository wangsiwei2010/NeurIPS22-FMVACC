function P = DSPFP(A1,A2,K,c)

n1 = size(A1,1);
n2 = size(A2,1);
X = ones(n1,n2)/(n1*n2);
% X = ones(n1,n2);

ep=100;
index=1;
maxN=max(n1,n2);
Y=zeros(maxN,maxN);

a = 0.5;

while ep >= 1e-6 && index <= 50
    x = X;        
    Y(1:n1,1:n2) = A1*X*A2+c*K;  
    Y = gm_dsn(Y);   
    X = (1-a)*X+a*Y(1:n1,1:n2);
    X = X/(max(max(X)));        
    ep = max(max(abs(x-X)));
    index = index + 1;
end

P =X;
A=zeros(size(P));
for i =1:size(P,2)
    [~,j] = max(P(:,i));
    A(j,i)=1;
end
P=A;
%%%P=dis_greedy(X);