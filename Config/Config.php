<?php

const BASE_URL = "http://localhost/tienda_virtual/";

//Zona horaria


//Datos de conexión a Base de Datos
const DB_HOST = "localhost";
const DB_NAME = "db_tiendavirtual";
const DB_USER = "root";
const DB_PASSWORD = "";
const DB_CHARSET = "utf8";

//Para envío de correo
const ENVIRONMENT = 1; // Local: 0, Produccón: 1;

//Deliminadores decimal y millar Ej. 24,1989.00
const SPD = ".";
const SPM = ",";

//Simbolo de moneda
const SMONEY = "$";
const CURRENCY = "USD";

//Api PayPal
//SANDBOX PAYPAL
//const URLPAYPAL = "https://api-m.sandbox.paypal.com";
//const IDCLIENTE = "AdH6-sSdDI6aoCeLt8nEpslPh0GSH2qCP71Qw95TjE35-f2aXscI2Dv3XI04aBBHfWh7yWHqNWKukc5o";
//const SECRET = "EKfGJJyPYZcLIyTIVWia1X9DIR4tSojMONKv8xw9iKU1lVFBrH3qq7srfuOp3czvk-flyQyTWdOcurQf";

//LIVE PAYPAL
const IDCLIENTE = "ASSzBjKiaYf5RzPiUbNqMVbiA1NdATz8yYiu7OToFvinOqcSOF-TQ6VF5UNarABPAQH1PYRyu77XgK98";
const URLPAYPAL = "https://api-m.paypal.com";
const SECRET = "EI05lyjJQDX_OBJh3qiSmRoDjLjN_w5TC-YNMY5_PhtRQ7SobYlHKER_S0TRgF_YK6KHFkTqq1WT_89h";

const NOMBRE_REMITENTE = "Soporte Stunt Riders";
const EMAIL_REMITENTE  = "soportestuntriders@gmail.com";
const NOMBRE_EMPRESA   = "Stunt Riders";
const WEB_EMPRESA      = "www.stuntriders.com"; // si la tienes


const DESCRIPCION = "La mejor tienda De Motos De lujo.";
const SHAREDHASH = "Stunt Riders";

//Datos Empresa
const DIRECCION = "Cra. 15 Bis #18A - 07 local 1, Los Mártires, Bogotá  D.C.";
const TELEMPRESA = "+57 3169740070";
const WHATSAPP = "+57 3169740070";
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

const STATUS = array('Completo', 'Aprobado', 'Cancelado', 'Reembolsado', 'Pendiente', 'Entregado');

//Productos por página
const CANTPORDHOME = 20;
const PROPORPAGINA = 20;
const PROCATEGORIA = 20;
const PROBUSCAR = 8;

//REDES SOCIALES
const FACEBOOK = "https://www.facebook.com/stuntriderscolombia/?locale=es_LA";
const INSTAGRAM = "https://www.instagram.com/stuntriderscolombia?utm_source=ig_web_button_share_sheet&igsh=MXIwcnQ3ZmhyYXE3NQ==";
