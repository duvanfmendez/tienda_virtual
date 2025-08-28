<?php
class Conexion{
	private $conect;

	public function __construct(){
		$connectionString = "mysql:host=".sql106.infinityfree.com.";dbname=".if0_39811723_XXX.";charset=".DB_CHARSET;
		try{
			$this->conect = new PDO($connectionString, if0_39811723, stuntrider1234);
			$this->conect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		    //echo "conexión exitosa";
		}catch(PDOException $e){
			$this->conect = 'Error de conexión';
		    echo "ERROR: " . $e->getMessage();
		}
	}

	public function conect(){
		return $this->conect;
	}
}

?>