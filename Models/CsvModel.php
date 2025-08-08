<?php
class CsvModel extends Mysql {

    public function __construct() {
        parent::__construct();
    }

    public function selectPersonas() {
        $sql = "SELECT * FROM persona ORDER BY idpersona ASC";
        return $this->select_all($sql);
    }

    public function insertPersona($data) {
        // Validar que el array tenga exactamente 12 elementos
        if (count($data) !== 12) {
            throw new Exception("El array de datos debe contener exactamente 12 elementos");
        }

        // Asignar valores con validación
        $identificacion = $this->validarCampo($data[0], 'Identificación');
        $nombres = $this->validarCampo($data[1], 'Nombres');
        $apellidos = $this->validarCampo($data[2], 'Apellidos');
        $telefono = $this->validarCampoOpcional($data[3]);
        $email_user = $this->validarEmail($data[4]);
        $password = $this->validarCampo($data[5], 'Contraseña');
        $nit = $this->validarCampoOpcional($data[6]);
        $nombrefiscal = $this->validarCampoOpcional($data[7]);
        $direccionfiscal = $this->validarCampoOpcional($data[8]);
        $token = $this->generarToken(); // Generar token si viene vacío
        $rolid = $this->validarRol($data[10]);
        $status = $this->validarEstado($data[11]);

        $query = "INSERT INTO persona (
            identificacion, nombres, apellidos, telefono, email_user, password,
            nit, nombrefiscal, direccionfiscal, token, rolid, status
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $arrData = [
            $identificacion, $nombres, $apellidos, $telefono, $email_user, $password,
            $nit, $nombrefiscal, $direccionfiscal, $token, $rolid, $status
        ];

        return $this->insert($query, $arrData);
    }

    // Métodos de validación auxiliares
    private function validarCampo($valor, $nombreCampo) {
        if (empty(trim($valor))) {
            throw new Exception("El campo $nombreCampo es obligatorio");
        }
        return trim($valor);
    }

    private function validarCampoOpcional($valor) {
        return empty(trim($valor)) ? null : trim($valor);
    }

    private function validarEmail($email) {
        if (empty(trim($email))) {
            throw new Exception("El email es obligatorio");
        }
        if (!filter_var(trim($email), FILTER_VALIDATE_EMAIL)) {
            throw new Exception("El formato del email no es válido");
        }
        return trim($email);
    }

    private function generarToken() {
        return bin2hex(random_bytes(16));
    }

    private function validarRol($rol) {
        $rolesPermitidos = [1, 2, 3]; // Ajusta según tus roles
        if (!in_array((int)$rol, $rolesPermitidos)) {
            return 2; // Rol por defecto si no es válido
        }
        return (int)$rol;
    }

    private function validarEstado($estado) {
        return ($estado == 1) ? 1 : 0;
    }
}