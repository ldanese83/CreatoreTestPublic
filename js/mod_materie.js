function modifica_materia(id_materia) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_materia.php?id_materia="+id_materia,
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
				
				$("#mod_materia").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function assegna_materia(id_materia) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_utenti_assegnamento.php?id_materia="+id_materia,
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
				
				$("#mod_assegnamenti").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function assegna_materia_utente(id_utente,id_materia) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "assegna_materia_utente.php?id_utente="+id_utente+"&id_materia="+id_materia,
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
				
				//alert("Materia assegnata correttamente");
				location.reload(true);
				
			} // else
		} // complete

	});//ajax
	
}

function elimina_materia(id_materia) {

	var result= confirm("Sei sicuro di voler eliminare la materia?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_materia.php?id_materia="+id_materia,
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
					
					alert("Materia eliminata!");
					location.reload(true);
					
				} // else
			} // complete

		});//ajax
		
	}
	else {}
	
}

function update_materia() {

	id_materia_mod=$("#id_materia_mod").val();
	nome_materia_mod=$("#nome_materia_mod").val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "save_materia.php?id_materia="+id_materia_mod+"&nome_materia="+nome_materia_mod,
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
				//$("#mod_portafoglio").html(XHR.responseText);
				location.reload(true);
				
			} // else
		} // complete

	});//ajax
	
}


