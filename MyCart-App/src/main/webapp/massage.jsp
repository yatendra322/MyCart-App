<%
	String message=(String)session.getAttribute("message");
	if(message!=null){
		//prints
		//out.println(message);
		
	}
%>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="background-color:yellow">
  <strong  style="color: rgb(255,0,0)"><%=message %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="background-color:red">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<% session.removeAttribute("message");

%>