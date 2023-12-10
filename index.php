<?php

require_once "clases/Conexion.php";
$obj = new conectar();
$conexion = $obj->conexion();

$sql = "SELECT * from usuarios where email='admin'";
$result = mysqli_query($conexion, $sql);
$validar = 0;
if (mysqli_num_rows($result) > 0) {
	$validar = 1;
}
?>


<!DOCTYPE html>
<html>

<head>
	<title>Login de usuario</title>
	<link rel="stylesheet" type="text/css" href="librerias/bootstrap/css/bootstrap.css">
	<script src="librerias/jquery-3.2.1.min.js"></script>
	<script src="js/funciones.js"></script>

	<style>
        body {
            background-color: #ffcc66; /* Color naranja suave */
        }

        .login-container {
            margin-top: 50px;
        }

        .panel-primary {
            border-color: #FF8C00; /* Borde naranja */
        }

        .panel-primary .panel-heading {
            background-color: #FF8C00; /* Encabezado naranja */
            color: #fff;
        }

        .login-img {
            width: 100%;
            max-height: 150px;
            object-fit: contain;
        }
    </style>
</head>

<body style="background-color: orange">
	<!--<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel panel-heading">Sistema de ventas y almacen "TAMBO PATAS"</div>
					<div class="panel panel-body">
						<p>
							<img src="img/log.jpeg" height="200">
						</p>
						<form id="frmLogin">
							<label>Usuario</label>
							<input type="text" class="form-control input-sm" name="usuario" id="usuario">
							<label>Password</label>
							<input type="password" name="password" id="password" class="form-control input-sm">
							<p></p>
							<span class="btn btn-primary btn-sm" id="entrarSistema">Entrar</span>
							<?php if (!$validar) : ?>
							<a href="registro.php" class="btn btn-danger btn-sm">Registrar</a>
							<?php endif; ?>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>-->


	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 login-container">
				<div class="panel panel-primary">
					<div class="panel-heading text-center">
						<h3>Sistema de Ventas y Almacén</h3>
						<p class="lead">"TAMBO PATAS"</p>
					</div>
					<div class="panel-body">
						<p class="text-center">
							<img src="img/log.jpeg" class="login-img" alt="Logo">
						</p>
						<form id="frmLogin">
							<div class="form-group">
								<label for="usuario">Usuario</label>
								<input type="text" class="form-control" name="usuario" id="usuario" required>
							</div>
							<div class="form-group">
								<label for="password">Contraseña</label>
								<input type="password" class="form-control" name="password" id="password" required>
							</div>
							<div class="form-group text-center">
								<button type="button" class="btn btn-primary btn-block" id="entrarSistema">Entrar</button>
								<?php if (!$validar) : ?>
									<a href="registro.php" class="btn btn-danger btn-block">Registrar</a>
								<?php endif; ?>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</body>

</html>

<script type="text/javascript">
	$(document).ready(function() {
		$('#entrarSistema').click(function() {

			vacios = validarFormVacio('frmLogin');

			if (vacios > 0) {
				alert("Debes llenar todos los campos!!");
				return false;
			}

			datos = $('#frmLogin').serialize();
			$.ajax({
				type: "POST",
				data: datos,
				url: "procesos/regLogin/login.php",
				success: function(r) {

					if (r == 1) {
						window.location = "vistas/inicio.php";
					} else {
						alert("No se pudo acceder :(");
					}
				}
			});
		});
	});
</script>