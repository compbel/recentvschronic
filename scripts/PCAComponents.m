function [dim] = PCAComponents(sequence,dist_thr,nc)
     
        varFrac = 0.5;
        sequence=char(sequence);
        sequence=fillGaps(sequence);
        if size(sequence,2) == 291
            sequence = sequence(:,8:271);
        end
        if size(sequence,2) == 306
            sequence = sequence(:,21:284);
        end
        sequence = sequence(:,2:end);
        L = size(sequence,2);
        
        D = L*squareform(pdist(sequence,'hamming'));
        AM=(D <= dist_thr) - eye(size(D,1),size(D,2));


        Array_of_Sequences=nuc2num(sequence);

        InitialData=double(Array_of_Sequences);

        [Number_of_Rows,Number_of_Columns]=size(InitialData);
        CenteredData=zeros(Number_of_Rows,Number_of_Columns);    
        %initializes a new matrix called CenteredData of size Number_of_Rows to Number_of_Columns


        Means_of_Strings=mean(InitialData,2);   % computes column vector containing the mean of each row

        for i=1:Number_of_Rows  
            for j=1:Number_of_Columns % subtracts the coppresonding mean from each element in i-th row
                CenteredData(i,j)=InitialData(i,j)-Means_of_Strings(i);
            end
        end

        cov_matrix=cov(CenteredData); %computes the covariance matrix

        [eigVec,eigVal]=eig(cov_matrix); %computes eigenvalues and eigenvectors

        % it returns diagonal matrix eigVal of eigenvalues

        eigVal=diag(eigVal);
        
        eigValNormalized = eigVal/sum(eigVal,1);
        cs=cumsum(flip(eigValNormalized));
        dim=find(cs >= varFrac,1,'first')/nc;

end

