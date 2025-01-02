function elimina_quest(id_quest,nome_quest) {

	var result= confirm("Sei sicuro di voler eliminare la quest "+nome_quest+" dalla classe?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "elimina_quest.php?id_quest="+id_quest,
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
					
					alert("Quest eliminata");
					location.reload(true);
					
				} // else
			} // complete

		});//ajax
		
	}
	else {}
	
}

function aggiungi_nome(nome,id) {

	document.getElementById("nome_quest_mod").value=nome;
	
	document.getElementById("id_quest_mod").value=id;
}

function cambia_materia() {
	
	var sel=document.getElementById("materia");
	var opsel = sel.options[sel.selectedIndex];
	id_materia=opsel.value;
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "../give_me_argomenti_select.php?id_materia="+id_materia,
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
				
				document.getElementById("argomento").innerHTML=XHR.responseText;
				
			} // else
		} // complete

	});//ajax
}

function update_quest() {

	let nome_quest_mod=$("#nome_quest_mod").val();
	let id_quest_mod=$("#id_quest_mod").val();
	
	let fileInput = document.getElementById('img_quest_mod');
    let file = fileInput.files[0];

    if (!file) {
        alert('Seleziona un file prima di continuare.');
        return;
    }

    let formData = new FormData();
    formData.append('file', file);
	formData.append('id_quest', id_quest_mod);
	formData.append('nome_quest', nome_quest_mod);

	
	//make an AJAX call to retrieve the file with ingredients
	let xhr = new XMLHttpRequest();
    xhr.open('POST', 'save_quest.php', true);

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

function attiva_esercizio(id_esercizio,id_quest) {
	var result= confirm("Sei sicuro di voler attivare l'esercizio? Poi non si potrà più modificare/eliminare e sarà visibile agli studenti");
	if(result==true) {
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "attiva_esercizio.php?id_quest="+id_quest+"&id_esercizio="+id_esercizio,
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
	
}

function elimina_esercizio(id_esercizio,nome_capitolo,id_quest) {

	var result= confirm("Sei sicuro di voler eliminare l'esercizio "+nome_capitolo+" dalla quest?");
	if(result==true) {
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "elimina_esercizio.php?id_quest="+id_quest+"&id_esercizio="+id_esercizio,
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
	
}


function cambiaValutazioneFinale(tot_aperte) {
	
	var tot=0;
	var counter=0;
	var val_multiple=parseInt(document.getElementById("val_risp_multiple").value);
	for(var i=0;i<tot_aperte;i++) {
		if(document.getElementById("valutazione"+i).value!="" && parseInt(document.getElementById("valutazione"+i).value)!=0) {
			tot+=parseInt(document.getElementById("valutazione"+i).value);
			counter++;
		}
	}	
	var media=tot/counter;
	if(val_multiple!=0)
		var media_finale=Math.round((media+val_multiple)/2);
	else 
		var media_finale=Math.round(media);
	document.getElementById("valutazione").value=media_finale;
	
}
