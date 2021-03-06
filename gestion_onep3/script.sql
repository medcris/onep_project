USE [gestion_agent]
GO
/****** Object:  Table [dbo].[typeconge]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[typeconge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](20) NULL,
	[Remarque] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](20) NULL,
	[Remarque] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Remarque] [varchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[UserName] [varchar](40) NOT NULL,
	[Passworde] [char](40) NULL,
	[confirmPass] [char](40) NULL,
	[mobile] [int] NULL,
	[Adresse] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Demande]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Demande](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_agent] [int] NULL,
	[date_demande] [datetime] NULL,
	[du] [datetime] NULL,
	[au] [datetime] NULL,
	[nbrjour] [int] NULL,
	[type] [varchar](50) NULL,
	[Precisions] [varchar](max) NULL,
	[remark] [varchar](max) NULL,
	[opinion] [tinyint] NULL,
 CONSTRAINT [PK_Demande] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[agent]    Script Date: 03/04/2018 19:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](20) NULL,
	[Prenom] [varchar](20) NULL,
	[CIN] [varchar](30) NULL,
	[Tel] [int] NULL,
	[Email] [varchar](30) NULL,
	[Service_Id] [int] NULL,
	[Fonction] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Role_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__agent__Role_Id__31EC6D26]    Script Date: 03/04/2018 19:43:25 ******/
ALTER TABLE [dbo].[agent]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Id])
GO
/****** Object:  ForeignKey [FK__agent__Service_I__2A4B4B5E]    Script Date: 03/04/2018 19:43:25 ******/
ALTER TABLE [dbo].[agent]  WITH CHECK ADD FOREIGN KEY([Service_Id])
REFERENCES [dbo].[service] ([id])
GO
/****** Object:  ForeignKey [FK_agent_agent]    Script Date: 03/04/2018 19:43:25 ******/
ALTER TABLE [dbo].[agent]  WITH CHECK ADD  CONSTRAINT [FK_agent_agent] FOREIGN KEY([id])
REFERENCES [dbo].[agent] ([id])
GO
ALTER TABLE [dbo].[agent] CHECK CONSTRAINT [FK_agent_agent]
GO
/****** Object:  ForeignKey [FK_role_agent]    Script Date: 03/04/2018 19:43:25 ******/
ALTER TABLE [dbo].[agent]  WITH CHECK ADD  CONSTRAINT [FK_role_agent] FOREIGN KEY([id])
REFERENCES [dbo].[agent] ([id])
GO
ALTER TABLE [dbo].[agent] CHECK CONSTRAINT [FK_role_agent]
GO
