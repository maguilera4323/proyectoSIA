<?php
require_once('../tcpdf/tcpdf.php'); //Llamando a la Libreria TCPDF
include ("../cone.php"); 
include('../APP.php');   //Llamando a la conexión para BD
date_default_timezone_set('America/Tegucigalpa');

ob_end_clean(); //limpiar la memoria

class MYPDF extends TCPDF{
    	public function Header() {
            $path = dirname( __FILE__ );
            $logo = $path.'/images/cafe.jpg';
            $bMargin = $this->getBreakMargin();
            $auto_page_break = $this->AutoPageBreak;
            $this->SetAutoPageBreak(false, 0);
            $this->Image($logo, 85, 8, 20, 25, '', '', '', false, 30, '', false, false, 0);
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
        $pdf->SetCreator('UrianViera');
        $pdf->SetAuthor('UrianViera');
        $pdf->SetTitle('Informe de Empleados');
        
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
        $pdf->Cell(100,6,'LISTA DE INSUMOS',0,0,'C');


        $pdf->Ln(10); //Salto de Linea
        $pdf->SetTextColor(0, 0, 0); 

        //Almando la cabecera de la Tabla
        $pdf->SetFillColor(232,232,232);
        $pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
        $pdf->Cell(30,6,'Nombre',1,0,'C',1);
        $pdf->Cell(30,6,'Categoria',1,0,'C',1);
        $pdf->Cell(38,6,'Cantidad Maxima',1,0,'C',1);
        $pdf->Cell(38,6,'Cantidad Minima',1,0,'C',1); 
        $pdf->Cell(35,6,'Unidad Medida',1,1,'C',1); 
        /*El 1 despues de  Fecha Ingreso indica que hasta alli 
        llega la linea */

        $pdf->SetFont('helvetica','',10);

        // filtro de insumos
        $filtroinsumos=($_POST['filtroinsumo']);

        $sqlTrabajadores = ("SELECT * FROM TBL_insumos WHERE nom_insumo LIKE'%".$filtroinsumos."%'");
        
        //$sqlTrabajadores = ("SELECT * FROM trabajadores");
        $query = mysqli_query($conexion, $sqlTrabajadores);

        while ($dataRow = mysqli_fetch_array($query)) {
                $pdf->Cell(30,6,($dataRow['nom_insumo']),1,0,'C');
                $pdf->Cell(30,6,$dataRow['id_categoria'],1,0,'C');
                $pdf->Cell(38,6, $dataRow['cant_max'],1,0,'C');
                $pdf->Cell(38,6, $dataRow['cant_min'],1,0,'C');
                $pdf->Cell(35,6, $dataRow['unidad_medida'],1,1,'C');
            }


        //$pdf->AddPage(); //Agregar nueva Pagina

        $pdf->Output('Resumen_Insumos_'.date('d_m_y').'.pdf', 'I'); 
        // Output funcion que recibe 2 parameros, el nombre del archivo, ver archivo o descargar,
        // La D es para Forzar una descarga
