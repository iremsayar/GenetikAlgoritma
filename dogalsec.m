function [ara_pop] = dogalsec(pop,amac,pop_size)
 
% 3- dogal secilim uygula.(rank tabanl� s�ilim, rulet �ark�, turnuva
% se�ilimi)
% rulet �ark�: maksimize etmek i�in kullan�l�r, minimize etmek i�in
% terleriz.

olas=amac/sum(amac);
kum_olas=olas;
for i=2:pop_size
    kum_olas(i)=kum_olas(i-1)+olas(i);
end

rs=unifrnd(0,1,[pop_size,1]); %kumalatif olasl�k ile kar��la�t�r�l�r

%dogal secilimden sonra ara populasyon olu�acak
ara_pop = pop;% sat�r sutun ayn�


%rassal say�lar� kumalatif ile kars�la�t�rd�ktan sonra hangi kromozomlara
%kar��l�k geldi�ini buluyoruz
for i=1:pop_size
    idx=find(rs(i)<kum_olas,1); % rs'dan k���k olan kum. olas�l�k de�eri idx
    ara_pop(i,:)= pop(idx,:); %bu kromozomlar ara populasyonu olusturur.
end
end

