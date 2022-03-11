

var connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
var connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");