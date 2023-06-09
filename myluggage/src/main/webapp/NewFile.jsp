<%@page import="com.entities.Store"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.Storedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    
   
   
 <%  String s =  request.getParameter("name")  ;   
   Integer id = Integer.parseInt(s) ; 
 
 Storedao sdao= new Storedao(FactoryProvider.getfactory()) ;
  Store store = sdao.getstorebyId(id) ;  
  
  %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" /> 
	<meta name="viewport" content="width=device-width,initial-scale=1.0"> 

	<title>Counter</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/NewFile.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
 <main>  


          <h2>book your store</h2>  
 <div class="container">
  <form> 
    <div class="mb-3">
        <h3>Store Name</h3>  
        <div class="input-group">
        <div class="input-group-prepend">
        <div class="input-group-text">
        <input type="radio" aria-label="Radio button for following text input">
    </div>
  </div>
  <input type="text" class="form-control" placeholder="<%=store.getStoreName() %>" aria-label="Text input with radio button">
</div>
    </div>
  

 <div class="mb-3">
 <h5>Booking date</h5>
<input type="date" id="birthday" name="birthday">
</div>
 </div> 

 <div class="mb-3">
        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Bags Count</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01">
    <option selected>Choose...</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="1">4</option>
    <option value="2">5</option>
    <option value="3">6</option>
    <option value="1">7</option>
    <option value="2">8</option>
    <option value="3">9</option>
    <option value="3">10</option>
  </select>
</div>     
 </div>



<div class="mb-3">
        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Day Count</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01">
    <option selected>Choose...</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="1">4</option>
    <option value="2">5</option>
    <option value="3">6</option>
    <option value="1">7</option>
    <option value="2">8</option>
    <option value="3">9</option>
    <option value="3">10</option>
  </select>
</div> 
</div> 

 <button type="button" class="btn btn-warning">confirm order</button> 

  </form>
</div>

         

    
</main>
 <script type="text/javascript" src="JS/NewFile.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>