%fonction pour ajouter une filtre au photo

function filtrePhoto(src,event)

 global imgOriginale imgGris imgNegative imgBinaire imgMasqueCovolutif imgContourDetecte;

 b_Original=findobj('tag','b_Originale');%bouton filtre originale
 b_Gris=findobj('tag','b_Gris');%bouton filtre niveaux de gris
 b_Negatif=findobj('tag','b_Negatif');%bouton filtre negatif
 b_Binaire=findobj('tag','b_Binaire');%bouton filtre binaire
 b_Masque=findobj('tag','b_Masque');%bouton pour filtre aussi pour faire une masque covolutif d'image
 b_Contour=findobj('tag','b_Contour');%bouton pour filtre aussi pour faire une detection de contours

 axe=findobj('tag','axePrincipale'); %on recuperes l'axes elles meme
 imgRecup=recupImageAxe('axePrincipale');%on recuperes l'images dans l'axes


%on teste le bouton source d'evenement
 switch src
   case b_Original
      %on preparer l'axe
      axes(axe);
      %on afficher l'images originales
      imshow(imgOriginale,'parent',axe);

   case b_Gris

      if isequal(size(imgOriginale),size(imgRecup))%on test si l'image a traite est egale au image originale

        imgGris=rgb2gray(imgOriginale);%on changer en niveaux de gris l'image originale
        %on preparer l'axe
        axes(axe);
        %on afficher l'images en niveax de gris
        imshow(imgGris,'parent',axe);

        else% sinon
         imgGris=rgb2gray(imgRecup);%on changer en niveaux de gris l'image dans l'axe
         %on preparer l'axe
         axes(axe);
        %on afficher l'images en niveax de gris
         imshow(imgGris,'parent',axe);
      end
   case b_Negatif

       if isequal(size(imgOriginale),size(imgRecup))%on test si l'image a traite est egale au image originale
        imgNegative=255-imgOriginale;%on changer en negatif l'image originale
          %on preparer l'axe
          axes(axe);
          %on afficher l'images negatif
        imshow(imgNegative,'parent',axe);

        else%sinon
          imgNegative=255-imgRecup;%on changer en niveaux de gris l'image dans l'axe
          %on preparer l'axe
          axes(axe);
          %on afficher l'images negatif
          imshow(imgNegative,'parent',axe);
      end

   case b_Binaire

          if isequal(size(imgOriginale),size(imgRecup))%on test si l'image a traite est egale au image originale
            imgBinaire=im2bw(imgOriginale,0.5);% avec seuil 0.5 (50%),on changer en une images binaire(0,1) l'image originale
            %on preparer l'axe
             axes(axe);
             %on afficher l'images binaire
            imshow(imgBinaire,'parent',axe);

           else%sinon
             imgBinaire=im2bw(imgRecup,0.5);%avec seuil 0.5 (50%),on changer en niveaux de gris l'image dans l'axe
              %on preparer l'axe
              axes(axe);
             %on afficher l'images binaire
              imshow(imgBinaire,'parent',axe);
      end
  case b_Masque

         choix=Type_masque_covolutif();%on afficher une messages au utilisateurs

         switch choix
           case 'Par defaut'
                if isequal(size(imgOriginale),size(imgRecup))%images vaut image originale

                      noyau=fspecial('sobel'); % on creer un noyau de type sobel

                      imgMasqueCovolutif=MasqueCovolutif (imgOriginale, noyau);%on ammplique la msque covolutif
                      %on prepare l'axe
                      axes(axe);
                      %on afficher l'images
                      imshow(imgMasqueCovolutif,'parent',axe);
                       else %sinon images vaut image dans l'axes
                        noyau=fspecial('sobel');% on creer un noyau de type sobel

                        imgMasqueCovolutif=MasqueCovolutif (imgRecup, noyau);%on ammplique la msque covolutif
                        %on prepare l'axe
                        axes(axe);
                        %on afficher l'images
                        imshow(imgMasqueCovolutif,'parent',axe);
                end
           case 'Personaliser'

                panel=findobj('tag','panelFiltrePersonaliser');%on get le panel correspodant
                set(axe,'position',[0 0.2 0.65 0.65]);
                set(panel,'visible','on');%on l'afficher


         endswitch



 case b_Contour

          if isequal(size(imgRecup),size(imgGris))%on teste si limage dans l'axe est en niveaux de gris


            methode=Type_de_Detetion_Contour();% on affiche les  different methodes aux utilisateurs

            switch methode

            case 'Sobel'
                imgContourDetecte=edge(imgGris,'Sobel'); % methode sobel
                %on prepare l'axe
                axes(axe);
                %on afficher l'images traites
                imshow(imgContourDetecte,'parent',axe);
            case 'Canny'
                imgContourDetecte=edge(imgGris,'Canny');% methode canny
                %on prepare l'axe
                axes(axe);
                %on afficher l'images traites
                imshow(imgContourDetecte,'parent',axe);
            case 'Prewitt'
                imgContourDetecte=edge(imgGris,'Prewitt');% methode Prewitt
                %on prepare l'axe
                axes(axe);
                %on afficher l'images traites
                imshow(imgContourDetecte,'parent',axe);

            endswitch

             else%si l'images n'est en nivaux de gris en le transforme d'abord

            warndlg('Changement de image en niveaux de girs.! Ressayer maintenant', 'Avertissement');
             imgGris=rgb2gray(imgOriginale);
             axes(axe);
             imshow(imgGris,'parent',axe);

       end

 endswitch



end
