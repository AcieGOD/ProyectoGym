
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creatinas</title>
    <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/styleCart.css" />
</head>
<body>
    <section>
      <div class="title-item white-text">Detalle del Producto</div>
      <form action="index.php?page=Cliente_DetalleProducto" method="post">
      <div class="product-detail">
        <div class="card-img">
          <img src="{{productImgUrl}}" alt="Producto" />
        </div>
        <div class="detail-items">
        <p class="subtitle-item">{{productStatus}}</p>
        <p class="subtitle-item">{{productName}}</p>
        <p class="text">Lps. {{productPrice}}</p>
        <div>
          <p>Cantidad:</p>
          <input type="number" min="1" value="1" name="quantity" placeholder="1">
          <input type="hidden" name="productId" value="{{productId}}">
        </div>
        <p class="text">{{productStock}}</p>
        <p class="text">{{productDescription}}</p>
        <button type="submit" class="btn">Añadir Al Carrito</buttom>
        </div>
      </div>
      </form>
    </section>
</body>
</html>

