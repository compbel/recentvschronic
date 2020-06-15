function [corrFREig] = corrFREig(D,freq, thr_dist)

%      thr_dist = 1;
     thr_comp = 10;
    
       n = size(D,1);
       A = (D <= thr_dist) - eye(n,n);
       [S, C] = graphconncomp(sparse(A), 'Directed', false);
       corr_i = [];
       corrdeg_i = [];
     
       for j = mode(C)
           A_comp = A(C==j,C==j);
           nComp = size(A_comp,2);
           if nComp < thr_comp
                continue;
           end
           freq_comp = freq(C==j);
           deg_comp = sum(A_comp,2);
           [V,Val] = eig(A_comp);
           V = V(:,end);
           V = 100*V/sum(V,1);
           corr_i = [corr_i corr(V,freq_comp')];
       end
      
       corrFREig=corr_i;
end