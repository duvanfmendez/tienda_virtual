<?php 
	//const BASE_URL = "https://abelosh.com/store";
	const BASE_URL = "http://sql208.infinityfree.com/tienda_virtual";

	//Zona horaria
	date_default_timezone_set('America/Guatemala');

	//Datos de conexión a Base de Datos
	const DB_HOST = "sql208.infinityfree.com";
	const DB_NAME = "if0_39804321_tienda_virtual";
	const DB_USER = "if0_39804321";
	const DB_PASSWORD = "stuntriders2025";
	const DB_CHARSET = "utf8";

	//Para envío de correo
	const ENVIRONMENT = 0; // Local: 0, Produccón: 1;

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "$";
	const CURRENCY = "COP";

	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "AYcF2p8R-9gV_iUQ1AGdOz_6vOAc_jwwUSfCC4FQr6bWLT_7_d4mbDFrv1ulNnelVZcicrJwgwVwJIRF";
	const SECRET = "EIhyWpvOuPhIBhTKG54dyTJ2HtFc-EbegpQgsyqQkHKqRzZTu0zzdHr9_M7A7u25hNG0o_NySx8wBuCt";
	//LIVE PAYPAL
	//const IDCLIENTE = "AWBtVubwv1loCQFkpbwVdxw3GN9v4wj8ieLQPCpm8i8v0iwHSO_wc1_fWPNqldrcrPh1RqQ1bIcZPKWD";
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const SECRET = "ELCYtuxTFft8kEuAhcg8jE7_Bi31BnMd8E4DilpsnnsgXnZRUA8AKiXHwOVSPVu7xFIDZYw_6AjXulyC";

	//Datos envio de correo
	const NOMBRE_REMITENTE = "StuntRider";
	const EMAIL_REMITENTE = "soportestuntriders@gmail.com";
	const NOMBRE_EMPESA = "StuntRider";
	const WEB_EMPRESA = "www.StuntRiders";

	const DESCRIPCION = "La mejor tienda en línea con artículos de motos.";
	const SHAREDHASH = "Stunt Riders";

	//Datos Empresa
	const DIRECCION = "Cra. 15 Bis #18A - 07 local 1, Los Mártires, Bogotá, Cundinamarca";
	const TELEMPRESA = "+(57)3212050326";
	const WHATSAPP = "+57 321 2050326";
	const EMAIL_EMPRESA = "soportestuntriders@gmail.com";
	const EMAIL_PEDIDOS = "soportestuntriders@gmail.com"; 
	const EMAIL_SUSCRIPCION = "soportestuntriders@gmail.com";
	const EMAIL_CONTACTO = "soportestuntriders@gmail.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'abelosh';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 50;

	//Módulos
	const MDASHBOARD = 1;
	const MUSUARIOS = 2;
	const MCLIENTES = 3;
	const MPRODUCTOS = 4;
	const MPEDIDOS = 5;
	const MCATEGORIAS = 6;
	const MSUSCRIPTORES = 7;
	const MDCONTACTOS = 8;
	const MDPAGINAS = 9;

	//Páginas
	const PINICIO = 1;
	const PTIENDA = 2;
	const PCARRITO = 3;
	const PNOSOTROS = 4;
	const PCONTACTO = 5;
	const PPREGUNTAS = 6;
	const PTERMINOS = 7;
	const PSUCURSALES = 8;
	const PERROR = 9;

	//Roles
	const RADMINISTRADOR = 1;
	const RSUPERVISOR = 2;
	const RCLIENTES = 3;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');

	//Productos por página
	const CANTPORDHOME = 8;
	const PROPORPAGINA = 4;
	const PROCATEGORIA = 4;
	const PROBUSCAR = 4;

	//REDES SOCIALES
	const FACEBOOK = "https://www.facebook.com/stuntriderscolombia/?locale=es_LA";
	const INSTAGRAM = "https://www.instagram.com/stuntriderscolombia/";
	

 ?>