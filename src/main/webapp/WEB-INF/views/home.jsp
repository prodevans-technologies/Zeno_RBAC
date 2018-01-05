<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  ${user}
</h1>

<P>  hellooo. ...cgnvhn${userInfo}. </P>
 <jsp:include page="component/footer.jsp"></jsp:include>
</body>
</html>
