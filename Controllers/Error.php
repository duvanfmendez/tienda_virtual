<?php 

	class Errors extends Controllers{
		    
		
		// Constructor básico: llama al constructor del controlador padre
		public function __construct()
		{
			parent::__construct();
		}
    
	
		// Muestra la página de error personalizada cuando no se encuentra una ruta
		public function notFound()
		{
			$pageContent = getPageRout('not-found');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"error",$data);
			}
		}
	}


// Instancia y ejecución inmediata del controlador de errores al final del archivo
	$notFound = new Errors();
	$notFound->notFound();
 ?>