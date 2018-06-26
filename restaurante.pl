homem(eliezer).
homem(esdras).

mulher(ester).
mulher(eunice).

prato_principal(picanha_argentina).
prato_principal(lasanha).
prato_principal(frango).
prato_principal(pizza).

bebida(agua).
bebida(cafe).
bebida(leite).
bebida(suco_graviola).

defrente(X,Y):-mulher(X),mulher(Y),\+(X = Y)
;homem(X),homem(Y),\+(X = Y).

aolado(X,Y):-homem(X),mulher(Y),\+(X = Y)
;mulher(X),homem(Y),\+(X = Y).

comeu(X,Y):- homem(X),prato_principal(Y),\+(naocomeu(X,Y))
;mulher(X),prato_principal(Y).

naocomeu(X,Y):- (X = eliezer),(Y = picanha_argentina).

bebeu(X,Y):-homem(X),bebida(Y),\+(Y = agua),\+(naobebe(X,Y))
;sobebe(X,Y).

naobebe(X,Y):- (X = esdras),(Y = cafe).

sobebe(X,Y):- (X = ester),(Y = agua)
;(X = eunice),(Y = cafe)
;(X = eunice),(Y = leite)
;(X = eunice),(Y = suco_graviola).

come_picanha(X):- comeu(X,picanha_argentina),aolado(X,eunice).
come_lasanha(X):- comeu(X,lasanha),bebe_leite(Y),defrente(X,Y).
comeu_frango(X):- comeu(X,frango),bebeu(X,suco_graviola),\+(come_picanha(X)).
come_frango(X):- comeu_frango(X),\+(come_lasanha(X)).
come_pizza(X):- comeu(X,pizza),\+(come_picanha(X)),\+(come_lasanha(X)),\+(come_frango(X)).

bebe_agua(X):- bebeu(X,agua).
bebe_leite(X):- bebeu(X,leite),\+(comeu_frango(X)).
bebe_cafe(X):- bebeu(X,cafe),\+(bebe_leite(X)),\+(come_frango(X)).
bebe_suco(X):- come_frango(X).

refeicao(X,Y,Z):- come_picanha(X),(Y ='Picanha Argentina')
;come_lasanha(X),(Y ='Lasanha')
;come_frango(X),(Y ='Frango')
;come_pizza(X),(Y ='Pizza')
;bebe_agua(X),(Z = 'Agua')
;bebe_leite(X),(Z = 'Leite')
;bebe_cafe(X),(Z = 'Cafe')
;bebe_suco(X),(Z = 'Suco de Graviola').