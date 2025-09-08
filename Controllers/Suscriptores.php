<?php 

	class Suscriptores extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MSUSCRIPTORES);
		}


		// Carga la vista principal de suscriptores con sus configuraciones y permisos
		public function Suscriptores()
		{
			if(empty($_SESSION['permisosMod']['r'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_tag'] = "Suscriptores";
			$data['page_title'] = "SUSCRIPTORES <small>Tienda Virtual</small>";
			$data['page_name'] = "suscriptores";
			$data['page_functions_js'] = "functions_suscriptores.js";
			$this->views->getView($this,"suscriptores",$data);
		}


		// Obtiene todos los suscriptores y los devuelve en formato JSON
		public function getSuscriptores(){
			if($_SESSION['permisosMod']['r']){
				$arrData = $this->model->selectSuscriptores();
				echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

	}
?>