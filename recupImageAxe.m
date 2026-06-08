%fonctin pour recuperer l'images dans une axe qui prend comme argument la tag  del'axe en question
function img = recupImageAxe (tag)

    axe=findobj('tag',tag);%on recuperer l'axe

    axeChild=get(axe,'children');%on recuperer l'enfant de l'axe

    img=get(axeChild(1),'CData');%on retourne l'image contenue dans l'axe

end
