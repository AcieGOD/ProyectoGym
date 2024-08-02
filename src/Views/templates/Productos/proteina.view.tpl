
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creatinas</title>
    <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/styleProducts.css" />
</head>
<body>
    <div class="container">
        <h1>Proteinas</h1>
        <div class="product-list">
            {{foreach productos}}
            <div class="product">
                <h2> {{nombre}} </h2>
                <img src=" {{imagen}} " alt="">
                <ul>
                    <li> {{descripcion}} </li>
                    <li> L.{{precio}} </li>
                </ul>
                <div class="buttons">
                    <button class="cart"><img src="https://cdn-icons-png.flaticon.com/128/3144/3144456.png" alt="Agregar al carrito"></button>
                    <button class="edit"><img src="https://cdn-icons-png.flaticon.com/128/84/84380.png" alt="Editar"></button>
                </div>
            </div>
            {{endfor productos}}
        </div>
    </div>
    
</body>
</html>

