function scegli_potere(id_potere,id_studente) {
	var result= confirm("Sei sicuro di voler attivare il potere selezionato?");
	if(result==true) {
		let formData = new FormData();
		formData.append('id_potere', id_potere);
		formData.append('id_studente', id_studente);

		
		//make an AJAX call to retrieve the file with ingredients
		let xhr = new XMLHttpRequest();
		xhr.open('POST', 'scelta_potere.php', true);

		// Aggiungere un gestore eventi per la risposta del server
		xhr.onload = function () {
			if (xhr.status === 200) {
				alert(xhr.responseText);
				location.reload(true);
			} else {
				alert('Errore nel salvataggio del potere.');
			}
		};

		xhr.send(formData);
	}
	
}

function usa_potere(id_potere,id_studente,nome) {
	var result= confirm("Sei sicuro di voler attivare il potere "+nome+"?");
	if(result==true) {
		let formData = new FormData();
		formData.append('id_potere', id_potere);
		formData.append('id_studente', id_studente);

		
		//make an AJAX call to retrieve the file with ingredients
		let xhr = new XMLHttpRequest();
		xhr.open('POST', 'usa_potere.php', true);

		// Aggiungere un gestore eventi per la risposta del server
		xhr.onload = function () {
			if (xhr.status === 200) {
				alert(xhr.responseText);
				location.reload(true);
			} else {
				alert('Errore nel salvataggio del potere.');
			}
		};

		xhr.send(formData);
	}
	
}



