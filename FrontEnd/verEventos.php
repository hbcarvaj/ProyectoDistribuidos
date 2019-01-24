 <?php 
 $a =  htmlspecialchars($_SERVER["PHP_SELF"]);
 #print_r(echo $a)

if ($_SERVER["REQUEST_METHOD"] == "POST" ) {
	$url = 'http://localhost:8080/prueba';
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
	#$r = (array) $response;
	#print_r($response[0]);
	$w = (( json_decode($response)));
	
	#print_r($w->Name);
	curl_close($ch);
	//print_r($w);
}

 ?>


<html>
<head>
	<title>Ver Eevntos</title>
</head>
<body>

<form action=<?php echo $a?> method="POST">
	Cargar Eventos: <input type="submit" />

	
</form>

<table>
	<tbody>
		<tr>
			<th>ID_evento</th>
			<th>Titulo</th>
			<th>Descripcion</th>
			<th>IDVENU</th>
			<th>Fecha</th>
			<th>Hora</th>
			<th>#General</th>
			<th>#Tribuna</th>
			<th>#VIP</th>
			<th>#Golde</th>
			<th>$General</th>
			<th>$Tribuna</th>
			<th>$VIP</th>
			<th>$Golde</th>
		</tr>
		<?php foreach ($w as &$i) { ?>
        <tr>
            <td> <?php echo $i->ID_evento; ?> </td>
            <td> <?php echo $i->Titulo; ?> </td>
            <td> <?php echo $i->Descripcion; ?> </td>
            <td> <?php echo $i->IdVenue; ?> </td>
            <td> <?php echo $i->Fecha; ?> </td>
            <td> <?php echo $i->Hora; ?> </td>
            <td> <?php echo $i->CantGeneral; ?> </td>
            <td> <?php echo $i->CantTribuna; ?> </td>
            <td> <?php echo $i->CantVIP; ?> </td>
            <td> <?php echo $i->cantGolden; ?> </td>
            <td> <?php echo $i->PrecioGeneral; ?> </td>
            <td> <?php echo $i->PrecioTribuna; ?> </td>
            <td> <?php echo $i->PrecioVIP; ?> </td>
            <td> <?php echo $i->PrecioGolden; ?> </td>
        </tr>
		<?php }; ?>
	</tbody>
</table>

</body>
</html>