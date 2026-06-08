
%fonction faire les filtre personaliser
function FiltrePersonaliser (src, event)

  global imgOriginale;

 axe=findobj('tag','axePrincipale');%on recuperer l'axe
 imgRecup=recupImageAxe('axePrincipale');%on recuperer l'images dans l'axe Principale

 %les boutons
 boutonApplique=findobj('tag','b_FiltreApplique'); %pour applique la filtre personaliser de l'utilisateur
 boutonRetour=findobj('tag','b_FiltreRetour');%pour faire un retoure au filtre normale

 %le text
  texte=findobj('tag','texteMatrice');%le champ de saisie de l'itlisateur

  switch src
    case boutonApplique

      if isequal(size(imgRecup),size(imgOriginale))% si l'images vaut  (ou egal) à imgOriginale


          noyau=str2num(get(texte,'string'));%transformation du type string en matrice pour le noyau


          img=conv2(imgOriginale,noyau);%on applique le masque
          %on prepare l'axe
          axes(axe);
          %on afficher l'images traites
          imshow(img,'parent',axe);

          set(texte,'string','');%effacher le champ

       else %sinon

          noyau=str2num(get(texte,'string'));%transformation du type string en matrice

          img=MasqueCovolutif(imgRecup,noyau);%on applique le masque
          %on prepare l'axe
          axes(axe);
          %on afficher l'images traites
          imshow(img,'parent',axe);
          set(texte,'string','');%effacher le champ

      end

    case boutonRetour


     panel=findobj('tag','panelFiltrePersonaliser');%on get le panel correspodant
                     set(axe,'position',[0.18 0.2 0.65 0.65]);
                     set(panel,'visible','off');%on hide le panel

     %on restore l'etat de l'image
     axes(axe);
     imshow(imgOriginale,'parent',axe);


  endswitch


endfunction
