function [transvermut] = transverMut(ss)
    purines={'A','G'};
    pyrimidines={'C','T'};
    
%     ss=char(sequence);
    [nr,nc]=size(ss);
    mutationdist=zeros(nc,1);
    for m=1:nc
        if(any(ismember(unique(ss(:,m)),purines) >=1) && any(ismember(unique(ss(:,m)),pyrimidines)>=1))
            mutationdist(m)=1;
        end
    end
     transvermut=mean(mutationdist);
end

