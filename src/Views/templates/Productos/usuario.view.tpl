<!-- <h1>Usuarios</h1>
{{foreach usuarios}}
<h2>{{nombre}}</h2>
<h2>{{correo}}</h2>
<h2>{{tel}}</h2>

{{endfor usuarios}} -->

<h1><div class="card mb-3" style="max-width: 540px;" >
       {{foreach usuarios}}
    <div class="row g-0">
        <div class="col-md-4">
            <img
                src="Image Source"
                class="img-fluid rounded-start"
                alt="Card title"
            />
        </div>
        <div class="col-md-8">
         
            <div class="card-body">
                <h5 class="card-title">{{nombre}}</h5>
                <p class="card-text">
                    {{correo}}
                </p>
                <p class="card-text">
                    {{tel}}
                </p>
             
            </div>
        </div>
    </div>
</div>
 {{endfor usuarios}}  
</h1>