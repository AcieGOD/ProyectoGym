

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/styleCart.css" />
    <title>PayPal Order</title>
</head>
<body>
    <h1>Orden Aceptada</h1>
    <h2>Gracias Por Su Compra</h2>

    <section>

    <div class="paypal-order">
        <div class="order-column">
            <p>Nombre</p>
            <p>Correo Electrónico:</p>
            <p>Factura</p>
            <p>Subtotal</p>
            <p>Tarifa</p>
            <p>Total</p>
        </div>

        <div class="order-column" style="text-align: end;">
            <p>{{name}} {{lastname}}</p>
            <p>{{email}}</p>
            <p>{{id}}</p>
            <p>$. {{net_amount}}</p>
            <p>$. {{paypal_fee}}</p>
            <p>$. {{gross_amount}}</p>
        </div>
    </div>
    <a href="index.php?page=Cliente_Catalogo">Volver al inicio </a>
    </section>
</body>
</html>