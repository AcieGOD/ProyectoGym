<?php

namespace Controllers\Cliente;

use Controllers\PublicController;


class Checkout extends PublicController
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
        \Views\Renderer::render("cliente/checkout", $viewData, 'layout.view.tpl');
    }
}