<?php

if($peticionAjax){
	require_once "../modelos/usuarioModelo.php";
}else{
	require_once "./modelos/usuarioModelo.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}

class usuarioControlador extends usuarioModelo{

	/*--------- Controlador agregar usuario ---------*/
	public function agregar_usuario_controlador(){
		$Usuario=mainModel::limpiar_cadena($_POST['usuario_reg']);
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_usuario_reg']);

		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_reg']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_reg']);
		$Ingreso=mainModel::limpiar_cadena($_POST['primer_ingreso_reg']);
		$Vencimiento=mainModel::limpiar_cadena($_POST['fecha_vencimiento_reg']);
		$creado=mainModel::limpiar_cadena($_POST['creado_por_reg']);
		$Creacion=mainModel::limpiar_cadena($_POST['fecha_creacion_reg']);


		$privilegio=mainModel::limpiar_cadena($_POST['id_rol']);


		/*== comprobar campos vacios ==*/
		if($Usuario=="" || $Nombre=="" || $Correo=="" || $Contraseña=="" || $Vencimiento=="" || $Creacion==""){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se an llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}


			/*== Verificando integridad de los datos ==*/
			if(mainModel::verificar_datos("[A-Z]{1,15}",$Usuario)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El USUARIO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,20}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			/*== Comprobando email ==*/
			if($Correo!=""){
				if(filter_var($Correo,FILTER_VALIDATE_EMAIL)){
					$check_correo=mainModel::ejecutar_consulta_simple("SELECT correo_electronico FROM TBL_usuario WHERE correo_electronico='$Correo'");
					if($check_correo->rowCount()>0){
						$alerta=[
							"Alerta"=>"simple",
							"Titulo"=>"Ocurrió un error inesperado",
							"Texto"=>"El Correp ingresado ya se encuentra registrado en el sistema",
							"Tipo"=>"error"
						];
						echo json_encode($alerta);
						exit();
					}
				}else{
					$alerta=[
						"Alerta"=>"simple",
						"Titulo"=>"Ocurrió un error inesperado",
						"Texto"=>"Ha ingresado un correo no valido",
						"Tipo"=>"error"
					];
					echo json_encode($alerta);
					exit();
				}
			}

	

			/*== Comprobando privilegio ==*/
			if($privilegio<1 || $privilegio>2){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El privilegio seleccionado no es valido",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			$datos_usuario_reg=[
				"Usu"=>$Usuario,
				"Nombre"=>$Nombre,
				"Estado"=>"1",
				"correo"=>$Correo,
				"contrase"=>$Contraseña,
				"ingreso"=>$Ingreso,
				"vencimiento"=>$Vencimiento,
				"creador"=>$creado,
				"fecha_crea"=>"Creacion",
				"Rol"=>$privilegio
			];

			$agregar_usuario=usuarioModelo::agregar_usuario_modelo($datos_usuario_reg);

			if($agregar_usuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"usuario registrado",
					"Texto"=>"Los datos del usuario han sido registrados con exito",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el usuario",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
		} /* Fin controlador */

	}