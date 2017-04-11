$(document).ready(function(){
	$(function() {
		$('.datepicker').datepicker({format: 'dd-mm-yyyy'});
	});
});

function Calculate()
{
  var locality = document.getElementById('locality').value;
  var loc = locality.substring(0, 3);
  var mobileno = document.getElementById('mobileno').value; 
  var uid = loc + mobileno;
  document.getElementById('uid').value = uid;
  document.form1.submit();
}