function [dndsP] = DNDS(sequences, freq)     

%    if size(sequences,2) == 291
%         sequences = sequences(:,8:271);
%    end
%    if size(sequences,2) == 306
%         sequences = sequences(:,21:284);
%    end
%    sequences = sequences(:,3:end);

    sequences = sequences(:,2:end);
    sequences=fillGaps(sequences);
%     if size(sequences,2) == 291
%         sequences = sequences(:,8:271);
%     end
%     if size(sequences,2) == 306
%         sequences = sequences(:,21:284);
%     end
% 
%     ind = zeros(1,size(sequences,1));
%     for n = 1:size(sequences,1)
%         s = sequences(n,:);
%         j = length(s);
%             while s(j) == ' '
%                 j = j-1;
%             end
%         s = s(1:j);
%         if length(s) == 263
%             ind(n) = 1;
%         end
%     end
%     sequences = sequences(logical(ind),:);
%     sequences = sequences(:,1:263);
   [maxf, imaxf] = max(freq);
   ref = sequences(imaxf,:); 
   DnTotal = 0;
   DsTotal = 0;
   dndsS = 0;
   for i = 1:size(sequences,1)
%        [Dn, Ds, Vardn, Vards] = dnds(sequences(i,:),ref);
       [Dn, Ds, like] = dndsml(sequences(i,:),ref);
%        [Dn, Ds, like] = dndsml(sequences(i,:),ref, 'verbose','true');
       DnTotal = DnTotal + Dn;
       DsTotal = DsTotal + Ds;
       dndsS = dndsS + Dn-Ds;
   end
%    dndsS = dndsS/(size(sequences,1)-1);
   dndsP = DnTotal/DsTotal;
end

