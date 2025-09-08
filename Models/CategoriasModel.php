<?php 

	class CategoriasModel extends Mysql
	{
		public $intIdcategoria;
		public $strCategoria;
		public $strDescripcion;
		public $intStatus;
		public $strPortada;
		public $strRuta;

		public function __construct()
		{
			parent::__construct();
		}

		/**
		 * Inserta una nueva categoría en la base de datos
		 * Verifica que no exista una con el mismo nombre antes de registrar.
		 * @return int|string ID del registro insertado o "exist" si ya existe
		 */
		public function inserCategoria(string $nombre, string $descripcion, string $portada, string $ruta, int $status){

			$return = 0;
			$this->strCategoria = $nombre;
			$this->strDescripcion = $descripcion;
			$this->strPortada = $portada;
			$this->strRuta = $ruta;
			$this->intStatus = $status;

			$sql = "SELECT * FROM categoria WHERE nombre = '{$this->strCategoria}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO categoria(nombre,descripcion,portada,ruta,status) VALUES(?,?,?,?,?)";
	        	$arrData = array($this->strCategoria, 
								 $this->strDescripcion, 
								 $this->strPortada,
								 $this->strRuta, 
								 $this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
			return $return;
		}

		/**
		 * Obtiene todas las categorías activas (status != 0)
		 * @return array Lista de categorías
		 */
		public function selectCategorias()
		{
			$sql = "SELECT * FROM categoria 
					WHERE status != 0 ";
			$request = $this->select_all($sql);
			return $request;
		}

		/**
		 * Obtiene una categoría específica por su ID
		 * @param int $idcategoria
		 * @return array Datos de la categoría
		 */
		public function selectCategoria(int $idcategoria){
			$this->intIdcategoria = $idcategoria;
			$sql = "SELECT * FROM categoria
					WHERE idcategoria = $this->intIdcategoria";
			$request = $this->select($sql);
			return $request;
		}

		/**
		 * Actualiza los datos de una categoría
		 * Verifica que no exista otra con el mismo nombre antes de actualizar.
		 * @return string|bool "exist" si ya existe, o resultado de la actualización
		 */
		public function updateCategoria(int $idcategoria, string $categoria, string $descripcion, string $portada, string $ruta, int $status){
			$this->intIdcategoria = $idcategoria;
			$this->strCategoria = $categoria;
			$this->strDescripcion = $descripcion;
			$this->strPortada = $portada;
			$this->strRuta = $ruta;
			$this->intStatus = $status;

			$sql = "SELECT * FROM categoria WHERE nombre = '{$this->strCategoria}' AND idcategoria != $this->intIdcategoria";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$sql = "UPDATE categoria SET nombre = ?, descripcion = ?, portada = ?, ruta = ?, status = ? WHERE idcategoria = $this->intIdcategoria ";
				$arrData = array($this->strCategoria, 
								 $this->strDescripcion, 
								 $this->strPortada,
								 $this->strRuta, 
								 $this->intStatus);
				$request = $this->update($sql,$arrData);
			}else{
				$request = "exist";
			}
		    return $request;			
		}


		/**
		 * Elimina (desactiva) una categoría cambiando su estado a 0
		 * Solo si no está relacionada con productos.
		 * @return string "ok", "error" o "exist"
		 */
		public function deleteCategoria(int $idcategoria)
		{
			$this->intIdcategoria = $idcategoria;
			$sql = "SELECT * FROM producto WHERE categoriaid = $this->intIdcategoria";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE categoria SET status = ? WHERE idcategoria = $this->intIdcategoria ";
				$arrData = array(0);
				$request = $this->update($sql,$arrData);
				if($request)
				{
					$request = 'ok';	
				}else{
					$request = 'error';
				}
			}else{
				$request = 'exist';
			}
			return $request;
		}	

		/**
		 * Obtiene las categorías configuradas para mostrarse en el footer
		 * Solo categorías activas (status = 1) y dentro de la constante CAT_FOOTER
		 * Además, genera la URL completa de la portada.
		 * @return array Lista de categorías del footer
		 */
		public function getCategoriasFooter(){
			$sql = "SELECT idcategoria, nombre, descripcion, portada, ruta
					FROM categoria WHERE  status = 1 AND idcategoria IN (".CAT_FOOTER.")";
			$request = $this->select_all($sql);
			if(count($request) > 0){
				for ($c=0; $c < count($request) ; $c++) { 
					$request[$c]['portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['portada'];		
				}
			}
			return $request;
		}


	}
 ?>