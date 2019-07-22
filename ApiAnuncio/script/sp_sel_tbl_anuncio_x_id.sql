Alter procedure [dbo].[sp_sel_tbl_anuncio_x_id](
@id int 
)
as
declare           
@tx_descripcion varchar(100) 
begin
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')       
select 
id,      
isnull((SELECT STUFF(          
    (SELECT top 1 ', ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales          
    FROM tbl_galeria_anuncio          
    WHERE tbl_galeria_anuncio.id_anuncio = a.id   and tbl_galeria_anuncio.id_tipo_archivo in (1,2,3)        and IdTipoPresentacion =1
    FOR XML PATH ('')),          
1,2, '')),'') as txt_imagen_prensetancion,  

isnull((SELECT STUFF(          
    (SELECT '; ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales          
    FROM tbl_galeria_anuncio          
    WHERE tbl_galeria_anuncio.id_anuncio = a.id   and tbl_galeria_anuncio.id_tipo_archivo in (1,2,3)        and IdTipoPresentacion =2
    FOR XML PATH ('')),          
1,2, '')),'') as txt_imagen_galeria,  

 (SELECT det.tx_descripcion     
  FROM    tbl_parameter_det det     
  where det.val_valor  =  a.int_pais_origen   
  AND det.skey_cab =   'SKEY_PAISES'   
) as tx_pais_origen,    
case when ISNULL(a.fl_atencion_24horas,0)=0 then ''  
  when a.fl_atencion_24horas=1 then 'Atiende las 24 horas'  
 end as tx_fl_atencion_24horas,  

 cast( (SELECT det.tx_descripcion     
  FROM    tbl_parameter_det det     
  where det.val_valor  =  a.int_pais_origen   
  AND det.skey_cab =   'SKEY_EDADES'   
) as int ) as int_edad,   

txt_nombre_ficha,
txt_telefono_1,
txt_telefono_2,
txt_email,
txt_web,
int_pais_origen,
int_estudios,
(SELECT det.tx_descripcion     
FROM    tbl_parameter_det det     
where det.val_valor  =  a.int_pais_origen   
AND det.skey_cab =   'SKEY_ESTUDIOS'   
) as tx_estudio,

txt_presentacion,
int_color_cabello,
(SELECT det.tx_descripcion     
FROM    tbl_parameter_det det     
where det.val_valor  =  a.int_pais_origen   
AND det.skey_cab =   'SKEY_COLOR_CABELLO'   
) as tx_color_cabello,



int_color_ojos,

(SELECT det.tx_descripcion     
FROM    tbl_parameter_det det     
where det.val_valor  =  a.int_pais_origen   
AND det.skey_cab =   'SKEY_COLOR_OJOS'   
) as tx_color_ojos,


int_estatura,
(SELECT det.tx_descripcion     
FROM    tbl_parameter_det det     
where det.val_valor  =  a.int_pais_origen   
AND det.skey_cab =   'SKEY_ESTATURA'   
) as tx_estatura,

int_peso,

(SELECT det.tx_descripcion     
FROM    tbl_parameter_det det     
where det.val_valor  =  a.int_pais_origen   
AND det.skey_cab =   'SKEY_PESO'   
) as tx_peso,

txt_medidas_busto_cintura_cadera,
txt_descripcion_extra_apariencia,
dbl_costo_x_tiempo_30min,
dbl_costo_x_tiempo_45min,
dbl_costo_x_tiempo_1hora,
dbl_costo_x_tiempo_1hora_media,
dbl_costo_x_tiempo_2hora,
dbl_costo_x_tiempo_3hora,
dbl_costo_x_tiempo_salidas,
dbl_costo_x_tiempo_toda_noche,
--txt_forma_pago,
(SELECT Stuff((SELECT '; '+ det.tx_descripcion     
                        FROM   dbo.Split(a.txt_lugar_servicio_distrito, ',') split     
                                INNER JOIN tbl_parameter_det det     
                                        ON split.id = det.val_valor     
                                            AND det.skey_cab =     
                                                'SKEY_FORMA_PAGO'     
                        FOR xml path ('')), 1, 2, ''))                 AS     
            txt_forma_pago,  
txt_descripcion_extra_tarifa,

---select * from tbl_parameter_det

txt_lugar_servicio_distrito,
(SELECT Stuff((SELECT '; '+ --cast(det.val_valor as varchar(10)) + '-'+ 
							det.tx_descripcion     
                        FROM   dbo.Split(a.txt_lugar_servicio_distrito, ',') split     
                                INNER JOIN tbl_parameter_det det     
                                        ON split.id = det.val_valor     
                                            AND det.skey_cab =     
                                                'SKEY_DISTRITO'     
                        FOR xml path ('')), 1, 2, ''))                 AS     
            txt_descripcion_lugar_servicio_distrito,    

fl_atencion_24horas,
tx_descripcion_extra_horario,
tx_lugar_atencion,
(SELECT Stuff((SELECT '; '+ --cast(det.val_valor as varchar(10)) + '-'+ 
							det.tx_descripcion     
                        FROM   dbo.Split(a.txt_lugar_servicio_distrito, ',') split     
               INNER JOIN tbl_parameter_det det     
                                        ON split.id = det.val_valor     
                                            AND det.skey_cab =     
                                                'SKEY_LUGAR_ATENCION'     
                        FOR xml path ('')), 1, 2, ''))                 AS     
            tx_descripcion_lugar_atencion,    

tx_servicios_ofrece,
(SELECT Stuff((SELECT '; '+ --cast(det.val_valor as varchar(10)) + '-'+ 
							det.tx_descripcion     
                        FROM   dbo.Split(a.txt_lugar_servicio_distrito, ',') split     
                                INNER JOIN tbl_parameter_det det     
                                        ON split.id = det.val_valor     
                                            AND det.skey_cab =     
                                                'SKEY_SERVICIO_OFRECE'     
                        FOR xml path ('')), 1, 2, ''))                 AS     
            tx_descripcion_servicios_ofrece,    

tx_descripcion_extra_servicio,
tx_foto_presentacion,
dt_fe_ini_vig,
dt_fe_fin_vig,
dt_fe_crea,
id_estado_reg,
fl_portada,
filenametop,
id_categoria,
id_tipo_anuncio,
id_tarifa_anuncio,
id_pago_anuncio,
dbl_pago_total_tarifa_calculado,
dbl_pago_total_depositado,
fl_cerrado,
cod_anuncio_encryptado,
id_usuario,
dbl_costo_x_viaje,
codigo
 from tbl_anuncio a where a.id=@id and a.id_estado_reg = 0
end