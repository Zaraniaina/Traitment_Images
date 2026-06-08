% fonction pour rognage predefinie
function croupe (src, event)

    global imgOriginale ;% on utiliser la variable global

    axe=findobj('tag','axePrincipale');%on recuperer l'axe
    img=recupImageAxe('axePrincipale');%on recuperer l'image dans  l'axePrincipale


    %les bouton cropage
    b_croupe1=findobj('tag','b_croupe1');%1:2
    b_croupe2=findobj('tag','b_croupe2');%16:9
    b_croupe3=findobj('tag','b_croupe3');%4:3
    b_croupe4=findobj('tag','b_croupe4');%9:16
    b_croupe5=findobj('tag','b_croupe5');%5:4
    b_croupe6=findobj('tag','b_croupe6');%4:5
    b_croupe7=findobj('tag','b_croupe7');%4:3
    b_croupe8=findobj('tag','b_croupe8');3:4
    b_croupe9=findobj('tag','b_croupe9');%2:3
    b_croupe10=findobj('tag','b_croupe10');%5:7



    %on teste le source d'evenement
    switch src
      case b_croupe1 %1:2
           ratio=1/2; %calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);

      case b_croupe2 %16:9
           ratio=16/9;%calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
     case b_croupe3 %4:3
           ratio=4/3;%calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);

      case b_croupe4% 9:16
           ratio=9/16; %calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);      case b_croupe5 %5:4
           ratio=5/4; %calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
            %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
      case b_croupe6 %4:5
           ratio=4/5; %calcules le rations
           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
      case b_croupe7 %4:3
           ratio=4/3; %calcules le rations
%on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
            %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
      case b_croupe8 %3:4
           ratio=3/4;

          %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
      case b_croupe9 %2:3
           ratio=2/3; %calcules le rations

         %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
      case b_croupe10%5:7
           ratio=5/7; %calcules le rations

           %on croupe l'image
           imgCroupe=specialCroup(imgOriginale,ratio);
           %on prepare l'axe
           axes(axe);
           %on afficher l'images
           imshow(imgCroupe,'parent',axe);
    endswitch

endfunction

