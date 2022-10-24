function M=dsn(X)

n=length(X);

for i = 1:30
    x = X;
    k1 = sum(X')/n; 
    k2 = sum(X)/n;
    
    X = X + 1/n + sum(k1)/n ;    
    
    for i=1:n
        X(i,:)=X(i,:)-k2;
        X(:,i)=X(:,i)-k1';
    end

    X = (X + abs(X)) / 2;   
end
M=X;