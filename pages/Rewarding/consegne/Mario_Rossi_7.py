parola_segreta="marmellata"

parola_indovinata="-"*len(parola_segreta)
tentativi=8
while(parola_indovinata!=parola_segreta and tentativi>0):
    print("La parola da indovinare:")
    print(parola_indovinata)
    l=input("Inserire una lettera da trovare\n")

    if len(l)==1:
        parola=""
        trovato=False
        for cont in range(len(parola_segreta)):
            if parola_segreta[cont]==l:
                parola+=l
                trovato=True
            else:
                parola+=parola_indovinata[cont]
        parola_indovinata=parola
        if(trovato==False):
            print(f"lettera {l} non presente")
            tentativi-=1
            print(f"Rimangono {tentativi} tentativi")
        else:
            print("Hai trovato la lettera",l)

    else:
        print("Inserire una lettera singola")

if(tentativi>0):
    print(f"Hai trovato la parola segreta {parola_segreta}. Hai vinto!")
else:
    print("Hai perso!")