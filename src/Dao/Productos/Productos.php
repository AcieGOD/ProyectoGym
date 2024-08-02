<?php

namespace Dao\Productos;

use Dao\Table;

class Productos extends Table
{

  public static function findById(int $productId)
  {
    $sqlstr = "SELECT * FROM products WHERE productId = :productId;";
    $row = self::obtenerUnRegistro(
      $sqlstr,
      array(
        "productId" => $productId
      )
    );
    return $row;
  }

  public static function findAll()
  {
    $sqlstr = "SELECT * FROM products;";
    return self::obtenerRegistros($sqlstr, array());
  }

}
