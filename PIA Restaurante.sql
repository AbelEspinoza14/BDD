﻿USE [Restaurant]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[uIdCliente] [uniqueidentifier] NOT NULL,
	[iIdCliente] [int] IDENTITY(1,1) NOT NULL,
	[vNombreComun] [nvarchar](20) NULL,
	[vNombre] [nvarchar](40) NULL,
	[vApellidoPat] [nvarchar](20) NULL,
	[vApellidoMat] [nvarchar](20) NULL,
	[vDomicilioCalle] [nvarchar](50) NULL,
	[vDomiciolioZip] [int] NULL,
	[vDomicilioCiudad] [nvarchar](20) NULL,
	[vDomicilioEstado] [nvarchar](15) NULL,
	[vDomiclioPais] [nvarchar](20) NOT NULL,
	[vTelefono] [nvarchar](13) NULL,
	[vCorreEle] [nvarchar](40) NULL,
	[vRFC] [nvarchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
CREATE TABLE [dbo].[Empleados](
	[uIdEmpleado] [uniqueidentifier] NOT NULL,
	[iIdEmpleadoo] [int] IDENTITY(1,1) NOT NULL,
	[vNombreComun] [nvarchar](20) NULL,
	[vNombre] [nvarchar](40) NULL,
	[vApellidoPat] [nvarchar](20) NULL,
	[vApellidoMat] [nvarchar](20) NULL,
	[vDomicilioCalle] [nvarchar](50) NULL,
	[vDomiciolioZip] [int] NULL,
	[vDomicilioCiudad] [nvarchar](20) NULL,
	[vDomicilioEstado] [nvarchar](15) NULL,
	[vDomiclioPais] [nvarchar](20) NULL,
	[vTelefono] [nvarchar](13) NULL,
	[vCorreEle] [nvarchar](40) NULL,
	[vCurp] [nvarchar](18) NULL,
	[dFechaNacimiento] [smalldatetime] NULL,
	[cGenero] [char](1) NULL,
	[uIdPuesto] [uniqueidentifier] NOT NULL,
	[dFechaIngreso] [smalldatetime] NULL,
	[vStatus] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[uIdFactura] [uniqueidentifier] NOT NULL,
	[iIdFactura] [int] IDENTITY(1,1) NOT NULL,
	[uidCliente] [uniqueidentifier] NOT NULL,
	[vFormadePago] [nvarchar](2) NOT NULL,
	[uIdOrden] [uniqueidentifier] NULL,
	[uIdReservacion] [uniqueidentifier] NULL,
	[sdtFecha] [smalldatetime] NULL,
	[mSubtotal] [money] NULL,
	[mIVA]  AS ([mSubtotal]*(0.16)),
	[mtotal]  AS ([mSubtotal]*(1.16)),
PRIMARY KEY CLUSTERED 
(
	[uIdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredientes]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredientes](
	[uIdIngrediente] [uniqueidentifier] NOT NULL,
	[vNombreIngrediente] [nvarchar](30) NULL,
	[vMarca] [nvarchar](100) NULL,
	[uIdProvedor] [uniqueidentifier] NOT NULL,
	[vUbicacion] [varchar](20) NOT NULL,
	[vIdNombreIngUbic]  AS (left((5),[vNombreIngrediente])+left((5),[vUbicacion])),
	[fCantidad] [float] NULL,
	[vUnidad] [varchar](5) NOT NULL,
	[bDisponible] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[uIdMenuItem] [uniqueidentifier] NOT NULL,
	[uIdPLatillo] [uniqueidentifier] NOT NULL,
	[iIdMenuItem] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mesas]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mesas](
	[uIdMesa] [uniqueidentifier] NOT NULL,
	[iIdMesa] [int] IDENTITY(1,1) NOT NULL,
	[capacidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[uIdOrden] [uniqueidentifier] NOT NULL,
	[iIdOrden] [int] IDENTITY(1,1) NOT NULL,
	[uIdReservacion] [uniqueidentifier] NOT NULL,
	[uIdMesa] [uniqueidentifier] NOT NULL,
	[uIdTicket] [uniqueidentifier] NOT NULL,
	[uIdEmpleado] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosProductos]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosProductos](
	[uIdPedido] [uniqueidentifier] NOT NULL,
	[uIdIngrediente] [uniqueidentifier] NOT NULL,
	[uIdProvedor] [uniqueidentifier] NOT NULL,
	[iIdPedido] [int] IDENTITY(1,1) NOT NULL,
	[sdtFecha] [smalldatetime] NOT NULL,
	[fCantidad] [float] NOT NULL,
	[mPrecio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platillo](
	[uIdPlatillo] [uniqueidentifier] NOT NULL,
	[vNombrePlatillo] [nvarchar](40) NULL,
	[vTipoPlatillo] [nvarchar](200) NULL,
	[mPrecio] [money] NULL,
	[bDisponible] [bit] NULL,
	[bActivo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdPlatillo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provedores]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provedores](
	[uIdProvedor] [uniqueidentifier] NOT NULL,
	[iIdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[bActivo] [bit] NULL,
	[vNombreProv] [nvarchar](30) NULL,
	[vNombreContacto] [nvarchar](100) NULL,
	[vCorreo] [varchar](50) NULL,
	[vTelefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdProvedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[uIdPuesto] [uniqueidentifier] NOT NULL,
	[iIdPuesto] [int] IDENTITY(1,1) NOT NULL,
	[vNombrePuesto] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[uIdPlatillo] [uniqueidentifier] NOT NULL,
	[uIdIngrediente] [uniqueidentifier] NOT NULL,
	[iIdReceta] [int] NOT NULL,
	[fCantidad] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 10-May-19 7:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaciones](
	[uIdReservacion] [uniqueidentifier] NOT NULL,
	[iIdReservacion] [int] IDENTITY(1,1) NOT NULL,
	[uIdcliente] [uniqueidentifier] NULL,
	[sdtFechadeCreacionReserva] [smalldatetime] NULL,
	[stdFechadeReservacion] [smalldatetime] NULL,
	[uIdMesa] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uIdReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 10-May-19 7:59:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[uIdTicket] [uniqueidentifier] NOT NULL,
	[uIdPlatillo] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ('Mexico') FOR [vDomiclioPais]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (newid()) FOR [uIdEmpleado]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('México') FOR [vDomiclioPais]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (getdate()) FOR [dFechaIngreso]
GO
ALTER TABLE [dbo].[Factura] ADD  DEFAULT (newid()) FOR [uIdFactura]
GO
ALTER TABLE [dbo].[ingredientes] ADD  DEFAULT (newid()) FOR [uIdIngrediente]
GO
ALTER TABLE [dbo].[ingredientes] ADD  DEFAULT ((0)) FOR [fCantidad]
GO
ALTER TABLE [dbo].[ingredientes] ADD  DEFAULT ('KM') FOR [vUnidad]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (newid()) FOR [uIdMenuItem]
GO
ALTER TABLE [dbo].[mesas] ADD  DEFAULT (newid()) FOR [uIdMesa]
GO
ALTER TABLE [dbo].[PedidosProductos] ADD  DEFAULT (newid()) FOR [uIdPedido]
GO
ALTER TABLE [dbo].[PedidosProductos] ADD  DEFAULT (getdate()) FOR [sdtFecha]
GO
ALTER TABLE [dbo].[Platillo] ADD  DEFAULT (newid()) FOR [uIdPlatillo]
GO
ALTER TABLE [dbo].[provedores] ADD  DEFAULT (newid()) FOR [uIdProvedor]
GO
ALTER TABLE [dbo].[Reservaciones] ADD  DEFAULT (newid()) FOR [uIdReservacion]
GO
ALTER TABLE [dbo].[Reservaciones] ADD  DEFAULT (getdate()) FOR [sdtFechadeCreacionReserva]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([uidCliente])
REFERENCES [dbo].[Clientes] ([uIdCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Orden] FOREIGN KEY([uIdFactura])
REFERENCES [dbo].[Orden] ([uIdOrden])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Orden]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Reservaciones] FOREIGN KEY([uIdReservacion])
REFERENCES [dbo].[Reservaciones] ([uIdReservacion])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Reservaciones]
GO
ALTER TABLE [dbo].[ingredientes]  WITH CHECK ADD  CONSTRAINT [FK_ingredientes_provedores] FOREIGN KEY([uIdProvedor])
REFERENCES [dbo].[provedores] ([uIdProvedor])
GO
ALTER TABLE [dbo].[ingredientes] CHECK CONSTRAINT [FK_ingredientes_provedores]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Platillo] FOREIGN KEY([uIdPLatillo])
REFERENCES [dbo].[Platillo] ([uIdPlatillo])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Platillo]
GO
ALTER TABLE [dbo].[PedidosProductos]  WITH CHECK ADD  CONSTRAINT [FK_PedidosProductos_ingredientes] FOREIGN KEY([uIdPedido])
REFERENCES [dbo].[ingredientes] ([uIdIngrediente])
GO
ALTER TABLE [dbo].[PedidosProductos] CHECK CONSTRAINT [FK_PedidosProductos_ingredientes]
GO
ALTER TABLE [dbo].[PedidosProductos]  WITH CHECK ADD  CONSTRAINT [FK_PedidosProductos_provedores] FOREIGN KEY([uIdPedido])
REFERENCES [dbo].[provedores] ([uIdProvedor])
GO
ALTER TABLE [dbo].[PedidosProductos] CHECK CONSTRAINT [FK_PedidosProductos_provedores]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_ingredientes] FOREIGN KEY([uIdIngrediente])
REFERENCES [dbo].[ingredientes] ([uIdIngrediente])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_ingredientes]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Platillo] FOREIGN KEY([uIdPlatillo])
REFERENCES [dbo].[Platillo] ([uIdPlatillo])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Platillo]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_mesas] FOREIGN KEY([uIdMesa])
REFERENCES [dbo].[mesas] ([uIdMesa])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_mesas]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Orden] FOREIGN KEY([uIdTicket])
REFERENCES [dbo].[Orden] ([uIdOrden])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Orden]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Platillo] FOREIGN KEY([uIdPlatillo])
REFERENCES [dbo].[Platillo] ([uIdPlatillo])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Platillo]
GO
