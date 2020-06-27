clc; clear all; close all;
Im = (imread('h7.bmp'));
Im2 = (imread('h6.bmp'));
Im3 = (imread('h8.bmp'));
Im4 = (imread('hinput2.jpg'));
I2=rgb2gray(Im2);
I=rgb2gray(Im);
I3=rgb2gray(Im3);
I4=rgb2gray(Im4);


Ic1=CLAHE(I,0.9);
Ic2=CLAHE(I2,0.9);
Ic3=CLAHE(I3,0.9);
Ic4=CLAHE(I4,0.9);



Ib=bclahe(I,8);
Ib2=bclahe(I2,8);
Ib3=bclahe(I3,8);
Ib4=bclahe(I4,8);

I4=I4(1:680,1:1024);

Q(1)=imageQualityIndex(uint8(I),uint8(Ib),1);
Q(2)=imageQualityIndex(uint8(I2),uint8(Ib2),1);
Q(3)=imageQualityIndex(uint8(I3),uint8(Ib3),1);
Q(4)=imageQualityIndex(uint8(I4),uint8(Ib4),1);

Qc(1)=imageQualityIndex(uint8(I),uint8(Ic1),1);
Qc(2)=imageQualityIndex(uint8(I2),uint8(Ic2),1);
Qc(3)=imageQualityIndex(uint8(I3),uint8(Ic3),1);
Qc(4)=imageQualityIndex(uint8(I4),uint8(Ic4),1);

M(1)=mutualinfo(uint8(I),uint8(Ic1));
M(2)=mutualinfo(uint8(I2),uint8(Ic2));
M(3)=mutualinfo(uint8(I3),uint8(Ic3));
M(4)=mutualinfo(uint8(I4),uint8(Ic4));

Mb(1)=mutualinfo(uint8(I),uint8(Ib));
Mb(2)=mutualinfo(uint8(I2),uint8(Ib2));
Mb(3)=mutualinfo(uint8(I3),uint8(Ib3));
Mb(4)=mutualinfo(uint8(I4),uint8(Ib4));
% Ec = entropyfilt(uint8(Ic));
% Eb = entropyfilt(uint8(Ib));

Ec(1) = entropy(uint8(Ic1));
Ec(2) = entropy(uint8(Ic2));
Ec(3) = entropy(uint8(Ic3));
Ec(4) = entropy(uint8(Ic4));

Eb(1) = entropy(uint8(Ib));
Eb(2) = entropy(uint8(Ib2));
Eb(3) = entropy(uint8(Ib3));
Eb(4) = entropy(uint8(Ib4));

E(1) = entropy(uint8(I));
E(2) = entropy(uint8(I2));
E(3) = entropy(uint8(I3));
E(4) = entropy(uint8(I4));

figure
plot(Ec)
hold on 

plot(Eb)
plot(E)

legend('Clahe','BClahe','Ýnput')
xlabel('Ýmage Set')
ylabel('Entropy')

figure
plot(Qc)
hold on 

plot(Q)

legend('Clahe','BClahe')
xlabel('Ýmage Set')
ylabel('universal image quality index ')

figure
plot(M)
hold on 

plot(Mb)

legend('Clahe','BClahe')
xlabel('Ýmage Set')
ylabel('Mutual Information')

figure
 imshow(uint8(Ic1)),title('Clahe');
 figure
 imshow(uint8(Ib)),title('BClahe');
 figure
 imshow(uint8(I)),title('Ýnput');
