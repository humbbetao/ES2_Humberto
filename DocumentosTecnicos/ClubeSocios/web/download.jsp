<%@page import="dao.DAO"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("isLogado") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script language="JavaScript">

        function mascara(t, mask) {
            var i = t.value.length;
            var saida = mask.substring(1, 0);
            var texto = mask.substring(i)
            if (texto.substring(0, 1) != saida) {
                t.value += texto.substring(0, 1);
            }
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Cadastro Socio</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Dados Cadatro</a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("nome_usuario")%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="LoginServlet?op=perfil"><i class="fa fa-fw fa-user"></i> Perfil</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="LoginServlet?op=sair"><i class="fa fa-fw fa-power-off"></i>Sair</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="home.jsp"><i class="fa fa-fw fa-home"></i> Inicio</a>
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-fw fa-plus-circle"></i> Socio</a>
                        </li>

                        <li>
                            <a href="LoginServlet?op=contato"><i class="fa fa-fw fa-plus-circle"></i> Unidade</a>
                        </li>

                        <li>
                            <a href="LoginServlet?op=contato"><i class="fa fa-fw fa-plus-circle"></i> Dependentes</a>
                        </li>


                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">

                            <h2 class="page-header">
                                Cadastro <small>socio</small>
                            </h2>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-plus-circle"></i> Socio Cadastro
                                </li>

                            </ol>
                            <div id="form-download" style="margin-left: 220px; margin-top: 20px;"> 

                                <%
                                    if ((Boolean) session.getAttribute("listaDownloadVazia")) {
                                        out.print("<br/><b style=\"color:red\">A pesquisa não retornou dados!</b><br/><br/>");
                                    }
                                %>

                                <div id="tabela">
                                    <form action="DownloadServlet" method="GET">
                                        <table style="margin-top: 10px; margin-left: 0px;">
                                            <tr>
                                                <td  style="width: 70px; height: 45px;">
                                                    <b>Nome:</b>
                                                </td>
                                                <td> 
                                                    <input type="text" name="data_inicial" >
                                                </td>
                                            </tr>

                                            <tr>
                                                <td  style="width: 150px; height: 45px;">
                                                    <b>Endereço:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="data_final">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td  style="width: 100px; height: 45px;">
                                                    <b>Valor Mensalidade:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="data_final">
                                                </td>

                                            </tr>

                                        </table>
                                        <input type="submit" value="Cadastrar" name="op" style="width: 150px; height: 25px; margin-left: 120px; margin-top: 15px;">
                                        <input type="reset" value="Limpar" style="width: 150px; height: 25px; margin-left: 35px; margin-top: 15px;" >
                                    </form>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
