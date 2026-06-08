%Fonction pour traite les adjustements
function AjustementImage (src,event)
   global imgOriginale imgGris;

    val=round(get(src,'value'));%on recuperer chaque valeur de slider

    axe=findobj('tag','axePrincipale');%on recuperer l'axe
    img=recupImageAxe('axePrincipale');%on recuperer l'image dans  l'axePrincipale


    %les label valeur concerner
    labelLuminoste=findobj('tag','labelvaleurLuminosite');
    labelContraste=findobj('tag','labelvaleurConstraste');
    labelFlou=findobj('tag','labelvaleurFlou');
    labelNettete=findobj('tag','labelvaleurNettete');
    labelChaleur=findobj('tag','labelvaleurChaleur');
    labelSaturation=findobj('tag','labelvaleurSaturation');


    %les slider concerner
     slideLuminosite=findobj('tag','slideLum');
     slideContraste=findobj('tag','slideContraste');
     slideFlou=findobj('tag','slideFlou');
     slideNettete=findobj('tag','slideNettete');
     slideChaleur=findobj('tag','slideChaleur');
     slideSaturation=findobj('tag','slideSaturation');


    %on teste le src d'evenement
   switch src

   case slideLuminosite %pour la luminosite de l'image
 if isequal(size(img),size(imgOriginale))

           if val>0

                  imgLight=imgOriginale+val;
                  imgLight=min(imgLight ,255);

                  axes(axe);%on prepare l'axe

                  imshow(uint8(imgLight),'parent',axe);
                  set(labelLuminoste,'string',sprintf('%d',val));

                elseif val==0
                  axes(axe);%on prepare l'axe

                  imshow(uint8(imgOriginale),'parent',axe);
                  set(labelLuminoste,'string',sprintf('%d',val));

                else

                   imgDark=imgOriginale+val;
                   imgDark=max(imgDark,0);

                   axes(axe);%on prepare l'axe

                   imshow(uint8(imgDark),'parent',axe);
                   set(labelLuminoste,'string',sprintf('%d',val));
           end

 elseif isequal(size(img),size(imgGris))

              if val>0
                    imgLight=imgGris+val;
                    imgLight=min(imgLight ,255);

                    axes(axe);%on prepare l'axe

                    imshow(uint8(imgLight),'parent',axe);
                    set(labelLuminoste,'string',sprintf('%d',val));


                  elseif val==0
                    axes(axe);%on prepare l'axe

                    imshow(uint8(imgGris),'parent',axe);
                    set(labelLuminoste,'string',sprintf('%d',val));

                  else
                     imgDark=imgGris+val;
                     imgDark=max(imgDark,0);

                     axes(axe);%on prepare l'axe

                     imshow(uint8(imgDark),'parent',axe);
                     set(labelLuminoste,'string',sprintf('%d',val));
              end

 end

     case slideContraste %pour le contaste de l'image

     ratio=abs(val/100);% la valeur absolu


    if isequal(size(img),size(imgOriginale))

         if val>=1

            img_contraste=(1+ratio)*imgOriginale;

           imshow(uint8(img_contraste),'parent',axe);

           set(labelContraste,'string',sprintf('%d',val));

         elseif val==0
              imshow(uint8(imgOriginale),'parent',axe);

              set(labelContraste,'string',sprintf('%d',val));

          else

            img_contraste=(1.2-ratio)*imgOriginale;

            imshow(uint8(img_contraste),'parent',axe);

            set(labelContraste,'string',sprintf('%d',val));

         end
    end

   case slideFlou  %pour le flou

  ratio = val / 30;
  mosaique=120;

  if val>0
    imgTraite = imgaussfilt (imgOriginale, ratio);
    axes (axe);
    imshow (imgTraite, 'parent', axe);
    set(labelFlou,'string',sprintf('%d',val));

 elseif val<0

    r=(mosaique+val)/100;

    imgTraite = imresize(imgOriginale,r);
    axes (axe);
    imshow (imgTraite, 'parent', axe);
    set(labelFlou,'string',sprintf('%d',val));
  end

   case slideNettete

      ratio=(val/100);
   sigma=abs(val/40);% valeur absolue du val/40 pour un blur pas au maximum


    if isequal(size(img),size(imgOriginale))

      if val==0

         axes(axe);

         imshow(imgOriginale,'parent',axe);

         set(labelNettete,'string',sprintf('%d',val));

         elseif  val>0

         img_blure=imgaussfilt(imgOriginale,sigma);

         amount=ratio; %force d'aiguisage

         mask=imgOriginale-img_blure;%detail haut frequence

         img_nettete=imgOriginale+amount*mask;

         img_nettete=min(max(img_nettete,0),255);

             axes(axe);

             imshow(img_nettete,'parent',axe);

             set(labelNettete,'string',sprintf('%d',val));

         else% valeur negatif

             img_nettete=imgaussfilt(imgOriginale,sigma);
             axes(axe);

             imshow(img_nettete,'parent',axe);

             set(labelNettete,'string',sprintf('%d',val));

      end

    elseif  isequal(size(img),size(imgGris))

    if val==0

         axes(axe);

         imshow(imgGris,'parent',axe);

         set(labelNettete,'string',sprintf('%d',val));

         elseif  val>0

         img_blure=imgaussfilt(imgGris,sigma);%on met une filtre gaussien pour le flou
         amount=ratio; %force d'aiguisage

         mask=imgOriginale-img_blure;%detail haut frequence

         img_nettete=imgGris+amount*mask;% img nettete = img + amount x mask

         img_nettete=min(max(img_nettete,0),255);

             axes(axe);

             imshow(img_nettete,'parent',axe);

             set(labelval,'string',sprintf('%d',val));

         else% valeur negatif

             img_nettete=imgaussfilt(imgGris,sigma);
             axes(axe);

             imshow(img_nettete,'parent',axe);

             set(labelNettete,'string',sprintf('%d',val));
       end
    end


   case slideChaleur % pour la chaleur de l'image

      ratio=abs(val/100);

          if isequal(size(img),size(imgOriginale))


                if val>0 % valeur positif image chaud

                  R=1+ratio;%gain en rouge
                  V=1;%peu utiliser
                  B=1-ratio;%perd en bleu


                  img(:,:,1)=imgOriginale(:,:,1)*R;
                  img(:,:,2)=imgOriginale(:,:,2)*V;
                  img(:,:,3)=imgOriginale(:,:,3)*B;

                  img=min(max(img,0),255);

                  imshow(img,'parent',axe);
                  set(labelChaleur,'string',sprintf('%d',val));

              elseif val==0 %image origianel

                  imshow(imgOriginale,'parent',axe);
                  set(labelChaleur,'string',sprintf('%d',val));

               else% valeur negatif image froid
                   R=1-ratio;%perd en rouge
                   V=1;%peu utiliser
                   B=1+ratio;%gain en bleu


                  img(:,:,1)=imgOriginale(:,:,1)*R;
                  img(:,:,2)=imgOriginale(:,:,2)*V;
                  img(:,:,3)=imgOriginale(:,:,3)*B;

                  img=min(max(img,0),255);

                  imshow(img,'parent',axe);
                  set(labelChaleur,'string',sprintf('%d',val));

                end

          else

              errordlg('Image non couleur!','Erreur!');

        end

  case slideSaturation % pour la saturation d'un image
     if isequal(size(img),size(imgOriginale))

     ratio=(val/100);

         if val>0

                facteur=1+ratio;% image sature superieur à 1

                imshow(AjustementSaturation(imgOriginale,facteur),'parent',axe);
                set(labelSaturation,'string',sprintf('%d',val));


          elseif val==0
                imshow(imgOriginale,'parent',axe);
                set(labelSaturation,'string',sprintf('%d',val));

          else
          %facteur negatif image désature (gris)
               imshow(AjustementSaturation(imgOriginale,ratio),'parent',axe);
                set(labelSaturation,'string',sprintf('%d',val));

         end


     end

   endswitch

end
