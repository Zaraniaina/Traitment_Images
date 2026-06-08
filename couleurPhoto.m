%fonction pour modifier les canaux Rouge,VERT,bleu
function couleurPhoto(src, event)

  %on recuperes les variables global concerner
  global imgOriginale canaux_rouge canaux_vert canaux_bleu imgRouge imgVert imgBleu;
  global valRouge valBleu valVert;


%les boutons src d'event
 b_O=findobj('tag','b_Original2');
 b_rouge=findobj('tag','b_rouge');
 b_vert=findobj('tag','b_vert');
 b_bleu=findobj('tag','b_bleu');

 %les slider src d'evenement
 slide_rouge=findobj('tag','slideRouge');
 slide_vert=findobj('tag','slideVert');
 slide_bleu=findobj('tag','slideBleu');

 %les lables
 labelRouge=findobj('tag','labelRouge');
 labelVert=findobj('tag','labelVert');
 labelBleu=findobj('tag','labelBleu');

%l'axe de l'image
 axe=findobj('tag','axePrincipale');


 %on test le bouton source d'event avec switch
  switch src

    case b_rouge %isolations du canaux rouges
    %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on isole le canaux rouge de l'image
    canaux_rouge=imgRecup(:,:,1);
    %on reafficher l'images avec canaux rouges isoles
    imshow(canaux_rouge,'parent',axe);

  case b_vert%isolations du canaux vert

   %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on isole le canaux vert de l'image
    canaux_vert=imgRecup(:,:,2);
    %on reafficher l'images avec canaux verte isoles
    imshow(canaux_vert,'parent',axe);

  case b_bleu %isolations du canaux bleu
    %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on isole le canaux bleu de l'image
    canaux_bleu=imgRecup(:,:,3);
    %on reafficher l'images avec canaux bleu isoles
    imshow(canaux_bleu,'parent',axe);

  case b_O %affichages del'images originel

  imshow(imgOriginale,'parent',axe);% dans l'axe principale

  case slide_rouge %si le slide du couleur  rouges src d'evenement

  valRouge=round(get(src,'value'));%on recupere la valeur du slide

   %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on applique la couleur sur chaque canaux
    imgRecup(:,:,1)=valRouge;

    imgRouge=imgRecup;

    %on afficher l'images en rouges
    imshow(imgRouge,'parent',axe);
    %on afficher la valeur du slide
    set(labelRouge,'string',sprintf('Rouge:%d',valRouge));%on afficher les  modifier de la valeur du slider

 case slide_vert %si le slide du couleur vert src d'evenement

  valVert=round(get(src,'value'));%on recupere la valeur du slide

  %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on applique la couleur sur un canaux
    imgRecup(:,:,2)=valVert;

    imgVert=imgRecup;
    %on afficher l'images en vertes
    imshow(imgVert,'parent',axe);
    %on afficher la valeur du slide
    set(labelVert,'string',sprintf('Vert:%d',valVert));%on afficher les  modifier de la valeur du slider

  case slide_bleu %si le slide du couleur bleu src d'evenement

  valBleu=round(get(src,'value'));%on recupere la valeur du slide

   %d'abord on afficher l'image orignel
    imshow(imgOriginale,'parent',axe);

    imgRecup=recupImageAxe('axePrincipale');%on recup l'Image Axe

    %on applique la couleur sur un canaux
     imgRecup(:,:,3)=valBleu;

     imgBleu=imgRecup;
    %on afficher l'images en bleu
    imshow(imgBleu,'parent',axe);
    %on afficher la valeur du slide
    set(labelBleu,'string',sprintf('Bleu:%d',valBleu));%on afficher les  modifier de la valeur du slider

  endswitch

end


