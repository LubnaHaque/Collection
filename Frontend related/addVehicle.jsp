<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#engine_type {
    display: none;
}

#turbo_div {
    display: none;
}
</style>

<script type="text/javascript">
function myFun() {
	var selectBox = document.getElementById("vehicle_type");
    var val = selectBox.options[selectBox.selectedIndex].value;
    
    if(val === "sports"){
        document.getElementById("turbo_div").style.display='block';
        document.getElementById("engine_type").style.display='none';
        document.getElementById("weight").type="hidden";
    }
    else if(val === "heavy"){
    	document.getElementById("turbo_div").style.display='none';
    	document.getElementById("engine_type").style.display='none';
  	    document.getElementById("weight").type="number";
    }
    else if(val === "normal"){
    	document.getElementById("engine_type").style.display='block';
    	document.getElementById("turbo_div").style.display='none';
    	document.getElementById("weight").type="hidden";
    }
}
</script>
</head>
<body>

<h1>Add Vehicle:</h1>

<form action="showVehicle.jsp">

    <div id="model_div">
    	<input type="text" id="model" name="model" placeholder="Model Number" required="required">
    </div>
	
	<div id="vehicle_type_div">
		<select id="vehicle_type" name="vehicle_type" onchange="myFun()" required="required">
		<option value="">select vehicle type---</option>
		<option value="normal">Normal</option>
		<option value="heavy">Heavy</option>
		<option value="sports">Sports</option>
	</select>
	</div>
	
	<div id="engine_type_div">
		<select id="engine_type" name="engine_type" required="required">
		<option value="">select engine type---</option>
		<option value="oil">Oil</option>
		<option value="gas">Gas</option>
		<option value="diesel">Diesel</option>
	</select>
	</div>
	
	<div id="turbo_div">
		<label>Turbo type?</label>
		<select id="turbo" name="turbo" required="required">
			<option value="yes">Yes</option>
			<option value="no">No</option>
		</select>
	</div>
	
	<div id="weight_div">
		<input type="hidden" id="weight" name="weight" placeholder="weight" min="1" required="required">
	</div>
	
	<div id="power_div">
		<input type="number" id="power" name="power" placeholder="power" min="1" required="required">
	</div>
	
	<div id="size_div">
		<input type="number" id="size" name="size" placeholder="size" min="1" required="required">
	</div>
	
	<input type="submit">
</form>

</body>

</html>