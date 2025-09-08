<?php 
// Constructor de la clase: inicia la sesión y establece los permisos necesarios para acceder a esta página
	class Contacto extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDPAGINAS);
		}
        // Función principal que carga la vista de la página de contacto
		public function contacto()
		{
			$pageContent = getPageRout('contacto');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"contacto",$data); 
			}

		}

	}
 ?>
