<?php
	
	class vistasModelo{

		/*--------- Modelo obtener vistas ---------*/
		protected static function obtener_vistas_modelo($vistas){
			$listaBlanca=["bitacora","prueba","proveedor-list","proveedor-new","proveedor-update","client-update","company"
			,"home","insumos-list","insumos-new","insumos-update","inventario-list","reservation-list","reservation-new",
			"reservation-pending","reservation-search","reservation-update","user-list",
			"reservation-reservation","user-new","user-search","user-update","salir","compra-list","compra-new","compra-search","compra-detalle"];
			if(in_array($vistas, $listaBlanca)){
				if(is_file("./vistas/contenidos/".$vistas."-view.php")){
					$contenido="./vistas/contenidos/".$vistas."-view.php";
				}else{
					$contenido="404";
				}
			}elseif($vistas=="login" || $vistas=="index" || $vistas=="olvido-contrasena" || $vistas=="rec-correo" || $vistas=="rec-preguntas" || $vistas=="cambiocontrasena"
			 || $vistas=="primer-ingreso" || $vistas=="verifica-codigo" || $vistas=="autoregistro" || $vistas=="preguntasusuario"){
				switch($vistas){
					case 'login':
						$contenido="login";
					break;
					case 'index':
						$contenido="login";
					break;
					case 'olvido-contrasena':
						$contenido="olvido-contrasena";
					break;
					case 'rec-correo':
						$contenido="rec-correo";
					break;
					case 'rec-preguntas':
						$contenido="rec-preguntas";
					break;
					case 'cambiocontrasena':
						$contenido="cambiocontrasena";
					break;
					case 'primer-ingreso':
						$contenido="primer-ingreso";
					break;
					case 'verifica-codigo':
						$contenido="verifica-codigo";
					break;
					case 'autoregistro':
						$contenido="autoregistro";
					break;
					case 'preguntasusuario':
						$contenido="preguntasusuario";
					break;
				}

			}elseif($vistas=="login" || $vistas=="index" || $vistas=="prueba" || $vistas=="rec-correo" || $vistas=="rec-preguntas" || $vistas=="cambiocontrasena" 
			|| $vistas=="primer-ingreso" || $vistas=="verifica-codigo" || $vistas=="autoregistro" || $vistas=="preguntasusuario"){
				$contenido="login";

			}else{
				$contenido="404";
			}
			return $contenido;
		}
	}