<?php

namespace Dao\Cart;

use Dao\Table;

class DetalleVentas extends Table
{
  public static function insert(string $id_venta, string $productId, int $cantidad, float $precio): int
  {
    $sqlstr = "INSERT INTO detalle_ventas (id_venta, productId, cantidad, precio) values (:id_venta, :productId, :cantidad, :precio);";

    $rowsInserted = self::executeNonQuery(
      $sqlstr,
      array(
        'id_venta' => $id_venta,
        'productId' => $productId,
        'cantidad' => $cantidad,
        'precio' => $precio,
      )
    );
    return $rowsInserted;
  }

  public static function findAll()
  {
    $sqlstr = "SELECT * FROM detalle_ventas;";
    return self::obtenerRegistros($sqlstr, array());
  }

  public static function findById(string $id_venta)
  {
    $sqlstr = "SELECT * FROM detalle_ventas WHERE id_venta = :id_venta;";
    $row = self::obtenerUnRegistro(
      $sqlstr,
      array(
        "id_categoria" => $id_venta
      )
    );
    return $row;
  }
}