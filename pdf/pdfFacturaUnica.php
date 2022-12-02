<?php
require_once('../tcpdf/tcpdf.php'); //Llamando a la Libreria TCPDF
include ("../cone.php");    //Llamando a la conexión para BD
date_default_timezone_set('America/Tegucigalpa');

ob_end_clean(); //limpiar la memoria

class MYPDF extends TCPDF{
    	public function Header() {
            $bMargin = $this->getBreakMargin();
            $auto_page_break = $this->AutoPageBreak;
            $this->SetAutoPageBreak(false, 0);
            $this->Image('https://i.pinimg.com/564x/35/f5/3c/35f53c0062b906ca788a77b97e92e9f1.jpg', 90, 12, 30, 30, '', '', '', false, 30, '', false, false, 0);
            $this->SetAutoPageBreak($auto_page_break, $bMargin);
            $this->setPageMark();
	    }

            public function Footer() {
                $this->SetY(-15);
                $this->SetFont('helvetica', '', 8);
                //Mostrar cantidad de paginas
                //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
                $this->html = '<p style="border-top:1px solid #999; text-align:center;">
                                                 PAG 1
                                                </p>';
                $this->writeHTML($this->html, true, false, true, false, '');
        }
}


//Iniciando un nuevo pdf
        $id_factura=$_POST['id_factura'];

        $sqlFactura = ("SELECT * FROM TBL_pedidos WHERE id_pedido='$id_factura'");
        $query = mysqli_query($conexion, $sqlFactura);

        while ($fila = mysqli_fetch_array($query)) {
                $n_factura=$fila['num_factura'];
                $fecha_facturacion=$fila['fech_facturacion'];
                }

        $sqlCAI = ("SELECT * FROM TBL_talonario_cai");
        $query = mysqli_query($conexion, $sqlCAI);
        
        while ($fila = mysqli_fetch_array($query)) {
                 $inicio=$fila['rango_inicial'];
                 $fin=$fila['rango_final'];
                 $fecha_venc=$fila['fecha_vencimiento'];
         }

        $pdf = new MYPDF(PDF_PAGE_ORIENTATION, 'mm', 'Letter', true, 'UTF-8', false);
        
        //Establecer margenes del PDF
        $pdf->SetMargins(20, 35, 25);
        $pdf->SetHeaderMargin(20);
        $pdf->setPrintFooter(true);
        $pdf->setPrintHeader(true); //Eliminar la linea superior del PDF por defecto
        $pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM); //Activa o desactiva el modo de salto de página automático
        
        //Informacion del PDF
        $pdf->SetCreator('WorkNet');
        $pdf->SetAuthor('WorkNet');
        $pdf->SetTitle('Informe de Facturas');
        
        /** Eje de Coordenadas
         *          Y
         *          -
         *          - 
         *          -
         *  X ------------- X
         *          -
         *          -
         *          -
         *          Y
         * 
         * $pdf->SetXY(X, Y);
         */

        //Agregando la primera página
        $pdf->AddPage();
        $pdf->Ln(8); //Salto de Linea
        $pdf->SetFont('helvetica','B', 16); 
        $pdf->Cell(172,6,'CITY COFFE',0,0,'C');
        $pdf->Ln(8); //Salto de Linea
        $pdf->SetFont('helvetica','B', 12);
        $pdf->Cell(170,6,'COL. BRISAS DEL SUR, ARIZONA, ATLÁNTIDA',0,0,'C');
        $pdf->Ln(8); //Salto de Linea
        $pdf->Cell(170,6,'TELEFONO: 1234-5678',0,0,'C');
        $pdf->Ln(8); //Salto de Linea
        $pdf->Cell(170,6,'Fecha: '. $fecha_facturacion,0,0,'C');
        $pdf->Ln(8); //Salto de Linea
        $pdf->Cell(170,6,'N. FACTURA: '. $n_factura,0,0,'C');
        $pdf->Ln(25); //Salto de Linea
        /*$pdf->SetDrawColor(50, 0, 0, 0);
        $pdf->SetFillColor(100, 0, 0, 0); */
        $pdf->SetTextColor(0,0,0);
        //$pdf->SetTextColor(255,204,0); //Amarillo
        //$pdf->SetTextColor(34,68,136); //Azul
        //$pdf->SetTextColor(153,204,0); //Verde
        //$pdf->SetTextColor(204,0,0); //Marron
        //$pdf->SetTextColor(245,245,205); //Gris claro
        //$pdf->SetTextColor(100, 0, 0); //Color Carne
        $pdf->SetFont('helvetica','B', 15); 
        $pdf->Cell(180,6,'FACTURA',0,0,'C');
        $pdf->Ln(10); //Salto de Linea
       

        //Almando la cabecera de la Tabla
        /*El 1 despues de  Fecha Ingreso indica que hasta alli 
        llega la linea */

           $sql = ("SELECT p.id_pedido,p.nom_cliente, p.dni_cliente,p.fech_pedido, p.fech_entrega,p.sitio_entrega,p.num_factura,
           ep.estado_pedido,p.sub_total,p.ISV,p.total,f.forma_pago,p.fech_facturacion,p.porcentaje_isv FROM TBL_pedidos p
           inner join TBL_estado_pedido ep on ep.id_estado_pedido=p.id_estado_pedido
           inner join TBL_forma_pago f on f.id_forma_pago=p.id_forma_pago
           WHERE p.id_pedido='$id_factura'");

        $query = mysqli_query($conexion, $sql);

        while ($dataRow = mysqli_fetch_array($query)) {
                $pedido=$dataRow['id_pedido'];
                $cliente=$dataRow['nom_cliente'];
                $dni=$dataRow['dni_cliente'];
                $num_factura=$dataRow['num_factura'];
                $fech_pedido=$dataRow['fech_pedido'];
                $fech_entrega=$dataRow['fech_entrega'];
                $sitio=$dataRow['sitio_entrega'];
                $estado=$dataRow['estado_pedido'];
                $forma_pago=$dataRow['forma_pago'];
                $fech_facturacion=$dataRow['fech_facturacion'];
                $subtotal=$dataRow['sub_total'];
                $impuesto=$dataRow['ISV'];
                $porcentaje_isv=$dataRow['porcentaje_isv'];
                $total=$dataRow['total'];
                
            }

            $pdf->SetFillColor(232,232,232);
            $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
            $pdf->Cell(45,6,'CLIENTE',1,0,'C',1);
            $pdf->Cell(45,6,($cliente),1,1,'C',1);
            $pdf->Cell(45,6,'DNI',1,0,'C',1);
            $pdf->Cell(45,6,($dni),1,1,'C',1);
            $pdf->Cell(45,6,'FECHA PEDIDO',1,0,'C');
            $pdf->Cell(45,6,$fech_pedido,1,1,'C');
            $pdf->Cell(45,6,'FECHA ENTREGA',1,0,'C',1);
            $pdf->Cell(45,6,($fech_entrega),1,1,'C',1);
            $pdf->Cell(45,6,'SITIO DE ENTREGA',1,0,'C');
            $pdf->Cell(45,6, $sitio,1,1,'C');
            $pdf->Cell(45,6,'ESTADO',1,0,'C');
            $pdf->Cell(45,6, $estado,1,1,'C');
            $pdf->Cell(45,6,'FORMA DE PAGO',1,0,'C');
            $pdf->Cell(45,6, $forma_pago,1,1,'C');

            $pdf->Ln(10); //Salto de Linea

           //Almando la cabecera de la Tabla
        $pdf->SetFillColor(232,232,232);
        $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
        $pdf->SetTextColor(0, 0, 0);
        $pdf->Cell(60,6,'PRODUCTO',1,0,'C',1);
        $pdf->Cell(30,6,'CANTIDAD',1,0,'C',1);
        $pdf->Cell(40,6,'PRECIO UNIT.',1,0,'C',1); 
        $pdf->Cell(40,6,'TOTAL',1,1,'C',1); 

        $sqlDetalle = ("SELECT pr.nom_producto, d.id_pedido, d.id_producto, d.cantidad, d.precio_venta FROM TBL_detalle_pedido d
                inner join TBL_producto pr on pr.id_producto=d.id_producto
        WHERE d.id_pedido='$pedido'");

             $query2 = mysqli_query($conexion, $sqlDetalle);
     
             while ($dataRow = mysqli_fetch_array($query2)) {
                     $pdf->Cell(60,6,($dataRow['nom_producto']),1,0,'C');
                     $pdf->Cell(30,6,$dataRow['cantidad'],1,0,'C');
                     $pdf->Cell(40,6, $dataRow['precio_venta'],1,0,'C');
                     $pdf->Cell(40,6, ($dataRow['precio_venta']*$dataRow['cantidad']),1,1,'C');
                 }
        
        
                //Almando la cabecera de la Tabla
             $pdf->SetFillColor(232,232,232);
             $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
             $pdf->SetTextColor(0, 0, 0);
             $pdf->Cell(60,6,'PROMOCION',1,0,'C',1);
             $pdf->Cell(30,6,'CANTIDAD',1,0,'C',1);
             $pdf->Cell(40,6,'PRECIO UNIT.',1,0,'C',1); 
             $pdf->Cell(40,6,'TOTAL',1,1,'C',1); 
     
             $sqlDetalle = ("SELECT pr.nom_promocion,pp.id_pedido,pp.id_promocion, pp.cantidad, pp.precio_venta FROM TBL_pedidos_promociones pp
                     inner join TBL_promociones pr on pr.id_promociones=pp.id_promocion
             WHERE pp.id_pedido='$pedido'");
     
                  $query2 = mysqli_query($conexion, $sqlDetalle);
          
                  while ($dataRow = mysqli_fetch_array($query2)) {
                          $pdf->Cell(60,6,($dataRow['nom_promocion']),1,0,'C');
                          $pdf->Cell(30,6,$dataRow['cantidad'],1,0,'C');
                          $pdf->Cell(40,6, $dataRow['precio_venta'],1,0,'C');
                          $pdf->Cell(40,6, ($dataRow['precio_venta']*$dataRow['cantidad']),1,1,'C');
                      }
   
        
        
         $pdf->SetFillColor(232,232,232);
            $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
            $pdf-> SetFillColor(255,255,255);
            $pdf->Cell(130,6,'SUBTOTAL L.',1,0,'R',1);
            $pdf->SetFillColor(232,232,232);
            $pdf->Cell(40,6,($subtotal),1,1,'C',1);
            $pdf-> SetFillColor(255,255,255);
            $pdf->Cell(130,6,'ISV 15% L.',0,0,'R',1);
            $pdf->SetFillColor(232,232,232);
            $pdf->Cell(40,6,($impuesto),1,1,'C',1);
            $pdf-> SetFillColor(255,255,255);
            $pdf->Cell(130,6,'TOTAL L.',0,0,'R',1);
            $pdf->SetFillColor(232,232,232);
            $pdf->Cell(40,6,($total),1,1,'C',1);
        
            $pdf->Ln(30); //Salto de Linea

            $pdf->SetFillColor(255,255,255);
            $pdf->SetFont('helvetica','B',10); //La B es para letras en Negritas
            $pdf->Cell(120,6,'CAI: A2E6TY-GT463S-FRIR421-465732-NSGH35D-GT',0,0,'L',1);
            $pdf->Ln(9); //Salto de Linea
            $pdf->Cell(120,6,'RANGO DE FACTURACIÓN: '.$inicio.' AL '.$fin,0,0,'L',1);
            $pdf->Ln(9); //Salto de Linea
            $pdf->Cell(120,6,'FECHA LIMITE DE EMISIÓN: '.$fecha_venc,0,0,'L',1);
        /* $pdf->AddPage();  *///Agregar nueva Pagina


        $pdf->Output('Factura_Unica_'.date('d_m_y').'.pdf', 'I'); 
        // Output funcion que recibe 2 parameros, el nombre del archivo, ver archivo o descargar,
        // La D es para Forzar una desca