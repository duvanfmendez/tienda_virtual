<?php
	class Logout
	{
		// Constructor que finaliza la sesión del usuario y lo redirige al login
		public function __construct()
		{
			session_start();  // Inicia la sesión para manipularla
			session_unset();  // Limpia todas las variables de sesión
			session_destroy();		// Destruye la sesión actual
			header('location: '.base_url().'/login');
			die();
		}
	}
 ?>