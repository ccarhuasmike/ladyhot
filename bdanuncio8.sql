USE [DB_A3F06D_anuncio]
GO
/****** Object:  Table [dbo].[tbl_anuncio]    Script Date: 01/03/2019 06:21:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_anuncio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[txt_nombre_ficha] [varchar](60) NULL DEFAULT (NULL),
	[txt_telefono_1] [varchar](50) NULL DEFAULT (NULL),
	[txt_telefono_2] [varchar](50) NULL DEFAULT (NULL),
	[txt_email] [varchar](45) NULL DEFAULT (NULL),
	[txt_web] [varchar](500) NULL DEFAULT (NULL),
	[int_edad] [int] NULL DEFAULT (NULL),
	[int_pais_origen] [int] NULL DEFAULT (NULL),
	[int_estudios] [int] NULL DEFAULT (NULL),
	[txt_presentacion] [text] NULL,
	[int_color_cabello] [int] NULL DEFAULT (NULL),
	[int_color_ojos] [int] NULL DEFAULT (NULL),
	[int_estatura] [int] NULL DEFAULT (NULL),
	[int_peso] [int] NULL DEFAULT (NULL),
	[txt_medidas_busto_cintura_cadera] [varchar](45) NULL DEFAULT (NULL),
	[txt_descripcion_extra_apariencia] [varchar](200) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_30min] [decimal](9, 2) NULL,
	[dbl_costo_x_tiempo_45min] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_1hora] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_1hora_media] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_2hora] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_3hora] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_salidas] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_costo_x_tiempo_toda_noche] [decimal](9, 2) NULL DEFAULT (NULL),
	[txt_forma_pago] [varchar](400) NULL DEFAULT (NULL),
	[txt_descripcion_extra_tarifa] [varchar](255) NULL DEFAULT (NULL),
	[txt_lugar_servicio_distrito] [varchar](255) NULL DEFAULT (NULL),
	[fl_atencion_24horas] [int] NULL DEFAULT (NULL),
	[tx_descripcion_extra_horario] [varchar](200) NULL DEFAULT (NULL),
	[tx_lugar_atencion] [varchar](255) NULL DEFAULT (NULL),
	[tx_servicios_ofrece] [varchar](400) NULL DEFAULT (NULL),
	[tx_descripcion_extra_servicio] [varchar](255) NULL DEFAULT (NULL),
	[tx_foto_presentacion] [varchar](200) NULL DEFAULT (NULL),
	[dt_fe_ini_vig] [datetime] NULL DEFAULT (NULL),
	[dt_fe_fin_vig] [datetime] NULL DEFAULT (NULL),
	[dt_fe_crea] [datetime] NULL DEFAULT (NULL),
	[id_estado_reg] [int] NULL DEFAULT (NULL),
	[fl_portada] [int] NULL DEFAULT (NULL),
	[filenametop] [varchar](500) NULL,
	[id_categoria] [int] NULL DEFAULT (NULL),
	[id_tipo_anuncio] [int] NULL DEFAULT (NULL),
	[id_tarifa_anuncio] [int] NULL DEFAULT (NULL),
	[id_pago_anuncio] [int] NULL DEFAULT (NULL),
	[dbl_pago_total_tarifa_calculado] [decimal](9, 2) NULL DEFAULT (NULL),
	[dbl_pago_total_depositado] [decimal](9, 2) NULL DEFAULT (NULL),
	[fl_cerrado] [int] NULL DEFAULT (NULL),
	[cod_anuncio_encryptado] [varchar](500) NULL DEFAULT (NULL),
	[id_usuario] [int] NULL,
	[dbl_costo_x_viaje] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_galeria_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_galeria_anuncio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tx_filename] [varchar](100) NULL DEFAULT (NULL),
	[tx_ruta_file] [varchar](500) NULL DEFAULT (NULL),
	[tx_ruta_file_cort] [varchar](500) NULL DEFAULT (NULL),
	[size_file] [int] NULL DEFAULT (NULL),
	[id_tipo_archivo] [int] NULL DEFAULT (NULL),
	[dt_fe_crea] [datetime] NULL DEFAULT (NULL),
	[id_anuncio] [int] NULL,
	[txt_ruta_virtuales] [varchar](1000) NULL,
	[txt_ruta_virtuales_cortada] [varchar](1000) NULL,
	[Base64ContentFicha] [varchar](max) NULL,
	[Base64ContentFichaCort] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_parameter_cab]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_parameter_cab](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skey_cab] [varchar](45) NOT NULL,
	[tx_descripcion] [varchar](45) NULL DEFAULT (NULL),
	[id_estado_reg] [int] NULL DEFAULT (NULL),
	[dt_fe_crea] [datetime] NULL DEFAULT (NULL),
	[txt_comentario] [varchar](255) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[skey_cab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_parameter_det]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_parameter_det](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skey_det] [varchar](45) NOT NULL,
	[val_valor] [int] NULL DEFAULT (NULL),
	[tx_valor] [varchar](45) NOT NULL,
	[tx_descripcion] [varchar](1000) NULL DEFAULT (NULL),
	[tx_comentario] [varchar](500) NULL DEFAULT (NULL),
	[id_estado_reg] [int] NULL DEFAULT (NULL),
	[dt_fe_crea] [datetime] NULL DEFAULT (NULL),
	[skey_cab] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_tarifario_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tarifario_anuncio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mt_monto] [decimal](9, 2) NULL,
	[nid_categoria] [int] NULL,
	[nid_tarifa_anuncio] [int] NULL,
	[dt_fe_crea] [datetime] NULL,
	[id_estado_reg] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tx_pass] [varchar](500) NULL DEFAULT (NULL),
	[tx_email] [varchar](45) NULL DEFAULT (NULL),
	[dt_fe_crea] [datetime] NULL DEFAULT (NULL),
	[id_estado_reg] [int] NULL DEFAULT (NULL),
	[tx_token] [varchar](255) NULL DEFAULT (NULL),
	[tx_nombre] [varchar](45) NULL DEFAULT (NULL),
	[tx_apellido] [varchar](45) NULL DEFAULT (NULL),
	[tx_celular] [varchar](45) NULL DEFAULT (NULL),
	[tx_telefono] [varchar](45) NULL DEFAULT (NULL),
	[id_tipo_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split]
(
    @String NVARCHAR(4000),
    @Delimiter NCHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    WITH Split(stpos,endpos)
    AS(
        SELECT 0 AS stpos, CHARINDEX(@Delimiter,@String) AS endpos
        UNION ALL
        SELECT endpos+1, CHARINDEX(@Delimiter,@String,endpos+1)
            FROM Split
            WHERE endpos > 0
    )
    SELECT 'Id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
        'Data' = SUBSTRING(@String,stpos,COALESCE(NULLIF(endpos,0),LEN(@String)+1)-stpos)
    FROM Split
)




GO
ALTER TABLE [dbo].[tbl_tarifario_anuncio] ADD  DEFAULT (NULL) FOR [mt_monto]
GO
ALTER TABLE [dbo].[tbl_tarifario_anuncio] ADD  DEFAULT (NULL) FOR [nid_categoria]
GO
ALTER TABLE [dbo].[tbl_tarifario_anuncio] ADD  DEFAULT (NULL) FOR [nid_tarifa_anuncio]
GO
ALTER TABLE [dbo].[tbl_tarifario_anuncio] ADD  DEFAULT (NULL) FOR [dt_fe_crea]
GO
ALTER TABLE [dbo].[tbl_tarifario_anuncio] ADD  DEFAULT (NULL) FOR [id_estado_reg]
GO
ALTER TABLE [dbo].[tbl_anuncio]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id])
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio]  WITH CHECK ADD FOREIGN KEY([id_anuncio])
REFERENCES [dbo].[tbl_anuncio] ([id])
GO
ALTER TABLE [dbo].[tbl_parameter_det]  WITH CHECK ADD FOREIGN KEY([skey_cab])
REFERENCES [dbo].[tbl_parameter_cab] ([skey_cab])
GO
/****** Object:  StoredProcedure [dbo].[sp_del_galeria_x_id]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_del_galeria_x_id]
@id int
as
begin
delete from tbl_galeria_anuncio where id = @id
end



GO
/****** Object:  StoredProcedure [dbo].[sp_ins_anuncio_primerpaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ins_anuncio_primerpaso](
@txt_nombre_ficha varchar(60),
@txt_telefono_1 varchar(50),
@txt_telefono_2 varchar(50),
@txt_email varchar(45),
@txt_web varchar(500),
/*@int_edad int,
@int_pais_origen int,
@int_estudios int,
@txt_presentacion text,*/
@id_usuario int,
@id int out
)
as
begin
	insert into tbl_anuncio (txt_nombre_ficha,txt_telefono_1,txt_telefono_2,txt_email,txt_web,
	--int_edad,int_pais_origen,int_estudios,txt_presentacion,
	cod_anuncio_encryptado,id_usuario,id_estado_reg)
	values(@txt_nombre_ficha,@txt_telefono_1,@txt_telefono_2,@txt_email,@txt_web,
		--,@int_edad,@int_pais_origen,@int_estudios,@txt_presentacion,
		NEWID(),@id_usuario,0)
	set @id =@@IDENTITY
end





GO
/****** Object:  StoredProcedure [dbo].[sp_ins_usuario]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ins_usuario](
@tx_email varchar(45),
@tx_pass varchar(500),
@tx_telefono varchar(45),
@id int out
)
as
begin
 insert into tbl_usuario (tx_email,tx_pass,tx_telefono,id_estado_reg,dt_fe_crea,tx_token)
 values (@tx_email,@tx_pass,@tx_telefono,0,getdate(),NEWID())
 set @id = @@IDENTITY
end





GO
/****** Object:  StoredProcedure [dbo].[sp_listar_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listar_anuncio]
@vi_Pagina Int,  
@vi_RegistrosporPagina Int,  
@vi_RecordCount INT OUTPUT  
 
AS  
 
BEGIN  
--SET NOCOUNT ON Evita que se devuelva el mensaje que muestra el recuento del número de filas afectadas por una 
--instrucción  
SET NOCOUNT ON;  
 
SELECT ROW_NUMBER()Over(Order by id Asc) As RowNum,  
id,
[txt_nombre_ficha] as txt_nombre_ficha,
txt_telefono_1 ,
txt_telefono_2,
txt_email,
cod_anuncio_encryptado,
id_estado_reg
--id ,
--serie ,
--numerodoc ,
--nombre ,
--descripcion ,
--tipodocumento ,
--precio_compra ,
--CONVERT(varchar(10),fechaproceso,103) as fechaproceso,
--CONVERT(varchar(10),fecharegistro,103) as fecharegistro	
into #temporales  
FROM tbl_anuncio
--where 
--	(serie = @serie or '' = @serie ) and 
--	(numerodoc = @numerodoc or '' = @numerodoc ) and 
-- CONVERT(varchar(10),fechaproceso,112) between @fechaproceso_ini and @fechaproceso_fin
 
set @vi_RecordCount  = (select  COUNT(*)  
     FROM #temporales  )
       
SELECT * FROM #temporales       
WHERE RowNum BETWEEN (@vi_Pagina - 1) * @vi_RegistrosporPagina + 1 AND @vi_Pagina * @vi_RegistrosporPagina  
 
DROP TABLE #temporales   
END



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_sel_fichas_anuncio]          
as          
declare           
@tx_descripcion varchar(100)          
begin           
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')          
select           
(SELECT STUFF(          
    (SELECT top 4 ', ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales_cortada          
    FROM tbl_galeria_anuncio          
    WHERE tbl_galeria_anuncio.id_anuncio = a.id   and tbl_galeria_anuncio.id_tipo_archivo in (1,2,3)        
    FOR XML PATH ('')),          
1,2, '')) as txt_imagen_prensetancion,  
 (SELECT det.tx_descripcion     
  FROM    tbl_parameter_det det     
  where det.val_valor  =  a.int_pais_origen   
  AND det.skey_cab =   'SKEY_PAISES'   
) as tx_pais_origen,    
case when ISNULL(a.fl_atencion_24horas,0)=0 then ''  
  when a.fl_atencion_24horas=1 then 'Atiende las 24 horas'  
 end as tx_fl_atencion_24horas,  
a.*  from tbl_anuncio a         
where a.id_estado_reg = 0
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio_top_10]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_sel_fichas_anuncio_top_10]          
as          
declare           
@tx_descripcion varchar(100)          
begin           
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')          
select top 6          
(SELECT STUFF(          
    (SELECT top 4 ', ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales_cortada          
    FROM tbl_galeria_anuncio          
    WHERE tbl_galeria_anuncio.id_anuncio = a.id   and tbl_galeria_anuncio.id_tipo_archivo in (1,2,3)        
    FOR XML PATH ('')),          
1,2, '')) as txt_imagen_prensetancion,  
 (SELECT det.tx_descripcion     
  FROM    tbl_parameter_det det     
  where det.val_valor  =  a.int_pais_origen   
  AND det.skey_cab =   'SKEY_PAISES'   
) as tx_pais_origen,    
case when ISNULL(a.fl_atencion_24horas,0)=0 then ''  
  when a.fl_atencion_24horas=1 then 'Atiende las 24 horas'  
 end as tx_fl_atencion_24horas,  
a.*  from tbl_anuncio a         
--where a.id=68          
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio_x_tokens]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*
exec sp_sel_fichas_anuncio
exec sp_sel_fichas_anuncio_x_tokens '3EEC7E22-E06D-4D3D-BF3E-459A47DC5F0D'
*/

CREATE PROCEDURE [dbo].[sp_sel_fichas_anuncio_x_tokens]  
@cod_anuncio_encryptado varchar(500)       
AS     
    DECLARE @tx_descripcion VARCHAR(100)     
    
  BEGIN     
      SET @tx_descripcion = (SELECT tx_descripcion     
                             FROM   tbl_parameter_det     
                             WHERE  skey_cab = 'SKEY_RUTAS_FICHAS'     
                                    AND skey_det = 'SKEY_DOMINIO_FICHAS')     
    
      SELECT ( Isnull((SELECT Stuff((SELECT     
                              ', ' + @tx_descripcion     
                              + tbl_galeria_anuncio.txt_ruta_virtuales     
                                     FROM   tbl_galeria_anuncio     
                                     WHERE  tbl_galeria_anuncio.id_anuncio =     
                                            a.id     
                                     FOR xml path ('')), 1, 2, '')), '') ) AS     
             txt_imagen_prensetancion,     
             (SELECT Stuff((SELECT ', ' + cast(det.val_valor as varchar(10)) + '-'+ det.tx_descripcion     
                            FROM   dbo.Split(a.tx_servicios_ofrece, ',') split     
                                   INNER JOIN tbl_parameter_det det     
                                           ON split.id = det.val_valor     
                                              AND det.skey_cab =     
                                                  'SKEY_SERVICIO_OFRECE'     
                            FOR xml path ('')), 1, 2, ''))                 AS     
             tx_servicios_ofrece,    
             (SELECT Stuff((SELECT ' - ' +det.tx_descripcion     
                            FROM   dbo.Split(a.txt_forma_pago, ',') split     
                                   INNER JOIN tbl_parameter_det det     
                                           ON split.id = det.val_valor     
                                              AND det.skey_cab =     
                                                  'SKEY_FORMA_PAGO'     
                            FOR xml path ('')), 1, 2, ''))                 AS     
             txt_forma_pago,     
             (SELECT Stuff((SELECT ', ' + cast(det.val_valor as varchar(10)) + '-'+ det.tx_descripcion     
                            FROM   dbo.Split(a.txt_lugar_servicio_distrito, ',') split     
                                   INNER JOIN tbl_parameter_det det     
                                           ON split.id = det.val_valor     
                                              AND det.skey_cab =     
                                                  'SKEY_DISTRITO'     
                            FOR xml path ('')), 1, 2, ''))                 AS     
             txt_lugar_servicio_distrito,     
             (SELECT Stuff((SELECT ', ' + cast(det.val_valor as varchar(10)) + '-'+ det.tx_descripcion     
                            FROM   dbo.Split(a.tx_lugar_atencion, ',') split     
                                   INNER JOIN tbl_parameter_det det     
                                           ON split.id = det.val_valor     
                                              AND det.skey_cab =     
                                                  'SKEY_LUGAR_ATENCION'     
                            FOR xml path ('')), 1, 2, ''))                 AS     
             tx_lugar_atencion, 
             a.txt_nombre_ficha,
             a.txt_telefono_1,
             a.txt_telefono_2,
             a.txt_email,
             a.txt_web,
             a.int_edad,          
             a.int_pais_origen ,                
			(SELECT det.tx_descripcion     
				FROM    tbl_parameter_det det     
				where det.val_valor  =  a.int_pais_origen   AND det.skey_cab =   'SKEY_PAISES'   
			) as tx_pais_origen, 
             
             a.int_estudios,
             
             (SELECT det.tx_descripcion     
				FROM    tbl_parameter_det det     
				where det.val_valor  =  a.int_estudios   AND det.skey_cab =   'SKEY_ESTUDIOS'   
			) as tx_estudio, 
			
			--select * from tbl_parameter_cab
             
             a.txt_presentacion,
             a.int_color_cabello,
			(SELECT det.tx_descripcion     
			FROM    tbl_parameter_det det     
			where det.val_valor  =  a.int_color_cabello   AND det.skey_cab =   'SKEY_COLOR_CABELLO'   
			) as tx_color_cabello, 
             a.int_color_ojos,
			(SELECT det.tx_descripcion     
			FROM    tbl_parameter_det det     
			where det.val_valor  =  a.int_color_ojos   AND det.skey_cab =   'SKEY_COLOR_OJOS'   
			) as tx_color_ojos, 
             a.int_estatura,             
             a.int_peso,             
             a.txt_medidas_busto_cintura_cadera,
             a.txt_descripcion_extra_apariencia,
             a.dbl_costo_x_tiempo_30min,
             a.dbl_costo_x_tiempo_45min,
             a.dbl_costo_x_tiempo_1hora,
             a.dbl_costo_x_tiempo_1hora_media,
             a.dbl_costo_x_tiempo_2hora,
             a.dbl_costo_x_tiempo_3hora,
             a.dbl_costo_x_tiempo_salidas,
             a.dbl_costo_x_tiempo_45min,
             a.dbl_costo_x_tiempo_toda_noche, 
             a.txt_descripcion_extra_tarifa,
             a.fl_atencion_24horas,
             a.tx_descripcion_extra_horario,             
             a.tx_descripcion_extra_servicio             
      FROM   tbl_anuncio a     
      WHERE   a.cod_anuncio_encryptado=@cod_anuncio_encryptado      
END 



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_galeria_x_id]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_sel_galeria_x_id]  
@id int  
as  
declare 
	@tx_descripcion_fisicas varchar(100)      
begin  
	set @tx_descripcion_fisicas = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_RUTASFISICAS_FICHAS')       
	select 
	id,
	tx_filename,
	@tx_descripcion_fisicas + tx_ruta_file as tx_ruta_file,
	@tx_descripcion_fisicas + tx_ruta_file_cort as tx_ruta_file_cort,
	size_file,
	id_tipo_archivo,
	dt_fe_crea,
	id_anuncio,
	txt_ruta_virtuales,
	Base64ContentFicha,
	Base64ContentFichaCort

	 from tbl_galeria_anuncio where id = @id  
end  



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_galeria_x_id_anuncion]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

        
CREATE procedure [dbo].[sp_sel_galeria_x_id_anuncion]        
@id_anuncio int        
as        
declare           
@tx_descripcion varchar(100),          
@tx_descripcion_virtuales varchar(100)          
begin        
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')          
 --set @tx_descripcion_virtuales = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_RUTASVIRTUALES_FICHAS')           
 select         
 galeria.id,        
 galeria.tx_filename,        
 galeria.tx_ruta_file,        
 galeria.tx_ruta_file_cort,        
 galeria.size_file,        
 galeria.id_tipo_archivo,        
 galeria.dt_fe_crea,        
 --@tx_descripcion + @tx_descripcion_virtuales + galeria.txt_ruta_virtuales as txt_ruta_virtuales,        
 @tx_descripcion  + galeria.txt_ruta_virtuales as txt_ruta_virtuales,        
 @tx_descripcion  + galeria.txt_ruta_virtuales_cortada as txt_ruta_virtuales_cortada,
 galeria.id_anuncio ,   
 galeria.Base64ContentFicha,
 galeria.Base64ContentFichaCort
 from tbl_galeria_anuncio galeria   
 where galeria.id_anuncio = @id_anuncio order by id asc  --- and id_tipo_archivo in (1,2,3)  
   
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_parameter_skey]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_sel_parameter_skey]
@skey_cab varchar(45)
as
begin
	select det.val_valor,det.tx_descripcion from tbl_parameter_cab cab 
		inner join tbl_parameter_det det  on det.skey_cab= cab.skey_cab
	where det.skey_cab =  @skey_cab and det.id_estado_reg = 0 
end




GO
/****** Object:  StoredProcedure [dbo].[sp_sel_parameter_skey_x_det_id]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_sel_parameter_skey_x_det_id]
@skey_cab varchar(45),
@skey_det varchar(45)
as
begin
	select det.val_valor,det.tx_descripcion from tbl_parameter_cab cab 
		inner join tbl_parameter_det det  on det.skey_cab= cab.skey_cab
	where det.skey_cab =  @skey_cab and det.id_estado_reg = 0 and det.skey_det =  @skey_det
end




GO
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_sel_tbl_anuncio]
as
begin
	select * from tbl_anuncio
end




GO
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_id]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_sel_tbl_anuncio_x_id](
@id int 
)
as
begin
select * from tbl_anuncio where id=@id
end




GO
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_tokens]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[sp_sel_tbl_anuncio_x_tokens](  
@cod_anuncio_encryptado varchar(500)   
)  
as  
declare 
  @tx_descripcion varchar(100)    
begin  
  set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')    
 select a.* ,  
 (SELECT STUFF(    
    (SELECT top 1 ', ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales    
    FROM tbl_galeria_anuncio    
    WHERE tbl_galeria_anuncio.id_anuncio = a.id    
    FOR XML PATH ('')),    
1,2, '')) as txt_imagen_prensetancion   from tbl_anuncio a where a.cod_anuncio_encryptado=@cod_anuncio_encryptado  
end  



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_usuario]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE procedure [dbo].[sp_sel_tbl_anuncio_x_usuario](    
@token_usuario varchar(255)     
)    
as    
DECLARE     
  @id_usuario int,  
  @tx_descripcion varchar(100)    
begin    
 set @id_usuario = (select id from tbl_usuario where tx_token =@token_usuario)    
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')    
   
 select a.* ,  
 (SELECT STUFF(    
    (SELECT top 1 ', ' + @tx_descripcion+tbl_galeria_anuncio.txt_ruta_virtuales_cortada    
    FROM tbl_galeria_anuncio    
    WHERE tbl_galeria_anuncio.id_anuncio = a.id    
    FOR XML PATH ('')),    
1,2, '')) as txt_imagen_prensetancion  
 from tbl_anuncio a where a.id_usuario = @id_usuario and a.id_estado_reg = 0    
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_usuario]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_sel_tbl_usuario]
as
begin
select * from tbl_usuario
end




GO
/****** Object:  StoredProcedure [dbo].[sp_sel_usuario_login]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sel_usuario_login](
@tx_email varchar(45),
@tx_pass varchar(500)

)
as
begin
	select * from tbl_usuario where tx_email = @tx_email and tx_pass=@tx_pass
end





GO
/****** Object:  StoredProcedure [dbo].[sp_sel_usuario_x_id]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sel_usuario_x_id](
@id int
)
as
begin
	select * from tbl_usuario where id=@id 
end





GO
/****** Object:  StoredProcedure [dbo].[sp_sel_videos_x_id_anuncion]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
create procedure [dbo].[sp_sel_videos_x_id_anuncion]      
@id_anuncio int      
as      
declare         
@tx_descripcion varchar(100),        
@tx_descripcion_virtuales varchar(100)        
begin      
 set @tx_descripcion = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_DOMINIO_FICHAS')        
 --set @tx_descripcion_virtuales = (select tx_descripcion from tbl_parameter_det where skey_cab = 'SKEY_RUTAS_FICHAS' and skey_det ='SKEY_RUTASVIRTUALES_FICHAS')         
 select       
 galeria.id,      
 galeria.tx_filename,      
 galeria.tx_ruta_file,      
 galeria.tx_ruta_file_cort,      
 galeria.size_file,      
 galeria.id_tipo_archivo,      
 galeria.dt_fe_crea,      
 @tx_descripcion  + galeria.txt_ruta_virtuales as txt_ruta_virtuales,      
 galeria.id_anuncio      
 from tbl_galeria_anuncio galeria 
 where galeria.id_anuncio = @id_anuncio and id_tipo_archivo in (4)
 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_up_anuncio_primerpaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE procedure [dbo].[sp_up_anuncio_primerpaso](  
@txt_nombre_ficha varchar(60),  
@txt_telefono_1 varchar(50),  
@txt_telefono_2 varchar(50),  
@txt_email varchar(45),  
@txt_web varchar(500),  
@id int   
)  
as  
begin  

update tbl_anuncio set
	txt_nombre_ficha = @txt_nombre_ficha,
	txt_telefono_1=@txt_telefono_1,
	txt_telefono_2 =@txt_telefono_2,
	txt_email=@txt_email,
	txt_web=@txt_web	
where id =@id
end  
  



GO
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_cuartopaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_upd_anuncio_cuartopaso](
@dbl_costo_x_tiempo_30min decimal(9,2),
@dbl_costo_x_tiempo_45min decimal(9,2),
@dbl_costo_x_tiempo_1hora decimal(9,2),
@dbl_costo_x_tiempo_1hora_media decimal(9,2),
@dbl_costo_x_tiempo_2hora decimal(9,2),
@dbl_costo_x_tiempo_3hora decimal(9,2),
@dbl_costo_x_tiempo_salidas decimal(9,2),
@dbl_costo_x_tiempo_toda_noche decimal(9,2),
@dbl_costo_x_viaje decimal(9,2),
@txt_forma_pago	varchar(400),
@txt_descripcion_extra_tarifa	varchar(255),
/*@txt_lugar_servicio_distrito	varchar(255),
@fl_atencion_24horas	int,
@tx_descripcion_extra_horario	varchar(200),
@tx_lugar_atencion	varchar(255),
@tx_servicios_ofrece	varchar(400),
@tx_descripcion_extra_servicio	varchar(255),*/
@id int
)
as
begin
	
	update tbl_anuncio set 
		dbl_costo_x_tiempo_30min =@dbl_costo_x_tiempo_30min ,
		dbl_costo_x_tiempo_45min =@dbl_costo_x_tiempo_45min ,
		dbl_costo_x_tiempo_1hora =@dbl_costo_x_tiempo_1hora ,
		dbl_costo_x_tiempo_1hora_media =@dbl_costo_x_tiempo_1hora_media ,
		dbl_costo_x_tiempo_2hora =@dbl_costo_x_tiempo_2hora ,
		dbl_costo_x_tiempo_3hora =@dbl_costo_x_tiempo_3hora ,
		dbl_costo_x_tiempo_salidas =@dbl_costo_x_tiempo_salidas ,		
		dbl_costo_x_tiempo_toda_noche =@dbl_costo_x_tiempo_toda_noche ,
		dbl_costo_x_viaje   =@dbl_costo_x_viaje,
		txt_forma_pago   =@txt_forma_pago,
		txt_descripcion_extra_tarifa   =@txt_descripcion_extra_tarifa--,
		/*txt_lugar_servicio_distrito   =@txt_lugar_servicio_distrito,
		fl_atencion_24horas   =@fl_atencion_24horas,
		tx_descripcion_extra_horario   =@tx_descripcion_extra_horario,
		tx_lugar_atencion   =@tx_lugar_atencion,
		tx_servicios_ofrece   =@tx_servicios_ofrece,
		tx_descripcion_extra_servicio   =@tx_descripcion_extra_servicio*/
	where id= @id
end




GO
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_quintopaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_upd_anuncio_quintopaso](
@txt_lugar_servicio_distrito	varchar(255),
@fl_atencion_24horas	int,
@tx_descripcion_extra_horario	varchar(200),
@tx_lugar_atencion	varchar(255),
@tx_servicios_ofrece	varchar(400),
@tx_descripcion_extra_servicio	varchar(255),
@id int
)
as
begin	
	update tbl_anuncio set 		
		txt_lugar_servicio_distrito   =@txt_lugar_servicio_distrito,
		fl_atencion_24horas   =@fl_atencion_24horas,
		tx_descripcion_extra_horario   =@tx_descripcion_extra_horario,
		tx_lugar_atencion   =@tx_lugar_atencion,
		tx_servicios_ofrece   =@tx_servicios_ofrece,
		tx_descripcion_extra_servicio   =@tx_descripcion_extra_servicio
	where id= @id
end




GO
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_segundopaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_upd_anuncio_segundopaso](
@int_edad int,
@int_pais_origen int,
@int_estudios int,
@txt_presentacion text,
@id int
)
as
begin
	update tbl_anuncio set 
		int_edad =@int_edad ,
		int_pais_origen =@int_pais_origen ,
		int_estudios =@int_estudios ,
		txt_presentacion =@txt_presentacion		
	where id= @id
end



GO
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_tercerpaso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_upd_anuncio_tercerpaso](
@int_color_cabello int,
@int_color_ojos int,
@int_estatura int,
@int_peso int,
@txt_medidas_busto_cintura_cadera varchar(45),
@txt_descripcion_extra_apariencia varchar(200),
@id int
)
as
begin
	update tbl_anuncio set 
		int_color_cabello =@int_color_cabello ,
		int_color_ojos =@int_color_ojos ,
		int_estatura =@int_estatura ,
		int_peso =@int_peso ,
		txt_medidas_busto_cintura_cadera =@txt_medidas_busto_cintura_cadera ,
		txt_descripcion_extra_apariencia =@txt_descripcion_extra_apariencia 
	where id= @id
end



GO
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_todos_paso]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_upd_anuncio_todos_paso](
@txt_nombre_ficha varchar(60),
@txt_telefono_1 varchar(50),
@txt_telefono_2 varchar(50),
@txt_email varchar(45),
@txt_web varchar(500),
@int_edad int,
@int_pais_origen int,
@int_estudios int,
@txt_presentacion text,

@int_color_cabello int,
@int_color_ojos int,
@int_estatura int,
@int_peso int,
@txt_medidas_busto_cintura_cadera varchar(45),
@txt_descripcion_extra_apariencia varchar(200),

@dbl_costo_x_tiempo_30min decimal(9,2),
@dbl_costo_x_tiempo_45min decimal(9,2),
@dbl_costo_x_tiempo_1hora decimal(9,2),
@dbl_costo_x_tiempo_1hora_media decimal(9,2),
@dbl_costo_x_tiempo_2hora decimal(9,2),
@dbl_costo_x_tiempo_3hora decimal(9,2),
@dbl_costo_x_tiempo_salidas decimal(9,2),
@dbl_costo_x_tiempo_toda_noche decimal(9,2),
@dbl_costo_x_viaje decimal(9,2),
@txt_forma_pago	varchar(400),
@txt_descripcion_extra_tarifa	varchar(255),
@txt_lugar_servicio_distrito	varchar(255),
@fl_atencion_24horas	int,
@tx_descripcion_extra_horario	varchar(200),
@tx_lugar_atencion	varchar(255),
@tx_servicios_ofrece	varchar(400),
@tx_descripcion_extra_servicio	varchar(255),


@id int 
)
as
begin

update tbl_anuncio
set txt_nombre_ficha =@txt_nombre_ficha ,
	txt_telefono_1= @txt_telefono_1,
	txt_telefono_2=@txt_telefono_2 ,
	txt_email= @txt_email,
	txt_web=@txt_web ,
	int_edad= @int_edad,
	int_pais_origen=@int_pais_origen ,
	int_estudios= @int_estudios,
	txt_presentacion= @txt_presentacion,

	int_color_cabello =@int_color_cabello ,
	int_color_ojos =@int_color_ojos ,
	int_estatura =@int_estatura ,
	int_peso =@int_peso ,
	txt_medidas_busto_cintura_cadera =@txt_medidas_busto_cintura_cadera ,
	txt_descripcion_extra_apariencia =@txt_descripcion_extra_apariencia, 

	dbl_costo_x_tiempo_30min =@dbl_costo_x_tiempo_30min ,
	dbl_costo_x_tiempo_45min =@dbl_costo_x_tiempo_45min ,
	dbl_costo_x_tiempo_1hora =@dbl_costo_x_tiempo_1hora ,
	dbl_costo_x_tiempo_1hora_media =@dbl_costo_x_tiempo_1hora_media ,
	dbl_costo_x_tiempo_2hora =@dbl_costo_x_tiempo_2hora ,
	dbl_costo_x_tiempo_3hora =@dbl_costo_x_tiempo_3hora ,
	dbl_costo_x_tiempo_salidas =@dbl_costo_x_tiempo_salidas ,		
	dbl_costo_x_tiempo_toda_noche =@dbl_costo_x_tiempo_toda_noche ,
	dbl_costo_x_viaje   =@dbl_costo_x_viaje,
	txt_forma_pago   =@txt_forma_pago,
	txt_descripcion_extra_tarifa   =@txt_descripcion_extra_tarifa,
	txt_lugar_servicio_distrito   =@txt_lugar_servicio_distrito,
	fl_atencion_24horas   =@fl_atencion_24horas,
	tx_descripcion_extra_horario   =@tx_descripcion_extra_horario,
	tx_lugar_atencion   =@tx_lugar_atencion,
	tx_servicios_ofrece   =@tx_servicios_ofrece,
	tx_descripcion_extra_servicio   =@tx_descripcion_extra_servicio


	where id = @id
end





GO
/****** Object:  StoredProcedure [dbo].[sp_upd_dar_baja_tbl_anuncio]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_upd_dar_baja_tbl_anuncio](
@cod_anuncio_encryptado varchar(500) 
)
as

begin
	update tbl_anuncio
	set id_estado_reg = 1
	where cod_anuncio_encryptado =@cod_anuncio_encryptado
end





GO
/****** Object:  StoredProcedure [dbo].[usp_ins_galeria]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[usp_ins_galeria]   
@xml text,     
@id_anuncio int,    
@Ind int out,    
@Mensaje varchar(200) out    
AS    
BEGIN    
    
--BEGIN TRANSACTION -- O solo BEGIN TRAN    
BEGIN TRY      
 DECLARE @XmlDocumentHandle int     
 -- Create an internal representation of the XML document.      
 EXEC sp_xml_preparedocument @XmlDocumentHandle OUTPUT, @xml      
 -- Execute a SELECT statement using OPENXML rowset provider.    
 INSERT INTO tbl_galeria_anuncio  
           (  
           id_anuncio,  
           tx_filename,  
           tx_ruta_file,  
           tx_ruta_file_cort,  
           size_file,  
           id_tipo_archivo,  
           dt_fe_crea,             
           txt_ruta_virtuales,
           txt_ruta_virtuales_cortada 
   )     
       
 SELECT   @id_anuncio, tx_filename,tx_ruta_file,tx_ruta_file_cort,size_file,id_tipo_archivo,getdate(),txt_ruta_virtuales ,txt_ruta_virtuales_cortada  
 FROM      OPENXML (@XmlDocumentHandle, '/ROOT/Detalle',2)      
   WITH (  
   tx_filename  varchar(100),      
      tx_ruta_file varchar(500),    
      tx_ruta_file_cort varchar(500),  
      size_file int,  
      id_tipo_archivo int,  
      txt_ruta_virtuales varchar(1000)  ,
      txt_ruta_virtuales_cortada varchar(1000)  
     )      
 EXEC sp_xml_removedocument @XmlDocumentHandle      
    
 set @Ind=1    
 set @Mensaje = 'Se registro satisfactoriamente la galeria'    
    
 /* Confirmamos la transaccion*/     
 --COMMIT TRANSACTION     
    
END TRY    
    
BEGIN CATCH    
 --ROLLBACK TRANSACTION    
 set @Ind=-1    
 set @Mensaje = 'Ocurro un problema al registra la galeria'    
END CATCH    
END 



GO
/****** Object:  StoredProcedure [dbo].[usp_ins_galeria_object]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[usp_ins_galeria_object]   

@id_anuncio int,    
@tx_filename varchar(100),
@Base64ContentFicha varchar(max),
@Base64ContentFichaCort varchar(max),
@size_file int,
@Ind int out,    
@Mensaje varchar(200) out    
AS    
BEGIN    
    
--BEGIN TRANSACTION -- O solo BEGIN TRAN    
BEGIN TRY      
 --DECLARE @XmlDocumentHandle int     
 -- Create an internal representation of the XML document.      
 --EXEC sp_xml_preparedocument @XmlDocumentHandle OUTPUT, @xml      
 -- Execute a SELECT statement using OPENXML rowset provider.    
 INSERT INTO tbl_galeria_anuncio  
           (  
           id_anuncio,  
           tx_filename,  
           Base64ContentFicha,  
           Base64ContentFichaCort,  
           size_file,            
           dt_fe_crea
   )     values (
			@id_anuncio,
			@tx_filename,
			@Base64ContentFicha,
			@Base64ContentFichaCort,
			@size_file,
			getdate()
   )
       
 --SELECT   @id_anuncio, tx_filename,tx_ruta_file,tx_ruta_file_cort,size_file,id_tipo_archivo,getdate(),txt_ruta_virtuales ,txt_ruta_virtuales_cortada  
 --FROM      OPENXML (@XmlDocumentHandle, '/ROOT/Detalle',2)      
 --  WITH (  
 --  tx_filename  varchar(100),      
 --     tx_ruta_file varchar(500),    
 --     tx_ruta_file_cort varchar(500),  
 --     size_file int,  
 --     id_tipo_archivo int,  
 --     txt_ruta_virtuales varchar(1000)  ,
 --     txt_ruta_virtuales_cortada varchar(1000)  
 --    )      
 -- EXEC sp_xml_removedocument @XmlDocumentHandle      
    
 set @Ind=@@IDENTITY
 set @Mensaje = 'Se registro satisfactoriamente la galeria'    
    
 /* Confirmamos la transaccion*/     
 --COMMIT TRANSACTION     
    
END TRY    
    
BEGIN CATCH    
 --ROLLBACK TRANSACTION    
 set @Ind=-1    
 set @Mensaje = ERROR_MESSAGE()  
END CATCH    
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ins_videos]    Script Date: 01/03/2019 06:21:30 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[usp_ins_videos]
@xml text,     
@id_anuncio int,    
@Ind int out,    
@Mensaje varchar(200) out    
AS    
BEGIN    
    
--BEGIN TRANSACTION -- O solo BEGIN TRAN    
BEGIN TRY      
 DECLARE @XmlDocumentHandle int     
 -- Create an internal representation of the XML document.      
 EXEC sp_xml_preparedocument @XmlDocumentHandle OUTPUT, @xml      
 -- Execute a SELECT statement using OPENXML rowset provider.    
 INSERT INTO tbl_galeria_anuncio  
           (  
           id_anuncio,  
           tx_filename,  
           tx_ruta_file,  
           tx_ruta_file_cort,  
           size_file,  
           id_tipo_archivo,  
           dt_fe_crea,             
           txt_ruta_virtuales  
   )     
       
 SELECT   @id_anuncio, tx_filename,tx_ruta_file,tx_ruta_file_cort,size_file,id_tipo_archivo,getdate(),txt_ruta_virtuales    
 FROM      OPENXML (@XmlDocumentHandle, '/ROOT/Detalle',2)      
   WITH (  
   tx_filename  varchar(100),      
      tx_ruta_file varchar(500),    
      tx_ruta_file_cort varchar(500),  
      size_file int,  
      id_tipo_archivo int,  
      txt_ruta_virtuales varchar(1000)  
     )      
 EXEC sp_xml_removedocument @XmlDocumentHandle      
    
 set @Ind=1    
 set @Mensaje = 'Se registro satisfactoriamente el video'    
    
 /* Confirmamos la transaccion*/     
 --COMMIT TRANSACTION     
    
END TRY    
    
BEGIN CATCH    
 --ROLLBACK TRANSACTION    
 set @Ind=-1    
 set @Mensaje = 'Ocurro un problema al registra la galeria'    
END CATCH    
END 



GO
