function modifica_personaggio(id_personaggio) {

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_personaggio.php?id_personaggio="+id_personaggio,
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
				
				$("#mod_personaggio").html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax
	
}


function update_personaggio() {

	let nome_personaggio_mod=$("#nome_personaggio_mod").val();
	let id_personaggio_mod=$("#id_personaggio_mod").val();
	let vite_pers_mod=$("#vite_pers_mod").val();
	let mana_pers_mod=$("#mana_pers_mod").val();
	let color_pers_mod=$("#color_pers_mod").val();
	let color_persb_mod=$("#color_persb_mod").val();
	//let descr_pers_mod=$("#descr_pers_mod").val();
	let descr_pers_mod=CKEDITOR.instances.descr_pers_mod.getData();
	let fileInput = document.getElementById('img_pers_mod');
    let file = fileInput.files[0];

    if (id_personaggio_mod==0 && !file) {
        alert('Seleziona un file prima di continuare.');
        return;
    }

    let formData = new FormData();
    formData.append('file', file);
	formData.append('nome_personaggio', nome_personaggio_mod);
	formData.append('id_personaggio', id_personaggio_mod);
	formData.append('vite_pers', vite_pers_mod);
	formData.append('mana_pers', mana_pers_mod);
	formData.append('color_pers', color_pers_mod);
	formData.append('color_persb', color_persb_mod);
	formData.append('descr_pers', descr_pers_mod);

	
	//make an AJAX call to retrieve the file with ingredients
	let xhr = new XMLHttpRequest();
    xhr.open('POST', 'save_personaggio.php', true);

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


