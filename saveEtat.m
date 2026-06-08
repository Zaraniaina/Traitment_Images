#fonction pour save etat d'une images

function  saveEtat (src, event)

 global imgOriginale; %on utiliser la varibale global

 img=recupImageAxe('axePrincipale');%on recuperes l'images de l'axePrincipale

 imgOriginale=img;%on affecte l'images dans le variables globals

endfunction
