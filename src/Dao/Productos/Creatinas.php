<?php

namespace Dao\Productos;

class Creatinas extends \Dao\Table{
    public static function getCreatinas():array
    {
        $sqlstr="SELECT nombreProducto as productoCreatina, descripcion as descripcion, precio as precio, imagen as imagen  from productos WHERE categoria = 'Creatina'";
        $creatina=self::obtenerRegistros($sqlstr,array());
        return $creatina;
    }
    
}