<?php

namespace Dao\Productos;

class Proteinas extends \Dao\Table{
    public static function getProteinas():array
    {
        $sqlstr="SELECT nombreProducto as nombre, descripcion as descripcion, precio as precio, imagen as imagen  from products WHERE categoria = 'Proteina'";
        $proteina=self::obtenerRegistros($sqlstr,array());
        return $proteina;
    }
    
}