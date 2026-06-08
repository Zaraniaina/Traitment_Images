%fonction pour faire une choix entre les methodes Sobel, Prewitt, Canny.
function choix = Type_de_Detetion_Contour()

         choix=questdlg('Détèction de contour par la methode ?'
                        ,'Question'
                        ,'Canny','Prewitt','Sobel','Sobel');%par defaut Sobel

endfunction
