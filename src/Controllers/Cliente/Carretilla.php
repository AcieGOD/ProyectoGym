<?php

namespace Controllers\Cliente;

use Controllers\PublicController;


class Carretilla extends PublicController
{
  /**
   * Index run method
   *
   * @return void
   */
  public function run(): void
  {

    $viewData = array();
    if (isset($_SESSION['cart']) && count($_SESSION['cart']) > 0) {
      $cart = $_SESSION['cart'];
      $viewData['total'] = 0;
      foreach ($cart as $key => $value) {
        $product = \Dao\Productos\Productos::findById($value['productId']);
        $product['quantity'] = $value['quantity'];
        $product['total'] = $value['quantity'] * $product['productPrice'];
        $viewData['products'][] = $product;
      }

      foreach ($viewData['products'] as $key => $value) {
        $viewData['total'] += $value['total'];
      }
    }

    if (isset($_GET['productId'])) {
      $productId = $_GET['productId'];
      foreach ($_SESSION['cart'] as $key => $value) {
        if ($value['productId'] == $productId) {
          unset($_SESSION['cart'][$key]);
        }
      }
      \Utilities\Site::redirectTo("index.php?page=cliente_carretilla");
    }

    \Views\Renderer::render("cliente/carretilla", $viewData, 'layout.view.tpl');
  }
}
