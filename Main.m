%on charger le package image

pkg load image;


%on vide les variables
clear; clc;

%creation d'une fenetre

f=fenetre();% f le fenetre main

%les variables global
global imgOriginale imgNegative imgGris imgBinaire imgMasqueCovolutif imgContourDetecte;
global canaux_rouge canaux_vert canaux_bleu  imgRouge imgVert imgBleu  valRouge valBleu valVert;
global imgFourie img_shiffted F;
global imgRestor;

%les icone des boutons
imgBoutonOpen=imread('icone/open.png');
imgBoutonsave=imread('icone/save.png');
imgBoutonfiltre=imread('icone/filtre.png');
imgBoutonAjustement=imread('icone/ajustement.png');
imgBoutonRogner=imread('icone/crop.png');
imgBoutonSelectionLibre=imread('icone/libre.png');
imgBoutoncouleur=imread('icone/color.png');
imgBoutonRestore=imread('icone/restor.png');
imgBoutonRotationGauche=imread('icone/rotGauche.png');
imgBoutonRotationDroite=imread('icone/rotDroite.png');
imgBoutonPivoteHorizontale=imread('icone/flipHorizontale.png');
imgBoutonPivoteVertical=imread('icone/flipVerticale.png');
imgBoutonTraitementImage=imread('icone/Traitement.png');
imgBoutonHistogrameImage=imread('icone/histo.png');
imgBoutonRedimensionImage=imread('icone/redimension.png');
imgBoutonSaveEtat=imread('icone/save2.png');



%panel menu
panel_menu=panel(f,[0 0.95 1 0.09],[0.6 0.6 0.6],'panelmenu');

distance=50;

%les bouton pour la menu
bouton_ouvrire=uicontrol('style','pushbutton','parent',panel_menu,'string','Ouvrire'
                        ,'position',[10 5 80 25]
                        ,'CData',imgBoutonOpen,
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@chargeImage);
bouton_save=uicontrol('style','pushbutton','parent',panel_menu,'string','Enregistrement'
                        ,'position',[900 5 125 25],'CData',imgBoutonsave,
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                      ,'callback',@saveImage);
bouton_filtre=uicontrol('style','pushbutton','parent',panel_menu,'string','Filtre'
                        ,'position',[160+distance 5 68 25],'CData',imgBoutonfiltre,'tag','boutonFiltre',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);
bouton_ajustement=uicontrol('style','pushbutton','parent',panel_menu,'string','Ajustement'
                        ,'position',[238+distance 5 100 25],'CData',imgBoutonAjustement,'tag','boutonAjustement',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);
bouton_rogner=uicontrol('style','pushbutton','parent',panel_menu,'string','Rogner'
                        ,'position',[348+distance 5 80 25],'CData',imgBoutonRogner,'tag','boutonRogne',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);
bouton_couleur=uicontrol('style','pushbutton','parent',panel_menu,'string','Couleur'
                        ,'position',[438+distance 5 80 25],'CData',imgBoutoncouleur,'tag','boutonCouleur',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);
bouton_traitement=uicontrol('style','pushbutton','parent',panel_menu,'string','Traitement'
                        ,'position',[528+distance 5 100 25],'CData',imgBoutonTraitementImage,'tag','boutonTraitement',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);

bouton_Histograme=uicontrol('style','pushbutton','parent',panel_menu,'string','Histogramme'
                        ,'position',[638+distance 5 110 25],'CData',imgBoutonHistogrameImage,'tag','boutonHistogramme',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);



%axe sur la panel image
axe=axes('parent',f,'position',[0.18 0.2 0.65 0.65],'tag','axePrincipale','visible','on');

%panel pour le filtre
panel_filtre=panel(f,[0.18 0.06 0.65 0.1],[0.12 0.12 0.12],'panelfiltre');
set(panel_filtre,'visible','off');%on hide le panel au debut

bouton_original=uicontrol('style','pushbutton','parent',panel_filtre,'string','Originale'
                        ,'position',[10 25 80 25],'tag','b_Originale',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);
bouton_gris=uicontrol('style','pushbutton','parent',panel_filtre,'string','En Gris'
                        ,'position',[100 25 60 25],'tag','b_Gris',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);
bouton_negatif=uicontrol('style','pushbutton','parent',panel_filtre,'string','Negatif'
                        ,'position',[170 25 70 25],'tag','b_Negatif',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);
bouton_binaire=uicontrol('style','pushbutton','parent',panel_filtre,'string','Binaire'
                        ,'position',[250 25 70 25],'tag','b_Binaire',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);
bouton_masqueCovolutif=uicontrol('style','pushbutton','parent',panel_filtre,'string','Masque convolutif '
                        ,'position',[330 25 120 25],'tag','b_Masque',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);
bouton_Contour=uicontrol('style','pushbutton','parent',panel_filtre,'string','Détection de contours'
                        ,'position',[470 25 130 25],'tag','b_Contour',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@filtrePhoto);

%filtre personaliser par l'utilisateur
panel_filtrePersonaliser=panel(f,[0.68 0.5 0.3 0.2],[0.12 0.12 0.12],'panelFiltrePersonaliser');
set(panel_filtrePersonaliser,'visible','off');%on hide le panel au debut
labelTitre=uicontrol('style','text','parent',panel_filtrePersonaliser,'string','Masque Personaliser:',
                     'foregroundcolor',[1 1 1],'position',[80 110 150 32],'backgroundcolor',[0.6 0.6 0.6]);
textMatrice=uicontrol('style','edit','position',[5 70 300 32],'parent',panel_filtrePersonaliser,'tag','texteMatrice');
bouton_filtreApplique=uicontrol('style','pushbutton','parent',panel_filtrePersonaliser,'string','Appliquer'
                        ,'position',[5 20 80 25],'tag','b_FiltreApplique',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@FiltrePersonaliser);
bouton_filtreRetour=uicontrol('style','pushbutton','parent',panel_filtrePersonaliser,'string','Annuler'
                        ,'position',[220 20 80 25],'tag','b_FiltreRetour',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@FiltrePersonaliser);


%panel pour le couleur
panel_couleur=panel(f,[0.3 0.06 0.40 0.1],[0.12 0.12 0.12],'panelcouleur');
set(panel_couleur,'visible','off');%on hide le panel au debut

bouton_original=uicontrol('style','pushbutton','parent',panel_couleur,'string','Originale'
                        ,'position',[10 25 80 25],'tag','b_original2',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@couleurPhoto);
bouton_Rouge=uicontrol('style','pushbutton','parent',panel_couleur,'string','Isole Rouge'
                        ,'position',[95 25 70 25],'tag','b_rouge',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@couleurPhoto);
bouton_Vert=uicontrol('style','pushbutton','parent',panel_couleur,'string','Isole Vert'
                        ,'position',[170 25 70 25],'tag','b_vert',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@couleurPhoto);
bouton_Bleu=uicontrol('style','pushbutton','parent',panel_couleur,'string','Isole Bleu'
                        ,'position',[250 25 70 25],'tag','b_bleu',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@couleurPhoto);
bouton_Manuelle=uicontrol('style','pushbutton','parent',panel_couleur,'string','Manuelle'
                        ,'position',[330 25 70 25],'tag','b_manuelle',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@switchFonctionalite);
%pour le panel couleur manuelle
panel_couleur_manuelle=panel(f,[0.68 0.3 0.3 0.5],[0.12 0.12 0.12],'panelCouleurManuelle');
set(panel_couleur_manuelle,'visible','off');
labelRouge=uicontrol('style','text','string','Rouge:','parent',panel_couleur_manuelle
                   ,'position',[10 300 80 20],'tag','labelRouge');

slideRouge=uicontrol('style','slider','parent',panel_couleur_manuelle,'min',0,'max',255
                   ,'position',[10 260 290 20],'value',0,'tag','slideRouge','visible','on'
                   ,'callback',@couleurPhoto);

labelVert=uicontrol('style','text','string','Vert:','parent',panel_couleur_manuelle
                   ,'position',[10 210 80 20],'tag','labelVert');

slideVert=uicontrol('style','slider','parent',panel_couleur_manuelle,'min',0,'max',255
                   ,'position',[10 180 290 20],'value',0,'tag','slideVert','visible','on'
                   ,'callback',@couleurPhoto);

labelBleu=uicontrol('style','text','string','Bleu:','parent',panel_couleur_manuelle
                   ,'position',[10 140 80 20],'tag','labelBleu');

slideBleu=uicontrol('style','slider','parent',panel_couleur_manuelle,'min',0,'max',255
                   ,'position',[10 100 290 20],'value',0,'tag','slideBleu','visible','on'
                   ,'callback',@couleurPhoto);

bouton_retourBasicColor=uicontrol('style','pushbutton','string','Retourner en Basic','parent',panel_couleur_manuelle
                   ,'position',[10 30 290 20],'tag','b_retourBasicColor','callback',@switchFonctionalite);



%panel pour Ajustement
panel_ajustement=panel(f,[0.68 0.06 0.3 0.8],[0.12 0.12 0.12],'panelAjustement');
set(panel_ajustement,'visible','off');%on hide le panel au debut


#pour la restoration d’image
bouton_restor=uicontrol('style','pushbutton','parent',f,'string','restorer'
                        ,'position',[10 630 80 32],'visible','on','tag','b_restor',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@restoreImage,'CData',imgBoutonRestore);

bouton_saveEtat=uicontrol('style','pushbutton','parent',f,'string','save Etat'
                          ,'position',[130 630 89 32],'visible','on','tag','b_saveEtat',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@saveEtat,'CData',imgBoutonSaveEtat);

%pour la luminosite

distance_y=30;

titre1=uicontrol('style','text','string','Clair:','parent',panel_ajustement,
                'position',[120 530 80 20]);

labelLum=uicontrol('style','text','string','Luminosité:','parent',panel_ajustement
                   ,'position',[10 520-distance_y 80 20],'tag','labelLuminosite'
                   );
labelvaleurLum=uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 520-distance_y 40 20],'tag','labelvaleurLuminosite'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideLum=uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 490-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideLum');

%pour la constrate
labelContraste=uicontrol('style','text','string','Constraste:','parent',panel_ajustement
                   ,'position',[10 460-distance_y 80 20],'tag','labelConstrate'
                   );
labelvaleurConstraste=uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 460-distance_y 40 20],'tag','labelvaleurConstraste'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideContraste=uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 430-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideContraste');

 %pour le flou
labelFlou=uicontrol('style','text','string','Flou:','parent',panel_ajustement
                   ,'position',[10 400-distance_y 80 20],'tag','labelFlou'
                   );
labelvaleurFlou=uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 400-distance_y 40 20],'tag','labelvaleurFlou'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideFlou=uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 370-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideFlou');
%pour le netete d'image


titre2=uicontrol('style','text','string','Couleur:','parent',panel_ajustement,
                'position',[120 300 80 20]);

labelNettete=uicontrol('style','text','string','Netteté :','parent',panel_ajustement
                   ,'position',[10 290-distance_y 80 20],'tag','labelNettete');

labelvaleurNettete =uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 290-distance_y 40 20],'tag','labelvaleurNettete'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideNettete =uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 250-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideNettete');

%pour le chaleur d'une image

labelChaleur=uicontrol('style','text','string','Chaleur :','parent',panel_ajustement
                   ,'position',[10 210-distance_y 80 20],'tag','labelNettete');

labelvaleurChaleur =uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 210-distance_y 40 20],'tag','labelvaleurChaleur'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideChaleur =uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 180-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideChaleur');

%pour la Saturation d'une image

labelSaturation=uicontrol('style','text','string','Saturation :','parent',panel_ajustement
                   ,'position',[10 140-distance_y 80 20],'tag','labelSaturation');

labelvaleurSaturation =uicontrol('style','text','string','0','parent',panel_ajustement
                   ,'position',[260 140-distance_y 40 20],'tag','labelvaleurSaturation'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideSaturation =uicontrol('style','slider','parent',panel_ajustement,'min',-100,'max',100
                   ,'position',[10 100-distance_y 290 20],'value',0
                   ,'callback',@AjustementImage,'tag','slideSaturation');



%pour la rognager
panelRognage=panel(f,[0.18 0.03 0.65 0.1],[0.12 0.12 0.12],'panelRognage');
set(panelRognage,'visible','off');%on hide le panel au debut

%slider pour une rotation de -45 à 45 degré
labelvaleurRotation =uicontrol('style','text','string','0','parent',f
                   ,'position',[500 130 40 15],'tag','labelvaleurRotation','visible','off'
                   ,'backgroundcolor',[0.12 0.12 0.12],'foregroundcolor',[1 1 1]);
slideRotation =uicontrol('style','slider','parent',f,'min',-45,'max',45
                   ,'position',[185 100 670 20],'value',0,'visible','off'
                   ,'callback',@rotation,'tag','sliderRotation');

%les bouton dans pane Rognager

boutonSelectionLibre=uicontrol('style','pushbutton','parent',panelRognage,'string','Libre'
                        ,'position',[10 25 65 25],'CData',imgBoutonSelectionLibre,
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@selectionLibre);
boutoncrop1=uicontrol('style','pushbutton','parent',panelRognage,'string','1:2'
                        ,'position',[90 25 45 25],'tag','b_croupe1',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop2=uicontrol('style','pushbutton','parent',panelRognage,'string','16:9'
                        ,'position',[150 25 45 25],'tag','b_croupe2',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop3=uicontrol('style','pushbutton','parent',panelRognage,'string','4:3'
                        ,'position',[210 25 45 25],'tag','b_croupe3',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop4=uicontrol('style','pushbutton','parent',panelRognage,'string','9:16'
                        ,'position',[270 25 45 25],'tag','b_croupe4',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop5=uicontrol('style','pushbutton','parent',panelRognage,'string','5:4'
                        ,'position',[330 25 45 25],'tag','b_croupe5',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop6=uicontrol('style','pushbutton','parent',panelRognage,'string','4:5'
                        ,'position',[390 25 45 25],'tag','b_croupe6',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop7=uicontrol('style','pushbutton','parent',panelRognage,'string','4:3'
                        ,'position',[445 25 45 25],'tag','b_croupe7',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop8=uicontrol('style','pushbutton','parent',panelRognage,'string','3:4'
                        ,'position',[500 25 45 25],'tag','b_croupe8',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop9=uicontrol('style','pushbutton','parent',panelRognage,'string','2:3'
                        ,'position',[555 25 45 25],'tag','b_croupe9',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
boutoncrop10=uicontrol('style','pushbutton','parent',panelRognage,'string','5:7'
                        ,'position',[610 25 45 25],'tag','b_croupe10',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@croupe);
%bouton pour faire un rotation
bouton_rotGauche=uicontrol('style','pushbutton','parent',f
                        ,'position',[360 630 32 32],'visible','off','tag','b_rotGauche',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@rotation,'CData',imgBoutonRotationGauche);
bouton_rotDroite=uicontrol('style','pushbutton','parent',f
                        ,'position',[400 630 32 32],'visible','off','tag','b_rotDroite',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@rotation,'CData',imgBoutonRotationDroite);
%bouton faire du reflexion
bouton_PivoteHorizontale=uicontrol('style','pushbutton','parent',f
                        ,'position',[600 630 32 32],'visible','off','tag','b_PivoteHorizontale',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@pivote,'CData',imgBoutonPivoteHorizontale);
bouton_PivoteVerticale=uicontrol('style','pushbutton','parent',f
                        ,'position',[640 630 32 32],'visible','off','tag','b_PivoteVerticale',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@pivote,'CData',imgBoutonPivoteVertical);
%pour la redimension de l'image

ComboRedimension=uicontrol('style','popupmenu','parent',f,
                        'String',TailleImage()
                        ,'position',[850 630 180 32],'visible','off','tag','ComboRedimension',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]);

bouton_Redimension=uicontrol('style','pushbutton','parent',f,'String','Applique'
                        ,'position',[899 580 85 32],'visible','off','tag','b_Redimension',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@RedimensionImage,'CData',imgBoutonRedimensionImage);

%panel pour le traitement special Transfomation de fouries
panel_TraiteSpecial=panel(f,[0.18 0.06 0.65 0.1],[0.12 0.12 0.12],'panelTraiteSpecial');
set(panel_TraiteSpecial,'visible','off');%on hide le panel au debut

bouton_TransformationFourier=uicontrol('style','pushbutton','parent',panel_TraiteSpecial,'string','Transfomation de Fourier'
                        ,'position',[100 25 150 25],'tag','b_fourier',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@TraitementSpecialImage);
bouton_TransformationFourierInverse=uicontrol('style','pushbutton','parent',panel_TraiteSpecial,'string','Transfomation de Fourier Inverse'
                        ,'position',[380 25 190 25],'tag','b_fourier_inverse',
                        'backgroundcolor',[0.6 0.6 0.6],'foregroundcolor',[1 1 1]
                        ,'callback',@TraitementSpecialImage);




