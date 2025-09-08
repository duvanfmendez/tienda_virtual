<?php 

class ContactosModel extends Mysql{

	/**
	 * Obtiene todos los contactos registrados.
	 * Devuelve id, nombre, email y fecha formateada.
	 * @return array Lista de contactos
	 */

	public function selectContactos()
	{
		$sql = "SELECT id, nombre, email, DATE_FORMAT(datecreated, '%d/%m/%Y') as fecha
				FROM contacto ORDER BY id DESC";
		$request = $this->select_all($sql);
		return $request;
	}

	/**
	 * Obtiene el detalle de un mensaje de contacto específico.
	 * Incluye nombre, email, fecha y el mensaje enviado.
	 * @param int $idmensaje
	 * @return array Datos del mensaje
	 */
	public function selectMensaje(int $idmensaje){
		$sql = "SELECT id, nombre, email, DATE_FORMAT(datecreated, '%d/%m/%Y') as fecha, mensaje
				FROM contacto WHERE id = {$idmensaje}";
		$request = $this->select($sql);
		return $request;
	}

}
 ?>