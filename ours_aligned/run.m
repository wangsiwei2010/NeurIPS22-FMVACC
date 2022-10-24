clear;
clc;
warning off;
addpath(genpath('./'));

ds = {'synthetic_data','3-sources'};
dsPath = '../datasets/';

for dsi = 1:1:length(ds)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    :length(ds)
    % load data & make folder
    dataName = ds{dsi}; disp(dataName);
    load(strcat(dsPath,dataName)); 
    k = length(unique(Y));
    numofview = length(X);
    %% para setting
    selectanchor = [1 2 5]*k;
    beta = [0.01 1 100];
    lambda = [0,10^-4,1,10^4];
    
    %%
    for ichor = 1:length(selectanchor)
        for id = 1:length(beta)
            for ic = 1:length(lambda)
                tic;
                [U,A,Z,iter,obj] = algo_qp(X,Y,selectanchor(ichor),beta(id),lambda(ic)); % X,Y,lambda,d,numanchor
                [res,std] = myNMIACCwithmean(U,Y,k); % [ACC nmi Purity Fscore Precision Recall AR Entropy]
                timer(ichor,id,ic)  = toc;
                fprintf('Anchor:%d \t Beta:%d\t Lambda:%d\t Res:%12.6f %12.6f %12.6f %12.6f \tTime:%12.6f \n',[selectanchor(ichor) beta(id) lambda(ic) res(1) res(2) res(3) res(4) timer(ichor,id,ic)]);
            end
        end
    end
    clear resall objall;
end


