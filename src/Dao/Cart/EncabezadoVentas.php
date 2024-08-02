<?php

namespace Dao\Cart;
use Dao\Table;

class EncabezadoVentas extends Table
{
  public static function insert(string $id_venta, string $usercod, string $fecha): int
  {
    $sqlstr = "INSERT INTO encabezado_ventas (id_venta, usercod, fecha) values (:id_venta, :usercod, :fecha);";

    $rowsInserted = self::executeNonQuery(
      $sqlstr,
      array(
        'id_venta' => $id_venta,
        'usercod' => $usercod,
        'fecha' => $fecha,
        )
    );
    return $rowsInserted;
  }

  public static function findAll()
  {
    $sqlstr = "SELECT * FROM encabezado_ventas;";
    return self::obtenerRegistros($sqlstr, array());
  }

  public static function findById(int $id_venta)
  {
    $sqlstr = "SELECT * FROM encabezado_ventas WHERE id_venta = :id_venta;";
    $row = self::obtenerUnRegistro(
      $sqlstr,
      array(
        "id_venta" => $id_venta
      )
    );
    return $row;
  }
}
