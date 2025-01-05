function aggiornaModal(id_studente,nome,cognome) {
	
	document.getElementById("id_studente").value=id_studente;
	document.getElementById("nome_tc").innerHTML=nome;
	document.getElementById("cognome_tc").innerHTML=cognome;
	//console.log("ciao"+nome+cognome);
	
}

function togli_cuore() {
	id_studente_mod=document.getElementById("id_studente").value;
	motivazione_mod=document.getElementById("motivazione").value;

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "togli_cuore.php?id_studente="+id_studente_mod+"&motivazione="+motivazione_mod,
		dataType: "text",
		//function called when the AJAX call is completed
		complete: function (XHR, textStatus) {
			//If the AJAX call has no success there is an error
			if(textStatus!="success") { 
				alert("Errore nella ricerca del file XML");
			}//if 
			//else the AJAX call is successful
			else { 
				//if there are no documents retrieved, we have an error on loading the SMIL document: it was not well formatted, or the path to it was wrong
				if(XHR == null) {
					//display an error message
					alert("Errore nella ricerca del file XML");
					return;
				} // if
				//normalize the XML document retreived, erasing white spaces and tabs
				//alert(XHR.responseText);
				alert("Cuore tolto allo studente!");
				location.reload(true);
				
			} // else
		} // complete

	});//ajax
	
}
