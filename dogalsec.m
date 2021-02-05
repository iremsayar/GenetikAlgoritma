function [ara_pop] = dogalsec(pop,amac,pop_size)
 
% 3- dogal secilim uygula.(rank tabanlý sçilim, rulet çarký, turnuva
% seçilimi)
% rulet çarký: maksimize etmek için kullanýlýr, minimize etmek için
% terleriz.

olas=amac/sum(amac);
kum_olas=olas;
for i=2:pop_size
    kum_olas(i)=kum_olas(i-1)+olas(i);
end

rs=unifrnd(0,1,[pop_size,1]); %kumalatif olaslýk ile karþýlaþtýrýlýr

%dogal secilimden sonra ara populasyon oluþacak
ara_pop = pop;% satýr sutun ayný


%rassal sayýlarý kumalatif ile karsýlaþtýrdýktan sonra hangi kromozomlara
%karþýlýk geldiðini buluyoruz
for i=1:pop_size
    idx=find(rs(i)<kum_olas,1); % rs'dan küçük olan kum. olasýlýk deðeri idx
    ara_pop(i,:)= pop(idx,:); %bu kromozomlar ara populasyonu olusturur.
end
end

