<?php 
    class MySql{
        private $dbc;
        private $user;
        private $pass;
        private $dbname;
        private $host;

        function __construct($host="20.25.134.34", $dbname="proyecto_cafeteria", $user="admin_bd", $pass="admin1234"){
            $this->user = $user;
            $this->pass = $pass;
            $this->dbname = $dbname;
            $this->host = $host;
            $opt = array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC );
            try{
                $this->dbc = new PDO('mysql:host='.$this->host.';dbname='.$this->dbname.';charset=utf8', $user, $pass, $opt);
            }
            catch(PDOException $e){
                 echo $e->getMessage();
                 echo "Hubo problemas con el usuario o la contraseña para acceder a la base de datos. ";
            }
        } /*fin de function*/

        public function backup_tables($tables = '*'){  
            $host=$this->host;
            $user=$this->user;
            $pass=$this->pass;
            $dbname=$this->dbname;
            $data = "SET SQL_MODE  = 'NO_AUTO_VALUE_ON_ZERO';\n  ";
               $data .= "SET time_zone = '+00:00'; \n";
            //obtener todas las tablas
            if($tables == '*')
            {
                $tables = array();
                $result = $this->dbc->prepare('SHOW TABLES');
                $result->execute();

                while($row = $result->fetch(PDO::FETCH_NUM))
                {
                    $tables[] = $row[0];
                       }
                          }
                   else
                       {
                           $tables = is_array($tables) ? $tables : explode(',',$tables); //Si backup_tables tiene una tabla en concreto como parametro
                                         }
            //recorrido
             $cols = array();
            foreach($tables as $table)
            {

                 //  echo "var dump cols =";
                 // echo "La tabla es actual es:";
                   $columns = $this->dbc->prepare('SELECT * FROM '.$table);
                   $columns->execute();
                   $cols_numero = $columns->columnCount();
                   //var_dump("Cols_numero =".$cols_numero . "<br>");
                   $resultcount = $this->dbc->prepare('SELECT count(*) FROM '.$table); //Devuelve el numero de filas en la tabla x
                   $resultcount->execute(); //Eejecutamos la consulta.
                   $num_fields = $resultcount->fetch(PDO::FETCH_NUM);
                   $num_fields = $num_fields[0];
                   // echo "<hr>";
            ///*** final del conteo se almacena en una variable  ***/////
                $result = $this->dbc->prepare('SELECT * FROM '.$table);
                $result->execute();
                $data.= 'DROP TABLE '.$table.';';
                $result2 = $this->dbc->prepare('SHOW CREATE TABLE '.$table);
                $result2->execute();
                $row2 = $result2->fetch(PDO::FETCH_NUM);
                $data.= "\n\n".$row2[1].";\n\n"; // Consulta Sql para crear las tablas
                           ////////////////////////////////////////
                  $show_cols = $this->dbc->prepare("SHOW columns from  $table");
                  $show_cols->execute();
                     if($num_fields == 0){
                      $data.="\n";
                     } else{

                        $data.= "INSERT INTO `".$table."`(";

                   $cuenta_columnas = 0 ;
               while($col = $show_cols->fetch(PDO::FETCH_NUM))
                {
                      $cuenta_columnas++ ;

                        for($e=0; $e < $cols_numero; $e++)
                        {
                             if ($e<($cols_numero -1 ))
                                 {
                                     /*echo 'A';*/
                                                   }
                                                      else
                                                           {
                                                              /*echo'_';*/
                                                                            }
                              //echo" 1 -El valor de e es:$e  (<) $cols_numero <br>" ;
                           }

                          if (isset($col[0]))
                             {
                                  $data.= "`". $col[0]."`" ;
                                                                       }

                           if ( $cuenta_columnas == $cols_numero ) {$data.= "";} else {$data.= ',';}
                           // if (!$e < ($cols_numero -1 )) { $data.= ','; } else{$data.= '9';}  //agregamos una coma entre campos

                                                            }
                               ////////////////////////////////////

                           $data.= ') VALUES ';
                           $cuenta = 0;
                           while($row = $result->fetch(PDO::FETCH_NUM))
                    {
                          $cuenta++;
                                $data.="\n(";

                        for($j=0; $j<$cols_numero; $j++)
                        {
                            //var_dump($row[$j]);
                           $row[$j] = addslashes($row[$j]);    //Escapamos caracteres especiales
                             $row[$j] = str_replace("\n","\\n",$row[$j]);
                                 //echo" 2 - El valor de $j es:$j  (<) $cols_numero <br>" ;

                          if (isset($row[$j]))
                             {
                                  $data.= "'".$row[$j]."'" ;
                                                               }
                                                                  else
                                                                        {
                                                                             $data.= '"8888"'; }

                            // if ($j<($cols_numero -1 )) { echo 'C'; } else{echo'_';}
                            if ($j<($cols_numero-1))
                                  {
                                     $data.= ',';
                                     }

                            elseif($cuenta == $num_fields)

                                  {
                                      $data.= "";
                                           }
                                              else
                                                 {
                                                     $data.= "),\n";
                                                                       }  //agregamos una coma entre campos
                               }
                                }
                           $data.= ");\n";
                            }
                             }
              $data.="\n\n\n";

            //guarda el nombre del archivo
            $filename = 'db-backup-'.time().'-'.(implode(",",$tables)).'.sql';
            $this->writeUTF8filename($filename,$data);

        } /*end function*/ 

        private function writeUTF8filename($filenamename,$content){  /* save as utf8 encoding */
            $f=fopen($filenamename,"w+");
            # Now UTF-8 - Add byte order mark
            fwrite($f, pack("CCC",0xef,0xbb,0xbf));
            fwrite($f,$content);
            fclose($f);

        } /*end function*/

                    // OjO aqui en esta funcion puedes incorporar el codigho para inportar la base de datos  OjO
                    // Puedes hacer un formulario y acomodar todo en el front end
        public function recoverDB($file_to_load){
            echo "write some code to load and proccedd .sql file in here ...";
        } /*end function*/


        public function closeConnection(){
            $this->dbc = null;

        }/*end function*/


    } /*END OF CLASS*/
    ?>