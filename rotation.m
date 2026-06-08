%fonction pour controle la rotation d'une image
function rotation(src,event)


   global imgOriginale;

  %je recupere les bouton concerner
    boutonRotGauche=findobj('tag','b_rotGauche');%bouton rotation 90 de gauche
    boutonRotDroite=findobj('tag','b_rotDroite');%bouton rotation 90 de droite

    %on recuperer l'image dans l'axe
    imgTraite=recupImageAxe('axePrincipale');
    % l'axe de l'image
    axe=findobj('tag','axePrincipale');

    %slider rotation 45
    sliderRotation=findobj('tag','sliderRotation');
    %le la label valeur
    label=findobj('tag','labelvaleurRotation');


    %on teste le source d'evenement

     switch src
       case boutonRotGauche

         % rotation depart en  gauche

         imgRotGauche=imrotate(imgTraite,90);%on applique la rotaion sur l'image de 90 degree
            %on afficher l'images
         imshow(imgRotGauche,'parent',axe);;

      case boutonRotDroite

          % rotation depart en  droite

         imgRotDroite=imrotate(imgTraite,-90);%on applique la rotaion sur l'image de -90 degree
            %on afficher l'images
         imshow(imgRotDroite,'parent',axe);

     case sliderRotation % rotation entre -45 et 45

         degree=round(get(sliderRotation,'value'));% on recuperer la valeur du slide

         imgRot=imrotate(imgOriginale,degree);%on applique la rotaion sur l'image
         %on afficher l'images
         imshow(imgRot,'parent',axe);
         %on afficher la valeur du slider
         set(label,'string',sprintf('%d',degree));

     endswitch




end
