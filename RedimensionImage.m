%pour la redimension de l'image
function  RedimensionImage (src, event)

   global imgRestor;

  combo=findobj('tag','ComboRedimension');
  axe=findobj('tag','axePrincipale');%on recuperer l'axe
  img=recupImageAxe('axePrincipale');%on recuperer l'image dans  l'axePrincipale


  %on teste les choise de l'utilisateur
  switch get(combo,'value')

  case 1 %taille originer
    axes(axe);
    imshow(imgRestor,'parent',axe);
  case 2 % taille 640x480
    newTaille=imresize(img,[640 480]);
    axes(axe);
    imshow(newTaille,'parent',axe);
    imgOriginale=newTaille;
  case 3 % taille 320x240
    newTaille=imresize(img,[320 240]);
    axes(axe);
    imshow(newTaille,'parent',axe);
    imgOriginale=newTaille;
  case 4 %taille 176x144
    newTaille=imresize(img,[176 144]);
    axes(axe);
    imshow(newTaille,'parent',axe);
    imgOriginale=newTaille;
  otherwise %taille originale
    axes(axe);
    imshow(imgRestor,'parent',axe);
  endswitch



endfunction
