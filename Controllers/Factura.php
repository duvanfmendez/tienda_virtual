<?php 
	require 'Libraries/html2pdf/vendor/autoload.php';
	use Spipu\Html2Pdf\Html2Pdf;

	class Factura extends Controllers{
		
		
		// Constructor: inicia la sesión, valida si el usuario está logueado y aplica permisos del módulo de pedidos
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MPEDIDOS);
		}
// Genera un PDF con los datos del pedido (factura)
		public function generarFactura($idpedido)
		{
			// Verifica si el usuario tiene permiso de lectura
			if($_SESSION['permisosMod']['r']){
				// Valida que el parámetro recibido sea un número (ID de pedido)
				if(is_numeric($idpedido)){
					$idpersona = "";
					// Si el usuario es un cliente, solo puede ver su propio pedido
					if($_SESSION['permisosMod']['r'] and $_SESSION['userData']['idrol'] == RCLIENTES){
						$idpersona = $_SESSION['userData']['idpersona'];
					}
					$data = $this->model->selectPedido($idpedido,$idpersona);
					if(empty($data)){
						echo "Datos no encontrados";
					}else{
						$idpedido = $data['orden']['idpedido'];
						ob_end_clean();
						$html = getFile("Template/Modals/comprobantePDF",$data);
						// Crea una instancia de Html2Pdf y genera el PDF
						$html2pdf = new Html2Pdf('p','A4','es','true','UTF-8');
						$html2pdf->writeHTML($html);
						$html2pdf->output('factura-'.$idpedido.'.pdf');
					}
				}else{
					echo "Dato no válido";
				}
			}else{
				header('Location: '.base_url().'/login');
				die();
			}
		}

	}
 ?>
