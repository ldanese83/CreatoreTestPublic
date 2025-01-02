function modifica_classe(id_classe) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_classi.php?id_classe="+id_classe,
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
				
				$("#mod_classi").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function elimina_classe(id_classe,nome_classe) {

	var result= confirm("Sei sicuro di voler eliminare la classe "+nome_classe+"?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_classe.php?id_classe="+id_classe,
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
					
					alert("Classe eliminata");
					location.reload(true);
					
				} // else
			} // complete

		});//ajax
		
	}
	else {}
	
}

function update_classe() {

	id_classe_mod=$("#id_classe_mod").val();
	nome_classe_mod=$("#nome_classe_mod").val();
	anno_scolastico_mod =$("#anno_scolastico_mod").val();
	icona_classe_mod=$("#icona_classe_mod").val();
	colore_classe_mod=$("#colore_classe_mod").val();
	colore_classe_mod=colore_classe_mod.substring(1);
	//alert(colore_classe_mod);
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "save_classe.php?id_classe="+id_classe_mod+"&nome_classe="+nome_classe_mod+"&anno_scolastico="+anno_scolastico_mod+"&icona_classe="+icona_classe_mod+"&colore_classe="+colore_classe_mod,
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


