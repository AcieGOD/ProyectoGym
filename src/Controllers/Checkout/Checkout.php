<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController
{
  public function run(): void
  {
    $viewData = array();
    $url = getenv('BASE_DIR');
    if ($this->isPostBack()) {
      $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
        "test" . (time() - 10000000),
        "http://localhost/" . $url . "/index.php?page=Checkout_Error",
        "http://localhost/" . $url . "/index.php?page=Checkout_Accept"
      );
      $products = array();
      $cart = $_SESSION["cart"];

      foreach ($cart as $key => $value) {
        $product = \Dao\Productos\Productos::findById($value["productId"]);
        $product["quantity"] = $value["quantity"];
        $products[] = $product;
      }

      foreach ($products as $product) {
        $price = number_format((float)$product["productPrice"], 2, '.', '');
        $tax = number_format((float)($product["productPrice"] * 0.15), 2, '.', '');
        $PayPalOrder->addItem($product["productName"], $product["productName"], $product["productId"], $price, $tax, $product["quantity"], "DIGITAL_GOODS");
      }

      $response = $PayPalOrder->createOrder();
      $_SESSION["orderid"] = $response[1]->result->id;
      \Utilities\Site::redirectTo($response[0]->href);
      die();
    }

    \Views\Renderer::render("paypal/checkout", $viewData);
  }
}
