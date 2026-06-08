
function switchFonctionalite(src, event)

  %les variables global
  global imgOriginale imgNegative imgGris imgBinaire imgMasqueCovolutif imgContourDetecte;
   global canaux_rouge canaux_vert canaux_bleu;
   global imgRouge imgVert imgBleu  valRouge valBleu valVert;

   #on recuperer l’image dans axe
   imgAxe=recupImageAxe('axePrincipale');

   %combo box
   comboRedimension=findobj('tag','ComboRedimension');%pour la redimension de l'image


  %les boutons
   boutonFiltre=findobj('tag','boutonFiltre');%bouton filtre
   boutonAjustement=findobj('tag','boutonAjustement');%bouton Ajustement
   boutonRogne=findobj('tag','boutonRogne');%bouton rogne
   boutonCouleur=findobj('tag','boutonCouleur');%bouton couleur
   boutonRotGauche=findobj('tag','b_rotGauche');%bouton rotation 90 de gauche
   boutonRotDroite=findobj('tag','b_rotDroite');%bouton rotation 90 de droite
   boutonPivoteHorizontale=findobj('tag','b_PivoteHorizontale');%bouton pivote horizontale
   boutonPivoteVerticale=findobj('tag','b_PivoteVerticale');%bouton pivote verticle
   boutonRestor=findobj('tag','b_restor');%bouton restore l'image d'origine

   boutonCouleurManuelle=findobj('tag','b_manuelle');%pour la couleur manule d'images

   boutonRetourBasicColor=findobj('tag','b_retourBasicColor');% bouton pour faire une retour

   boutonTraiteSpecial=findobj('tag','boutonTraitement');%pour le bouton traiment special dans la menu

   boutonHistogramme=findobj('tag','boutonHistogramme');%pour l'histogramme

   boutonRedimension=findobj('tag','b_Redimension');%pour la redimension de l'image


   %l'axe d'image
   AxeImage=findobj('tag','axePrincipale');%panel pour l'image


   %les panel correspondant
  panelFiltre=findobj('tag','panelfiltre');%panel pour les filtre

  panelAjustement=findobj('tag','panelAjustement');%panel pour l'ajustement

  panelRogne=findobj('tag','panelRognage');%pour la panel de Rognager

  panelCouleur=findobj('tag','panelCouleur');%pour la panel couleur

  panelCouleurManuelle=findobj('tag','panelCouleurManuelle');%pour le panel couleur manuelle

  panelTraiteSpecial=findobj('tag','panelTraiteSpecial'); %pour les traitement special
  panel=findobj('tag','panelFiltrePersonaliser');%le panel correspodant au filtre personaliser




  %les labels
 labelRedimension=findobj('tag','labelRedimension');
 labelRotation=findobj('tag','labelvaleurRotation');

 %les slides
 slideRedimension=findobj('tag','slideRedimension');
 sliderRotation=findobj('tag','sliderRotation');


     %on teste le source d'evenement
     switch src
       case boutonFiltre %la menu est filtre

        set(panelFiltre,'visible','on');
        set(panelCouleur,'visible','off');
        set(panelAjustement,'visible','off');%on hide le panel d'ajustement
        set(panelRogne,'visible','off');%on hide le panel de rognage
        set(AxeImage,'position',[0.18 0.2 0.65 0.65]);
        set(boutonRestor,'visible','off');
        set(boutonRotGauche,'visible','off');
        set(boutonRotDroite,'visible','off');
        set(boutonPivoteVerticale,'visible','off');
        set(boutonPivoteHorizontale,'visible','off');
        set(panelCouleurManuelle,'visible','off');
        set(labelRedimension,'visible','off');
        set(slideRedimension,'visible','off');
        set(panelTraiteSpecial,'visible','off');
        set(boutonRedimension,'visible','off');
        set(comboRedimension,'visible','off');
        set(labelRotation,'visible','off');
        set(sliderRotation,'visible','off');
        set(panel,'visible','off');

      case boutonAjustement % la menu est Ajustement

         set(AxeImage,'position',[0 0.2 0.65 0.65]);%on deplace l'axe image
         set(panelFiltre,'visible','off');%on hide le panel filtre
         set(panelCouleur,'visible','off');
         set(panelRogne,'visible','off');%on hide le panel de rognage
         set(panelAjustement,'visible','on');%on rend visible le panel d'ajustement
         set(boutonRestor,'visible','on');
         set(boutonRotGauche,'visible','off');
         set(boutonRotDroite,'visible','off');
         set(boutonPivoteVerticale,'visible','off');
         set(boutonPivoteHorizontale,'visible','off');
         set(panelCouleurManuelle,'visible','off');
         set(labelRedimension,'visible','off');
         set(slideRedimension,'visible','off');
          set(panelTraiteSpecial,'visible','off');
          set(boutonRedimension,'visible','off');
        set(comboRedimension,'visible','off');
         set(labelRotation,'visible','off');
        set(sliderRotation,'visible','off');
        set(panel,'visible','off');

      case boutonRogne % la menu est rognage

         set(AxeImage,'position',[0.18 0.2 0.65 0.65]);
         set(panelCouleur,'visible','off');
         set(panelFiltre,'visible','off');%on hide le panel filtre
         set(panelAjustement,'visible','off');%on hide le panel d'ajustement
         set(panelRogne,'visible','on');%on rend visible le panel de rognager
         set(boutonRestor,'visible','on');
         set(boutonRotGauche,'visible','on');
         set(boutonRotDroite,'visible','on');
         set(boutonPivoteVerticale,'visible','on');
         set(boutonPivoteHorizontale,'visible','on');
         set(panelCouleurManuelle,'visible','off');
         set(labelRedimension,'visible','on');
         set(slideRedimension,'visible','on');
         set(panelTraiteSpecial,'visible','off');
         set(boutonRedimension,'visible','on');
        set(comboRedimension,'visible','on');
         set(labelRotation,'visible','on');
        set(sliderRotation,'visible','on');
        set(panel,'visible','off');

      case boutonCouleur% la couler d'images

         set(AxeImage,'position',[0.18 0.2 0.65 0.65]);
         set(panelCouleur,'visible','on');
         set(panelFiltre,'visible','off');%on hide le panel filtre
         set(panelAjustement,'visible','off');%on hide le panel d'ajustement
         set(panelRogne,'visible','off');%on rend visible le panel de rognager
         set(boutonRestor,'visible','on');
         set(boutonRotGauche,'visible','off');
         set(boutonRotDroite,'visible','off');
         set(boutonPivoteVerticale,'visible','off');
         set(boutonPivoteHorizontale,'visible','off');
         set(panelCouleurManuelle,'visible','off');
         set(labelRedimension,'visible','off');
         set(slideRedimension,'visible','off');
         set(panelTraiteSpecial,'visible','off');
         set(boutonRedimension,'visible','off');
        set(comboRedimension,'visible','off');
         set(labelRotation,'visible','off');
        set(sliderRotation,'visible','off');
        set(panel,'visible','off');

      case boutonCouleurManuelle%pour la couleur manuel d'un images
         set(AxeImage,'position',[0 0.2 0.65 0.65]);%on deplace l'axe image
         set(panelCouleurManuelle,'visible','on');
         set(panelCouleur,'visible','off');

      case boutonRetourBasicColor% pour faire un retour vers panel couleur
         set(AxeImage,'position',[0.18 0.2 0.65 0.65]);%on deplace l'axe image
         set(panelCouleurManuelle,'visible','off');
         set(panelCouleur,'visible','on');

      case boutonTraiteSpecial% pour aller au panel traitement special
         set(AxeImage,'position',[0.18 0.2 0.65 0.65]);
         set(panelCouleur,'visible','off');
         set(panelFiltre,'visible','off');%on hide le panel filtre
         set(panelAjustement,'visible','off');%on hide le panel d'ajustement
         set(panelRogne,'visible','off');%on rend visible le panel de rognager
         set(boutonRestor,'visible','on');
         set(boutonRotGauche,'visible','off');
         set(boutonRotDroite,'visible','off');
         set(boutonPivoteVerticale,'visible','off');
         set(boutonPivoteHorizontale,'visible','off');
         set(panelCouleurManuelle,'visible','off');
         set(labelRedimension,'visible','off');
         set(slideRedimension,'visible','off');
         set(panelTraiteSpecial,'visible','on');%on affciher le panel
         set(boutonRedimension,'visible','off');
        set(comboRedimension,'visible','off');

     case boutonHistogramme %si l'evenement est l'histogramme (affchages d'un histogramme)

         img=recupImageAxe('axePrincipale');%on recupere l'image dans l'axe

         figure;%on affciher un nouveau figure
         imhist(img);

         xlabel('Niveux de gris'); % pour le label en x
         ylabel('Quantite en pixel');% pour le label en Y
         %on test l'images
         switch img

           case imgOriginale
            title('Histograme: Image originale');
           case imgGris
           title('Histograme :Image en niveaux de gris');
           case imgBinaire
           title('Histograme : Image Binaire');
           case imgNegative
           title('Histograme : Image en negatif ');
          case imgContourDetecte
           title('Histograme : Image en Détection de contour ');
          case imgMasqueCovolutif
           title('Histograme : Image avec masque covolutif ');
          case canaux_rouge
           title('Histograme : isolation du canaux rouge ');
          case canaux_vert
           title('Histograme :isolation du canaux vert ');
          case canaux_bleu
          title('Histograme : isolation du canaux bleu ');
           case imgRouge
           title(sprintf('Histograme : Image en Rouge de valeur = %d',valRouge));
           case imgVert
           title(sprintf('Histograme : Image en Vert de valeur = %d',valVert));
           case imgBleu
           title(sprintf('Histograme : Image en Bleu de valeur = %d',valBleu));
          otherwise %autre ou bien par defaut
           title('Histograme :');

         endswitch


     endswitch
end
