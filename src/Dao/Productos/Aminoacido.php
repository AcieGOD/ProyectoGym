<?php

namespace Dao\Productos;

class Aminoacido extends \Dao\Table{
    public static function getAminoacido():array
    {
        $sqlstr="SELECT nombreProducto as nombre, descripcion as descripcion, precio as precio, imagen as imagen  from productos WHERE categoria = 'Aminoacidos'";
        $aminoacidos=self::obtenerRegistros($sqlstr,array());
        return $aminoacidos;
    }
    
}