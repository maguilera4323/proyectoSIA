<?php

//datos de conexion al servidor de la base de datos
const SERVER="20.163.218.52";/* servidor de base de datos */
const DB="proyecto_cafeteria";/* NOMBRE DE BD */
const USER="admin_bd";/* */
const PASS="clave1234";/* */

//datos de conexion al servidor de correo
const HOST_SMTP='smtp.gmail.com';
const USER_SMTP="soportecitycoffe@gmail.com";
const CLAVE_SMTP="auipcxsessbbvniz";
const PUERTO_SMTP=465;


const SGBD="mysql:host=".SERVER.";dbname=".DB; /* SGBD sera la constante que usaremos para conectarnos a la base ded datos */

const METHOD="AES-256-CBC"; /* metodo para procersar las contraseñas por el metodo hash*/

const SECRET_KEY='cafeteria'; /* esta se puede cambiar por la que el grupo <desee></desee>*/
const SECRET_IV ='1234';