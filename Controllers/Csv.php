<?php
class Csv extends Controllers {
        
    
// Constructor: inicia la sesión y llama al constructor del controlador base 
    public function __construct() {
        parent::__construct();
        session_start();
    }


 // Carga la vista principal de carga CSV, incluyendo una lista de personas existentes desde el modelo
    public function csv() {
        $data['page_tag'] = "Carga CSV";
        $data['page_title'] = "Carga Masiva desde CSV";
        $data['page_name'] = "csv";
        $data['personas'] = $this->model->selectPersonas();
        $this->views->getView($this, "csv", $data);
    }


   
    // Procesa el archivo CSV subido y guarda los datos en la base de datos usando el modelo
    public function subirCSV() {
        if ($_FILES['dataCliente']['name']) {
            $archivo = fopen($_FILES['dataCliente']['tmp_name'], "r"); // Abre el archivo CSV

            $i = 0;
            while (($datos = fgetcsv($archivo, 1000, ";")) !== FALSE) {
                // Omite la primera fila (cabecera) y guarda el resto en la base de datos
                if ($i != 0) {
                    $this->model->insertPersona($datos);
                }
                $i++;
            }

            fclose($archivo);
        }

        header("Location: " . base_url() . "/csv");
        die();
    }
}
