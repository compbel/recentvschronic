function [smetric] = sMetrics(sequence,dist_thr)

    
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

    smetric=sMetric(AM)/((size(AM,1))^4);
end

