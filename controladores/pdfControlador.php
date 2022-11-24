<?php
require_once('../tcpdf/tcpdf.php'); //Llamando a la Libreria TCPDF
include ("../cone.php");  //Llamando a la conexión para BD
date_default_timezone_set('America/Tegucigalpa');


ob_end_clean(); //limpiar la memoria


class MYPDF extends TCPDF{
      
    	public function Header() {

            /*$bMargin = $this->getBreakMargin();
            $auto_page_break = $this->AutoPageBreak;
            $this->SetAutoPageBreak(false, 0);
            $img_file = dirname( __FILE__ ) .'./images/CityCoffe.jpeg';
            $this->Image($img_file, 85, 8, 20, 25, '', '', '', false, 30, '', false, false, 0);
            $this->SetAutoPageBreak($auto_page_break, $bMargin);
            $this->setPageMark();*/
            $this->SetFont('helvetica', 'B',35);
            $this->Cell(0,5, 'City Coffe', 0,0,'C');
            $this->Image('images/logo.jpeg', 0, -40, 20, 20, 'jpeg');

	    }


        public function footer() {
            $this->SetFont('helvetica', 'B', 9);
            $this->SetX(-15);
            $this->AliasNbPages('tpagina');
            $this->Write(5, $this->PageNo().'/{tpagina}');
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
$pdf->SetTitle('Reporte Insumos');
 
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
$pdf->SetFont('helvetica','A',9); //Tipo de fuente y tamaño de letra
$pdf->SetXY(17, 35);
$pdf->SetXY(17, 40);
$pdf->Write(0, 'Fecha: '. date('d-m-Y'));
$pdf->SetXY(17, 45);
$pdf->Write(0, 'Hora: '. date('h:i:s A'));




$pdf->Ln(30); //Salto de Linea
$pdf->Cell(40,10,'',0,0,'C');
/*$pdf->SetDrawColor(50, 0, 0, 0);
$pdf->SetFillColor(100, 0, 0, 0); */
$pdf->SetTextColor(34,68,136);
//$pdf->SetTextColor(255,204,0); //Amarillo
//$pdf->SetTextColor(34,68,136); //Azul
//$pdf->SetTextColor(153,204,0); //Verde
//$pdf->SetTextColor(204,0,0); //Marron
//$pdf->SetTextColor(245,245,205); //Gris claro
//$pdf->SetTextColor(100, 0, 0); //Color Carne
$pdf->SetFont('helvetica','B', 18); 
$pdf->Cell(90,6,'REPORTE DE INSUMOS',0,0,'C');


$pdf->Ln(10); //Salto de Linea
$pdf->SetTextColor(0, 0, 0); 

//Almando la cabecera de la Tabla
$pdf->SetFillColor(232,232,232);
$pdf->SetFont('helvetica','B',12); //La B es para letras en Negritas
$pdf->Cell(40,6,'Nombre',1,0,'C',1);
$pdf->Cell(50,6,'Categoria',1,0,'C',1);
$pdf->Cell(40,6,'Cantidad Maxima',1,0,'C',1);
$pdf->Cell(40,6,'Cantidad Minima',1,1,'C',1); 
/*El 1 despues de  Fecha Ingreso indica que hasta alli 
llega la linea */

$pdf->SetFont('helvetica','',10);


$sqlinsumos = ("SELECT * FROM TBL_insumos");
$query = mysqli_query($conexion, $sqlinsumos);

while ($dataRow = mysqli_fetch_array($query)) {
        $pdf->Cell(40,6,($dataRow['nom_insumo']),1,0,'C');
        $pdf->Cell(50,6,$dataRow['id_categoria'],1,0,'C');
        $pdf->Cell(40,6, $dataRow['cant_max'],1,0,'C');
        $pdf->Cell(40,6, $dataRow['cant_min'],1,1,'C');
    }



    
//$pdf->AddPage(); //Agregar nueva Pagina


$pdf->Output('Resumen_Pedido_'.date('d_m_y').'.pdf', 'I'); 
// Output funcion que recibe 2 parameros, el nombre del archivo, ver archivo o descargar,
// La D es para Forzar una descarga
