<?php

    require_once "mainModel.php";

    class compraModelo extends mainModel
    {

        // modelo para agregar compra
        protected static function agregar_compra_modelo($datos)
        {
            $sql=mainModel::conectar()->prepare("INSERT INTO TBL_compras(id_proveedor,id_usuario,id_estado_compra,
            fech_compra,total_compra) 
            VALUES(?,?,?,?,?)");


			$sql->bindParam(1,$datos['idproveedor']);
			$sql->bindParam(2,$datos['usuario']);
			$sql->bindParam(3,$datos['estadocompra']);
			$sql->bindParam(4,$datos['fechacompra']);
            $sql->bindParam(5,$datos['totalcompra']);
			$sql->execute();
			return $sql;

        }

        // modelo para actualizar compra
        protected static function actualizar_compra_modelo ($dato, $id)
        {
            $sql=mainModel::conectar()->prepare("UPDATE ");

            $sql->bindParam(1,$dato['nombreinsumo']);
			$sql->bindParam(2,$dato['cantidad']);
			$sql->bindParam(3,$dato['precio']);
			$sql->bindParam(4,$dato['fechacaducidad']);
			$sql->bindParam(5,$dato['fechacompra']);
            $sql->bindParam(6,$dato['proveedor']);
            $sql->bindParam(7,$dato['estadocompra']);
            $sql->bindParam(8,$dato['totalcompra']);
			$sql->execute();
			return $sql;

            	/* VERIFICAR SI GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_compra" => null,
					"accion" => "Actualizacion de compra",
					"descripcion" => "Acceso de compra"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
        }

    }