 <?php 
 $a =  htmlspecialchars($_SERVER["PHP_SELF"]);
 #print_r(echo $a)

if ($_SERVER["REQUEST_METHOD"] == "POST" ) {
	$url = 'http://localhost:8080/comprarBoleto';
	# Create a connection
	#$url = '/api/update';
	$ch = curl_init($url);
	# Form data string
	$postString = http_build_query($_POST, '', '&');
	# Setting our options
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $postString);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	# Get the response
	$response = curl_exec($ch);
	
	#print_r($w->Name);
	curl_close($ch);
	//print_r($w);
}

 ?>

<!DOCTYPE html>
<html>
<head>
	<title>Comprar Boleto</title>
</head>
<body>
<form action =<?php echo $a ?> method="POST">
	id_cliente: <input type="text" name="id_cliente">
	id_evento : <input type="text" name="id_evento">
	id_tipo: <input type="text" name="id_tipo">
	tipoButaca : <input type="text" name="tipoButaca">
	Comprar : <input type="submit" name="Comprar">	
	
</form>
<?php echo $response?>
</body>
</html>