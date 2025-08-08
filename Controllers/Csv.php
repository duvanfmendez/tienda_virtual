<?php
class Csv extends Controllers {
    public function __construct() {
        parent::__construct();
        session_start();
    }

    public function csv() {
        $data['page_tag'] = "Carga CSV";
        $data['page_title'] = "Carga Masiva desde CSV";
        $data['page_name'] = "csv";
        $data['personas'] = $this->model->selectPersonas();
        $this->views->getView($this, "csv", $data);
    }

    public function subirCSV() {
        if ($_FILES['dataCliente']['name']) {
            $archivo = fopen($_FILES['dataCliente']['tmp_name'], "r");

            $i = 0;
            while (($datos = fgetcsv($archivo, 1000, ";")) !== FALSE) {
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
