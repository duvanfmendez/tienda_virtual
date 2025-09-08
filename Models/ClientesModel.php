<?php 
class ClientesModel extends Mysql
{
	private $intIdUsuario;
	private $strIdentificacion;
	private $strNombre;
	private $strApellido;
	private $intTelefono;
	private $strEmail;
	private $strPassword;
	private $strToken;
	private $intTipoId;
	private $intStatus;
	private $strNit;
	private $strNomFiscal;
	private $strDirFiscal;

	public function __construct()
	{
		parent::__construct();
	}	

	/**
	 * Inserta un nuevo cliente en la base de datos.
	 * Verifica que el email o la identificación no estén registrados previamente.
	 * @return int|string ID del nuevo cliente o "exist" si ya existe
	 */
	public function insertCliente(string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid, string $nit, string $nomFiscal, string $dirFiscal){

		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strPassword = $password;
		$this->intTipoId = $tipoid;
		$this->strNit = $nit;
		$this->strNomFiscal = $nomFiscal;
		$this->strDirFiscal = $dirFiscal;

		$return = 0;
		$sql = "SELECT * FROM persona WHERE 
				email_user = '{$this->strEmail}' or identificacion = '{$this->strIdentificacion}' ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
			$query_insert  = "INSERT INTO persona(identificacion,nombres,apellidos,telefono,email_user,password,rolid,nit,nombrefiscal,direccionfiscal) 
							  VALUES(?,?,?,?,?,?,?,?,?,?)";
        	$arrData = array($this->strIdentificacion,
    						$this->strNombre,
    						$this->strApellido,
    						$this->intTelefono,
    						$this->strEmail,
    						$this->strPassword,
    						$this->intTipoId,
    						$this->strNit,
    						$this->strNomFiscal,
    						$this->strDirFiscal);
        	$request_insert = $this->insert($query_insert,$arrData);
        	$return = $request_insert;
		}else{
			$return = "exist";
		}
        return $return;
	}

	/**
	 * Obtiene todos los clientes registrados con rol de cliente (RCLIENTES) y que estén activos.
	 * @return array Lista de clientes
	 */

	public function selectClientes()
	{
		$sql = "SELECT idpersona,identificacion,nombres,apellidos,telefono,email_user,status 
				FROM persona 
				WHERE rolid = ".RCLIENTES." and status != 0 "; 
		$request = $this->select_all($sql);
		return $request;
	}

	/**
	 * Obtiene los datos de un cliente en específico.
	 * Incluye información fiscal y fecha de registro.
	 * @param int $idpersona
	 * @return array Datos del cliente
	 */
	public function selectCliente(int $idpersona){
		$this->intIdUsuario = $idpersona;
		$sql = "SELECT idpersona,identificacion,nombres,apellidos,telefono,email_user,nit,nombrefiscal,direccionfiscal,status, DATE_FORMAT(datecreated, '%d-%m-%Y') as fechaRegistro 
				FROM persona
				WHERE idpersona = $this->intIdUsuario and rolid = ".RCLIENTES;
		$request = $this->select($sql);
		return $request;
	}

	/**
	 * Actualiza los datos de un cliente.
	 * Si se proporciona un password, también lo actualiza; de lo contrario mantiene el anterior.
	 * Verifica que no haya conflictos con identificación o correo de otro usuario.
	 * @return string|bool "exist" si ya existe, o resultado de la actualización
	 */

	public function updateCliente(int $idUsuario, string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, string $nit, string $nomFiscal, string $dirFiscal){

		$this->intIdUsuario = $idUsuario;
		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strPassword = $password;
		$this->strNit = $nit;
		$this->strNomFiscal = $nomFiscal;
		$this->strDirFiscal = $dirFiscal;

		$sql = "SELECT * FROM persona WHERE (email_user = '{$this->strEmail}' AND idpersona != $this->intIdUsuario)
									  OR (identificacion = '{$this->strIdentificacion}' AND idpersona != $this->intIdUsuario) ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
			if($this->strPassword  != "")
			{
				$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, email_user=?, password=?, nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE idpersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strPassword,
        						$this->strNit,
        						$this->strNomFiscal,
        						$this->strDirFiscal);
			}else{
				$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, email_user=?, nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE idpersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strNit,
        						$this->strNomFiscal,
        						$this->strDirFiscal);
			}
			$request = $this->update($sql,$arrData);
		}else{
			$request = "exist";
		}
		return $request;
	}

	/**
	 * Elimina (desactiva) un cliente cambiando su estado a 0.
	 * @return bool Resultado de la actualización
	 */
	public function deleteCliente(int $intIdpersona)
	{
		$this->intIdUsuario = $intIdpersona;
		$sql = "UPDATE persona SET status = ? WHERE idpersona = $this->intIdUsuario ";
		$arrData = array(0);
		$request = $this->update($sql,$arrData);
		return $request;
	}
}

 ?>