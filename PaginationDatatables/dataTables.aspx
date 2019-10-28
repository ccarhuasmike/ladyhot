<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dataTables.aspx.cs" Inherits="PaginationDatatables.dataTables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <div class="container">   
        <div class="form-horizontal">
            <div class="form-group">
                <label for="email" class="col-md-2">Nombre:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="txtNombre">
                </div>
                <label for="email" class="col-md-2">Apellido:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="txtApellido">
                </div>
            </div>
            <div class="form-group text-center">
                <button type="button" class="btn btn-sm btn-default" id="btnBuscar">Buscar</button>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <table id="example" class="table table-striped table-bordered" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Apellido</th>
                                <th>Nombre</th>                                
                            </tr>
                        </thead>                  
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="<%= ResolveClientUrl("~/Scripts/datatables/bandejadatatables.js")%>"></script>
</asp:Content>
