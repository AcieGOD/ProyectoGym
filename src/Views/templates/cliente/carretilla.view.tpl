<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carretilla</title>
    <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/styleCart.css" />
</head>
<body>
  <div class="container">
    <h1 >Carrito de Compras</h1>
    <div class="carretilla">
      <div class="carretilla-table">
        <div class="row headers">
          <p>Producto</p>
          <p>Precio</p>
          <p>Cantidad</p>
          <p>Total</p>
          <p>Acciones</p>
        </div>
        {{foreach products}}
        <div class="row">
          <p>{{productName}}</p>
          <p>$. {{productPrice}}</p>
          <p>{{quantity}}</p>
          <p>$. {{total}}</p>
          <p class="btn-eliminar">
            <a href="index.php?page=Cliente_Carretilla&productId={{productId}}">Eliminar</a>
          </p>
        </div>
        {{endfor products}}
        <div class="row">
          <a class="btn-back" href="index.php?page=Cliente_Catalogo"> Continuar comprando</a>
          <a class="btn-pay" href="index.php?page=Checkout_Checkout">Pagar</a>
        </div>
      </div>
      <div class="order-summary">
        <h2>Resumen de Orden</h2>
        <div>
          <p>Total:</p>
          <p>{{total}}</p>
        </div>
        <div>
          <p>Descuento:</p>
          <p>$ -10.00</p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

