function [ ara_pop2 ] = caprazlama(pop,ara_pop ,pop_size,b)
% tek noktal� caprazlama 
%random olarak �iftleri berlirleriz [[randperm()]];

cift=randperm(pop_size);
for i=1:(pop_size/2)
    parent1_idx(i,:)=cift(2*i-1);
    parent2_idx(i,:)=cift(2*i);
    parent1(i,:)=ara_pop(parent1_idx(i,1),:);
    parent2(i,:)=ara_pop(parent2_idx(i,1),:);
end

 rs=unifrnd(0,1);


    % b boyut i�in b-1 adet �aprazlama noktas� vard�r.
    cprz_nok= unifrnd(0,b-1); %boyut-1 kadar rassal say�
    %caprazlama noktas�na kadar olan genler korunacak, kalanlar de�i�ecek
    % de�i�ecek k�s�mlar� dummy de�i�keninde tut


    caprazlama_nok=floor(cprz_nok); 
         
for i=1:(pop_size/2)
    dummy(i,:)= parent1(i,caprazlama_nok+1:end);
end
 
 for i=1:(pop_size/2)
    parent1(i,caprazlama_nok+1:end)=parent2(i,caprazlama_nok+1:end);
    parent2(i,caprazlama_nok+1:end)=dummy(i,:);
end
             ara_pop2=pop; %boyutlar� ayn�
for i=1:(pop_size/2)
    ara_pop2(parent1_idx(i,1),:)=parent1(i,:);
    ara_pop2(parent2_idx(i,1),:)=parent2(i,:);
end
         
         
         

end

