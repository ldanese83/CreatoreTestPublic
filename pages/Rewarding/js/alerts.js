function read_alert(id_alert,link_page) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "alert_read.php?id_alert="+id_alert,
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
				if(link_page!="")
					window.location.href=link_page;
				
			} // else
		} // complete

	});//ajax

		
}

function elimina_alert(id_alert) {
	var result= confirm("Sei sicuro di voler eliminare l'alert selezionato?");
	if(result==true) {
		let formData = new FormData();
		formData.append('id_alert', id_alert);

		
		//make an AJAX call to retrieve the file with ingredients
		let xhr = new XMLHttpRequest();
		xhr.open('POST', 'elimina_alert.php', true);

		// Aggiungere un gestore eventi per la risposta del server
		xhr.onload = function () {
			if (xhr.status === 200) {
				alert(xhr.responseText);
				location.reload(true);
			} else {
				alert('Errore nella eliminazione dell\' alert');
			}
		};

		xhr.send(formData);
	}
	
}
