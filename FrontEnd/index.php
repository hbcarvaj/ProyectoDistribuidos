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

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="theme.css" type="text/css">
</head>

<body>
  <nav class="navbar navbar-expand-md navbar-light" style="">
    <div class="container"> <a class="navbar-brand text-primary" href="#">
        <i class="fa d-inline fa-lg fa-stop-circle"></i>
        <b> TuBoleton</b>
      </a> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar4">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar4">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"> <a class="nav-link" href="#">Quienes somos</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Contáctenos</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">FAQ</a> </li>
        </ul> <a class="btn navbar-btn ml-md-2 btn-light">Contáctenos</a>
      </div>
    </div>
  </nav>
  <div class="m-0 py-0">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <form class="form-inline">
            <div class="input-group">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search">
              <div class="input-group-append"><button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button></div>
            </div>
          </form>
        </div>
        <div class="col-md-6 text-right"><a class="btn btn-secondary" href="index.php">Eventos</a><a class="btn btn-primary" href="login.php">Iniciar sesión</a><a class="btn btn-light" href="signup.php">Regístrate</a></div>
      </div>
    </div>
  </div>
  <div class="py-2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 contenteditable="true">Eventos Disponibles</h2>
        </div>
      </div>
    </div>
  </div>

  <div class="py-0">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          
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




        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  <pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 20px;right:20px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:220px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo Free&nbsp;&nbsp;<img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16"></pingendo>
</body>

</html>