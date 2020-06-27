function Ikend =clahe(I,threshold_number)
[wi hi]=size(I);

%  threshold_number = ((8*8)*21)/100;
%  threshold_number=0.8;  


blocks = tilling_fn(I,8,0);
bl = tilling_fn(I,16,0);

[wb hb]=size(blocks);


for i=1:1:wb
    for j=1:1:hb
Ihfirst{i,j}=imhist(blocks{i,j});  %Her bir Bloðun Histogramý bulunur
    end
end
Ih=Ihfirst;
[w,h]=size(Ih{1});

% figure; plot(Ihfirst{1,1});title('ilk hist');

e=zeros(wb,hb);
for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
           
         if (Ih{i,j}(wp,1)>threshold_number)
            e(i,j)=e(i,j)+ Ih{i,j}(wp,1)-threshold_number; %kýrpýlan piksel sayýsý
             Ih{i,j}(wp,1)=threshold_number;          
        
            end
        end
     
    end
end
for i=1:1:wb
    for j=1:1:hb   
        redist(i,j)=e(i,j)/256;
        redusial(i,j)= e(i,j)-(redist(i,j)*256); %Kýrpýlan HÝsttogramý yayma                
            Ihnew{i,j}=Ih{i,j}+redist(i,j);        
          
        end
     
 end

% figure; plot(Ihnew{1,1});title('yayýlan hist');
for i=1:1:wb
    for j=1:1:hb
[Iout{i,j} LUT{i,j} cdf{i,j}]=histogram_esitle(blocks{i,j},Ihnew{i,j}); %Histogram Eþitleme
    end
end
% for i=1:1:wb
%     for j=1:1:hb
% [Iout{i,j} LUT{i,j}]=histEqualization(blocks{i,j} %Histogram Eþitleme
%     end
% end

Iwi=(cell2mat(Iout));
Ikend=Iwi;
 a=1;
b=1;

for i=1:8:wi-15
    for j=1:8:hi-15
   Iblock=I(i:i+15,j:j+15);
 Ikend(i:i+15,j:j+15)=interpolate(Iblock,LUT{a,b},LUT{a,b+1},LUT{a+1,b},LUT{a+1,b+1},8,8); 
 b=b+1;
    end
    b=1;
   
  
    a=a+1;
end
%  ia=intblock(I,LUT); 
% Iwi=(cell2mat(Iout));
% da=adapthisteq(I);
%  
% figure;imshow(uint8(ia)),title('Output without interpoation'); 
%  figure;imshow((uint8((I)))),title('Ýnput');
%  figure;imshow(((uint8(Ikend)))),title('Clahe');
end