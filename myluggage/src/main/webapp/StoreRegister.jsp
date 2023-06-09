<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Your store with LuggageHero</title>

     <!-- google fonts -->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Nosifer&display=swap" rel="stylesheet">

     <!-- Bootstrap CSS -->

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   
     <!-- Mapbox GL links -->
      
      <script src='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js'></script>
      <link href='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css' rel='stylesheet'>
      <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
      <link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css">
</head>
<body>
<br> 
<h1>Register Store</h1> 
<br>

 <div class="container mt-5 d-flex justify-content-center">
      <form id="MyStore" >  
        <fieldset class="border rounded border-success p-5">

          <legend class="text-center" style="font-family: 'Nosifer', cursive;">Become a LuggageHero</legend>


        <div class="mb-3">
          
            <input type="text" class="form-control" placeholder="Storename" name="storename" aria-label="ShopKeepername">
          
        </div>

         <div class="mb-3">
          
            <input type="text" class="form-control" placeholder="Store Description" name="storedesc" aria-label="ShopKeepername">
          
        </div>
        

      
        <div class="row g-2 mb-3">
          <div class="col-sm">
          <input type="text" class="form-control" placeholder="Bussiness Address" name="address">
          </div>
          <div class="col-sm">
          <select class="form-control " name="type" aria-label="">
            <option selected>Type of Bussiness</option>
            <option value="Hotel">Hotel</option>
            <option value="Hostel">Hostel</option>
            <option value="Kirana Shop">Kirana Shop</option>
            <option value="Cafe">Cafe</option>
            <option value="Restaurant">Restaurant</option>
            <option value="Rental Shop">Rental Shop</option>
            <option value="Other">Other</option>
          </select>
          </div>
        </div>

        <div class="row g-3 mb-3">
          <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="City" name="city" aria-label="City">
          </div>
          <div class="col-sm">
            <input type="text" class="form-control" placeholder="State" name="state" aria-label="State">
          </div>
          <div class="col-sm">
            <input type="text" class="form-control" placeholder="Country" name="country" aria-label="Zip">
          </div>
          <div class="col-sm">
            <input type="text" class="form-control" placeholder="Pin Code" name="pincode" aria-label="Pincode">
          </div>
        </div>

        <div class="form-control" id="BussinessAddress"></div>
        <footer class="blockquote-footer d-flex justify-content-end mb-4">Bussiness Address with City Name</footer>
       <div class="from-group mt-2">   
           <label for="pid">Add Store Pic</label> 
           <input type="file" name="productPic" id="pid" required />
           </div>
        <div class="d-flex justify-content-center ">
          
          <button type="submit" class="btn btn-dark">Submit</button>
          
        </div>


       </fieldset> 
      </form>
    </div>

  

    <script>

          mapboxgl.accessToken = 'pk.eyJ1IjoibmF5YW5tZyIsImEiOiJja3hrcnh3MGQwNWdxMm9rb3ZhaWdlM2I1In0.AApGj8R9Bh-iyGOkfs-Dpw';
            const geocoder = new MapboxGeocoder({
              accessToken: mapboxgl.accessToken,
              mapboxgl: mapboxgl
            });

            geocoder.addTo('#BussinessAddress');

            const address_coord = {};
            geocoder.on('result', (e) =>{
                address_coord['Longitude'] = e.result["center"][0];
                address_coord['Latitude'] = e.result["center"][1];
            }); 



          document.getElementById("MyStore").addEventListener('submit', handleform);
             
          
          
          function handleform(e){
           e.preventDefault();
      
            var Myform = e.srcElement;
            console.log(Myform)
            var fd = new FormData(Myform);
            fd.append('Longitude', address_coord['Longitude']);
            fd.append('Latitude', address_coord['Latitude']);
              
            var request = new XMLHttpRequest();
            request.open("POST", "StoreServelet",true);
            
            
            request.send(fd); 
            
            
           
            console.log("Form data submitted") 
            console.log(address_coord['Longitude'])
            console.log(address_coord['Longitude'])
          }


    </script>





   
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>