<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootsstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<p>ludwin es gei</p>
<h1>hola mom provando conexión</h1>
<?php 
	require_once("Config/Config.php");
	require_once("Helpers/Helpers.php");
	

 


	$url = !empty($_GET['url']) ? $_GET['url'] : 'home/home';
	$arrUrl = explode("/", $url);
	$controller = $arrUrl[0];
	$method = $arrUrl[0];
	$params = "";

	if(!empty($arrUrl[1]))
	{
		if($arrUrl[1] != "")
		{
			$method = $arrUrl[1];	
		}
	}

	if(!empty($arrUrl[2]))
	{
		if($arrUrl[2] != "")
		{
			for ($i=2; $i < count($arrUrl); $i++) {
				$params .=  $arrUrl[$i].',';
				# code...
			}
			$params = trim($params,',');
		}
	}

	require_once("Libraries/Core/Autoload.php");
	require_once("Libraries/Core/Load.php");
 

 ?>

