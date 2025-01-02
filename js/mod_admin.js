function modifica_admin(id_amministratore) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_admin.php?id_amministratore="+id_amministratore,
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
				
				$("#mod_admin").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}

function elimina_admin(id_amministratore) {

	var response = confirm("Sei sicuro di voler eliminare l'amministratore?");
	
     if (response) {
	 
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "delete_admin.php?id_admin="+id_amministratore,
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
     else return;

	
}

function update_admin() {

	id_admin_mod = $("#id_admin_mod").val();
	password_admin_mod=$("#password_admin_mod").val();
	nome_admin=$("#nome_admin").val();
	cognome_admin=$("#cognome_admin").val();
	login_admin=$("#login_admin").val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "save_admin.php?id_admin_mod="+id_admin_mod+"&password_admin_mod="+password_admin_mod+"&nome_admin="+nome_admin+"&cognome_admin="+cognome_admin+"&login_admin="+login_admin,
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

