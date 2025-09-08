<?php 
	class Nosotros extends Controllers{


		// Constructor que inicializa la clase padre, la sesión y obtiene permisos de páginas
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDPAGINAS);
		}


		// Función que carga la vista "Nosotros" con la información de la página
		public function nosotros()
		{
			$pageContent = getPageRout('nosotros');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"nosotros",$data);  
			}

		}

	}
 ?>
