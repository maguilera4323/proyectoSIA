<?php

const SERVER="20.25.134.34";/* servidor de base de datos */
const DB="proyecto_cafeteria";/* NOMBRE DE BD */
const USER="admin_bd";/* */
const PASS="admin1234";/* */


const SGBD="mysql:host=".SERVER.";dbname=".DB; /* SGBD sera la constante que usaremos para conectarnos a la base ded datos */

const METHOD="AES-256-CBC"; /* metodo para procersar las contraseñas por el metodo hash*/

const SECRET_KEY='cafeteria'; /* esta se puede cambiar por la que el grupo <desee></desee>*/
const SECRET_IV ='1234';