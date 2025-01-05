function elimina_punizione(id_punizione) {
	var result= confirm("Sei sicuro di voler eliminare la punizione selezionata?");
	if(result==true) {
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_punizione.php?id_punizione="+id_punizione,
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
					
				} // else
			} // complete

		});//ajax
	}
	
}

function modifica_punizione(id_punizione) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_punizione.php?id_punizione="+id_punizione,
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
				
				$("#mod_punizione").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}


function update_punizione() {

	let id_punizione_mod = $("#id_punizione_mod").val();
	let descrizione_punizione = CKEDITOR.instances.descrizione_punizione.getData();
	let giorni_per_consegna = $("#giorni_per_consegnare").val();


	let fileInput = document.getElementById('img_punizione');
	let file = fileInput.files[0];

	if (id_punizione_mod == 0 && !file) {
		alert('Seleziona un file prima di continuare.');
		return;
	}

	let formData = new FormData();
	formData.append('file', file);
	formData.append('id_punizione', id_punizione_mod);
	formData.append('descrizione_punizione', descrizione_punizione);
	formData.append('giorni_per_consegna', giorni_per_consegna);

	
	//make an AJAX call to retrieve the file with ingredients
	let xhr = new XMLHttpRequest();
    xhr.open('POST', 'save_punizione.php', true);

    // Aggiungere un gestore eventi per la risposta del server
    xhr.onload = function () {
        if (xhr.status === 200) {
            alert('File caricato con successo: ' + xhr.responseText);
			location.reload(true);
        } else {
            alert('Errore durante il caricamento del file.');
        }
    };

    xhr.send(formData);
	
}


