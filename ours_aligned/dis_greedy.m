function P=dis_greedy(X)
if (nnz(isnan(X)))
    disp('NaN');
end
n1=size(X,1);
n2=size(X,2);

switchN1N2=0;

if n1 < n2
    X=X';
    [n1,n2]=deal(n2,n1);
    switchN1N2=1;
end

[a,b]=max(X);
A=sortrows([a' b' (1:n2)']);
counterSet=[];
for i=n2:-1:1
    while any(A(i,2) == counterSet)
        X(A(i,2),A(i,3))=-1;
        [A(i,1) A(i,2)]=max(X(:,A(i,3)));
        A(1:i,:)=sortrows(A(1:i,:));
    end
    counterSet=[counterSet A(i,2)];
end 
 
P=zeros(n1,n2);
for i=1:n2
    P(A(i,2),A(i,3))=1;
end

if switchN1N2
    P=P';
end