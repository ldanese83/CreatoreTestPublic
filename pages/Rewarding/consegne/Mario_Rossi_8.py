import random
s=0#selezioner
cn=0#contatore navi piazzate
ci=False#contatore incrociatori piazzate
cc=False#contatore corazzate piazzate
lg=[]#scheda giocatore
la=[]#scheda aversario computer
lv=[]#scheda visualizzata dal giocatore dove non sono segnate le posizioni della navi
for count in range(0,5,1):#creazione matrice 5 righe
    l1=[0]*5#creazione 5 colonne
    lg.append(l1)
for count in range(0,5,1):#creazione matrice 5 righe
    l1=[0]*5#creazione 5 colonne
    la.append(l1)
for count in range(0,5,1):#creazione matrice 5 righe
    l1=[0]*5#creazione 5 colonne
    lv.append(l1)
nig=1#navi incrociatori giocatore 2 spazzi
nia=1#navi incrociatori avversario 2 spazzi
cg=1#corazzate giocatore 3 spazzi
ca=1#corazzate giocatore 3 spazzi
ng=5#navi giocatore
na=3#navi avversario
ag=5#navi affondate giocatore
aa=5#navi affondate avversario
tmg=20#tentativi massimi giocatore
tma=20#tentativi massimi avversario
da=random.randint(0,1)#incrociatore aversario
if da==1:
    r=random.randint(0,4)
    c=random.randint(0,3)
    la[r][c]=2
    la[r][c+1]=2
else:
    r=random.randint(0,3)
    c=random.randint(0,4)
    la[r][c]=2
    la[r+1][c]=2
da=random.randint(0,1)#corazzata aversaria
pa=False#piazzamento avenuto corretamnete
while pa!=True:
    if da==1:
        r=random.randint(0,4)
        c=random.randint(0,2)
        if la[r][c]!=0 or la[r][c+1]!=0 or la[r][c+2]!=0:#controlla che non si sovrapongano
            print()
        else:
            la[r][c]=3
            la[r][c+1]=3
            la[r][c+2]=3
            pa=True
    else:
        r=random.randint(0,2)
        c=random.randint(0,4)
        if la[r][c]!=0 or la[r+1][c]!=0 or la[r+2][c]!=0:#controlla che non si sovrapongano
            print()
        else:
            la[r][c]=3
            la[r+1][c]=3
            la[r+2][c]=3
            pa=True
while na!=0:#piazamento delle navi dell'aversario
    r=random.randint(0,4)
    c=random.randint(0,4)
    if la[r][c]!=0:
        print()
    else:
        la[r][c]=1
        na-=1
print("gioco della battaglia navale seleziona dove piazzare le tue navi hai 1 incrociatore da 2 spazzi una corazzata da 3 spazzi e 3 navi da 1 spazio")
while s!=-1:#continua finche non viene inserito -1
    if ng==0:
        print("hai inserito tutte le navi")
        break
    s=int(input("seleziona la nave da piazzare scrivendo gli spazzi della nave scelta(-1 per terminare)"))#fa selezionare la nave da piazzare
    if s==-1:#controlla che non sia -1
        print("termina programma")
        break
    elif s<1 or s>3:#controlla che sia valido
        print("non esistono navi di quelle dimensioni")
        continue
    elif s==1:#se si vuole piazzare una nave da 1
        if cn==3:#se si sono gia inserite 3 navi normali
            print("hai gia inserito le navi")
        r=int(input("inserire la riga da 1 a 5"))
        if r<1 or r>5:
            print("valore non valdo inserire di nuovo il valore")
        else:
            c=int(input("inserire la colonna da 1 a 5"))
            if c<1 or c>5:
                print("valore non valdo inserire di nuovo il valore")
            elif lg[r-1][c-1]!=0:#controlla che non si sofrapongano
                print("hai gia inserito una nave qui")
                continue
            else:#inserisce la nave e aumenta i contatori
                lg[r-1][c-1]=1
                cn+=1
                ng-=1
                for r in range(0,5,1):#scrive la griglia
                    print()
                    for c in range(0,5,1):
                        print(lg[r][c], end=' ')
                print()
    elif s==2:#nel caso venga scelto l'incrociatore
        if ci==True:#cosi non puo essere riscelto 
            print("hai gia inserito l'incrociatore")
            continue
        d=int(input("inserimento verticale=1,inserimento orizontale=0"))#sceglie la direzione
        if d==1:#se verticale
            r=int(input("inserire la riga da 1 a 5"))
            if r<1 or r>5:
                print("valore non valdo inserire di nuovo il valore")
            else:
                c=int(input("inserire la colonna da 1 a 4"))
                if c<1 or c>4:
                    print("valore non valdo inserire di nuovo il valore")
                elif lg[r-1][c-1]!=0 or lg[r-1][c]!=0:#controlla che non si sovrapongano
                    print("gia inserita una nave qui")
                else:#inserisce la nave e aumenta i contatori
                    lg[r-1][c-1]=2
                    lg[r-1][c]=2
                    ng-=1
                    ci=True
                    for r in range(0,5,1):# scrive la griglia
                        print()
                        for c in range(0,5,1):
                            print(lg[r][c], end=' ')
                    print()
        elif d==0:#se orizontale
            r=int(input("inserire la riga da 1 a 4"))
            if r<1 or r>4:
                print("valore non valdo inserire di nuovo il valore")
            else:
                c=int(input("inserire la colonna da 1 a 5"))
                if c<1 or c>5:
                    print("valore non valdo inserire di nuovo il valore")
                elif lg[r-1][c-1]!=0 or lg[r][c-1]!=0:#controlla che non si sovrapongano
                    print("gia inserita una nave qui")
                else:#inserisce la nave e aumenta i contatori
                    lg[r-1][c-1]=2
                    lg[r][c-1]=2
                    ng-=1
                    ci=True
                    for r in range(0,5,1):# scrive la griglia
                        print()
                        for c in range(0,5,1):
                            print(lg[r][c], end=' ')
                    print()
        else:#se non si sceglie orizontale o verticale
            print("inserire o 1 o 0")
            continue
    elif cc!=True:#se si sceglie la corazzata
        d=int(input("inserimento verticale=1,inserimento orizontale=0"))#sceglie la direzione
        if d==1:#se verticale
            r=int(input("inserire la riga da 1 a 5"))
            if r<1 or r>5:
                print("valore non valdo inserire di nuovo il valore")
            else:
                c=int(input("inserire la colonna da 1 a 3"))
                if c<1 or c>3:
                    print("valore non valdo inserire di nuovo il valore")
                elif lg[r-1][c-1]!=0 or lg[r-1][c]!=0 or lg[r-1][c+1]!=0:#controlla che non si sovrapongano
                    print("gia inserita una nave qui")
                else:#inserisce la nave e aumenta i contatori
                    lg[r-1][c-1]=3
                    lg[r-1][c]=3
                    lg[r-1][c+1]=3
                    cc=True
                    ng-=1
                    for r in range(0,5,1):# scrive la griglia
                        print()
                        for c in range(0,5,1):
                            print(lg[r][c], end=' ')
                    print()
        elif d==0:#se orizontale
            r=int(input("inserire la riga da 1 a 3"))
            if r<1 or r>3:
                print("valore non valdo inserire di nuovo il valore")
            else:
                c=int(input("inserire la colonna da 1 a 5"))
                if c<1 or c>5:
                    print("valore non valdo inserire di nuovo il valore")
                elif lg[r-1][c-1]!=0 or lg[r][c-1]!=0 or lg[r+1][c-1]!=0:#controlla che non si sovrapongano
                    print("gia inserita una nave qui")
                else:#inserisce la nave e aumenta i contatori
                    lg[r-1][c-1]=3
                    lg[r][c-1]=3
                    lg[r+1][c-1]=3
                    cc=True
                    ng-=1
                    for r in range(0,5,1):# scrive la griglia
                        print()
                        for c in range(0,5,1):
                            print(lg[r][c], end=' ')
                    print()
    else:
        print("hai gia inserito la corazzata")
print("la tua lista")#scrive la griglia giocatore
for r in range(0,5,1):
    print()
    for c in range(0,5,1):
        print(lg[r][c], end=' ')
print()
print("lista avversario")#scrive la griglia avversario
for r in range(0,5,1):
    print()
    for c in range(0,5,1):
        print(lv[r][c], end=' ')
print()
ai=False#incrociatore aversario afoondato
ac=3#corazzata aversario affondato
aia=False#incrociatore affondato
acra=3#corazzata affondata
print("casella ignota=0, nave piccola=1, incrociatore=2, corazzata=3, nave copita=4, acqua=5, copita ed affondata=6")
while r!=-1 or c!=-1:#inizi ad attacare le navi aversario
    r=int(input("inserire la riga da colpire da 1 a 5(-1 per terminare)"))
    if r==-1 or c==-1:#controlla se il giocatore vuole uscire dal gioco
        print("hai terminato")
        break
    elif r<1 or r>5:#controlla se i valori sono validi
        print("valore non valdo inserire di nuovo il valore")
    else:
        c=int(input("inserire la colonna da colpire da 1 a 5(-1 per terminare)"))
        if r==-1 or c==-1:#controlla se il giocatore vuole uscire dal gioco
            print("hai terminato")
            break
        elif c<1 or c>5:#controlla se i valori sono validi
            print("valore non valdo inserire di nuovo il valore")
        elif la[r-1][c-1]==0:#se non ce la nave
            print("acqua")
            tmg-=1#tentativi meno 1
            la[r-1][c-1]=5
            lv[r-1][c-1]=5
            if tmg==0:#se ci hai messo troppi tentativi
                print("hai perso, ecco dove erano le navi")
                for r in range(0,5,1):
                    print()
                    for c in range(0,5,1):
                        print(la[r][c], end=' ')
                break
        elif la[r-1][c-1]==1:#se  hai colpito la nave
            print("nave colpita ed affondata")
            aa-=1#diminuisce le navi da affondare
            la[r-1][c-1]=6
            lv[r-1][c-1]=6
            if aa==0:#se il giocatore ha affondato tutte le navi
                print(f"hai vinto con {tmg} tentativi rimasti")
                break
        elif la[r-1][c-1]==2:
            if ai!=True:
                ai=True
                print("colpita una nave")
                la[r-1][c-1]=4
                lv[r-1][c-1]=4
                ir=r
                ic=c
            else:
                print("colpita ed affondata")
                aa-=1
                la[r-1][c-1]=6
                lv[r-1][c-1]=6
                la[ir-1][ic-1]=6
                lv[ir-1][ic-1]=6
                if aa==0:#se il giocatore ha affondato tutte le navi
                    print(f"hai vinto con {tmg} tentativi rimasti")
                    break
        elif la[r-1][c-1]==3:
            if ac==3:
                ac-=1
                print("colpita una nave")
                la[r-1][c-1]=4
                lv[r-1][c-1]=4
                cr=r
                cc=c
            elif ac==2:
                ac-=1
                print("colpita una nave")
                la[r-1][c-1]=4
                lv[r-1][c-1]=4
                cr2=r
                cc2=c
            else:
                print("colpita ed affondata")
                aa-=1
                la[r-1][c-1]=6
                lv[r-1][c-1]=6
                la[cr-1][cc-1]=6
                lv[cr-1][cc-1]=6
                la[cr2-1][cc2-1]=6
                lv[cr2-1][cc2-1]=6
                if aa==0:#se il giocatore ha affondato tutte le navi
                    print(f"hai vinto con {tmg} tentativi rimasti")
                    break
        else:#se copisce un punto gia colpito
            print("hai gia colpito quel punto")
        r=random.randint(0,4)#riga randomica dell'aversario
        c=random.randint(0,4)#colonna randomica dell'aversario
        if lg[r][c]==0:#se non ha colpito niente 
            lg[r][c]=5
            print("l'aversario ha sbagliato")
        elif lg[r][c]==1:#se ha colpito la nave del giocatore
            ag-=1#diminuiscono le navi da affondare
            lg[r][c]=6
            if ag==0:#se l'aversario elimina tutte le navi
                print("l'aversario ha affondato tutte le tue navi hai perso")
                print("lista avversario")#scrive la griglia dell'aversario
                for r in range(0,5,1):
                    print()
                    for c in range(0,5,1):
                        print(la[r][c], end=' ')
                    break
            print("l'aversario ti ha colpito in pieno")
        elif lg[r][c]==2:
            if aia!=True:
                aia=True
                lg[r][c]=4
                ara=r
                aca=c
            else:
                ag-=1
                lg[r][c]=6
                lg[ara][aca]=6
            if ag==0:#se l'aversario elimina tutte le navi
                print("l'aversario ha affondato tutte le tue navi hai perso")
                print("lista avversario")#scrive la griglia dell'aversario
                for r in range(0,5,1):
                    print()
                    for c in range(0,5,1):
                        print(la[r][c], end=' ')
                    break
        elif la[r][c]==3:
            if acra==3:
                acra-=1
                print("l'aversario ha colpito la corazzata")
                lg[r][c]=4
                cra=r
                cca=c
            elif acra==2:
                acra-=1
                print("l'aversario ha colpito la corazzata")
                lg[r][c]=4
                cra2=r
                cca2=c
            else:
                print("l'aversario ha colpito ed affondato la corazzata")
                ag-=1
                lg[r][c]=6
                lg[cra][cca]=6
                lg[cra2][cca2]=6
                if ag==0:#se l'aversario elimina tutte le navi
                    print("l'aversario ha affondato tutte le tue navi hai perso")
                    print("lista avversario")#scrive la griglia dell'aversario
                    for r in range(0,5,1):
                        print()
                        for c in range(0,5,1):
                            print(la[r][c], end=' ')
                    break
        else:
            print("l'aversario ha colpito un punto gia colpito")
    print("lista giocatore")#scrive la griglia giocatore
    for r in range(0,5,1):
        print()
        for c in range(0,5,1):
            print(lg[r][c], end=' ')
    print("lista avversario")#scrive la griglia avversario
    for r in range(0,5,1):
        print()
        for c in range(0,5,1):
            print(lv[r][c], end=' ')