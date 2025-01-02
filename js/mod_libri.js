function modifica_libro(id_libro) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_libro.php?id_libro="+id_libro,
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
				
				$("#mod_libro").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function update_libro() {

	id_libro_mod=$("#id_libro_mod").val();
	titolo_libro_mod=$("#titolo_libro_mod").val();
	casa_mod=$("#casa_mod").val();
	autori_mod=$("#autori_mod").val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "save_libro.php?id_libro_mod="+id_libro_mod+"&titolo_libro_mod="+titolo_libro_mod+"&casa_mod="+casa_mod+"&autori_mod="+autori_mod,
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


