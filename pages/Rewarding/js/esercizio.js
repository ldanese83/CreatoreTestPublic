var MappaRisp = new Map();
function seleziona_risp(id_domanda,id_risposta) {
	console.log("rispdom_"+id_domanda);
	let dom=document.getElementById("rispdom_"+id_domanda);
	dom.value=id_risposta;
	let valore = MappaRisp.get(id_domanda);
	
	if(valore===undefined) {
		console.log("icona_risp"+id_risposta);
		let icona=document.getElementById("icona_risp"+id_risposta);
		icona.className="fa fa-check";
	}
	else {
		console.log("icona_risp"+id_risposta);
		let icona=document.getElementById("icona_risp"+valore);
		icona.className="fa fa-angle-double-right";
		let icona2=document.getElementById("icona_risp"+id_risposta);
		icona2.className="fa fa-check";
	}
	MappaRisp.set(id_domanda,id_risposta);
}
