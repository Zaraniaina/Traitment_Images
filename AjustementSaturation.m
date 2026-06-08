
%fonction pour ajuste la saturation d'un image
function x = AjustementSaturation (img, facteur)

          s=im2double(img);%on passe en double

          %on convertier RGB to HSV
          hsv=rgb2hsv(s);

          %on applique la saturation sur la dexieme canaux
          hsv(:,:,2)=hsv(:,:,2)*facteur; %facteur > 1 image sature et facteur <1 image désature

          %on doit pas sortir de [0 1]
          hsv(:,:,2)=min(max(hsv(:,:,2),0),1);

          %on retourner on revenir en RGB
          x=hsv2rgb(hsv);

endfunction
