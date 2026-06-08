
%pour restore l'etat d'image d'origine
function restoreImage (src, event)

   global imgOriginale imgRestor;%on recuperer les variables global

   imgOriginale=imgRestor;%on resoter l'image originaire

   axe=findobj('tag','axePrincipale');%on recuperer l'axe

   imshow(imgOriginale,'parent',axe);%on afficher l'image restore

end
