function seqConv = nuc2num(seq)
codes = [3 1 2 4];
% A C T G
seqConv = zeros(size(seq,1),size(seq,2));

for i = 1:size(seq,1)
    for j = 1:size(seq,2)
        if seq(i,j) == 'A'
            seqConv(i,j) = codes(1);
        end
        if seq(i,j) == 'C'
            seqConv(i,j) = codes(2);
        end
        if seq(i,j) == 'T'
            seqConv(i,j) = codes(3);
        end
        if seq(i,j) == 'G'
            seqConv(i,j) = codes(4);
        end
    end
end
