//change this to not have an annoying popups and modify the document to have an error div come up with red text stating the error. should be some sort of ajax
//call i bet. idk, not worried about it now but the popups get annoying.

//going to neeed to do something with managerprofile ajax wise since we dont have a submit button onsubmit is never called.
//might need to do the same stuff on a couple other pages, dunno.
//need to validate the trusted user stuff
/*function loadXMLDoc()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  {
	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	  }
	  };
	
	xmlhttp.open("GET","ajax_info.txt",true);
	xmlhttp.send();
}*/


//ajax functions
var xmlhttp;

function loadFeedback()
{
 var str = document.forms["NUsefulFeedbacks"]["NumberOfFeedback"].value;
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="usefulfeedback.jsp";
    url=url+"?q="+str;

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("feedbacks").innerHTML=xmlhttp.responseText;
  }
}

function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
       return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
      return new ActiveXObject("Microsoft.XMLHTTP");
    }
 return null;
}

//swap image stuff
$(document).ready(function(){
    $(".fimg").hover(
        function() {$(this).attr("src","./images/fullstar.png");},
        function() {$(this).attr("src","./images/emptystar.gif");
    });
});


//other functions
function changeContentsOnClick(formname, elementname)
{
	 oFormObject = document.forms[formname];	
	 oFormElement = oFormObject.elements[elementname]; 
	 oFormElement.value="";
}

function validateLogin(foname)
{
	for(i in document.forms[foname].elements)
	{
		var x=document.forms[foname][i].value;
		$.trim(x);
		if (x==null || x=="")
		{
			if(i == "password")
			{	alert("Please enter a password."); 
				i.focus();
			}
			else
			{
				alert("Please enter a username.");
				i.focus();
			}
	  	return false;
	  }
		else
			{
				var re = new RegExp(/[\s\[\]\(\)=,"\/\?@\:\;]/g);
				if (re.test(x)) 
				{
					alert('Illegal characters are present, please remove them.');
					return false;}
				else { return true;} 
			}
	}
}

function validString(foname)
{
	
}

function validateIntegerForm(foname)
{
	for(i in document.forms[foname].elements)
	{
		var x=document.forms[foname][i].value;
		$.trim(x);
		if (x==null || x=="")
		{
			i.focus();
			alert("Please enter an integer");
	  	return false;
	  }
		else
			{
				var re = new RegExp(/[\D]/g);
				if (re.test(x)) 
				{
					alert('Please use integers only.');
					return false;}
				else { return true;} 
			}
	}
}

function validateRegistration(foname)
{
	for(i in document.forms[foname].elements)
	{
		var x=document.forms[foname][i].value;
		$.trim(x);
		if (x==null || x=="")
		{
			i.focus(); //problem with this for some reason. i don't think i is actually calling what i want it to. muse on this.
			alert("Please fill out each part of the registration.");
	  	return false;
	  }
		else
			{
				var re = new RegExp(/[\s\[\]\(\)=,"\/\?@\:\;\-]/g);
				if (re.test(x)) 
				{
					alert('Please use valid characters only.');
					return false;}
				else { return true;} 
			}
	}
}

function validateSearch()
{
		var x=document.forms["search"]["search"].value;
		$.trim(x);
		var re = new RegExp(/[\s\[\]\(\)=,"\/\?@\:\;]/g);
		if (re.test(x)) 
		{
					alert('Illegal Characters are present, please remove them.');
					return false;
		}
		else { return true;	} 
}