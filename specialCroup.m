
%fonction pour faire des croupe predefinier
function img = specialCroup (imgCroupe, ratio)

  %on recuper la taille de l'image
  [hauteur,largeur,~]=size(imgCroupe);

  %on calculer la zone a croupe

  if((largeur/hauteur)>ratio)
   %L'image est trop large -> on ajuste la largeur
    newLargeur=round(hauteur*ratio);
    newHauteur=hauteur;
    x=round((largeur-newLargeur)/2);
    y=0;

   %sinon image trop haute -> on ajuste l'hauteur
 else
    newLargeur=largeur;
    newHauteur=round(largeur/ratio);
    y=round((hauteur-newLargeur)/2);
    x=0;

  endif
  % Rectangle [x, y, largeur, hauteur]
  rect = [x, y, newLargeur, newHauteur];
  % on retourner l'image Crop
  img = imcrop(imgCroupe, rect);


endfunction
