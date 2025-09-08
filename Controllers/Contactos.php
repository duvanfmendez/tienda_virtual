<?php 

	class Contactos extends Controllers{
		// Constructor de la clase: inicia la sesión, valida si el usuario está logueado y aplica permisos de acceso
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MDCONTACTOS);
		}
		
		
		// Carga la vista principal del módulo de contactos si el usuario tiene permiso de lectura
		public function Contactos()
		{
			if(empty($_SESSION['permisosMod']['r'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_tag'] = "Contactos";
			$data['page_title'] = "CONTACTOS <small>Tienda Virtual</small>";
			$data['page_name'] = "contactos";
			$data['page_functions_js'] = "functions_contactos.js";
			$this->views->getView($this,"contactos",$data);
		}
		
		
		// Obtiene todos los mensajes de contacto y les agrega opciones de acción (como ver detalle) según los permisos
		public function getContactos(){
			if($_SESSION['permisosMod']['r']){
				$arrData = $this->model->selectContactos();
				for ($i=0; $i < count($arrData) ; $i++) { 
					$btnView = '';
					if($_SESSION['permisosMod']['r']){
						$btnView = '<button class="btn btn-info btn-sm" onClick="fntViewInfo('.$arrData[$i]['id'].')" title="Ver mensaje"><i class="far fa-eye"></i></button>';
					}
					$arrData[$i]['options'] = '<div class="text-center">'.$btnView.'</div>';
				}
				echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			}
			die();
		}


// Obtiene el detalle de un mensaje específico por ID, si el usuario tiene permisos
		public function getMensaje($idmensaje){
			if($_SESSION['permisosMod']['r']){
				$idmensaje = intval($idmensaje);
				if($idmensaje > 0){
					$arrData = $this->model->selectMensaje($idmensaje);
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
					}else{
						$arrResponse = array('status' => true, 'data' => $arrData);
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

	}
?>