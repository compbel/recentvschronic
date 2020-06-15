function seqNew = nuc2numBin(seq)
L = size(seq,2);
n = size(seq,1);
seqNew = zeros(n,4*L);
for i = 1:n
    for j = 1:L
        if seq(i,j) == 'A'
            seqNew(i,(4*(j-1)+1):4*j) = [0 0 0 1];
        end
        if seq(i,j) == 'C'
            seqNew(i,(4*(j-1)+1):4*j) = [0 0 1 0];
        end
        if seq(i,j) == 'T'
            seqNew(i,(4*(j-1)+1):4*j) = [0 1 0 0];
        end
        if seq(i,j) == 'G'
            seqNew(i,(4*(j-1)+1):4*j) = [1 0 0 0];
        end
    end
end