function XdoubleHat = f_TransfromFeaturesToPoly(X,k)
    d = size(X,1); 
    N = size(X,2);
    A = [false(1,k) true(1,d)];    
    n = numel(A);
    b = nnz(A);
    M = 0:ones(1,n)*pow2(n-1:-1:0)';
    z = rem(floor(M(:)*pow2(1-n:0)),2);
    terms = logical(z(sum(z,2) == b,:));    
    %terms = unique(perms(v),'rows');
    numTerms = size(terms,1);
    XdoubleHat = zeros(numTerms,N);
    for t = 1:numTerms
       p = f_computePowers(terms(t,:)); 
       XdoubleHat(t,:) = prod(X.^repmat(p,1,N),1);
    end
end
function p = f_computePowers(term)
    p = zeros(sum(term==true),1);
    i = 1;
    while sum(term==true)>0
        idx = find(term==true,1,'first');
        p(i) = idx-1;
        i = i+1;
        term(1:idx) = [];
    end   
end