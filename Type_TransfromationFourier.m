
%fonction pour faire une choix parimis les transformaton de fourier
function choix = Type_TransfromationFourier ()

  choix=questdlg('Applique quelle type de transformaton de Fourier?','Question',
                  'Fourier','Spectre d amplitude','Spectre de phase','Fourier');

endfunction
