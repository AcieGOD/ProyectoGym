<?php

namespace Controllers\Cliente;

use Controllers\PublicController;


class DetalleProducto extends PublicController
{
  public function run(): void
  {
    $viewData = array(
      "productId" => 0,
      "productName" => "",
      "productDescription" => "",
      "productPrice" => 0,
      "productImgUrl" => '',
      "productStock" => "",
      "productStatus" => "",
    );

    if (isset($_GET["productId"])) {
      $product = \Dao\Productos\Productos::findById($_GET["productId"]);
      \Utilities\ArrUtils::mergeFullArrayTo($product, $viewData);
    } else if (isset($_POST["productId"])) {
      if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = array();
      }

      $product = array(
        "productId" => $_POST['productId'],
        "quantity" => $_POST['quantity'],
      );
      foreach ($_SESSION['cart'] as $key => $value) {
        if ($value['productId'] == $product['productId']) {
          $product['quantity'] += $value['quantity'];
          unset($_SESSION['cart'][$key]);
        }
      }
      array_push($_SESSION['cart'], $product);
      \Utilities\Site::redirectTo("index.php?page=Cliente_Carretilla");
      // \Utilities\Site::redirectTo("test.php");
    } else {
      \Utilities\Site::redirectToWithMsg(
        "index.php",
        "No se ha especificado un producto"
      );
    }
    \Views\Renderer::render("cliente/detalleproducto", $viewData, 'layout.view.tpl');
  }
}
