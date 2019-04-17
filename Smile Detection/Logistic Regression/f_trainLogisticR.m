function w = f_trainLogisticR(XTrain,yTrain,lambda)
    X = [ones(1,size(XTrain,2)); XTrain];     
    y = yTrain';    
    N = length(y);    
    d = size(X,1);
    updateNorm = 1;
    alpha = 0.01;
    wOld = rand(d,1);    
    while updateNorm>0.001
        w = wOld - (alpha/N)*(X*((1./(1+exp(-X'*wOld)))-y)-lambda*wOld);
        updateNorm = norm(w-wOld);        
        wOld = w;                         
    end            
end