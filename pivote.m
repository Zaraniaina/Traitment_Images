%fonction pour faire du pivotage (flip)

function pivote (src, event)
   %je recupere les bouton concerner
    boutonPivoteHorizontale=findobj('tag','b_PivoteHorizontale');%bouton PivoteHorizontale
    boutonPivoteVerticale=findobj('tag','b_PivoteVerticale');%bouton PivoteVerticale

    %on recuperer l'image dans l'axe
    imgTraite=recupImageAxe('axePrincipale');
    % l'axe de l'image
    axe=findobj('tag','axePrincipale');

%on teste le source d'evenement

     switch src
       case boutonPivoteHorizontale

         % de doitre vers gauche

         imgMiroire=fliplr(imgTraite);

         imshow(imgMiroire,'parent',axe);

      case boutonPivoteVerticale

         %de haut vers bas
         imgMiroireInverse=flipud(imgTraite);
         imshow(imgMiroireInverse,'parent',axe)

     endswitch


end
