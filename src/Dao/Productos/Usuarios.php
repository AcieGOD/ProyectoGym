<?php

namespace Dao\Productos;

class Usuarios extends \Dao\Table{
 public static function getUsuarios():array
 {
    $sqlstr="SELECT nombre_usuario as nombre, email as correo, telefono as tel from usuarios;";
    $usuarios=self::obtenerRegistros($sqlstr,array());
    return $usuarios;
 }
}