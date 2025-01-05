function elimina_potere(id_potere) {
	var result= confirm("Sei sicuro di voler eliminare il potere selezionato?");
	if(result==true) {
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_potere.php?id_potere="+id_potere,
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

function modifica_potere(id_potere) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_potere.php?id_potere="+id_potere,
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
				
				$("#mod_potere").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}


function update_potere() {

	let nome_potere = $("#nome_potere").val();
	let id_potere_mod = $("#id_potere_mod").val();
	let descrizione_potere = CKEDITOR.instances.descrizione_potere.getData();
	let livello = $("#livello").val();
	let mana_pot = $("#mana_pot").val();

	if(mana_pot>4)
		mana_pot=4;
	if (mana_pot<1)
		mana_pot=1;

	let fileInput = document.getElementById('img_potere');
	let file = fileInput.files[0];

	if (id_potere_mod == 0 && !file) {
		alert('Seleziona un file prima di continuare.');
		return;
	}

	let formData = new FormData();
	formData.append('file', file);
	formData.append('nome_potere', nome_potere);
	formData.append('id_potere', id_potere_mod);
	formData.append('descrizione_potere', descrizione_potere);
	formData.append('livello', livello);
	formData.append('mana_pot', mana_pot);

	
	//make an AJAX call to retrieve the file with ingredients
	let xhr = new XMLHttpRequest();
    xhr.open('POST', 'save_potere.php', true);

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


