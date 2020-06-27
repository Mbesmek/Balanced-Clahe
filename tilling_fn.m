function Ik_t = tilling_fn(img,Dim,F)

if F
    figure; imshow(uint8(img)); axis on; title('Original Image');
end

D = size(img);
max_row = floor(D(1)/Dim);
max_col = floor(D(2)/Dim);
Ik_t = cell(max_row,max_col);
r1 = 1; % sat�r indexsi par�alanm�� g�r�n�t�n�n s�ralanmas� i�in
for row = 1:max_row
    
    c1 = 1; % s�t�n indexsi
    for col = 1:max_col
        r2 = r1+Dim-1; %image 128x128 b�l�nmesi i�in 
        c2 = c1+Dim-1;
        
        % b�l�nen g�r�n�t�ler Ik_t matrisine at�l�yor
        Ik_t(row,col) = {img(r1:r2,c1:c2,:)};
        
        if F
        % plot segment
        subplot(max_row,max_col,(row-1)*max_col+col)
        imshow(uint8(cell2mat(Ik_t(row,col))))  % cell2mat tek bir g�r�nt�de toplamak i�in      
        end
        
        % ka� d��emeye b�l�nd��� (s�tun)
        c1 = c2 +1;
    end
    
    % ka� d��emeye b�l�nd��� (sat�r)
    r1 = r2 +1;
end