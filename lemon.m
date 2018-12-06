
files=dir(['E:\name_frames\' '*.jpg']);
BG = imread(strcat('E:\name_frames\',files(001).name));
BG = rgb2gray(BG);
sm2=0;
cent=[];
for k=1:numel(files)
I = imread(strcat('E:\name_frames\',files(k).name));
Io=double(I);
I= rgb2gray(I);
I = abs(BG-I);
% read in tiff image and convert it to double format
my_image = im2double(I);
my_image = my_image(:,:,1);
% allocate space for thresholded image
image_thresholded=zeros(size(my_image));
image_thresholded(my_image>0.2)=255;
% display result
disp(k);
I = image_thresholded;
I = imfill(I,'holes');
I = imfill(I);

Iy=(Io(:,:,1)/2+Io(:,:,2)/2-Io(:,:,3))>10;
Iy2=Io(:,:,1)/2+Io(:,:,2)/2-Io(:,:,3);

CC = bwconncomp(I.*Iy);

sm=0;
for i=101:CC.NumObjects
    ids=CC.PixelIdxList{i};
    ss=mean(Iy2(ids));
    if ss>max(sm,10)
        oi=i;
        sm=ss;
    end
end

if sm>sm2
    sm2=sm;
end

if abs(sm-max(10,sm2))<10
 bb=zeros(CC.ImageSize);
 bb(CC.PixelIdxList{oi})=1;
 figure,imshow(bb) 
 s  = regionprops(bb, 'centroid');
end

end
 %std(cent)
  temp = std(cent);
readImage1=imread('001.jpg');% name of image % 001.jpg
[x1,y1,z1] = size(readImage1);
 t = temp(2);
 l = (0.25)*y1;
  if(t > l)
      disp('False');
  else
      disp('True');
  end