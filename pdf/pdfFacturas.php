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
            $this->Image('https://i.pinimg.com/564x/35/f5/3c/35f53c0062b906ca788a77b97e92e9f1.jpg', 90, 15, 35, 35, '', '', '', false, 30, '', false, false, 0);
            $this->SetAutoPageBreak($auto_page_break, $bMargin);
            $this->setPageMark();
	    }

            public function Footer() {
                $this->SetY(-15);
                $this->SetFont('helvetica', '', 8);
                //Mostrar cantidad de paginas
                //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
                $this->html = '<p style="border-top:1px solid #999; text-align:center;">
                                        WORKNET | PAG 1
                                                </p>';
                $this->writeHTML($this->html, true, false, true, false, '');
        }
}


//Iniciando un nuevo pdf

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
        $pdf->SetFont('helvetica','B',10); //Tipo de fuente y tamaño de letra
        $pdf->SetXY(150, 20);
        $pdf->Write(0, 'Fecha: '. date('d-m-Y'));
        $pdf->SetXY(150, 30);
        $pdf->Write(0, 'Hora: '. date('h:i A'));

        $canal ='WebDeveloper';
        $pdf->SetFont('helvetica','B',10); //Tipo de fuente y tamaño de letra
        $pdf->SetXY(15, 20); //Margen en X y en Y
        $pdf->SetTextColor(204,0,0);
        $pdf->Write(0, 'City Coffe');
        $pdf->SetTextColor(0, 0, 0); //Color Negrita
        $pdf->SetXY(15, 25);
        $pdf->Write(0, "'La Felicidad Hecha Café'");



        $pdf->Ln(35); //Salto de Linea
        $pdf->Cell(40,26,'',0,0,'C');
        /*$pdf->SetDrawColor(50, 0, 0, 0);
        $pdf->SetFillColor(100, 0, 0, 0); */
        $pdf->SetTextColor(34,68,136);
        //$pdf->SetTextColor(255,204,0); //Amarillo
        //$pdf->SetTextColor(34,68,136); //Azul
        //$pdf->SetTextColor(153,204,0); //Verde
        //$pdf->SetTextColor(204,0,0); //Marron
        //$pdf->SetTextColor(245,245,205); //Gris claro
        //$pdf->SetTextColor(100, 0, 0); //Color Carne
        $pdf->SetFont('helvetica','B', 15); 
        $pdf->Cell(100,6,'LISTA DE FACTURAS',0,0,'C');


        $pdf->Ln(10); //Salto de Linea
        $pdf->SetTextColor(0, 0, 0); 

        //Almando la cabecera de la Tabla
        $pdf->SetFillColor(232,232,232);
        $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
        $pdf->Cell(30,6,'CLIENTE',1,0,'L',1);
        $pdf->Cell(30,6,'FECHA',1,0,'L',1);
        $pdf->Cell(30,6,'SITIO',1,0,'L',1);
        $pdf->Cell(30,6,'ESTADO',1,0,'L',1); 
        $pdf->Cell(30,6,'SUBTOTAL',1,0,'L',1); 
        $pdf->Cell(15,6,'ISV',1,0,'L',1); 
        $pdf->Cell(20,6,'TOTAL',1,1,'L',1); 
        /*El 1 despues de  Fecha Ingreso indica que hasta alli 
        llega la linea */

        $pdf->SetFont('helvetica','',10);

        // filtro de cliente
        $filtrofactura=($_POST['filtrofactura']);

        if(isset($filtrofactura)){
           $sqlTrabajadores = ("SELECT c.nom_cliente, p.fech_entrega,p.sitio_entrega,e.estado_pedido,p.sub_total,
           p.ISV, p.total FROM TBL_pedidos p
           inner join TBL_Clientes c on c.id_clientes=p.id_cliente
           inner join TBL_estado_pedido e on e.id_estado_pedido=p.id_estado_pedido
           WHERE p.num_factura LIKE'%".$filtrofactura."%'");
        }else{
                $sqlTrabajadores = ("SELECT * FROM TBL_pedidos");
        }


        $query = mysqli_query($conexion, $sqlTrabajadores);

        while ($dataRow = mysqli_fetch_array($query)) {
                $pdf->Cell(30,6,$dataRow['nom_cliente'],1,0,'L');
                $pdf->Cell(30,6,$dataRow['fech_entrega'],1,0,'L');
                $pdf->Cell(30,6, $dataRow['sitio_entrega'],1,0,'L');
                $pdf->Cell(30,6, $dataRow['estado_pedido'],1,0,'L');
                $pdf->Cell(30,6, $dataRow['sub_total'],1,0,'L');
                $pdf->Cell(15,6, $dataRow['ISV'],1,0,'L');
                $pdf->Cell(20,6, $dataRow['total'],1,1,'L');
            }


        // $pdf->AddPage(); //Agregar nueva Pagina

        $pdf->Output('Resumen_Facturas_'.date('d_m_y').'.pdf', 'I'); 
        // Output funcion que recibe 2 parameros, el nombre del archivo, ver archivo o descargar,
        // La D es para Forzar una desca