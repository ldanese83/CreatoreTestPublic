<html lang="it">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Danese Luca">
    
    <title>Creatore Test</title>
	
	<!-- jQuery -->
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link href="./css/signin.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<body>

    <div class="container" >

     <form method="post" action="salva_utente.php" class="row g-3 needs-validation" novalidate >
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Nome</label>
    <input type="text" class="form-control" id="validationCustom01" name="validationCustom01" value="" required>
	<div class="invalid-feedback">
      Nome obbligatorio
    </div>
  </div>
  <div class="col-md-4">
    <label for="validationCustom02" class="form-label">Cognome</label>
    <input type="text" class="form-control" id="validationCustom02" name="validationCustom02" value="" required>
	<div class="invalid-feedback">
      Cognome obbligatorio
    </div>
  </div>
  <div class="col-md-4">
    <label for="validationCustomUsername" class="form-label">Username</label>
    <div class="input-group has-validation">
      <span class="input-group-text" id="inputGroupPrepend">@</span>
      <input type="text" class="form-control" id="validationCustomUsername" name="validationCustomUsername" aria-describedby="inputGroupPrepend" required onchange="validaUser()">
      <div class="invalid-feedback">
        Username già in uso.
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom03" class="form-label">Email</label>
    <input type="email" class="form-control" id="validationCustom03" name="validationCustom03" required onchange="validaMail()">
    <div class="invalid-feedback">
      Email non valida (non corretta o già in uso).
    </div>
  </div>
  <div class="col-md-3">
    <label for="validationCustom04" class="form-label">Password</label>
    <input type="password" class="form-control" id="validationCustom04" name="validationCustom04" required>
    <div class="invalid-feedback">
      Password vuota o le password non coincidono.
    </div>
  </div>
  <div class="col-md-3">
    <label for="validationCustom05" class="form-label">Conferma password</label>
    <input type="password" class="form-control" id="validationCustom05" name="validationCustom05" required>
    <div class="invalid-feedback">
      Campo vuoto o le password non coincidono.
    </div>
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Conferma privacy
      </label>
      <div class="invalid-feedback">
		Conferma privacy obbligatoria
      </div>
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-primary" type="submit">Registrati!</button>
  </div>
</form>

<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
function validaUser() {
	var validazione1=0;

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "validazione.php?user="+$("#validationCustomUsername").val(),
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
					return false;
				} // if
				//normalize the XML document retreived, erasing white spaces and tabs
				validazione1=XHR.responseText;
				if(validazione1==0) document.getElementById("validationCustomUsername").setCustomValidity('Username già in uso');
				else document.getElementById("validationCustomUsername").setCustomValidity('');
			} // else
		} // complete

	});//ajax
	
}

function validaMail() {
	var validazione1=0;

	//make an AJAX call to retrieve the file with ingredients
	$.ajax({
		type: "GET",
		url: "validazione_mail.php?mail="+$("#validationCustom03").val(),
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
					return false;
				} // if
				//normalize the XML document retreived, erasing white spaces and tabs
				validazione1=XHR.responseText;
				if(validazione1==0) document.getElementById("validationCustom03").setCustomValidity('Email già in uso');
				else document.getElementById("validationCustom03").setCustomValidity('');
			} // else
		} // complete

	});//ajax
	
}

(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      var validata=false;
	  if($("#validationCustom04").val()==$("#validationCustom05").val()) validata=true;
	  if(validata==false) {
		  document.getElementById("validationCustom04").setCustomValidity('Le password non coincidono');
		  document.getElementById("validationCustom05").setCustomValidity('Le password non coincidono');
	  }
	  else {
		  document.getElementById("validationCustom04").setCustomValidity('');
		  document.getElementById("validationCustom05").setCustomValidity('');
	  }
	  if (!form.checkValidity() || validata==false) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
</script>

    </div> <!-- /container -->
	
  </body>
</html>