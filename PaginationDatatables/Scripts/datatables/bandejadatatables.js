
var bandejaDatatables = {
    initData: function () {
        $('#example').DataTable({
            "dom": 'Bfrtip',
            "buttons": [
                {
                    extend: "excelHtml5",
                    text: "<i class='fa fa-file-excel-o'>",
                    titleAttr: "Excel",
                    action: function (e, dt, node, config) {

                        debugger;
                        dt.page.len(-1).draw();
                        $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, node, config);


                        console.log(e);
                        console.log(dt);
                        console.log(node);
                        console.log(config);

                        console.log($("#txtNombre").val());
                        console.log($("#txtApellido").val());    
                        //alert("hola mundo");
                    }
                }
            ],
            "searching": false,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": true,
            "destroy": true,
            "language": "",
            "ajax": {
                "url": "https://localhost:44390/dataTables.aspx/GetDTDataSerializedList",
                "type": 'POST',
                "contentType": "application/json; charset=utf-8",
                "data": function (dtParms) {

                    //var request = new Object();
                    //request.CodigoSalesforce = $("#txtNombre").val();
                    //request.NombreCliente = $("#txtApellido").val();            
                    //return JSON.stringify({ "page": sSource, "request": request });

                    return JSON.stringify({ ClientParameters: JSON.stringify(dtParms) });

                }, dataFilter: function (res) {
                    // Web Method always returns the reponse in a d so it looks like
                    // {d:string} where the string is the reponse from the web method.
                    // Its a string because I serialize it before sending it out.
                    // This bit of code takes that into account and converts it
                    // to what DataTable is expecting.                  
                    var parsed = JSON.parse(res);
                    return parsed.d;
                },
            },
            "columns": [
                { "data": "Apellido", "autoWidth": true, "sClass": 'text-center' },
                { "data": "Nombre", "autoWidth": true, "sClass": 'text-left' }

            ]
        });
    }
};




$(document).ready(function () {

    $("#btnBuscar").click(buscar);



    function buscar() {
        bandejaDatatables.initData();
    }
    function getObjectBuscarAutorizacion() {
        var listcliente = $("#bemClienteMultiSelects").WebUserControlMultiSelectDatoss();
        var listSolcitante = $("#bemSolicitanteMultiSelects").WebUserControlMultiSelectDatoss();
        var params = new Array();
        params[0] = listcliente;
        params[1] = listSolcitante;
        params[2] = $("#cboTipo").val();
        params[3] = $("#txtCodigo").val();
        params[4] = $("#txtFechaInicio").val();
        params[5] = $("#txtFechaFin").val();
        params[6] = $("#cboEstado").val();
        params[7] = PendienteAprobacion;
        params[8] = currentPage;
        params[9] = RegistroXpagina;
        return params;
    }

    function getBuscarAutorizacion(params, $Loading) {
        return $.ajax({
            type: "POST",
            url: UriMaster + $rutaFormulario + "GetDTDataSerializedList",
            data: JSON.stringify({ arr: params }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                if ($Loading === 'LoadingBuscar') {
                    $('#loadingProgress').css('display', 'block');
                }
            },
            complete: function () {
                if ($Loading === 'LoadingBuscar') {
                    setTimeout(function () { $('#loadingProgress').css('display', 'none'); }, 500);
                }
            },
            async: true,
            error: function (xmlHttpRequest) {
                console.log("error function getBuscarAutorizacion");
            }
        });
    }

    function responseBuscarAutorizacion(response) {
        var result = JSON.parse(response.d);
        var HTML = "";
        document.getElementById("tbody").innerHTML = "";
        if (result.Status === "OK") {
            if (result.Data !== null && result.Data.length > 0) {
                for (index in result.Data) {
                    valParamteros = {
                        Id: parseInt(result.Data[index]["Id"])
                    };
                    var ClickDetalleRegistro = "verDetalle(" + JSON.stringify(valParamteros) + ")";
                    HTML += "<tr>";
                    var codigo = result.Data[index]["Codigo"] === null ? "" : result.Data[index]["Codigo"];
                    var FechaInicio = moment.utc(result.Data[index]["FechaInicio"]).local().isValid() ? moment.utc(result.Data[index]["FechaInicio"]).local().format("DD/MM/YYYY") : "";
                    var FechaFin = moment.utc(result.Data[index]["FechaFin"]).local().isValid() ? moment.utc(result.Data[index]["FechaFin"]).local().format("DD/MM/YYYY") : "";
                    var FechaRegistro = moment.utc(result.Data[index]["FechaRegistro"]).local().isValid() ? moment.utc(result.Data[index]["FechaRegistro"]).local().format("DD/MM/YYYY HH:mm:ss") : "";
                    var FechaAprobacion = moment.utc(result.Data[index]["FechaAprobacion"]).local().isValid() ? moment.utc(result.Data[index]["FechaAprobacion"]).local().format("DD/MM/YYYY HH:mm:ss") : "";
                    if (codigo !== "")
                        HTML += "<td align='center'><a href='#' onclick='" + ClickDetalleRegistro + "' title='Detalle registro' >" + codigo + "</a></td>";
                    else
                        HTML += "<td align='center'>" + codigo + "</td>";
                    HTML += "<td>" + FechaInicio + "</td>";
                    HTML += "<td>" + FechaFin + "</td>";
                    HTML += "<td>" + result.Data[index]["HorarioInicio"] + "</td>";
                    HTML += "<td>" + result.Data[index]["HorarioFin"] + "</td>";
                    HTML += "<td>" + result.Data[index]["Tipo"] + "</td>";
                    HTML += "<td>" + result.Data[index]["Estado"] + "</td>";
                    HTML += "<td>" + FechaRegistro + "</td>";
                    HTML += "<td>" + FechaAprobacion + "</td>";

                    if (codigo === "")
                        HTML += "<td><a href='#' onclick='" + ClickDetalleRegistro + "' title='Detalle registro' >" + result.Data[index]["Descripcion"] + "</a></td>";
                    else
                        HTML += "<td>" + result.Data[index]["Descripcion"] + "</td>";
                    HTML += "</tr>";
                }
                /*Mostrar los botones de Importar y Exportar cuando existe datos en la bandeja*/
                mostrarBotonImprimiryExportar(true);
                mostrarGrillaContentMasterGrilla(true);
                document.getElementById("tbody").innerHTML = HTML;
                /*Logica Paginacion*/
                $pagination.twbsPagination('destroy');
                $pagination.twbsPagination($.extend({}, defaultOpts, {
                    startPage: currentPage,
                    totalPages: JSON.parse(result.paginacion).TotalPages,
                    first: "Primero",
                    prev: "Anterior",
                    next: "Siguiente",
                    last: "último",
                    onPageClick: function (event, page) {
                        var flag = $("#flag").val();
                        if (flag === "true") {
                            $("#flag").val("false");
                            return;
                        } else {
                            $("#flag").val("true");
                            var object = getObjectBuscarAutorizacion();
                            LoadingPaginacion(); //mostran loading paginacion
                            setTimeout(function () {
                                document.getElementById("tbody").innerHTML = "";
                                getBuscarAutorizacion(object).done(responseBuscarAutorizacion); // Cargar Tabla 
                            }, 500);
                        }
                    }
                }));
            } else {
                NoEncontroRegistro();
                mostrarGrillaContentMasterGrilla(true);
                $pagination.twbsPagination('destroy');
            }
        } else {
            console.log(result.Errores);
        }
    }

    function btnNuevoMasterGilla() {
        $.ajax({
            type: "POST",
            url: UriMaster + $rutaFormulario + "NuevoAutorizacion",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = JSON.parse(response.d);
                if (result.Status === "OK")
                    window.location.href = UriMaster + "/" + result.Url;
            },
            error: function (xmlHttpRequest) {
                console.log("error function btnNuevoMasterGilla");
            }
        });
    }

    function cargarInicial() {
        getCargarInicial().done(responseCargarInicial);
    }

    function getCargarInicial() {
        return $.ajax({
            type: "POST",
            url: UriMaster + $rutaFormulario + "getInit",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            error: function (ex) {
                console.log("error function getCargarInicial");
            }
        });
    }

    function responseCargarInicial(response) {
        var result = JSON.parse(response.d);
        if (result.Status === "OK") {
            $("#bemClienteMultiSelects").PrecargarChossens(result.Data.listCliente);
            if (PendienteAprobacion !== "1")
                $("#bemSolicitanteMultiSelects").PrecargarChossens(result.Data.listSolicitante);
            loadCombos("cboTipo", result.Data.listComboTipoAutorizacion, "--SELECCIONE--", ["Id", "ValorTexto"], "-1", true);
            loadCombos("cboEstado", result.Data.listComboEstadoAutorizacion, "--SELECCIONE--", ["Id", "ValorTexto"], "-1", true);
            HabilitarOpcionesPorPaginaMasterGrillaPrincipal(result.Data.AccesoOciones);
        }
    }

});
