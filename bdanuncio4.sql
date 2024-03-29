USE [master]
GO
/****** Object:  Database [DB_A3F06D_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
CREATE DATABASE [DB_A3F06D_anuncio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A3F06D_anuncio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SA\MSSQL\DATA\DB_A3F06D_anuncio.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_A3F06D_anuncio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SA\MSSQL\DATA\DB_A3F06D_anuncio_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A3F06D_anuncio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_A3F06D_anuncio', N'ON'
GO
USE [DB_A3F06D_anuncio]
GO
/****** Object:  Table [dbo].[tbl_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  Table [dbo].[tbl_galeria_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_galeria_anuncio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tx_filename] [varchar](100) NULL,
	[tx_ruta_file] [varchar](500) NULL,
	[tx_ruta_file_cort] [varchar](500) NULL,
	[size_file] [int] NULL,
	[id_tipo_archivo] [int] NULL,
	[dt_fe_crea] [datetime] NULL,
	[id_anuncio] [int] NULL,
	[txt_ruta_virtuales] [varchar](1000) NULL,
	[txt_ruta_virtuales_cortada] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_parameter_cab]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  Table [dbo].[tbl_parameter_det]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  Table [dbo].[tbl_tarifario_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 12/02/2019 1:43:34 ******/
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
SET IDENTITY_INSERT [dbo].[tbl_anuncio] ON 

INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1162, N'2', N'2', N'2', N'2', N'2', 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1167, N'segundo mike ', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'E7B9D71D-8AD3-4279-A362-477993656B17', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1168, N'sdsd', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'520C47D0-C157-43C6-A9D4-B55146893454', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1169, N'ssee', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'85D4E563-4BA4-422F-A88F-74F6525AFCCA', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1170, N'334343', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6006242C-179A-4DE8-AFA4-D2D76D7388C4', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1171, N'ssee', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4CEE1416-5571-4CCA-A08A-2C261C81AC09', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1172, N'ssee', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'19DBB7DE-5A33-4C0E-A0C7-55DE6E3AD925', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1173, N'ssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'2B5A9E12-DFB8-4D84-97ED-9164A9739E8D', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (1174, N'seee', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9EF1986E-2909-41B5-82C6-ECF04BF93BCE', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2163, N'seff', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'B05EA537-0E1D-48B2-9939-D66665ADCA51', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2164, N'seff', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'3A3EFDAA-EB9B-4798-8009-65CBB170EE3E', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2165, N'segs', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6E33E73C-D8CB-4EC1-B9FC-C387DDAB6EAF', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2166, N'segundo', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'EE0C278E-027F-4C55-A87D-4045D5EEBD65', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2167, N'ssfs', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'41E2002F-0E99-4062-B680-5EDA410F5C67', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2168, N'sesss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'E21B7E16-BDB5-4990-8434-1E593036EBF0', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2169, N'ssssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1D93A869-A77D-44F3-A77C-AB48106EBF80', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2170, N'ssssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'A0325621-C944-40B0-9F91-884EB206A312', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2171, N'ssssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'3D23BD0F-1998-4AD7-B963-E556445D4E7D', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2172, N'sssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'EB69EBDF-D1FA-4A59-B246-B19568C690DA', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2173, N'segund', N'983150754', N'983150754', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7E82344F-228F-4368-89A7-3AD184AF5058', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2174, N'segund', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5D54879F-EFB4-4E84-B6DC-B8B1EC1A66D6', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2175, N'ssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4A7415E2-66DE-42AD-A5E6-0BAEEE12EFC9', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2176, N'sss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'C3509306-440C-49D1-ABFC-60C4C2B54B9B', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2177, N'sees', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'216F1AD8-6E32-4F9C-BD7E-B3FACE6A23BA', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2178, N'sssss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'CB299AAB-5273-403E-98F2-2E2776445E98', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2179, N'sss', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'44D5AE35-EAF7-4B63-A09F-2E967A6394F0', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2180, N'sessds', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AEEEC0B6-A1F8-4649-8E53-8F121C67421B', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2181, N'see', N'997322585', N'997322585', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'39E3498B-FBB3-4916-B0E5-5882F99954CA', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2182, N'segundo mike', N'983150754', N'983150754', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'C2837952-2FD5-4C20-9BC9-3399CA544BB8', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2183, N'segun mik', N'983150754', N'983150754', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'CE99B870-A0A4-4645-8A63-FBE77FBC6E77', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2184, N'seggfsd', N'997322585', N'997322585', N'ccc@gmail.com', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4AC9A8EB-0504-42F5-93F8-80EABFB22EC7', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2185, N'seggfsd', N'997322585', N'997322585', N'ccc@gmail.com', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'92545B85-DEA9-42BF-8941-071E0834DB38', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2186, N'segggg', N'997322585', N'997233662', N'cc@gmail.com', N'', 1, 1, 1, N'Explica un poco más sobre ti. Aquí puedes presentarte a los futuros clientes, descríbete un poco mejor, explica cómo eres, que te gusta, tus aficiones y habilidades. ¿Porqué deben llamarte? Cualquier otra cosa que creas es importante, esta es tu oportunidad!', 1, 1, 1, 14, N'12-12-12', N'

Si quieres explicar algun otro dato relevante sobre tu apariencia física aquí puedes describirte mejor.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'F3688B41-5FEA-4CB3-B935-CF11EFD7B344', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2187, N'segund mike', N'997322585', N'982150457', N'sss@gmail.com', N'', 1, 2, 1, N'Explica un poco más sobre ti. Aquí puedes presentarte a los futuros clientes, descríbete un poco mejor, explica cómo eres, que te gusta, tus aficiones y habilidades. ¿Porqué deben llamarte? Cualquier otra cosa que creas es importante, esta es tu oportunidad!', 1, 1, 2, 14, N'23-23-23', N'Si quieres explicar algun otro dato relevante sobre tu apariencia física aquí puedes describirte mejor.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BF51D121-E2A1-4822-A701-F45008B6C607', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2188, N'segundomik', N'983150754', N'983150754', N'cc@gmail.com', N'', 1, 1, 1, N'Explica un poco más sobre ti. Aquí puedes presentarte a los futuros clientes, descríbete un poco mejor, explica cómo eres, que te gusta, tus aficiones y habilidades. ¿Porqué deben llamarte? Cualquier otra cosa que creas es importante, esta es tu oportunidad!', 1, 1, 1, 18, N'23-23-23', N'

Si quieres explicar algun otro dato relevante sobre tu apariencia física aquí puedes describirte mejor.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7793E8BF-F236-4FD0-A32A-04C978C319CD', 11, NULL)
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2189, N'sdsd', N'997322585', N'983150754', N'a@ssd.com', N'', 2, 2, 2, N'dasdsdsdsdsdssssssssssssssssssssssssssssssssssssss', 1, 1, 1, 15, N'23-23-23', N'sdsd', CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), N'1,3', N'
Si necesitas aclarar algun otro aspecto sobre tus tarifas escríbelo aquí.', N'1,2,3,4,5,6,7,8', 0, N'¿Quieres hacer una aclaración sobre tus días y horarios?', N'1,2,3,4', N'1,7,8,10,11,13,14,17', N'¿Quieres hacer una aclaración o explicarte mejor?', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'B95AA8CE-2DD0-4A72-BE5A-F73748055F34', 11, CAST(0.00 AS Decimal(9, 2)))
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2190, N'Omar', N'978965412', N'985236544', N'ccc@gmail.com', N'', 8, 1, 1, N'Explica un poco más sobre ti. Aquí puedes presentarte a los futuros clientes, descríbete un poco mejor, explica cómo eres, que te gusta, tus aficiones y habilidades. ¿Porqué deben llamarte? Cualquier otra cosa que creas es importante, esta es tu oportunidad!', 1, 4, 1, 57, N'90-90-90', N'Si quieres explicar algun otro dato relevante sobre tu apariencia física aquí puedes describirte mejor.', CAST(20.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), CAST(50.00 AS Decimal(9, 2)), CAST(100.00 AS Decimal(9, 2)), CAST(200.00 AS Decimal(9, 2)), CAST(300.00 AS Decimal(9, 2)), CAST(500.00 AS Decimal(9, 2)), CAST(1000.00 AS Decimal(9, 2)), N'1,3', N'ok', N'9,28', 0, N'', N'2', N'1,18', N'', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'A98116A8-E171-4FF4-A335-A5D8013B2402', 11, CAST(5000.00 AS Decimal(9, 2)))
INSERT [dbo].[tbl_anuncio] ([id], [txt_nombre_ficha], [txt_telefono_1], [txt_telefono_2], [txt_email], [txt_web], [int_edad], [int_pais_origen], [int_estudios], [txt_presentacion], [int_color_cabello], [int_color_ojos], [int_estatura], [int_peso], [txt_medidas_busto_cintura_cadera], [txt_descripcion_extra_apariencia], [dbl_costo_x_tiempo_30min], [dbl_costo_x_tiempo_45min], [dbl_costo_x_tiempo_1hora], [dbl_costo_x_tiempo_1hora_media], [dbl_costo_x_tiempo_2hora], [dbl_costo_x_tiempo_3hora], [dbl_costo_x_tiempo_salidas], [dbl_costo_x_tiempo_toda_noche], [txt_forma_pago], [txt_descripcion_extra_tarifa], [txt_lugar_servicio_distrito], [fl_atencion_24horas], [tx_descripcion_extra_horario], [tx_lugar_atencion], [tx_servicios_ofrece], [tx_descripcion_extra_servicio], [tx_foto_presentacion], [dt_fe_ini_vig], [dt_fe_fin_vig], [dt_fe_crea], [id_estado_reg], [fl_portada], [filenametop], [id_categoria], [id_tipo_anuncio], [id_tarifa_anuncio], [id_pago_anuncio], [dbl_pago_total_tarifa_calculado], [dbl_pago_total_depositado], [fl_cerrado], [cod_anuncio_encryptado], [id_usuario], [dbl_costo_x_viaje]) VALUES (2191, N'dante', N'983150854', N'983150854', N'ccc@gmail.com', N'', 2, 2, 1, N'Explica un poco más sobre ti. Aquí puedes presentarte a los futuros clientes, descríbete un poco mejor, explica cómo eres, que te gusta, tus aficiones y habilidades. ¿Porqué deben llamarte? Cualquier otra cosa que creas es importante, esta es tu oportunidad!', 2, 2, 12, 12, N'11-2-2', N'Si quieres explicar algun otro dato relevante sobre tu apariencia física aquí puedes describirte mejor.', CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), N'1,2,3', N'Si necesitas aclarar algun otro aspecto sobre tus tarifas escríbelo aquí.', N'1,15,17,19,20,21,22,23,27,28,29,30', 0, N'¿Quieres hacer una aclaración sobre tus días y horarios?', N'1', N'1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,28', N'¿Quieres hacer una aclaración o explicarte mejor?', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'51771765-B756-43E7-B7B9-959A987B331E', 11, CAST(0.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[tbl_anuncio] OFF
SET IDENTITY_INSERT [dbo].[tbl_parameter_cab] ON 

INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (19, N'SKEY_CATEGORIA_ANUNCIO', N'Configuracion de categoria del anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara los niveles de anuncio para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (8, N'SKEY_COLOR_CABELLO', N'Configuracion de Color de cabello', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'e configurara el color de cabello para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (11, N'SKEY_COLOR_OJOS', N'Configuracion de Color de ojos', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara el color de ojos para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (14, N'SKEY_DISTRITO', N'Configuracion de Distrito', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara de distrito para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (1, N'SKEY_EDADES', N'Configuracion de Edades', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara las edades para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (27, N'SKEY_ESTADO_ANUNCIO', N'Se configurara el estado del anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara el estado del anuncio')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (20, N'SKEY_ESTADO_REG', N'Configuracion estado de registro', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Configuracion estado de registro')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (12, N'SKEY_ESTATURA', N'Configuracion de Estatura', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara estatura para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (3, N'SKEY_ESTUDIOS', N'Configuracion de Estudios', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara los estudios para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (15, N'SKEY_FORMA_PAGO', N'Configuracion de Forma de Pago', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara forma de pago para la carga en los checkboxes')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (16, N'SKEY_LUGAR_ATENCION', N'Configuracion de Lugar de Atención', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara lugar de atención para la carga en los checkboxes')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (32, N'SKEY_MAIL', N'Configuracion para enviar Mail', 0, CAST(N'2019-02-11 20:23:17.713' AS DateTime), N'Se configurara los parametros para el envio del email')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (2, N'SKEY_PAISES', N'Configuracion de Paises', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara los paises para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (13, N'SKEY_PESO', N'Configuracion de Peso', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara peso para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (31, N'SKEY_RUTAS_FICHAS', N'Configuracion las imanges por anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Configuracion las imanges que se cargara por cada anuncio')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (17, N'SKEY_SERVICIO_OFRECE', N'Configuracion de Servicio Ofrece', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara servicio ofrece para la carga en los checkboxes')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (21, N'SKEY_TARIFA_ANUNCIO', N'Configuracion de descripcio Tarifa Anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Configuracion de descripcio Tarifa Anuncio')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (18, N'SKEY_TIPO_ANUNCIO', N'Configuracion el tipo de anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara lo tipos de anuncio para la carga en los combos')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (26, N'SKEY_TIPO_ARCHIVO', N'Se configurara el tipo de archivo', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara el tipo de archivo')
INSERT [dbo].[tbl_parameter_cab] ([id], [skey_cab], [tx_descripcion], [id_estado_reg], [dt_fe_crea], [txt_comentario]) VALUES (28, N'SKEY_TIPO_CLIENTE', N'Se configurara el tipo de cliente', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Se configurara el tipo de cliente')
SET IDENTITY_INSERT [dbo].[tbl_parameter_cab] OFF
SET IDENTITY_INSERT [dbo].[tbl_parameter_det] ON 

INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (2, N'SKEY_EDADES_DET', 1, N'', N'18', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (3, N'SKEY_EDADES_DET', 2, N'', N'19', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (4, N'SKEY_EDADES_DET', 3, N'', N'20', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (5, N'SKEY_EDADES_DET', 4, N'', N'21', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (6, N'SKEY_EDADES_DET', 5, N'', N'22', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (7, N'SKEY_EDADES_DET', 6, N'', N'23', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (8, N'SKEY_EDADES_DET', 7, N'', N'24', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (9, N'SKEY_EDADES_DET', 8, N'', N'25', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (10, N'SKEY_EDADES_DET', 9, N'', N'26', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (11, N'SKEY_EDADES_DET', 10, N'', N'27', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (12, N'SKEY_EDADES_DET', 11, N'', N'28', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (13, N'SKEY_EDADES_DET', 12, N'', N'29', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (14, N'SKEY_EDADES_DET', 13, N'', N'30', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_EDADES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (15, N'SKEY_PAISES_DET', 1, N'', N'Peru', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (16, N'SKEY_PAISES_DET', 2, N'', N'Venezuela', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (17, N'SKEY_PAISES_DET', 3, N'', N'Brasil', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (18, N'SKEY_PAISES_DET', 4, N'', N'Argentina', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (19, N'SKEY_PAISES_DET', 5, N'', N'Bolivia', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (20, N'SKEY_PAISES_DET', 6, N'', N'Lima', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (21, N'SKEY_PAISES_DET', 7, N'', N'Ecuador', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (22, N'SKEY_PAISES_DET', 8, N'', N'Uruguay', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_PAISES')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (23, N'SKEY_ESTUDIOS_DET', 1, N'', N'Primarios', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTUDIOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (24, N'SKEY_ESTUDIOS_DET', 2, N'', N'Secundarios', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTUDIOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (25, N'SKEY_ESTUDIOS_DET', 3, N'', N'Universitarios', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTUDIOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (26, N'SKEY_COLOR_CABELLO', 1, N'', N'Castaño', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_CABELLO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (27, N'SKEY_COLOR_CABELLO', 2, N'', N'Moreno', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_CABELLO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (28, N'SKEY_COLOR_CABELLO', 3, N'', N'Pelirrojo', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_CABELLO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (29, N'SKEY_COLOR_CABELLO', 4, N'', N'Rubio', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_CABELLO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (30, N'SKEY_COLOR_OJOS', 1, N'', N'Azules', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_OJOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (31, N'SKEY_COLOR_OJOS', 2, N'', N'Marrones', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_OJOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (32, N'SKEY_COLOR_OJOS', 3, N'', N'Negros', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_OJOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (33, N'SKEY_COLOR_OJOS', 4, N'', N'Verdes', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_COLOR_OJOS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (34, N'SKEY_ESTATURA_DET', 1, N'', N'140', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (35, N'SKEY_ESTATURA_DET', 2, N'', N'141', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (36, N'SKEY_ESTATURA_DET', 3, N'', N'142', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (37, N'SKEY_ESTATURA_DET', 4, N'', N'143', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (38, N'SKEY_ESTATURA_DET', 5, N'', N'144', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (39, N'SKEY_ESTATURA_DET', 6, N'', N'145', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (40, N'SKEY_ESTATURA_DET', 7, N'', N'146', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (41, N'SKEY_ESTATURA_DET', 8, N'', N'147', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (42, N'SKEY_ESTATURA_DET', 9, N'', N'148', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (43, N'SKEY_ESTATURA_DET', 10, N'', N'149', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (44, N'SKEY_ESTATURA_DET', 11, N'', N'150', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (45, N'SKEY_ESTATURA_DET', 12, N'', N'151', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (46, N'SKEY_ESTATURA_DET', 13, N'', N'152', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (47, N'SKEY_ESTATURA_DET', 14, N'', N'153', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (48, N'SKEY_ESTATURA_DET', 15, N'', N'154', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (49, N'SKEY_ESTATURA_DET', 16, N'', N'155', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (50, N'SKEY_ESTATURA_DET', 17, N'', N'156', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (51, N'SKEY_ESTATURA_DET', 18, N'', N'157', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (52, N'SKEY_ESTATURA_DET', 19, N'', N'158', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (53, N'SKEY_ESTATURA_DET', 20, N'', N'159', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (54, N'SKEY_ESTATURA_DET', 21, N'', N'160', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (55, N'SKEY_ESTATURA_DET', 22, N'', N'161', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (56, N'SKEY_ESTATURA_DET', 23, N'', N'162', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (57, N'SKEY_ESTATURA_DET', 24, N'', N'163', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (58, N'SKEY_ESTATURA_DET', 25, N'', N'164', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (59, N'SKEY_ESTATURA_DET', 26, N'', N'165', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (60, N'SKEY_ESTATURA_DET', 27, N'', N'166', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (61, N'SKEY_ESTATURA_DET', 28, N'', N'167', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (62, N'SKEY_ESTATURA_DET', 30, N'', N'168', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (63, N'SKEY_ESTATURA_DET', 31, N'', N'169', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (64, N'SKEY_ESTATURA_DET', 32, N'', N'170', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (65, N'SKEY_ESTATURA_DET', 33, N'', N'171', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (66, N'SKEY_ESTATURA_DET', 34, N'', N'172', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (67, N'SKEY_ESTATURA_DET', 35, N'', N'173', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (68, N'SKEY_ESTATURA_DET', 36, N'', N'174', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (69, N'SKEY_ESTATURA_DET', 37, N'', N'175', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (70, N'SKEY_ESTATURA_DET', 38, N'', N'176', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (71, N'SKEY_ESTATURA_DET', 39, N'', N'177', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (72, N'SKEY_ESTATURA_DET', 40, N'', N'178', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (73, N'SKEY_ESTATURA_DET', 41, N'', N'179', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (74, N'SKEY_ESTATURA_DET', 42, N'', N'180', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (75, N'SKEY_ESTATURA_DET', 43, N'', N'181', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (76, N'SKEY_ESTATURA_DET', 44, N'', N'182', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (77, N'SKEY_ESTATURA_DET', 45, N'', N'183', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (78, N'SKEY_ESTATURA_DET', 46, N'', N'184', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (79, N'SKEY_ESTATURA_DET', 47, N'', N'185', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (80, N'SKEY_ESTATURA_DET', 48, N'', N'186', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (81, N'SKEY_ESTATURA_DET', 49, N'', N'187', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (82, N'SKEY_ESTATURA_DET', 50, N'', N'188', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (83, N'SKEY_ESTATURA_DET', 51, N'', N'189', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (84, N'SKEY_ESTATURA_DET', 52, N'', N'190', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (85, N'SKEY_ESTATURA_DET', 53, N'', N'191', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (86, N'SKEY_ESTATURA_DET', 54, N'', N'192', N'', 0, CAST(N'2030-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (87, N'SKEY_ESTATURA_DET', 55, N'', N'193', N'', 0, CAST(N'2031-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (88, N'SKEY_ESTATURA_DET', 56, N'', N'194', N'', 0, CAST(N'2032-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (89, N'SKEY_ESTATURA_DET', 57, N'', N'195', N'', 0, CAST(N'2033-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (90, N'SKEY_ESTATURA_DET', 58, N'', N'196', N'', 0, CAST(N'2034-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (91, N'SKEY_ESTATURA_DET', 59, N'', N'197', N'', 0, CAST(N'2035-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (92, N'SKEY_ESTATURA_DET', 60, N'', N'198', N'', 0, CAST(N'2036-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (93, N'SKEY_ESTATURA_DET', 61, N'', N'199', N'', 0, CAST(N'2037-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (94, N'SKEY_ESTATURA_DET', 62, N'', N'200', N'', 0, CAST(N'2038-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTATURA')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (95, N'SKEY_PESO_DET', 1, N'', N'45', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (96, N'SKEY_PESO_DET', 2, N'', N'46', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (97, N'SKEY_PESO_DET', 3, N'', N'47', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (98, N'SKEY_PESO_DET', 4, N'', N'48', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (99, N'SKEY_PESO_DET', 5, N'', N'49', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (100, N'SKEY_PESO_DET', 6, N'', N'50', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
GO
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (101, N'SKEY_PESO_DET', 7, N'', N'51', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (102, N'SKEY_PESO_DET', 8, N'', N'52', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (103, N'SKEY_PESO_DET', 9, N'', N'53', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (104, N'SKEY_PESO_DET', 10, N'', N'54', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (105, N'SKEY_PESO_DET', 11, N'', N'55', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (106, N'SKEY_PESO_DET', 12, N'', N'56', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (107, N'SKEY_PESO_DET', 13, N'', N'57', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (108, N'SKEY_PESO_DET', 14, N'', N'58', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (109, N'SKEY_PESO_DET', 15, N'', N'59', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (110, N'SKEY_PESO_DET', 16, N'', N'60', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (111, N'SKEY_PESO_DET', 17, N'', N'61', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (112, N'SKEY_PESO_DET', 18, N'', N'62', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (113, N'SKEY_PESO_DET', 19, N'', N'63', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (114, N'SKEY_PESO_DET', 20, N'', N'64', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (115, N'SKEY_PESO_DET', 21, N'', N'65', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (116, N'SKEY_PESO_DET', 22, N'', N'66', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (117, N'SKEY_PESO_DET', 23, N'', N'67', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (118, N'SKEY_PESO_DET', 24, N'', N'68', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (119, N'SKEY_PESO_DET', 25, N'', N'69', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (120, N'SKEY_PESO_DET', 26, N'', N'70', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (121, N'SKEY_PESO_DET', 27, N'', N'71', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (122, N'SKEY_PESO_DET', 28, N'', N'72', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (123, N'SKEY_PESO_DET', 30, N'', N'73', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (124, N'SKEY_PESO_DET', 31, N'', N'74', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (125, N'SKEY_PESO_DET', 32, N'', N'75', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (126, N'SKEY_PESO_DET', 33, N'', N'76', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (127, N'SKEY_PESO_DET', 34, N'', N'77', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (128, N'SKEY_PESO_DET', 35, N'', N'78', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (129, N'SKEY_PESO_DET', 36, N'', N'79', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (130, N'SKEY_PESO_DET', 37, N'', N'80', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (131, N'SKEY_PESO_DET', 38, N'', N'81', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (132, N'SKEY_PESO_DET', 39, N'', N'82', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (133, N'SKEY_PESO_DET', 40, N'', N'83', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (134, N'SKEY_PESO_DET', 41, N'', N'84', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (135, N'SKEY_PESO_DET', 42, N'', N'85', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (136, N'SKEY_PESO_DET', 43, N'', N'86', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (137, N'SKEY_PESO_DET', 44, N'', N'87', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (138, N'SKEY_PESO_DET', 45, N'', N'88', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (139, N'SKEY_PESO_DET', 46, N'', N'89', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (140, N'SKEY_PESO_DET', 47, N'', N'90', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (141, N'SKEY_PESO_DET', 48, N'', N'91', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (142, N'SKEY_PESO_DET', 49, N'', N'92', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (143, N'SKEY_PESO_DET', 50, N'', N'93', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (144, N'SKEY_PESO_DET', 51, N'', N'94', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (145, N'SKEY_PESO_DET', 52, N'', N'95', N'', 0, CAST(N'2028-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (146, N'SKEY_PESO_DET', 53, N'', N'96', N'', 0, CAST(N'2029-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (147, N'SKEY_PESO_DET', 54, N'', N'97', N'', 0, CAST(N'2030-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (148, N'SKEY_PESO_DET', 55, N'', N'98', N'', 0, CAST(N'2031-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (149, N'SKEY_PESO_DET', 56, N'', N'99', N'', 0, CAST(N'2032-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (150, N'SKEY_PESO_DET', 57, N'', N'100', N'', 0, CAST(N'2033-12-03 00:00:00.000' AS DateTime), N'SKEY_PESO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (182, N'SKEY_DISTRITO', 1, N'', N'Cercado de Lima', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (183, N'SKEY_DISTRITO', 2, N'', N'Ate', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (184, N'SKEY_DISTRITO', 3, N'', N'Barranca', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (185, N'SKEY_DISTRITO', 4, N'', N'Breña', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (186, N'SKEY_DISTRITO', 5, N'', N'Comas', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (187, N'SKEY_DISTRITO', 6, N'', N'Chorrillos', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (188, N'SKEY_DISTRITO', 7, N'', N'El Agustino', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (189, N'SKEY_DISTRITO', 8, N'', N'Jesús María', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (190, N'SKEY_DISTRITO', 9, N'', N'La Molina', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (191, N'SKEY_DISTRITO', 10, N'', N'La Victoria', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (192, N'SKEY_DISTRITO', 11, N'', N'Lince', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (193, N'SKEY_DISTRITO', 12, N'', N'Magdalena del Mar', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (194, N'SKEY_DISTRITO', 13, N'', N'Miraflores', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (195, N'SKEY_DISTRITO', 14, N'', N'Pueblo Libre', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (196, N'SKEY_DISTRITO', 15, N'', N'Puente Piedra', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (197, N'SKEY_DISTRITO', 16, N'', N'Rimac', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (198, N'SKEY_DISTRITO', 17, N'', N'San Isidro', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (199, N'SKEY_DISTRITO', 18, N'', N'Independencia', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (200, N'SKEY_DISTRITO', 19, N'', N'San Juan de Miraflores', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (201, N'SKEY_DISTRITO', 20, N'', N'San Luis', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (202, N'SKEY_DISTRITO', 21, N'', N'San Martin de Porres', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (203, N'SKEY_DISTRITO', 22, N'', N'San Miguel', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (204, N'SKEY_DISTRITO', 23, N'', N'Santiago de Surco', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (205, N'SKEY_DISTRITO', 24, N'', N'Surquillo', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (206, N'SKEY_DISTRITO', 25, N'', N'Villa María del Triunfo', N'', 0, CAST(N'2021-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (207, N'SKEY_DISTRITO', 26, N'', N'San Juan de Lurigancho', N'', 0, CAST(N'2022-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (208, N'SKEY_DISTRITO', 27, N'', N'Santa Rosa', N'', 0, CAST(N'2023-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (209, N'SKEY_DISTRITO', 28, N'', N'Los Olivos', N'', 0, CAST(N'2024-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (210, N'SKEY_DISTRITO', 29, N'', N'San Borja', N'', 0, CAST(N'2025-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (211, N'SKEY_DISTRITO', 30, N'', N'Villa El Savador', N'', 0, CAST(N'2026-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (212, N'SKEY_DISTRITO', 31, N'', N'Santa Anita', N'', 0, CAST(N'2027-12-03 00:00:00.000' AS DateTime), N'SKEY_DISTRITO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (213, N'SKEY_FORMA_PAGO', 1, N'', N'Efectivo', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_FORMA_PAGO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (214, N'SKEY_FORMA_PAGO', 2, N'', N'Tarjeta de crédito', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_FORMA_PAGO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (215, N'SKEY_FORMA_PAGO', 3, N'', N'Transferencia bancaria', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_FORMA_PAGO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (216, N'SKEY_LUGAR_ATENCION', 1, N'', N'Apartamento privado', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_LUGAR_ATENCION')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (217, N'SKEY_LUGAR_ATENCION', 2, N'', N'Domicilio cliente', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_LUGAR_ATENCION')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (218, N'SKEY_LUGAR_ATENCION', 3, N'', N'Salidas Hotel', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_LUGAR_ATENCION')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (219, N'SKEY_LUGAR_ATENCION', 4, N'', N'Viajes', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_LUGAR_ATENCION')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (220, N'SKEY_SERVICIO_OFRECE', 1, N'', N'69', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (221, N'SKEY_SERVICIO_OFRECE', 2, N'', N'Ama', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (222, N'SKEY_SERVICIO_OFRECE', 3, N'', N'Anteción a parejas', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (223, N'SKEY_SERVICIO_OFRECE', 4, N'', N'Besos', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (224, N'SKEY_SERVICIO_OFRECE', 5, N'', N'Bondage', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (225, N'SKEY_SERVICIO_OFRECE', 6, N'', N'Consultar', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (226, N'SKEY_SERVICIO_OFRECE', 7, N'', N'Cubana', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (227, N'SKEY_SERVICIO_OFRECE', 8, N'', N'Ducha Erotica', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (228, N'SKEY_SERVICIO_OFRECE', 9, N'', N'Dúplex', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (229, N'SKEY_SERVICIO_OFRECE', 10, N'', N'Fantasias sexuales', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (230, N'SKEY_SERVICIO_OFRECE', 11, N'', N'Fetichismo', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (231, N'SKEY_SERVICIO_OFRECE', 12, N'', N'Fetichismo de pies', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
GO
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (232, N'SKEY_SERVICIO_OFRECE', 13, N'', N'Fiestas', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (233, N'SKEY_SERVICIO_OFRECE', 14, N'', N'Frances', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (234, N'SKEY_SERVICIO_OFRECE', 15, N'', N'Fránces natural', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (235, N'SKEY_SERVICIO_OFRECE', 16, N'', N'Gargante Profunda', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (236, N'SKEY_SERVICIO_OFRECE', 17, N'', N'Griego', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (237, N'SKEY_SERVICIO_OFRECE', 18, N'', N'Juguetes', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (238, N'SKEY_SERVICIO_OFRECE', 19, N'', N'Lésbico', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (239, N'SKEY_SERVICIO_OFRECE', 20, N'', N'Masaje', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (240, N'SKEY_SERVICIO_OFRECE', 21, N'', N'Masajes Eroticos', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (241, N'SKEY_SERVICIO_OFRECE', 22, N'', N'Masajes Estimulantes', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (242, N'SKEY_SERVICIO_OFRECE', 23, N'', N'Masajes Relajantes', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (243, N'SKEY_SERVICIO_OFRECE', 24, N'', N'Masajes Terapeuticos', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (244, N'SKEY_SERVICIO_OFRECE', 25, N'', N'Orgias', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (245, N'SKEY_SERVICIO_OFRECE', 26, N'', N'Sado', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (246, N'SKEY_SERVICIO_OFRECE', 27, N'', N'Sado Light', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (247, N'SKEY_SERVICIO_OFRECE', 28, N'', N'Striptease', N'', 0, CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (248, N'SKEY_SERVICIO_OFRECE', 29, N'', N'Transformismo', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (249, N'SKEY_SERVICIO_OFRECE', 30, N'', N'Trato de Novia', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_SERVICIO_OFRECE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (250, N'SKEY_TIPO_ANUNCIO', 1, N'', N'Publicidad', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (251, N'SKEY_TIPO_ANUNCIO', 2, N'', N'Banner', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (252, N'SKEY_TIPO_ANUNCIO', 3, N'', N'Fichas', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (253, N'SKEY_CATEGORIA_ANUNCIO', 1, N'', N'Categoria 1', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_CATEGORIA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (254, N'SKEY_CATEGORIA_ANUNCIO', 2, N'', N'Categoria 2', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_CATEGORIA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (255, N'SKEY_CATEGORIA_ANUNCIO', 3, N'', N'Categoria 3', N'', 0, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'SKEY_CATEGORIA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (256, N'SKEY_CATEGORIA_ANUNCIO', 4, N'', N'Categoria 4', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_CATEGORIA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (257, N'SKEY_CATEGORIA_ANUNCIO', 5, N'', N'Clasico', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_CATEGORIA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (258, N'SKEY_ESTADO_REG', 0, N'', N'Activo', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTADO_REG')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (259, N'SKEY_ESTADO_REG', 1, N'', N'Inactivo', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTADO_REG')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (260, N'SKEY_ESTADO_ANUNCIO', 0, N'', N'Cerrado', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTADO_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (261, N'SKEY_ESTADO_ANUNCIO', 1, N'', N'Abierto', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_ESTADO_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (262, N'SKEY_TARIFA_ANUNCIO', 1, N'', N'30 DÍAS', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_TARIFA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (263, N'SKEY_TARIFA_ANUNCIO', 2, N'', N'30 DÍAS (+) TOP', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_TARIFA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (264, N'SKEY_TARIFA_ANUNCIO', 3, N'', N'30 DÍAS (+) DESTACADO', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_TARIFA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (265, N'SKEY_TARIFA_ANUNCIO', 4, N'', N'30 DÍAS (+) TOP Y DESTACADO', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_TARIFA_ANUNCIO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (266, N'SKEY_TIPO_ARCHIVO', 1, N'', N'jpg', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_ARCHIVO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (267, N'SKEY_TIPO_ARCHIVO', 2, N'', N'png', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_ARCHIVO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (268, N'SKEY_TIPO_CLIENTE', 1, N'', N'Empresa', N'', 0, CAST(N'2017-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_CLIENTE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (269, N'SKEY_TIPO_CLIENTE', 2, N'', N'Usuario', N'', 0, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'SKEY_TIPO_CLIENTE')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (270, N'SKEY_RUTASFISICAS_FICHAS', 1, N'', N'D:/ladyhot/WebAnuncio/uploads_fichas/', N'Configuracion las imanges por anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (271, N'SKEY_RUTASVIRTUALES_FICHAS', 1, N'', N'uploads_fichas/', N'Configuracion las imanges por anuncio', 0, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (272, N'SKEY_DOMINIO_FICHAS', 1, N'', N'http://localhost:2911/', N'Configuracion las imanges por anuncio', 0, CAST(N'2018-08-06 21:27:26.450' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (273, N'SKEY_TIPO_ARCHIVO', 3, N'', N'jpeg', N'', 0, CAST(N'2018-08-09 11:34:17.110' AS DateTime), N'SKEY_TIPO_ARCHIVO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (274, N'SKEY_TIPO_ARCHIVO', 4, N'', N'mp4', N'', 0, CAST(N'2018-08-09 11:35:05.110' AS DateTime), N'SKEY_TIPO_ARCHIVO')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (275, N'SKEY_RUTAS_FISICAS_VIDEOS', 1, N'', N'D:/ladyhot/WebAnuncio/uploads_videos/', N'', 0, CAST(N'2018-08-09 12:49:56.797' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (276, N'SKEY_RUTAS_VIRTUALES_VIDEOS', 1, N'', N'uploads_videos/', N'', 0, CAST(N'2018-08-09 12:49:56.800' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (277, N'SKEY_RUTAS_FISICAS_FICHAS_CORTADAS', 1, N'', N'D:/ladyhot/WebAnuncio/uploads_fichas_cortadas/', N'', 0, CAST(N'2018-08-09 15:58:59.800' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (278, N'SKEY_RUTAS_VIRTUALES_FICHAS_CORTADAS', 1, N'', N'uploads_fichas_cortadas/', N'', 0, CAST(N'2018-08-09 15:58:59.803' AS DateTime), N'SKEY_RUTAS_FICHAS')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (279, N'SKEY_MAIL_DET_USER', 1, N'ccarhuas.dante@gmail.com', N'USER', N'Configuracion del usuario para el envio de email', 0, CAST(N'2019-02-11 21:04:12.980' AS DateTime), N'SKEY_MAIL')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (280, N'SKEY_MAIL_DET_CLAVE', 2, N'ccarhuas.dante', N'CLAVE', N'Configuracion de la clave para el envio de email', 0, CAST(N'2019-02-11 21:04:12.983' AS DateTime), N'SKEY_MAIL')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (281, N'SKEY_MAIL_DET_SMTP', 3, N'smtp.gmail.com', N'SMTP', N'Configuracion del smpt para el envio de email', 0, CAST(N'2019-02-11 21:04:12.983' AS DateTime), N'SKEY_MAIL')
INSERT [dbo].[tbl_parameter_det] ([id], [skey_det], [val_valor], [tx_valor], [tx_descripcion], [tx_comentario], [id_estado_reg], [dt_fe_crea], [skey_cab]) VALUES (282, N'SKEY_MAIL_DET_PUERTO', 4, N'587', N'PUERTO', N'Configuracion del puerto para el envio de email', 0, CAST(N'2019-02-11 21:04:12.987' AS DateTime), N'SKEY_MAIL')
SET IDENTITY_INSERT [dbo].[tbl_parameter_det] OFF
SET IDENTITY_INSERT [dbo].[tbl_usuario] ON 

INSERT [dbo].[tbl_usuario] ([id], [tx_pass], [tx_email], [dt_fe_crea], [id_estado_reg], [tx_token], [tx_nombre], [tx_apellido], [tx_celular], [tx_telefono], [id_tipo_cliente]) VALUES (10, N'123', N'ccarhuas.mike@gmail.com', CAST(N'2018-08-05 15:12:52.283' AS DateTime), 0, N'C107A5F9-6B3F-4158-B928-4EDFCC422B90', NULL, NULL, NULL, N'123', NULL)
INSERT [dbo].[tbl_usuario] ([id], [tx_pass], [tx_email], [dt_fe_crea], [id_estado_reg], [tx_token], [tx_nombre], [tx_apellido], [tx_celular], [tx_telefono], [id_tipo_cliente]) VALUES (11, N'123', N'prueba@gmail.com', CAST(N'2018-08-20 13:00:04.650' AS DateTime), 0, N'70DFF663-A8CD-4280-B1D5-B395D7635BD6', NULL, NULL, NULL, N'9999999999', NULL)
SET IDENTITY_INSERT [dbo].[tbl_usuario] OFF
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [tx_filename]
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [tx_ruta_file]
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [tx_ruta_file_cort]
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [size_file]
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [id_tipo_archivo]
GO
ALTER TABLE [dbo].[tbl_galeria_anuncio] ADD  DEFAULT (NULL) FOR [dt_fe_crea]
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
/****** Object:  StoredProcedure [dbo].[sp_del_galeria_x_id]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ins_anuncio_primerpaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ins_usuario]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio_top_10]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_fichas_anuncio_x_tokens]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_galeria_x_id]    Script Date: 12/02/2019 1:43:34 ******/
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
	txt_ruta_virtuales
	 from tbl_galeria_anuncio where id = @id  
end  


GO
/****** Object:  StoredProcedure [dbo].[sp_sel_galeria_x_id_anuncion]    Script Date: 12/02/2019 1:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext sp_sel_galeria_x_id_anuncion

        
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
 galeria.id_anuncio        
 from tbl_galeria_anuncio galeria   
 where galeria.id_anuncio = @id_anuncio and id_tipo_archivo in (1,2,3)  
   
end 


GO
/****** Object:  StoredProcedure [dbo].[sp_sel_parameter_skey]    Script Date: 12/02/2019 1:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_sel_parameter_skey]
@skey_cab varchar(45)
as
begin
	select det.val_valor,det.tx_descripcion,det.skey_det,det.tx_valor from tbl_parameter_cab cab 
		inner join tbl_parameter_det det  on det.skey_cab= cab.skey_cab
	where det.skey_cab =  @skey_cab and det.id_estado_reg = 0 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sel_parameter_skey_x_det_id]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_id]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_tokens]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_anuncio_x_usuario]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_tbl_usuario]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_usuario_login]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_usuario_x_id]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sel_videos_x_id_anuncion]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_up_anuncio_primerpaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_cuartopaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_quintopaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_segundopaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_tercerpaso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_anuncio_todos_paso]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upd_dar_baja_tbl_anuncio]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_galeria]    Script Date: 12/02/2019 1:43:34 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ins_videos]    Script Date: 12/02/2019 1:43:34 ******/
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
USE [master]
GO
ALTER DATABASE [DB_A3F06D_anuncio] SET  READ_WRITE 
GO
