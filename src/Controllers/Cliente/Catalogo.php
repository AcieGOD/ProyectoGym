<?php

namespace Controllers\Cliente;
use Controllers\PublicController;


class Catalogo extends PublicController
{
  /**
   * Index run method
   *
   * @return void
   */
  public function run(): void
  {
    
    $viewData = array();
    $viewData["products"] = \Dao\Productos\Productos::findAll();
    \Views\Renderer::render("cliente/catalogo", $viewData, 'layout.view.tpl');
  }
}