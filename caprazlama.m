function [ ara_pop2 ] = caprazlama(pop,ara_pop ,pop_size,b)
% tek noktalý caprazlama 
%random olarak çiftleri berlirleriz [[randperm()]];

cift=randperm(pop_size);
for i=1:(pop_size/2)
    parent1_idx(i,:)=cift(2*i-1);
    parent2_idx(i,:)=cift(2*i);
    parent1(i,:)=ara_pop(parent1_idx(i,1),:);
    parent2(i,:)=ara_pop(parent2_idx(i,1),:);
end

 rs=unifrnd(0,1);


    % b boyut için b-1 adet çaprazlama noktasý vardýr.
    cprz_nok= unifrnd(0,b-1); %boyut-1 kadar rassal sayý
    %caprazlama noktasýna kadar olan genler korunacak, kalanlar deðiþecek
    % deðiþecek kýsýmlarý dummy deðiþkeninde tut


    caprazlama_nok=floor(cprz_nok); 
         
for i=1:(pop_size/2)
    dummy(i,:)= parent1(i,caprazlama_nok+1:end);
end
 
 for i=1:(pop_size/2)
    parent1(i,caprazlama_nok+1:end)=parent2(i,caprazlama_nok+1:end);
    parent2(i,caprazlama_nok+1:end)=dummy(i,:);
end
             ara_pop2=pop; %boyutlarý ayný
for i=1:(pop_size/2)
    ara_pop2(parent1_idx(i,1),:)=parent1(i,:);
    ara_pop2(parent2_idx(i,1),:)=parent2(i,:);
end
         
         
         

end

