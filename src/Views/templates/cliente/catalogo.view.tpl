
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/styleCart.css" />
</head>
<body>
  <section>
    <div class="title-item white-text">Productos Disponibles</div>
    <div class="cards-grid">
      {{foreach products}}
      <div class="card">
        <div class="card-img">
          <img src="{{productImgUrl}}" alt="Producto" />
        </div>
        <p class="subtitle-item">{{productId}}</p>
        <p class="subtitle-item">{{productName}}</p>
        <p class="text">Lps. {{productPrice}}</p>
        <p class="text">{{productStock}}</p>
        <p class="text">{{productDescription}}</p>
        <div class="btn">
          <a href="index.php?page=Cliente_DetalleProducto&productId={{productId}}">Añadir Al Carrito</a>
        </div>
      </div>
      {{endfor products}}
    </div>
  </section>
</body>
</html>

