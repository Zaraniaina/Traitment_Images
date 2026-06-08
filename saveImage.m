%pour enregistre une image
function saveImage (src, event)



   img=recupImageAxe('axePrincipale');

   [file,path]=uiputfile({'*.png';'*.jpg'});

   if isequal(file,0)

    msgbox('Enregistrement annulle','info');

   else

     imwrite(img,fullfile(path,file));
     msgbox('Image enregistrement!...','info')

   end



end
