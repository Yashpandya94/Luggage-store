<%@page import="com.entities.Store"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.Storedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
String city = request.getParameter("city") ;  
Storedao sdao= new Storedao(FactoryProvider.getfactory()) ;
java.util.List<Store> stores ;
if(city==null){
	stores = sdao.getstoreBYcity("bhopal") ; 
}
else{
     stores = sdao.getstoreBYcity(city) ; 
}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
<script src="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
  
  <link href="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css" rel="stylesheet"/> 
 
<!-- <link rel="stylesheet" href="CSS/main.css" />
 --> 
 
 <style> 
    
 @charset "ISO-8859-1";
body {
color: #404040;
font: 400 15px/22px 'Source Sans Pro', 'Helvetica Neue', sans-serif;
margin: 0;
padding: 0;
-webkit-font-smoothing: antialiased;
}
 
*{
box-sizing: border-box;
}
 
.sidebar { 

 position: absolute;
        width: 50%;
        left: 0;
        overflow: hidden;
        border-right: 1px solid rgba(0, 0, 0, 0.25); 
        
/* position: absolute;
width: 33.3333%;
height: 100%;
top: 0;
left: 0;
overflow: hidden;
border-right: 1px solid rgba(0, 0, 0, 0.25);
 */}
 
.map {
/* position: absolute;
left: 33.3333%;
width: 66.6666%;
top: 0;
bottom: 0;  */

  margin-top: 75px;
            float: right;
            position: fixed;
            bottom: 0;
            right: 0;
            width: 50%;
            height: 91.5%; 
}
 
h1 {
font-size: 22px;
margin: 0;
font-weight: 400;
line-height: 20px;
padding: 20px 2px;
}
 
a {
color: #404040;
text-decoration: none;
}
 
a:hover {
color: #101010;
}
 
.heading {
background: #fff;
border-bottom: 1px solid #eee;
min-height: 60px;
line-height: 60px;
padding: 0 10px;
background-color: #00853e;
color: #fff;
}
 
 .listings {
height: 100%;
overflow: auto;
padding-bottom: 60px;
} 
 
 
.listings .item {
display: block;
border-bottom: 1px solid #eee;
padding: 10px;
text-decoration: none;
} 
 
.listings .item:last-child {
border-bottom: none;
}
.listings .item .title {
display: block;
color: #00853e;
font-weight: 700;
}
 
.listings .item .title small {
font-weight: 400;
}
.listings .item.active .title,
.listings .item .title:hover {
color: #8cc63f;
}
.listings .item.active {
background-color: #f8f8f8;
}
::-webkit-scrollbar {
width: 3px;
height: 3px;
border-left: 0;
background: rgba(0, 0, 0, 0.1);
}
::-webkit-scrollbar-track {
background: none;
}
::-webkit-scrollbar-thumb {
background: #00853e;
border-radius: 0;
}
 
/* .marker {
border: none;
cursor: pointer;
height: 56px;
width: 56px;
background-image: url(marker.png);
}
  */
/* Marker tweaks */
.mapboxgl-popup {
padding-bottom: 50px;
}
 
.mapboxgl-popup-close-button {
display: none;
}
.mapboxgl-popup-content {
font: 400 15px/22px 'Source Sans Pro', 'Helvetica Neue', sans-serif;
padding: 0;
width: 180px;
}

.mapboxgl-popup-content h3 {
background: #91c949;
color: #fff;
margin: 0;
padding: 10px;
border-radius: 3px 3px 0 0;
font-weight: 700;
margin-top: -15px;
}
 
.mapboxgl-popup-content h4 {
margin: 0;
padding: 10px;
font-weight: 400;
}
 
.mapboxgl-popup-content div {
padding: 10px;
}
 
.mapboxgl-popup-anchor-top > .mapboxgl-popup-content {
margin-top: 15px;
}
 
.mapboxgl-popup-anchor-top > .mapboxgl-popup-tip {
border-bottom-color: #91c949;
}
    
 
  </style>
</head> 

 
<body>
     
    
    <div class="sidebar">
<div class="heading">
<h1>Our locations</h1>
</div>
<!--  <div id="" class="row "></div> -->
<div id="listings" class = "row m-2 d-flex justify-content-center"></div>
</div>
 

<div id="map" class="map"></div>


 
     
  
     
     <script> 
     
     mapboxgl.accessToken = 'pk.eyJ1IjoibmF5YW5tZyIsImEiOiJja3hrcnh3MGQwNWdxMm9rb3ZhaWdlM2I1In0.AApGj8R9Bh-iyGOkfs-Dpw';
     
     /**
     * Add the map to the page
     */
     const map = new mapboxgl.Map({
     container: 'map',
     style: 'mapbox://styles/mapbox/light-v10',
     center: [-77.034084142948, 38.909671288923],
     zoom: 13,
     scrollZoom: false
     });
          
       
          var features = []; 
        var obj = new Object() ; 
        <% 
        for(Store store :stores){%>
   obj.type = 'Feature'
   obj.geometry  =  {
   'type': 'Point',
   'coordinates': [<%=store.getLongitude()%>, <%=store.getLatitude()%>]
   }
   obj.properties = {
   'phoneFormatted': '<%=store.getStoreowner().getKeeperphone()%>',
   'phone': '9999999999',
   'address': '<%=store.getAddress()%>',
   'city': '<%=store.getCity()%>',
   'country': '<%=store.getCountry()%>',
   'crossStreet': '<%=store.getStoreName()%>',
   'postalCode': '<%=store.getPinCode()%>',
   'state': '<%=store.getState()%>',
   'photo': 'img/stores/<%=store.getStorePhoto()%>',
   'storeID': '<%=store.getStoreId()%>'
   
   }
   features.push(obj) ;
	obj = {};  
	 <%}%>
	 var stores = {} ; 
      stores.type = 'FeatureCollection' ; 
      stores.features = features ;
      
	 
	 /** 
	 'type': 'FeatureCollection',
'features': 
	
	 * Assign a unique id to each store. You'll use this `id`
	 * later to associate each point on the map with a listing
	 * in the sidebar.
	 */
	// console.log(stores) ;
	 
	 stores.features.forEach((store, i) => {
	 store.properties.id = i;
	 });
	  
	 /**
	 * Wait until the map loads to make changes to the map.
	 */
	 map.on('load', () => {
	 /**
	 * This is where your '.addLayer()' used to be, instead
	 * add only the source without styling a layer
	 */
	 map.addSource('places', {
	 'type': 'geojson',
	 'data': stores
	 });
	  
	 /**
	 * Add all the things to the page:
	 * - The location listings on the side of the page
	 * - The markers onto the map
	 */
	 buildLocationList(stores);
	 addMarkers();
	 });
	  
	 /**
	 * Add a marker to the map for every store listing.
	 **/
	 function addMarkers() {
	 /* For each feature in the GeoJSON object above: */
	 for (const marker of stores.features) {
	 /* Create a div element for the marker. */
	 const el = document.createElement('div');
	 /* Assign a unique `id` to the marker. */
	 el.id = `marker-${marker.properties.id}`;
	 /* Assign the `marker` class to each marker for styling. */
	 el.className = 'marker';
	  
	 /**
	 * Create a marker using the div element
	 * defined above and add it to the map.
	 **/
	 new mapboxgl.Marker(el, { offset: [0, -23] })
	 .setLngLat(marker.geometry.coordinates)
	 .addTo(map);
	  
	 /**
	 * Listen to the element and when it is clicked, do three things:
	 * 1. Fly to the point
	 * 2. Close all other popups and display popup for clicked store
	 * 3. Highlight listing in sidebar (and remove highlight for all other listings)
	 **/
	 el.addEventListener('click', (e) => {
	 /* Fly to the point */
	 flyToStore(marker);
	 /* Close all other popups and display popup for clicked store */
	 createPopUp(marker);
	 /* Highlight listing in sidebar */
	 const activeItem = document.getElementsByClassName('active');
	 e.stopPropagation();
	 if (activeItem[0]) {
	 activeItem[0].classList.remove('active');
	 }
	 const listing = document.getElementById(
	 `listing-${marker.properties.id}`
	 );
	 listing.classList.add('active');
	 });
	 }
	 }
	  
	 /**
	 * Add a listing for each store to the sidebar.
	 **/
	 function buildLocationList(stores) {
	 for (const store of stores.features) {
	 /* Add a new listing section to the sidebar. */
	 const listings = document.getElementById('listings');
	 console.log(listings) ;
	 const listing = listings.appendChild(document.createElement('div'));
	 /* Assign a unique `id` to the listing. */
	 listing.id = `listing-${store.properties.id}`;
	 /* Assign the `item` class to each listing for styling. */
	 listing.className = 'card m-2'; 
	 listing.style = 'width: 18rem'
	 
	 const image = listing.appendChild(document.createElement('img')) 
	  image.src = `${store.properties.photo}`;
            image.className = 'card-img-top pt-2'; 
            image.style = "height:180px;"
            	 
            
          

            /*creatind card body */ 
            
            const cardbody = listing.appendChild(document.createElement('div'))
            cardbody.className = 'card-body'
 
            
	 /* Add the link to the individual listing created above. */
	 const link = cardbody.appendChild(document.createElement('a'));
	 link.href = '#';
	 link.className = 'card-title h5';
	 link.id = `link-${store.properties.id}`;
	 link.innerHTML = `${store.properties.address}`;
	  
	 /* Add details to the individual listing. */
	 const details = cardbody.appendChild(document.createElement('div'));
	 details.className = 'card-text';
	 details.innerHTML = `${store.properties.city}`;
	 if (store.properties.phone) {
	 details.innerHTML += ` &middot; ${store.properties.phoneFormatted}`;
	  } 
	 
	 const form = cardbody.appendChild(document.createElement('form'));
     form.action = 'NewFile.jsp';
     form.method = 'post';
     /* input tag inside form*/
     const input = form.appendChild(document.createElement('input'));
     input.type = 'hidden' ;
     input.name = 'name'; 
     input.value = `${store.properties.storeID}` ;

     /* button inside the form*/
     const btn_link = form.appendChild(document.createElement('button'));
     /* btn_link.href = '/store'; */
     btn_link.type = 'submit';
     btn_link.className = 'form-control btn btn-danger';
     /* btn_link.role = 'button'; */
     btn_link.innerHTML = 'Book Now'
         
    
	  
	 /**y/
	 * Listen to the element and when it is clicked, do four things:
	 * 1. Update the `currentFeature` to the store associated with the clicked link
	 * 2. Fly to the point
	 * 3. Close all other popups and display popup for clicked store
	 * 4. Highlight listing in sidebar (and remove highlight for all other listings)
	 **/
	 link.addEventListener('click', function () {
	 for (const feature of stores.features) {
	 if (this.id === `link-${feature.properties.id}`) {
	 flyToStore(feature);
	 createPopUp(feature);
	 }
	 }
	 const activeItem = document.getElementsByClassName('active');
	 if (activeItem[0]) {
	 activeItem[0].classList.remove('active');
	 }
	 this.parentNode.classList.add('active');
	 });
	 }
	 }
	  
	 /**
	 * Use Mapbox GL JS's `flyTo` to move the camera smoothly
	 * a given center point.
	 **/
	 function flyToStore(currentFeature) {
	 map.flyTo({
	 center: currentFeature.geometry.coordinates,
	 zoom: 15
	 });
	 }
	  
	 /**
	 * Create a Mapbox GL JS `Popup`.
	 **/
	 function createPopUp(currentFeature) {
	 const popUps = document.getElementsByClassName('mapboxgl-popup');
	 if (popUps[0]) popUps[0].remove();
	 const popup = new mapboxgl.Popup({ closeOnClick: false })
	 .setLngLat(currentFeature.geometry.coordinates)
	 .setHTML(
	 `<h3>Sweetgreen</h3><h4>${currentFeature.properties.address}</h4>`
	 )
	 .addTo(map);
	 } 
	 
	  
        console.log(stores) ;
     </script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>