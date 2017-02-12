<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Student Barometer</title>
      <!-- Bootstrap Core CSS -->
      <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <!-- MetisMenu CSS -->
      <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
      <!-- Custom CSS -->
      <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
      <!-- Morris Charts CSS -->
      <link href="../vendor/morrisjs/morris.css" rel="stylesheet">
      <!-- Custom Fonts -->
      <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body>
      <div id="wrapper">
      <!-- Navigation -->
      <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
         <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">Student Barometer</a>
         </div>
          <ul class="nav navbar-top-links navbar-right"><a href="logout.jsp">Logout</a></ul>
         <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
               <ul class="nav" id="side-menu">
                  <li class="sidebar-search">
                     <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                        <i class="fa fa-search"></i>
                        </button>
                        </span>
                     </div>
                  </li>
               </ul>
               <ul class="nav" id="side-menu">
                  <%
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb","root","root");
                     Statement st = con.createStatement();
                     ResultSet rs=st.executeQuery("select colName from collist");
                     while(rs.next()){
                         
                         %>
                  <a href="">
                     <li><%= rs.getString("colName")%></li>
                  </a>
                  <%
                     }
                                                                    %>
               </ul>
            </div>
            <!-- /.sidebar-collapse -->
         </div>
         <!-- /.navbar-static-side -->
      </nav>
      <div id="page-wrapper">
         <div class="row col-lg-12 ">
            <div class="">
               <h1 class="page-header">Student Barometer</h1>
            </div>
            <div class="container">
               <div class="row ">
                  <div class="col-md-8 ">
                     <div class="panel panel-login">
                        <% System.out.println("--------------------"+session.getAttribute("exists").toString()); 
                        if(!session.getAttribute("exists").toString().equals("true")){%>
                        <a href="#" tabindex="4" class="form-control btn btn-login"  data-target="#FeedBackForm"   data-toggle="modal" role="button"   >Give Ur Feed Back</a>
                        <%}%>
                        <br><br> <a data-target="#Feeds"   data-toggle="modal" tabindex="4" class="form-control btn btn-login" >Visit College</a>
                     </div>
                  </div>
               </div>
                        <div class="row ">
                            <div class="col-md-8 ">
                                <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
            </div>
            <!-- /.col-lg-12 -->
            
         </div>
                    
                        
                </div>
      
               <div class="modal fade" id="Feeds"  aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                     <%
            Statement st1 = con.createStatement();
            String ColID = session.getAttribute("ColID").toString();
            ResultSet rs1=st1.executeQuery("select * from feed where ColID='"+ColID+"' ORDER BY ColId LIMIT 10" );                   
                while(rs1.next()){
                    int total = Integer.valueOf(rs1.getString(1))+Integer.valueOf(rs1.getString(2))+Integer.valueOf(rs1.getString(3))+Integer.valueOf(rs1.getString(4))+Integer.valueOf(rs1.getString(5));
                
                     %>
                         <div class="col-lg-12 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                 <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                    
                                </div>
                                <div class="col-xs-9 text-right">
                                    Over Comments Rating<div class="huge"><%= total / 5%></div>
                                </div>
                            </div>
                                <div class="panel-footer" style="background-color: #08C">
                                    <%= rs1.getString("comments")%>
                                </div>
                            </div>
                        </div>
                    </div>
                         <%}%>
                     </div>
                  </div>
               </div>
               </div>
            <!-- BEGIN # MODAL LOGIN -->
            <div class="modal fade" id="FeedBackForm"  aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                     </div>
                     <!-- Begin # DIV Form -->
                     <div id="div-forms">
                        <!-- Begin # Login Form -->
                        <form id="login-form" style="padding: 15px" action="feed1.jsp" method="post">
                           <h1>Feed back for the selected college</h1>
                           <div id ="f1" class="row lead">
                              <p>Over All experience</p>
                              <div id="stars" class="starrr"></div>
                              <input type="hidden" id="count1" name="f1">
                           </div>
                           <div id ="f2" class="row lead">
                              <p>College facility</p>
                              <div id="stars" class="starrr"></div>
                              <input type="hidden" id="count2" name="f2" >
                           </div>
                           <div id ="f3" class="row lead">
                              <p>Entry Standards</p>
                              <div id="stars" class="starrr"></div>
                              <input type="hidden" id="count3" name="f3">
                           </div>
                           <div id ="f4" class="row lead">
                              <p>Sports activity</p>
                              <div id="stars" class="starrr"></div>
                              <input type="hidden" id="count4" name="f4">
                           </div>
                           <div id ="f5" class="row lead">
                              <p>Club and Unions</p>
                              <div id="stars" class="starrr"></div>
                              <input type="hidden" id="count5" name="f5">
                           </div>
                           <div class="row lead">
                              <p>Comments</p>
                              <textarea style="width: 500px;height: 70px" id="f6" name="f6"> </textarea>
                           </div>
                           <div class="row lead">
                              <p class=""><input class="btn btn-primary btn-lg" type="submit"></p>
                           </div>
                        </form>
                        <!-- End # Login Form -->
                     </div>
                     <!-- End # DIV Form -->
                  </div>
               </div>
            </div>
           
         </div>
        
      </div>
      
      <%
      double  sports = 0;
      double Unioin = 0;
      double standards= 0;
      double facility= 0;
      double overall= 0;
      int count=0;
      Statement st2 = con.createStatement();
            String ColID1 = session.getAttribute("ColID").toString();
            ResultSet rs2=st2.executeQuery("select * from feed where ColID='"+ColID1+"'" );                   
                while(rs2.next()){
                   sports = sports + Integer.valueOf( rs2.getString(1));
                   Unioin = Unioin + Integer.valueOf( rs2.getString(2));
                   standards = standards + Integer.valueOf( rs2.getString(3));
                   facility = facility + Integer.valueOf( rs2.getString(4));
                   overall = overall + Integer.valueOf( rs2.getString(5));
                   count++;
          }
          
%>
      
<script type="text/javascript">
  window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer", {
            title: {
                text: "Your College rating",
                fontFamily: "Verdana",
                fontColor: "Peru",
                fontSize: 20

            },
            animationEnabled: true,
            axisY: {
                tickThickness: 0,
                lineThickness: 0,
                valueFormatString: " ",
                gridThickness: 0                    
            },
            axisX: {
                tickThickness: 0,
                lineThickness: 0,
                labelFontSize: 18,
                labelFontColor: "Peru"

            },
            data: [
            {
                indexLabelFontSize: 20,
                toolTipContent: "<span style='\"'color: {color};'\"'><strong>{indexLabel}</strong></span><span style='\"'font-size: 20px; color:peru '\"'><strong>{y}</strong></span>",

                indexLabelPlacement: "inside",
                indexLabelFontColor: "white",
                indexLabelFontWeight: 200,
                indexLabelFontFamily: "Verdana",
                color: "#62C9C3",
                type: "bar",
                dataPoints: [
                    { y: <%= Math.round((count/overall)*100) %>, label: <%= Math.round((count/overall)*100) %>+"%", indexLabel: "Over Experience" },
                    { y: <%= Math.round((count/facility)*100) %>, label: <%= Math.round((count/facility)*100)%>+"%", indexLabel: "Facility" },
                    { y: <%= Math.round((count/standards)*100) %>, label: <%= Math.round((count/standards)*100)%>+"%", indexLabel: "Standerds" },
                    { y: <%= Math.round((count/sports)*100) %>, label: <%= Math.round((count/sports)*100)%>+"%", indexLabel: "Sports" },
                    { y: <%= Math.round((count/Unioin)*100) %>, label: <%= Math.round((count/Unioin)*100)%>+"%", indexLabel: "Unioin" }
                    
                ]
            }
            ]
        });

        chart.render();
    }
  </script>
      <!-- /#wrapper -->
      <!-- jQuery -->
      <script src="../vendor/jquery/jquery.min.js"></script>
      <!-- Bootstrap Core JavaScript -->
      <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
      <!-- Metis Menu Plugin JavaScript -->
      <script src="../vendor/metisMenu/metisMenu.min.js"></script>
      <!-- Morris Charts JavaScript -->
      <script src="../vendor/raphael/raphael.min.js"></script>
      <script src="../vendor/morrisjs/morris.min.js"></script>
      <script src="../data/morris-data.js"></script>
      <!-- Custom Theme JavaScript -->
      <script src="../dist/js/sb-admin-2.js"></script>
      <script src="../js/feed.js"></script>
      
<script  src="../js/jquery.canvasjs.min.js"></script>
   </body>
</html>