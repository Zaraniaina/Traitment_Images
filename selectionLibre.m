%fonction pour une rognage libre
function selectionLibre (src,event)
  global imgRogne;

  imgAxe=recupImageAxe('axePrincipale');% on recuperer  l'images dans lk'axes
  axe=findobj('tag','axePrincipale');% on recuperer l'axe elle même

  %on effectue la crop libre
  imgRogne=imcrop(imgAxe);
  %on affiher l'images croupé
  imshow(imgRogne,'parent',axe);

end
