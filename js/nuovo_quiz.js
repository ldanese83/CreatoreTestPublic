function change_argomenti() {
	
	materia = $('#materia').val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_argomenti_select.php?id_materia="+materia,
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
				$('#argomento1').html(XHR.responseText);
				argomento(1);
				
			} // else
		} // complete

	});//ajax
	
}

var contatore_argomenti=1;

function add_row_argomenti() {
	
	contatore_argomenti++;
	
	$("#argomenti").append("<div class='row_form' id=\"row_argomento"+contatore_argomenti+"\"><div class=\"input-group input-group-icon\" style=\"width:100%\"><select onchange=\"argomento("+contatore_argomenti+")\" id=\"argomento"+contatore_argomenti+"\" name=\"argomenti[]\" class=\"select_form_domande\" style=\"width:90%\"></select><div class=\"input-icon\"><i class=\"fa fa-book\"></i></div><div class=\"remove_response\" id=\"remove_response"+contatore_argomenti+"\" onclick='remove_row_argomenti("+contatore_argomenti+");'><i class=\"fa fa-minus\"></i></div></div></div>");
	
	materia = $('#materia').val();
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_argomenti_select.php?id_materia="+materia,
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
				$('#argomento'+contatore_argomenti).html(XHR.responseText);
				
			} // else
				
			argomento(contatore_argomenti);
	
		} // complete

	});//ajax

}

function remove_row_argomenti(id) {
	
	$("#row_argomento"+id).remove();
	
}

var contatore_tipi=1;

function mod_testo_num(id) {
	
	testo=$("#tipo_domande"+id+" option:selected").text();
	$("#testo_num_dom"+id).html(testo);
	
}

function add_row_tipi() {
	
	contatore_tipi++;
	
	string_aggiunta = 
						"<div class='row_form' id=\"row_tipi"+contatore_tipi+"\">"+
						"<h4 class=\"row_form_h4\">Tipo domande</h4>"+
							"<div class=\"input-group input-group-icon\" style=\"width:100%\">"+
								"<select onchange=\"mod_testo_num("+contatore_tipi+")\" id=\"tipo_domande"+contatore_tipi+"\" name=\"tipo_domande[]\" class=\"select_form_domande\" style=\"width:90%\">"+
								"</select><div class=\"input-icon\"><i class=\"fa fa-book\"></i></div>"+
								"<div class=\"remove_response\" id=\"remove_tipo"+contatore_tipi+"\" onclick='remove_row_tipi("+contatore_tipi+");'><i class=\"fa fa-minus\"></i></div></div></div>"+
							"</div>"+
						"</div>"+
						"<div class='row_form' id=\"row_numero"+contatore_tipi+"\">"+
						"<h4 class=\"row_form_h4\" >Numero domande <span id='testo_num_dom"+contatore_tipi+"'>Risposta Aperta</span></h4>"+
							"<div class=\"input-group input-group-icon\" style=\"width:100%\">"+
								"<input type=\"number\" placeholder=\"Numero domande\" id=\"num_domande+"+contatore_tipi+"\" name=\"num_domande[]\" style=\"width:100%\" />"+
								"<div class=\"input-icon\"><i class=\"fa fa-bars\"></i></div>"+
							"</div>"+
						"</div>";
	
	$("#opzioni_aggiuntive").append(string_aggiunta);
	
	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "give_me_tipi_select.php",
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
				$('#tipo_domande'+contatore_tipi).html(XHR.responseText);
				
			} // else
		} // complete

	});//ajax

}

function remove_row_tipi(id) {
	
	$("#row_tipi"+id).remove();
	$("#row_numero"+id).remove();
	
}

function change_casuale() {
	
	tipo_domanda = $('#acaso').val();
	
	switch(tipo_domanda) {
		case "si":
			$('#opzioni_aggiuntive').css("display","block");
			$('#domande').css("display","none");
			break;
		case "no":
			$('#opzioni_aggiuntive').css("display","none");
			$('#domande').css("display","block");
			break;
	}
	
}

function delete_quiz(id_quiz) {
	
	var result= confirm("Sei sicuro di voler eliminare il quiz selezionato?");
	if(result==true) {
	
		//make an AJAX call to retrieve the file with ingredients
		$.ajax({
			type: "GET",
			url: "delete_quiz.php?id_quiz="+id_quiz,
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

var argomenti_selezionati = [];
var num_selezione=1;
function add_argomenti_selezionati(id) {
	argomenti_selezionati[num_selezione]=id;
	num_selezione++;
}

function argomento(num) {
	
	var opzione=$("#argomento"+num).val();
	argomenti_selezionati[num]=opzione;
	//alert(argomenti_selezionati);
	
}

function aggiungi_domanda(id_domanda,id_utente) {
	
	$.ajax({
		type: "GET",
		url: "add_temp_domande.php?id_domanda="+id_domanda+"&id_utente="+id_utente,
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
				//$("#body_dom").html("");
				//select_domande(id_utente);
				location.reload();
				
			} // else
		} // complete

	});//ajax
		
}

function rimuovi_domanda(id_domanda,id_utente) {
	
	$.ajax({
		type: "GET",
		url: "del_temp_domande.php?id_domanda="+id_domanda+"&id_utente="+id_utente,
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
				//$("#body_dom").html("");
				//select_domande(id_utente);
				location.reload();
				
			} // else
		} // complete

	});//ajax
		
}

function show_responses(id_domanda, numero) {
	
	$.ajax({
		type: "GET",
		url: "give_me_risposte2.php?id_domanda="+id_domanda,
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
				totale="<table style=\"width:100%\">"+XHR.responseText+"</table>";
				$("#response"+numero).html(totale);
				if($("#response"+numero).css("display")=="none") {
					$("#response"+numero).css("display","table-cell");
				}
				else {
					$("#response"+numero).css("display","none");
				}
				
			} // else
		} // complete

	});//ajax
	
	
	
}

function select_domande(id_utente) {
	for(var i=0;i<argomenti_selezionati.length;i++) {
		if(argomenti_selezionati[i]!=undefined) {
			//make an AJAX call to retrieve the file with ingredients
			$.ajax({
				type: "GET",
				url: "give_me_domande.php?id_argomento="+argomenti_selezionati[i]+"&id_utente="+id_utente,
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
						
						$("#body_dom").append(XHR.responseText);
						
					} // else
				} // complete

			});//ajax
		}
	}
}