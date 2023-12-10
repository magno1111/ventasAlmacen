<?php 
	session_start();
	if(isset($_SESSION['usuario'])){
		
 ?>


<!DOCTYPE html>
<html>
<head>
	<title>inicio</title>
</head>
<body>
<?php require_once "menu.php"; ?>

 <!-- Main jumbotron for a primary marketing message or call to action -->

  <!-- Primer Contenedor -->
  <div class="container mt-4">
    <!-- Encabezado de bienvenida -->
    <div class="jumbotron">
      <h1 class="display-4">¡Bienvenido al Panel de Administración!</h1>
      <p class="lead">Gestiona las ventas de productos de ferretería de manera eficiente.</p>
    </div>

    <!-- Contenido enriquecido -->
    <div class="row">
      <div class="col-md-6">
        <h2>Registro de Ventas</h2>
        <p>Aquí puedes registrar las ventas de productos de ferretería de manera rápida y sencilla. Utiliza el formulario a continuación para ingresar los detalles de cada venta.</p>
        <!-- Agrega aquí tu formulario de registro de ventas utilizando Bootstrap -->
      </div>
      <div class="col-md-6">
        <h2>Reportes y Estadísticas</h2>
        <p>Accede a informes detallados y estadísticas para analizar el rendimiento de tus ventas. Obtén insights valiosos para tomar decisiones informadas.</p>
        <!-- Agrega aquí elementos para mostrar reportes y estadísticas -->
      </div>
    </div>
  </div>
  <!-- /Primer Contenedor -->

  <br><br><br>

  <!-- Segundo Contenedor -->
  <div class="container mt-4">
    <!-- Encabezado de la sección -->
    <div class="jumbotron">
      <h1 class="display-4">Información de la Empresa</h1>
      <p class="lead">Descubre más sobre nuestra ferretería y cómo encontrarnos.</p>
    </div>

    <!-- Información de la empresa -->
    <div class="row">
      <div class="col-md-6">
        <h2>Nuestra Empresa</h2>
        <p>Somos una ferretería comprometida con la calidad y el servicio al cliente. Ofrecemos una amplia gama de productos para satisfacer tus necesidades de construcción y hogar.</p>
        <!-- Agrega aquí más información sobre tu empresa -->
      </div>
      <div class="col-md-6">
        <h2>Ubicación</h2>
        <p>Visítanos en nuestra ubicación principal:</p>
        <address>
          <strong>Ferretería XYZ</strong><br>
          Dirección de la Sucursal<br>
          Ciudad, País<br>
          Código Postal
        </address>
      </div>
    </div>
  </div>
</body>
</html>
<?php 
	}else{
		header("location:../index.php");
	}
 ?>