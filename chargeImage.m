function chargeImage(src,event)

  global imgOriginale imgRestor;%on utiliser les varibales global

  axe=findobj('tag','axePrincipale');% on recupere l'axe


  [file,path]=uigetfile({'*.png;*.jpg;*.jpeg','images formats'});%on creer un file chooser avec filtre d'images png,jpeg,jpg

  %on test si le fichier est vide
  if isequal(file,0)
    %si vide on a fficher une messager
    msgbox('Aucun fichier selectioner','info');
  else
    %sinon
    imgOriginale=imread(fullfile(path,file));%on affecte l'image quand vient de charger au variable imgOriginale

    imshow(imgOriginale,'parent',axe);%on recuperer l'image originale

    imgRestor=imgOriginale;% on garde une image se secours pour effectuer la restoration d'Image
  end

end
