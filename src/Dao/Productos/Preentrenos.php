<?php

namespace Dao\Productos;

class Preentrenos extends \Dao\Table{
    public static function getPreentrenos():array
    {
        $sqlstr="SELECT nombreProducto as nombre, descripcion as descripcion, precio as precio, imagen as imagen  from productos WHERE categoria = 'Preentreno'";
        $preentreno=self::obtenerRegistros($sqlstr,array());
        return $preentreno;
    }
    
}