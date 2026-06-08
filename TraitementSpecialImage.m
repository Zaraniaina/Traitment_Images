%fonction pour faire les different traitement spcecifique d'un image

function TraitementSpecialImage (src, event)

  global imgOriginale imgGris imgFourie img_shiffted F;

  ## on recuperer l'axe
  axe = findobj ('tag', 'axePrincipale');
  img=recupImageAxe('axePrincipale');%on recuperer l'image dans l'axe


  %les boutoun d'evenement
  b_fourier=findobj ('tag', 'b_fourier');
  b_fourier_inverse=findobj ('tag', 'b_fourier_inverse');

  %on fait les traitements de fourier
     F=fft2(im2double(imgGris)); %transformation de fourier 2d
     img_shiffted=fftshift(F);%centrage du spectre

%on teste le source d'evenement
  switch src

  case b_fourier

            if isequal(size(img),size(imgGris))%on teste si l'image est en niveaux de gris ou pas
             %si au nivaux gris
            choix=Type_TransfromationFourier();%on affique une dialog de question

             switch choix

                 case 'Fourier'

                 imgFourie=F; %on affecte le fourier de l'images
                  %on preparer l'axe
                  axes(axe);
                  %on affiche le fouriner simple de l'image
                 imshow(imgFourie,'parent',axe);
                 case 'Spectre d amplitude'
                 imgFourie=log(1+ abs(img_shiffted));%l'image spectral d'amplitude
                  %on preparer l'axe
                 axes(axe);
                  %on affiche le fouriner en spectre d' amplitude
                 imshow(mat2gray(imgFourie),'parent',axe);

               case 'Spectre de phase'

                 imgFourie=angle(img_shiffted);%on effecter mise en spetre de fourier qui est en Spectre d amplitude
                  %on preparer l'axe
                 axes(axe);
                  %on affiche le fouriner en spectre de phase
                 imshow(mat2gray(imgFourie),'parent',axe);

             endswitch


          else % sinon on transforme en niveaux de gris d'abord

             warndlg('Changement de l image en niveaux de girs! Veuillez-ressayer maintenant.', 'Avertissement');
                imgGris=rgb2gray(imgOriginale);
                axes(axe);
                imshow(imgGris,'parent',axe);

          end


  case b_fourier_inverse % la trasfomation de fourier inverse


    img_reconstruction=ifft2(im2double(F));%on fait la transformation inverse de fourier
     %on preparer l'axe
    axes(axe);
    %on affiche le fouriner inverse (generalement en doit avoire une images en nivaux de gris)
    imshow(img_reconstruction,'parent',axe);

  endswitch




endfunction
