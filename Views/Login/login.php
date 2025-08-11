<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Abel OSH">
  <meta name="theme-color" content="#009688">
  <link rel="shortcut icon" href="<?= media(); ?>/images/favicon.ico">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
  <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/login.css">

  <title><?= $data['page_tag']; ?></title>
</head>

<body>
  <section class="material-half-bg">
    <div class="cover"></div>
  </section>
  <section class="login-content">
    <div class="logo">
      <h1><?= $data['page_title']; ?></h1>
    </div>
    <div class="login-box">
      <div id="divLoading" style="display: none;">
        <div>
        </div>
      </div>

      <!-- FORMULARIO DE LOGIN (visible por defecto) -->
      <form class="login-form" name="formLogin" id="formLogin" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>INICIAR SESIÓN</h3>
        <div class="form-group">
          <label class="control-label">USUARIO</label>
          <input id="txtEmail" name="txtEmail" class="form-control" type="email" placeholder="Email" autofocus>
        </div>
        <div class="form-group">
          <label class="control-label">CONTRASEÑA</label>
          <input id="txtPassword" name="txtPassword" class="form-control" type="password" placeholder="Contraseña">
        </div>
        <div class="form-group">
          <div class="utility d-flex justify-content-between">
            <p class="semibold-text mb-2"><a href="#" data-toggle="flip" data-target="forget-form">¿Olvidaste tu contraseña?</a></p>
            <p class="semibold-text mb-2"><a href="#" data-toggle="flip" data-target="register-form">Regístrate aquí</a></p>
          </div>
        </div>
        <div id="alertLogin" class="text-center"></div>
        <div class="form-group btn-container">
          <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-sign-in-alt"></i> INICIAR SESIÓN</button>
        </div>
      </form>

      <!-- FORMULARIO DE RECUPERACIÓN -->
      <form id="formRecetPass" name="formRecetPass" class="forget-form d-none" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>¿Olvidaste contraseña?</h3>
        <div class="form-group">
          <label class="control-label">EMAIL</label>
          <input id="txtEmailReset" name="txtEmailReset" class="form-control" type="email" placeholder="Email">
        </div>
        <div class="form-group btn-container">
          <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>REINICIAR</button>
        </div>
        <div class="form-group mt-3 text-center">
          <p class="semibold-text mb-0">
            <a href="#" data-toggle="flip" data-target="login-form"><i class="fa fa-angle-left fa-fw"></i> Volver a iniciar sesión</a>
          </p>
        </div>
      </form>

      <!-- FORMULARIO DE REGISTRO DE CLIENTE -->
      <form id="formRegister" name="formRegister" class="register-form d-none" action="" style="margin: 20px;">
        <h3 class="login-head"><i class="fa fa-user-plus fa-lg fa-fw"></i> REGISTRARSE</h3>

        <div class="row">
          <div class="form-group col-md-6">
            <label for="txtIdentificacion">Identificación</label>
            <input type="text" class="form-control" id="txtIdentificacion" name="txtIdentificacion" placeholder="Número de documento" required onkeypress="return controlTag(event);">
          </div>
          <div class="form-group col-md-6">
            <label for="txtNombre">Nombres</label>
            <input type="text" class="form-control" id="txtNombre" name="txtNombre" placeholder="Ingresa tus nombres" required>
          </div>

          <div class="form-group col-md-6">
            <label for="txtApellido">Apellidos</label>
            <input type="text" class="form-control" id="txtApellido" name="txtApellido" placeholder="Ingresa tus apellidos" required>
          </div>
          <div class="form-group col-md-6">
            <label for="txtTelefono">Teléfono</label>
            <input type="text" class="form-control" id="txtTelefono" name="txtTelefono" placeholder="Número de contacto" required onkeypress="return controlTag(event);">
          </div>

          <div class="form-group col-md-6">
            <label for="txtEmailCliente">Correo electrónico</label>
            <input type="email" class="form-control" id="txtEmailCliente" name="txtEmailCliente" placeholder="Ejemplo: correo@email.com" required>
          </div>
          <div class="form-group col-md-6">
            <label for="txtPasswordCliente">Contraseña</label>
            <input type="password" class="form-control" id="txtPasswordCliente" name="txtPasswordCliente" placeholder="Crea una contraseña" required>
          </div>
        </div>

        <div class="form-group btn-container mt-3">
          <button type="submit" class="btn btn-primary btn-block">
            <i class="fa fa-user-plus fa-lg fa-fw"></i> REGISTRARSE
          </button>
        </div>
        <div class="form-group mt-3 text-center">
          <p class="semibold-text mb-0">
            <a href="#" data-toggle="flip" data-target="login-form"><i class="fa fa-angle-left fa-fw"></i> Volver a iniciar sesión</a>
          </p>
        </div>
      </form>
    </div>

      <!--Script para alternar entre formularios de login, registro y recuperación -->
      <script src="<?= media(); ?>/js/functions_alternar_form.js"></script>
  </section>
  <script>
    const base_url = "<?= base_url(); ?>";
  </script>

  <!--Script para registro de cliente  -->
  <script src="<?= media(); ?>/js/functions_register.js"></script>


  <!-- Essential javascripts for application to work-->
  <script src="<?= media(); ?>/js/jquery-3.3.1.min.js"></script>
  <script src="<?= media(); ?>/js/popper.min.js"></script>
  <script src="<?= media(); ?>/js/bootstrap.min.js"></script>
  <script src="<?= media(); ?>/js/fontawesome.js"></script>
  <script src="<?= media(); ?>/js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="<?= media(); ?>/js/plugins/pace.min.js"></script>
  <script type="text/javascript" src="<?= media(); ?>/js/plugins/sweetalert.min.js"></script>
  <script src="<?= media(); ?>/js/<?= $data['page_functions_js']; ?>"></script>
</body>

</html>