function elimina_domanda(id_domanda) {
	
	var result= confirm("Sei sicuro di voler eliminare la domanda?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_domanda.php?id_domanda="+id_domanda,
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
					location.reload(true);
					
				} // else
			} // complete

		});//ajax
		
	}
	else {}
	
}

function add_risposte(id_domanda) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "give_me_risposte.php?id_domanda="+id_domanda,
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
					$("#risp").html(XHR.responseText);
					
				} // else
			} // complete

		});//ajax
	
}


function importa_domanda(id_domanda) {
		
		var result= confirm("Vuoi importare tra le tue la domanda selezionata?");
		
		if(result==true) {
			//make an AJAX call to retrieve the file with ingredients
			$.ajax({
				type: "GET",
				url: "importa_domanda.php?id_domanda="+id_domanda,
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
		else {}
}

