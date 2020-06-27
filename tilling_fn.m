function Ik_t = tilling_fn(img,Dim,F)

if F
    figure; imshow(uint8(img)); axis on; title('Original Image');
end

D = size(img);
max_row = floor(D(1)/Dim);
max_col = floor(D(2)/Dim);
Ik_t = cell(max_row,max_col);
r1 = 1; % satýr indexsi parçalanmýþ görünütünün sýralanmasý için
for row = 1:max_row
    
    c1 = 1; % sütün indexsi
    for col = 1:max_col
        r2 = r1+Dim-1; %image 128x128 bölünmesi için 
        c2 = c1+Dim-1;
        
        % bölünen görünütüler Ik_t matrisine atýlýyor
        Ik_t(row,col) = {img(r1:r2,c1:c2,:)};
        
        if F
        % plot segment
        subplot(max_row,max_col,(row-1)*max_col+col)
        imshow(uint8(cell2mat(Ik_t(row,col))))  % cell2mat tek bir görüntüde toplamak için      
        end
        
        % kaç döþemeye bölündüðü (sütun)
        c1 = c2 +1;
    end
    
    % kaç döþemeye bölündüðü (satýr)
    r1 = r2 +1;
end