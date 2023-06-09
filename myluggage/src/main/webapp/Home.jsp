<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luggage Hero</title>



    <!-- Here Onwards all the external links wil be attahed -->
    <!-- We gona use Bootstrap, google Fonts, icons etc -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merienda:wght@700&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nosifer&display=swap" rel="stylesheet">
    
        <!-- Mapbox GL links -->
      <script src='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js'></script>
      <link href='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css' rel='stylesheet'>
      <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
      <link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css">
</head>
<body>
<div class="fluid-container">
        
        <div class=" navbar navbar-light bg-secondary">
            <a class="navbar-brand text-warning" href="home.html" style="font-family: 'Nosifer', cursive;">
                <img src= {{ url_for('static', filename='luggagehero_icon.png') }} alt="LuggageHero" width="40" height="30" class="d-inline-block align-text-top"> LuggageHero
            </a>
        </div>    


       <%-- <div class="bg-info">
            <div class="bg-info">
                <div class = "pt-5 pb-5" style="font-family: 'Merienda', cursive;"> 
                    <h1 class="text-center my-4">Luggage Storage Near You</h1>
                    <h4 class="text-center mb-3">Find luggage Storage in certified shops and hotels</h4>
                </div>
                <div class="container d-flex justify-content-center pb-5">
                    <div class="row row-cols-3 g-0">
                        <div class="col-sm-3" id="BussinessAddress"></div>
                        
                        <div class="col-sm-3 ">
                            <input type="date" class="form-control rounded-0" placeholder="Date" aria-label="State">
                        </div>
                        <div class="col-sm-3">
                            <a href="#">
                                <button type="button" class="form-control btn btn-danger rounded-0 rounded-end text-" placeholder="GO" aria-label="Zip">GO</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
          --%> 
          
        <div class="bg-info">
            <div class="bg-info">
                <div class = "pt-5 pb-5" style="font-family: 'Merienda', cursive;"> 
                    <h1 class="text-center my-4">Luggage Storage Near You</h1>
                    <h4 class="text-center mb-3">Find luggage Storage in certified shops and hotels</h4>
                </div>
                  <div class="container d-flex justify-content-center pb-5">
                     <h3>Search the city</h3> 
                 <form action="main.jsp" method="post" class="form-inline">
         <div class="form-group mx-sm-3 mb-2">
       <%--  <div id="BussinessAddress"></div> --%> 
    <input type="text" name="city" class="form-control" id="exampleInputPassword1" placeholder="Type city Name">
        </div> 
                <div class="text-center">
  <button type="submit" class="btn btn-success">GO</button>
  </div>
</form>

                </div>
            </div>
        </div>   
        <h2 class="text-center mt-5 mb-4 pb-5" style="font-family: 'Merienda', cursive;">Pricing per bag</h2>
        <div class="d-flex justify-content-center mb-5" style="font-family: 'Merienda', cursive;">
            <div class="ms-3">
                <h4 class="mb-4">Bumper Offer</h4>
                <h2>250 Rs/day</h2>
                <h6>per bag</h6>
            </div>
            <div class="ms-4 ps-5">
                <h4 class="mb-4">Pay as you go</h4>
                <h2>30 Rs/hour</h2>
                <h6>per bag</h6>
            </div>
            
        </div>
        <hr>



        <div class="my-5 pb-5">
            <h5 class="text-center mb-5" style="font-family: 'Merienda', cursive;">How Luggage Storage works?</h5>

            <div class="row row-cols-3 d-flex justify-content-center" style="font-family: 'Merienda', cursive;">
                <div class="col-sm-2 ms-5">
                    <img src="book online.png" class="ms-4 py-3 text-center" alt="" >
                    <div class="">
                    <p class="text-center">Book Online and Receive Direction.</p>
                    </div>
                </div>
                <div class="col-sm-2 mx-5">
                    <img src="Drop_luggage.png" class="py-3" alt="...">
                    <div class="">
                    <p class="">Drop off the luggage at a LuggageHero shop.</p>
                    </div>
                </div>
                <div class="col-sm-2 mx-5">
                    <img src="#" class="py-3" alt="...">
                    <div class="">
                    <p class="">Enjoy your time without the weight of your Luggage.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script>
   mapboxgl.accessToken = 'pk.eyJ1IjoibmF5YW5tZyIsImEiOiJja3hrcnh3MGQwNWdxMm9rb3ZhaWdlM2I1In0.AApGj8R9Bh-iyGOkfs-Dpw';
   const geocoder = new MapboxGeocoder({
     accessToken: mapboxgl.accessToken,
     mapboxgl: mapboxgl
   });

   geocoder.addTo('#BussinessAddress');
   </script>
</body>
</html>