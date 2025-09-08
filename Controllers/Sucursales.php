<?php 
	class Sucursales extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDPAGINAS);
		}


		// Muestra la vista de sucursales si la página existe, de lo contrario redirige a la base
		public function sucursales()
		{
			$pageContent = getPageRout('sucursales');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPRESA;
				$data['page_title'] = NOMBRE_EMPRESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"sucursales",$data);  
			}
		}

	}
 ?>
