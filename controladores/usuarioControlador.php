<?php

if($peticionAjax){
	require_once "../modelos/usuarioModelo.php";
}else{
	require_once "./modelos/usuarioModelo.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}
require_once "../controladores/emailControlador.php";

class usuarioControlador extends usuarioModelo
{

	/*--------- Controlador agregar usuario ---------*/
	public function agregar_usuario_controlador()
	{
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
					$check_correo=mainModel::ejecutar_consulta_simple("SELECT correo_electronico FROM TBL_usuarios WHERE correo_electronico='$Correo'");
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

			/*== Comprobando CLAVE ==*/

			 if(mainModel::verificar_datos("[a-zA-Z0-9$@.-]{7,100}",$Contraseña) ){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Las CLAVES no coinciden con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			} 

			/*== Comprobando DNI ==*/
			/* $check_usuario=mainModel::ejecutar_consulta_simple("SELECT usuario_dni FROM usuario WHERE usuario_dni='$Usuario'");
			if($check_usuario->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El USUARIO ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			} */

			/*== Comprobando usuario ==*/
			$check_user=mainModel::ejecutar_consulta_simple("SELECT usuario FROM TBL_usuarios WHERE usuario='$Usuario'");
			if($check_user->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE DE USUARIO ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if($Contraseña=""){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Las claves que acaba de ingresar no coinciden",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}else{
				$clave=mainModel::encryption($Contraseña);
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
			/*== AGREGAR USUARIOS ==*/
			$datos_usuario_reg=[
				"usu"=>$Usuario,
				"nombre"=>$Nombre,
				"estado"=>"1",
				"contrase"=>$clave,//$Contraseña,
				"rol"=>$privilegio,
				"ingreso"=>$Ingreso,
				"vencimiento"=>$Vencimiento,
				"correo"=>$Correo,
				"creador"=>$creado,
				"fecha_crea"=>$Creacion,
			];

			$agregar_usuario=usuarioModelo::agregar_usuario_modelo($datos_usuario_reg);

			if($agregar_usuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"usuario registrado",
					"Texto"=>"Los datos del usuario han sido registrados con exito",
					"Tipo"=>"success"
				];
				$envioCorreo = new Correo();
				$respuesta = $envioCorreo->CorreoCreacionUsuario($Correo,$Usuario,$Contraseña);
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

	


/*                           MUCHA PAJA CON ESTE CONTROLADOR MEJOR HICE UN SELEC NORNAL */

	/*--------- Controlador lista usuario ---------*/
	/*public function paginador_usuario_controlador($pagina,$registros,$id,$url,$busqueda)
	{
		$pagina=mainModel::limpiar_cadena($pagina);
		$registros=mainModel::limpiar_cadena($registros);
		$id=mainModel::limpiar_cadena($id);
		$url=mainModel::limpiar_cadena($url);
		$url=SERVERURL.$url."/"; //aqui concatenamos la url
		$busqueda=mainModel::limpiar_cadena($busqueda);

		$tabla=""; //esta sera la tabala que crearemos

		$pagina= (isset($pagina) && $pagina>0) ?(int) $pagina : 1 ; //controla que siempre este en la pagina que es no se ingresen letras
		$inicio= ($pagina>0)  ? (($pagina*$registros)-$registros) : 0 ;

		if(isset($busqueda) &&! $busqueda=""){ 
			$consulta="SELECT SQL_CALC_FOUNT_ROWS * FROM TBL_usuarios WHERE ((id_usuario!='$id' AND id_usuario!='1')AND (usuario LIKE '%$busqueda%' OR
			 nombre_usuario LIKE '%$busqueda%' OR estado_usuario LIKE '%$busqueda%' OR correo_electronico LIKE '%$busqueda%' OR creado_por LIKE '%$busqueda%'))
				ORDER BY nombre_usuario ASC LIMIT $inicio,$registros";

		}else{
			$consulta="SELECT SQL_CALC_FOUNT_ROWS * FROM TBL_usuarios WHERE id_usuario!='$id' AND id_usuario!='1'
				ORDER BY nombre_usuario ASC LIMIT $inicio,$registros";

		}
		$conexion = mainModel::conectar();
		$datos =$conexion->query($consulta);
		$datos = $datos->fetchAll();

		$total = $conexion->query("SELECT FOUND_ROWS()");
		$total = (int)$total->fetchColumn();
		
		$Npaginas=ceil($total/$registros);

		$tabla.='<div class="table-responsive">
			<table class="table table-dark table-sm">
				<thead>
					<tr class="text-center roboto-medium">
						<th>#</th>
						<th>USUARIO</th>
						<th>NOMBRE</th>
						<th>ESTADO</th>
						<th>ROL</th>
						<th>CORREO</th>
						<th>CREADO POR</th>
						<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
					</tr>
				</thead>
				<tbody>';
			if($total>=1 && $pagina<=$Npaginas)
			{
				$contador=$inicio+1;
				foreach($datos as $rows) {
					$tabla.='	
					<tr class="text-center" >
						<td>'.$contador.'</td>
						<td>'.$rows['usuario'].'</td>
						<td>'.$rows['nombre_usuario'].'</td>
						<td>'.$rows['estado_usuario'].'</td>
						<td>'.$rows['id_rol'].'</td>
						<td>'.$rows['correo_electronico'].'</td>
						<td>'.$rows['creado_por'].'</td>
						<td>
							<a href="user-update.html" class="btn btn-success">
									<i class="fas fa-sync-alt"></i>	
							</a>
						</td>
						<td>
							<form action="">
								<button type="button" class="btn btn-warning">
										<i class="far fa-trash-alt"></i>
								</button>
							</form>
						</td>
					</tr>';
					$contador++;
				}
				}else{
				if($total>=1){
					$tabla.='<tr class="text-center" ><td colspan="9">
					<a>href="'.$url.'" class="btn btn-raised btn-primary btn-sm">Recargar Lista</a>
					</td></tr>';
				}else{
					$tabla.='<tr class="text-center" ><td colspan="9">no hay resgistros guardados en el sistema</td></tr>';
				}
				
			}
			$tabla.='</tbody></table></div>';

	} Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizar_usuario_controlador()
	{
		$Usuario=mainModel::limpiar_cadena($_POST['usuario_actu']);
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_usuario_actu']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_actu']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_actu']);
		$privilegio=mainModel::limpiar_cadena($_POST['id_rol_actu']);



			/*== ACTUALIZAR USUARIOS ==*/
			$datos_usuario_actu=
			[
				"usua"=>$Usuario,
				"nombrea"=>$Nombre,
				"correoa"=>$Correo,	
				"contrasea"=>$Contraseña,
				"rola"=>$privilegio,
							
			];

			$actualizar_usuario=usuarioModelo::actualizar_usuario_modelo($datos_usuario_actu);

			if($actualizar_usuario->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"usuario registrado",
					"Texto"=>"Los datos del usuario han sido registrados con exito",
					"Tipo"=>"success"
				];
			}else
			{
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