<?php
header('Content-Type: text/html; charset=UTF-8');  
require('../Config/Config.php');

$tipo       = $_FILES['dataCliente']['type'];
$tamanio    = $_FILES['dataCliente']['size'];
$archivotmp = $_FILES['dataCliente']['tmp_name'];
$lineas     = file($archivotmp);

$i = 0;

foreach ($lineas as $linea) {
    $cantidad_registros = count($lineas);
    $cantidad_regist_agregados =  ($cantidad_registros - 1);

    if ($i != 0) {
        $datos = explode(";", $linea);

        $identificacion  = trim($datos[0]);
        $nombres         = utf8_encode(trim($datos[1]));
        $apellidos       = utf8_encode(trim($datos[2]));
        $telefono        = trim($datos[3]);
        $email_user      = trim($datos[4]);
        $password        = trim($datos[5]);
        $nit             = trim($datos[6]);
        $nombrefiscal    = utf8_encode(trim($datos[7]));
        $direccionfiscal = utf8_encode(trim($datos[8]));
        $token           = trim($datos[9]);
        $rolid           = trim($datos[10]);
        $status          = trim($datos[11]);

        $sqlInsert = "INSERT INTO persona (
            identificacion, nombres, apellidos, telefono, email_user, password,
            nit, nombrefiscal, direccionfiscal, token, rolid, status
        ) VALUES (
            '$identificacion', '$nombres', '$apellidos', '$telefono', '$email_user', '$password',
            '$nit', '$nombrefiscal', '$direccionfiscal', '$token', '$rolid', '$status'
        )";

        mysqli_query($con, $sqlInsert);
    }

    $i++;
}

echo '<center><p style="text-align:center; color:#333;">Total de Registros Agregados: '. ($i - 1) .'</p></center>';
echo "<center><a href='index.php'>Volver</a></center>";
?>