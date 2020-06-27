function Ii=bclahe(I,threshold_number)

% I=I(1:264,1:208);
    
 [wi,hi] = size(I);
%  threshold_number = ((8*8)*21)/100;
%  threshold_number=8;

sizeI = size(I);
blocks = tilling_fn(I,8,0);

[wb hb]=size(blocks);


for i=1:1:wb
    for j=1:1:hb
Ihfirst{i,j}=imhist(blocks{i,j});
    end
end
Ih=Ihfirst;
[w,h]=size(Ih{1});
e=zeros(wb,hb);
s=zeros(wb,hb);

for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            for hp=1:1:h
         if (Ih{i,j}(wp,1)>threshold_number)
            e(i,j)=e(i,j)+ Ih{i,j}(wp,1)-threshold_number;  %kýrpýlan piksel sayýsý
             Ih{i,j}(wp,1)=threshold_number;          
         else
             s(i,j)=s(i,j)+Ihfirst{i,j}(wp,1);
         end
         
            end
        end
     
    end
end

for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            for hp=1:1:h
         if (Ih{i,j}(wp,1)<threshold_number)                   
        pk{i,j}(wp,1)=Ihfirst{i,j}(wp,1)/sum(s(i,j));
         end
         
            end
        end
     
    end
end

% [Ih pk]=crop(Ih,Ihfirst);
% for i=1:1:wb
%     for j=1:1:hb
%  pk{i,j}=Ihfirst{i,j}/sum(s(i,j));
%     end
% end

as=(cell2mat(pk));
for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            
         if (Ihfirst{i,j}(wp,1)<threshold_number)
             Ihnew{i,j}(wp,1)= Ih{i,j}(wp,1)+(pk{i,j}(wp,1)*e(i,j));             
         else
             Ihnew{i,j}(wp,1)= Ih{i,j}(wp,1);
            
         end
            end
        end
 end
for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            for hp=1:1:h
         if (Ih{i,j}(wp,1)>threshold_number)
            e(i,j)=e(i,j)+ Ih{i,j}(wp,1)-threshold_number;  %kýrpýlan piksel sayýsý
             Ih{i,j}(wp,1)=threshold_number;          
         else
             s(i,j)=s(i,j)+Ihfirst{i,j}(wp,1);
         end
         
            end
        end
     
    end
end

for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            for hp=1:1:h
         if (Ih{i,j}(wp,1)<threshold_number)                   
        pk{i,j}(wp,1)=Ihfirst{i,j}(wp,1)/sum(s(i,j));
         end
         
            end
        end
     
    end
end

% [Ih pk]=crop(Ih,Ihfirst);
% for i=1:1:wb
%     for j=1:1:hb
%  pk{i,j}=Ihfirst{i,j}/sum(s(i,j));
%     end
% end

as=(cell2mat(pk));
for i=1:1:wb
    for j=1:1:hb   
        for wp=1:1:w
            
         if (Ihfirst{i,j}(wp,1)<threshold_number)
             Ihnew{i,j}(wp,1)= Ih{i,j}(wp,1)+(pk{i,j}(wp,1)*e(i,j));             
         else
             Ihnew{i,j}(wp,1)= Ih{i,j}(wp,1);
            
         end
            end
        end
 end

for i=1:1:wb
    for j=1:1:hb
[Iout{i,j} LUT{i,j} cdf{i,j}]=histogram_esitle(blocks{i,j},Ihnew{i,j});
    end
end

 
  
% figure; 
% plot(cdf{1,1});title('c');
 a=1;
b=1;

for i=1:8:wi-15
    for j=1:8:hi-15
   Iblock=I(i:i+15,j:j+15);
 Ii(i:i+15,j:j+15)=interpolate(Iblock,LUT{a,b},LUT{a,b+1},LUT{a+1,b},LUT{a+1,b+1},8,8); 

 b=b+1;
    end
    b=1;
   
  
    a=a+1;
end



Ikend=(cell2mat(Iout));
% 
% figure;
% bar(Ihfirst{1,1});title('input histogram');
% xlim([130 180]);
% figure; 
% bar(Ihnew{1,1});title('balanced histogram');
% xlim([130 180]);
%  figure;
%  figure;imshow((uint8((I)))),title('Ýnput');
%  figure;imshow((uint8((Ikend)))),title('LUT');
%  
%  subplot(2,2,1)
% plot(Ihfirst{1,1});title('first 8x8 block input histogram');
% xlim([130 180]);
% subplot (2,2,2);
% 
% plot(Ihnew{1,1});title('first 8x8 block balanced histogram');
% xlim([130 180]);
% 
% 
% 
% subplot(2,2,3) ;
% 
% imshow(uint8(Ii)),title(['Treshold value=',num2str(threshold_number)]);
% 
% H = uint8(Ii);
% 
% subplot(2,2,4) ;
% 
% imhist(H) ;
% 
% title ('Histogram of Output');
%  figure;imshow((uint8((Ii)))),title('adpt');
end