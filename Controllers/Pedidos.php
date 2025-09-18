<?php 
require_once("Models/TTipoPago.php"); 
class Pedidos extends Controllers{
	use TTipoPago;
	public function __construct()
	{
		parent::__construct();
		session_start();
		// Verifica que el usuario haya iniciado sesión
		if(empty($_SESSION['login']))
		{
			header('Location: '.base_url().'/login');
			die();
		}
		// Obtiene los permisos del módulo de pedidos
		getPermisos(MPEDIDOS);
	}


	// Carga la vista principal del módulo de pedidos
	public function Pedidos()
	{
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$data['page_tag'] = "Pedidos";
		$data['page_title'] = "PEDIDOS <small>Tienda Virtual</small>";
		$data['page_name'] = "pedidos";
		$data['page_functions_js'] = "functions_pedidos.js";
		$this->views->getView($this,"pedidos",$data);
	}


	// Obtiene la lista de pedidos (formato JSON para DataTable)
	public function getPedidos(){
		if($_SESSION['permisosMod']['r']){
			$idpersona = "";
			if( $_SESSION['userData']['idrol'] == RCLIENTES ){
				$idpersona = $_SESSION['userData']['idpersona'];
			}
			// Agrega botones de acciones (ver, editar, PDF, etc.) para cada pedido
			$arrData = $this->model->selectPedidos($idpersona);
			//dep($arrData);
			for ($i=0; $i < count($arrData); $i++)
				 {
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';

				$arrData[$i]['transaccion'] = $arrData[$i]['referenciacobro'];
				if($arrData[$i]['idtransaccionpaypal'] != ""){
					$arrData[$i]['transaccion'] = $arrData[$i]['idtransaccionpaypal'];
				}

				$arrData[$i]['monto'] = SMONEY.formatMoney($arrData[$i]['monto']);

				
				if($_SESSION['permisosMod']['r']){
					
					$btnView .= ' <a title="Ver Detalle" href="'.base_url().'/pedidos/orden/'.$arrData[$i]['idpedido'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="far fa-eye"></i> </a>

						<a title="Generar PDF" href="'.base_url().'/factura/generarFactura/'.$arrData[$i]['idpedido'].'" target="_blanck" class="btn btn-danger btn-sm"> <i class="fas fa-file-pdf"></i> </a> ';

					if($arrData[$i]['idtipopago'] == 1){
						$btnView .= '<a title="Ver Transacción" href="'.base_url().'/pedidos/transaccion/'.$arrData[$i]['idtransaccionpaypal'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="fa fa-paypal" aria-hidden="true"></i> </a> ';
					}else{
						$btnView .= '<button class="btn btn-secondary btn-sm" disabled=""><i class="fa fa-paypal" aria-hidden="true"></i></button> ';
					}
				}
				if($_SESSION['permisosMod']['u']){
					$btnEdit = '<button class="btn btn-primary  btn-sm" onClick="fntEditInfo(this,'.$arrData[$i]['idpedido'].')" title="Editar pedido"><i class="fas fa-pencil-alt"></i></button>';
				}
				$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		}
		die();
	}


	// Muestra el detalle de un pedido específico
	public function orden($idpedido){
		if(!is_numeric($idpedido)){
			header("Location:".base_url().'/pedidos');
		}
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$idpersona = "";
		if( $_SESSION['userData']['idrol'] == RCLIENTES ){
			$idpersona = $_SESSION['userData']['idpersona'];
		}
		
		$data['page_tag'] = "Pedido - Stunt Riders";
		$data['page_title'] = "PEDIDO <small>Stunt Riders</small>";
		$data['page_name'] = "pedido";
		$data['arrPedido'] = $this->model->selectPedido($idpedido,$idpersona);
		$this->views->getView($this,"orden",$data);
	}


	// Muestra una vista con los detalles de una transacción (solo lectura)
	public function transaccion($transaccion){
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$idpersona = "";
		if( $_SESSION['userData']['idrol'] == RCLIENTES ){
			$idpersona = $_SESSION['userData']['idpersona'];
		}
		$requestTransaccion = $this->model->selectTransPaypal($transaccion,$idpersona);	
		$data['page_tag'] = "Detalles de la transacción - Stunt Riders";
		$data['page_title'] = "Detalles de la transacción";
		$data['page_name'] = "detalle_transaccion";
		$data['page_functions_js'] = "functions_pedidos.js";
		$data['objTransaccion'] = $requestTransaccion;
		$this->views->getView($this,"transaccion",$data);
	}


	// Devuelve los datos HTML para mostrar el modal de reembolso
	public function getTransaccion(string $transaccion){
		if($_SESSION['permisosMod']['r'] and $_SESSION['userData']['idrol'] != RCLIENTES){
			if($transaccion == ""){
				$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
			}else{
				$transaccion = strClean($transaccion);
				$requestTransaccion = $this->model->selectTransPaypal($transaccion);
				if(empty($requestTransaccion)){
					$arrResponse = array("status" => false, "msg" => "Datos no disponibles.");
				}else{
					$htmlModal = getFile("Template/Modals/modalReembolso",$requestTransaccion);
					$arrResponse = array("status" => true, "html" => $htmlModal);
				}
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}


	// Procesa la solicitud de reembolso para una transacción
	public function setReembolso(){
		if($_POST){
			if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrol'] != RCLIENTES){
				//dep($_POST);
				$transaccion = strClean($_POST['idtransaccion']);
				$observacion = strClean($_POST['observacion']);
				$requestTransaccion = $this->model->reembolsoPaypal($transaccion,$observacion);
				if($requestTransaccion){
					$arrResponse = array("status" => true, "msg" => "El reembolso se ha procesado.");
				}else{
					$arrResponse = array("status" => false, "msg" => "No es posible procesar el reembolso.");
				}
			}else{
				$arrResponse = array("status" => false, "msg" => "No es posible realizar el proceso, consulte al administrador.");
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}


	// Devuelve los datos de un pedido para mostrar en el modal de edición
	public function getPedido(string $pedido){
		if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrol'] != RCLIENTES){
			if($pedido == ""){
				$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
			}else{
				$requestPedido = $this->model->selectPedido($pedido,"");
				if(empty($requestPedido)){
					$arrResponse = array("status" => false, "msg" => "Datos no disponibles.");
				}else{
					$requestPedido['tipospago'] = $this->getTiposPagoT();
					$htmlModal = getFile("Template/Modals/modalPedido",$requestPedido);
					$arrResponse = array("status" => true, "html" => $htmlModal);
				}
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}



	// Guarda los cambios realizados a un pedido (estado, tipo de pago, transacción)
	public function setPedido(){
		if($_POST){
			if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrol'] != RCLIENTES){

				$idpedido = !empty($_POST['idpedido']) ? intval($_POST['idpedido']) : "";
				$estado = !empty($_POST['listEstado']) ? strClean($_POST['listEstado']) : "";
				$idtipopago =  !empty($_POST['listTipopago']) ? intval($_POST['listTipopago']) : "";
				$transaccion = !empty($_POST['txtTransaccion']) ? strClean($_POST['txtTransaccion']) : "";

				if($idpedido == ""){
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}else{
					if($idtipopago == ""){
						if($estado == ""){
							$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
						}else{
							$requestPedido = $this->model->updatePedido($idpedido,"","",$estado);
							if($requestPedido){
								$arrResponse = array("status" => true, "msg" => "Datos actualizados correctamente");
							}else{
								$arrResponse = array("status" => false, "msg" => "No es posible actualizar la información.");
							}
						}
					}else{
						if($transaccion == "" or $idtipopago =="" or $estado == ""){
							$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
						}else{
							$requestPedido = $this->model->updatePedido($idpedido,$transaccion,$idtipopago,$estado);
							if($requestPedido){
								$arrResponse = array("status" => true, "msg" => "Datos actualizados correctamente");
							}else{
								$arrResponse = array("status" => false, "msg" => "No es posible actualizar la información.");
							}
						}
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		
			}
			// Valida los datos y llama al modelo para actualizar el pedido
				// Devuelve respuesta JSON según el resultado
		}

		die();
	}
}
 ?>