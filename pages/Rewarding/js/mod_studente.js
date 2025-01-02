function modifica_studente(id_studente) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_studente.php?id_studente="+id_studente,
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
				
				$("#mod_studente").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function elimina_studente(id_studente,cognome_studente) {

	var result= confirm("Sei sicuro di voler eliminare lo studente "+cognome_studente+"?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_studente.php?id_studente="+id_studente,
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
					
					alert("Studente eliminato");
					location.reload(true);
					
				} // else
			} // complete

		});//ajax
		
	}
	else {}
	
}

function update_studente() {

	id_studente_mod=$("#id_studente_mod").val();
	nome_studente_mod=$("#nome_studente_mod").val();
	cognome_studente_mod =$("#cognome_studente_mod").val();
	email_studente_mod =$("#email_studente_mod").val();
	username_studente_mod =$("#username_studente_mod").val();
	password_studente_mod =$("#password_studente_mod").val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "save_studente.php?id_studente="+id_studente_mod+"&nome_studente="+nome_studente_mod+"&cognome_studente="+cognome_studente_mod+"&email_studente="+email_studente_mod+"&username_studente="+username_studente_mod+"&password_studente="+password_studente_mod,
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
				
				alert(XHR.responseText);
				location.reload(true);
				
			} // else
		} // complete

	});//ajax
	
}


