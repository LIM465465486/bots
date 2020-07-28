CREATE DATABASE [TFi]
GO

USE [TFi]
GO

/****** Object:  Table [dbo].[UPLOADEDI]    Script Date: 7/27/2020 2:44:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[payload](id INT IDENTITY(1,1), data XML)
GO

CREATE TABLE [dbo].[UPLOADEDI](
	[ROWID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UPLOADED] [char](1) NULL,
	[FIELD001] [nvarchar](40) NULL,
	[FIELD002] [nvarchar](40) NULL,
	[FIELD003] [nvarchar](40) NULL,
	[FIELD004] [nvarchar](100) NULL,
	[FIELD005] [nvarchar](100) NULL,
	[FIELD006] [nvarchar](40) NULL,
	[FIELD007] [nvarchar](100) NULL,
	[FIELD008] [nvarchar](40) NULL,
	[FIELD009] [nvarchar](40) NULL,
	[FIELD010] [nvarchar](40) NULL,
	[FIELD011] [nvarchar](100) NULL,
	[FIELD012] [nvarchar](40) NULL,
	[FIELD013] [nvarchar](40) NULL,
	[FIELD014] [nvarchar](40) NULL,
	[FIELD015] [nvarchar](40) NULL,
	[FIELD016] [nvarchar](40) NULL,
	[FIELD017] [nvarchar](40) NULL,
	[FIELD018] [nvarchar](40) NULL,
	[FIELD019] [nvarchar](40) NULL,
	[FIELD020] [nvarchar](40) NULL,
	[FIELD021] [nvarchar](40) NULL,
	[FIELD022] [nvarchar](40) NULL,
	[FIELD023] [nvarchar](40) NULL,
	[FIELD024] [nvarchar](40) NULL,
	[FIELD025] [nvarchar](40) NULL,
	[FIELD026] [nvarchar](40) NULL,
	[FIELD027] [nvarchar](40) NULL,
	[FIELD028] [nvarchar](40) NULL,
	[FIELD029] [nvarchar](40) NULL,
	[FIELD030] [nvarchar](40) NULL,
	[FIELD031] [nvarchar](40) NULL,
	[FIELD032] [nvarchar](40) NULL,
	[FIELD033] [nvarchar](40) NULL,
	[FIELD034] [nvarchar](40) NULL,
	[FIELD035] [nvarchar](40) NULL,
	[FIELD036] [nvarchar](40) NULL,
	[FIELD037] [nvarchar](40) NULL,
	[FIELD038] [nvarchar](40) NULL,
	[FIELD039] [nvarchar](40) NULL,
	[FIELD040] [nvarchar](40) NULL,
	[FIELD041] [nvarchar](40) NULL,
	[FIELD042] [nvarchar](40) NULL,
	[FIELD043] [nvarchar](40) NULL,
	[FIELD044] [nvarchar](40) NULL,
	[FIELD045] [nvarchar](40) NULL,
	[FIELD046] [nvarchar](40) NULL,
	[FIELD047] [nvarchar](40) NULL,
	[FIELD048] [nvarchar](40) NULL,
	[FIELD049] [nvarchar](40) NULL,
	[FIELD050] [nvarchar](40) NULL,
	[FIELD051] [nvarchar](40) NULL,
	[FIELD052] [nvarchar](40) NULL,
	[FIELD053] [nvarchar](40) NULL,
	[FIELD054] [nvarchar](40) NULL,
	[FIELD055] [nvarchar](40) NULL,
	[FIELD056] [nvarchar](40) NULL,
	[FIELD057] [nvarchar](40) NULL,
	[FIELD058] [nvarchar](40) NULL,
	[FIELD059] [nvarchar](40) NULL,
	[FIELD060] [nvarchar](40) NULL,
	[FIELD061] [nvarchar](40) NULL,
	[FIELD062] [nvarchar](40) NULL,
	[FIELD063] [nvarchar](40) NULL,
	[FIELD064] [nvarchar](40) NULL,
	[FIELD065] [nvarchar](40) NULL,
	[FIELD066] [nvarchar](40) NULL,
	[FIELD067] [nvarchar](40) NULL,
	[FIELD068] [nvarchar](40) NULL,
	[FIELD069] [nvarchar](40) NULL,
	[FIELD070] [nvarchar](40) NULL,
	[FIELD071] [nvarchar](40) NULL,
	[FIELD072] [nvarchar](40) NULL,
	[FIELD073] [nvarchar](40) NULL,
	[FIELD074] [nvarchar](40) NULL,
	[FIELD075] [nvarchar](40) NULL,
	[FIELD076] [nvarchar](40) NULL,
	[FIELD077] [nvarchar](40) NULL,
	[FIELD078] [nvarchar](40) NULL,
	[FIELD079] [nvarchar](40) NULL,
	[FIELD080] [nvarchar](40) NULL,
	[FIELD081] [nvarchar](40) NULL,
	[FIELD082] [nvarchar](40) NULL,
	[FIELD083] [nvarchar](40) NULL,
	[FIELD084] [nvarchar](40) NULL,
	[FIELD085] [nvarchar](40) NULL,
	[FIELD086] [nvarchar](40) NULL,
	[FIELD087] [nvarchar](40) NULL,
	[FIELD088] [nvarchar](40) NULL,
	[FIELD089] [nvarchar](40) NULL,
	[FIELD090] [nvarchar](40) NULL,
	[FIELD091] [nvarchar](40) NULL,
	[FIELD092] [nvarchar](40) NULL,
	[FIELD093] [nvarchar](40) NULL,
	[FIELD094] [nvarchar](40) NULL,
	[FIELD095] [nvarchar](40) NULL,
	[FIELD096] [nvarchar](40) NULL,
	[FIELD097] [nvarchar](40) NULL,
	[FIELD098] [nvarchar](40) NULL,
	[FIELD099] [nvarchar](40) NULL,
	[TIMESTMP] [nvarchar](25) NULL,
	[UP_LOAD_ID] [bigint] NULL,
	[PROC_BY_MA] [nvarchar](1) NULL,
	[FIELD100] [nvarchar](40) NULL,
	[FIELD101] [nvarchar](40) NULL,
	[FIELD102] [nvarchar](40) NULL,
	[FIELD103] [nvarchar](40) NULL,
	[FIELD104] [nvarchar](40) NULL,
	[FIELD105] [nvarchar](40) NULL,
	[FIELD106] [nvarchar](40) NULL,
	[FIELD107] [nvarchar](40) NULL,
	[FIELD108] [nvarchar](40) NULL,
	[FIELD109] [nvarchar](40) NULL,
	[FIELD110] [nvarchar](40) NULL,
	[FIELD111] [nvarchar](40) NULL,
	[FIELD112] [nvarchar](40) NULL,
	[FIELD113] [nvarchar](40) NULL,
	[FIELD114] [nvarchar](40) NULL,
	[FIELD115] [nvarchar](40) NULL,
	[FIELD116] [nvarchar](40) NULL,
	[FIELD117] [nvarchar](40) NULL,
	[FIELD118] [nvarchar](40) NULL,
	[FIELD119] [nvarchar](40) NULL,
	[FIELD120] [nvarchar](40) NULL,
	[FIELD121] [nvarchar](40) NULL,
	[FIELD122] [nvarchar](40) NULL,
	[FIELD123] [nvarchar](40) NULL,
	[FIELD124] [nvarchar](40) NULL,
	[FIELD125] [nvarchar](40) NULL,
	[FIELD126] [nvarchar](40) NULL,
	[FIELD127] [nvarchar](40) NULL,
	[FIELD128] [nvarchar](40) NULL,
	[FIELD129] [nvarchar](40) NULL,
	[FIELD130] [nvarchar](40) NULL,
	[FIELD131] [nvarchar](40) NULL,
	[FIELD132] [nvarchar](40) NULL,
	[FIELD133] [nvarchar](40) NULL,
	[FIELD134] [nvarchar](40) NULL,
	[FIELD135] [nvarchar](40) NULL,
	[FIELD136] [nvarchar](40) NULL,
	[FIELD137] [nvarchar](40) NULL,
	[FIELD138] [nvarchar](40) NULL,
	[FIELD139] [nvarchar](40) NULL,
	[FIELD140] [nvarchar](40) NULL,
	[FIELD141] [nvarchar](40) NULL,
	[FIELD142] [nvarchar](40) NULL,
	[FIELD143] [nvarchar](40) NULL,
	[FIELD144] [nvarchar](40) NULL,
	[FIELD145] [nvarchar](40) NULL,
	[FIELD146] [nvarchar](40) NULL,
	[FIELD147] [nvarchar](40) NULL,
	[FIELD148] [nvarchar](40) NULL,
	[FIELD149] [nvarchar](40) NULL,
	[FIELD150] [nvarchar](40) NULL,
	[FIELD151] [nvarchar](40) NULL,
	[FIELD152] [nvarchar](40) NULL,
	[FIELD153] [nvarchar](40) NULL,
	[FIELD154] [nvarchar](40) NULL,
	[FIELD155] [nvarchar](40) NULL,
	[FIELD156] [nvarchar](40) NULL,
	[FIELD157] [nvarchar](40) NULL,
	[FIELD158] [nvarchar](40) NULL,
	[FIELD159] [nvarchar](40) NULL,
	[FIELD160] [nvarchar](40) NULL,
	[FIELD161] [nvarchar](40) NULL,
	[FIELD162] [nvarchar](40) NULL,
	[FIELD163] [nvarchar](40) NULL,
	[FIELD164] [nvarchar](40) NULL,
	[FIELD165] [nvarchar](40) NULL,
	[FIELD166] [nvarchar](40) NULL,
	[FIELD167] [nvarchar](40) NULL,
	[FIELD168] [nvarchar](40) NULL,
	[FIELD169] [nvarchar](40) NULL,
	[FIELD170] [nvarchar](40) NULL,
	[MESSAGE] [nvarchar](4000) NULL,
 CONSTRAINT [PK_UPLOADEDI] PRIMARY KEY CLUSTERED
(
	[ROWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  DEFAULT (newsequentialid()) FOR [ROWID]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_UPLOADED]  DEFAULT ('') FOR [UPLOADED]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD001]  DEFAULT ('') FOR [FIELD001]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD002]  DEFAULT ('') FOR [FIELD002]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD003]  DEFAULT ('') FOR [FIELD003]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD004]  DEFAULT ('') FOR [FIELD004]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD005]  DEFAULT ('') FOR [FIELD005]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD006]  DEFAULT ('') FOR [FIELD006]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD007]  DEFAULT ('') FOR [FIELD007]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD008]  DEFAULT ('') FOR [FIELD008]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD009]  DEFAULT ('') FOR [FIELD009]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD010]  DEFAULT ('') FOR [FIELD010]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD011]  DEFAULT ('') FOR [FIELD011]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD012]  DEFAULT ('') FOR [FIELD012]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD013]  DEFAULT ('') FOR [FIELD013]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD014]  DEFAULT ('') FOR [FIELD014]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD015]  DEFAULT ('') FOR [FIELD015]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD016]  DEFAULT ('') FOR [FIELD016]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD017]  DEFAULT ('') FOR [FIELD017]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD018]  DEFAULT ('') FOR [FIELD018]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD019]  DEFAULT ('') FOR [FIELD019]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD020]  DEFAULT ('') FOR [FIELD020]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD021]  DEFAULT ('') FOR [FIELD021]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD022]  DEFAULT ('') FOR [FIELD022]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD023]  DEFAULT ('') FOR [FIELD023]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD024]  DEFAULT ('') FOR [FIELD024]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD025]  DEFAULT ('') FOR [FIELD025]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD026]  DEFAULT ('') FOR [FIELD026]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD027]  DEFAULT ('') FOR [FIELD027]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD028]  DEFAULT ('') FOR [FIELD028]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD029]  DEFAULT ('') FOR [FIELD029]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD030]  DEFAULT ('') FOR [FIELD030]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD031]  DEFAULT ('') FOR [FIELD031]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD032]  DEFAULT ('') FOR [FIELD032]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD033]  DEFAULT ('') FOR [FIELD033]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD034]  DEFAULT ('') FOR [FIELD034]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD035]  DEFAULT ('') FOR [FIELD035]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD036]  DEFAULT ('') FOR [FIELD036]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD037]  DEFAULT ('') FOR [FIELD037]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD038]  DEFAULT ('') FOR [FIELD038]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD039]  DEFAULT ('') FOR [FIELD039]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD040]  DEFAULT ('') FOR [FIELD040]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD041]  DEFAULT ('') FOR [FIELD041]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD042]  DEFAULT ('') FOR [FIELD042]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD043]  DEFAULT ('') FOR [FIELD043]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD044]  DEFAULT ('') FOR [FIELD044]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD045]  DEFAULT ('') FOR [FIELD045]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD046]  DEFAULT ('') FOR [FIELD046]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD047]  DEFAULT ('') FOR [FIELD047]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD048]  DEFAULT ('') FOR [FIELD048]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD049]  DEFAULT ('') FOR [FIELD049]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD050]  DEFAULT ('') FOR [FIELD050]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD051]  DEFAULT ('') FOR [FIELD051]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD052]  DEFAULT ('') FOR [FIELD052]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD053]  DEFAULT ('') FOR [FIELD053]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD054]  DEFAULT ('') FOR [FIELD054]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD055]  DEFAULT ('') FOR [FIELD055]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD056]  DEFAULT ('') FOR [FIELD056]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD057]  DEFAULT ('') FOR [FIELD057]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD058]  DEFAULT ('') FOR [FIELD058]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD059]  DEFAULT ('') FOR [FIELD059]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD060]  DEFAULT ('') FOR [FIELD060]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD061]  DEFAULT ('') FOR [FIELD061]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD062]  DEFAULT ('') FOR [FIELD062]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD063]  DEFAULT ('') FOR [FIELD063]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD064]  DEFAULT ('') FOR [FIELD064]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD065]  DEFAULT ('') FOR [FIELD065]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD066]  DEFAULT ('') FOR [FIELD066]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD067]  DEFAULT ('') FOR [FIELD067]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD068]  DEFAULT ('') FOR [FIELD068]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD069]  DEFAULT ('') FOR [FIELD069]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD070]  DEFAULT ('') FOR [FIELD070]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD071]  DEFAULT ('') FOR [FIELD071]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD072]  DEFAULT ('') FOR [FIELD072]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD073]  DEFAULT ('') FOR [FIELD073]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD074]  DEFAULT ('') FOR [FIELD074]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD075]  DEFAULT ('') FOR [FIELD075]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD076]  DEFAULT ('') FOR [FIELD076]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD077]  DEFAULT ('') FOR [FIELD077]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD078]  DEFAULT ('') FOR [FIELD078]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD079]  DEFAULT ('') FOR [FIELD079]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD080]  DEFAULT ('') FOR [FIELD080]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD081]  DEFAULT ('') FOR [FIELD081]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD082]  DEFAULT ('') FOR [FIELD082]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD083]  DEFAULT ('') FOR [FIELD083]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD084]  DEFAULT ('') FOR [FIELD084]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD085]  DEFAULT ('') FOR [FIELD085]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD086]  DEFAULT ('') FOR [FIELD086]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD087]  DEFAULT ('') FOR [FIELD087]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD088]  DEFAULT ('') FOR [FIELD088]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD089]  DEFAULT ('') FOR [FIELD089]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD090]  DEFAULT ('') FOR [FIELD090]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD091]  DEFAULT ('') FOR [FIELD091]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD092]  DEFAULT ('') FOR [FIELD092]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD093]  DEFAULT ('') FOR [FIELD093]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD094]  DEFAULT ('') FOR [FIELD094]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD095]  DEFAULT ('') FOR [FIELD095]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD096]  DEFAULT ('') FOR [FIELD096]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD097]  DEFAULT ('') FOR [FIELD097]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD098]  DEFAULT ('') FOR [FIELD098]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD099]  DEFAULT ('') FOR [FIELD099]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_TIMESTMP]  DEFAULT ('') FOR [TIMESTMP]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_UP_LOAD_ID]  DEFAULT ((0)) FOR [UP_LOAD_ID]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_PROC_BY_MA]  DEFAULT ('') FOR [PROC_BY_MA]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD100]  DEFAULT ('') FOR [FIELD100]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD101]  DEFAULT ('') FOR [FIELD101]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD102]  DEFAULT ('') FOR [FIELD102]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD103]  DEFAULT ('') FOR [FIELD103]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD104]  DEFAULT ('') FOR [FIELD104]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD105]  DEFAULT ('') FOR [FIELD105]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD106]  DEFAULT ('') FOR [FIELD106]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD107]  DEFAULT ('') FOR [FIELD107]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD108]  DEFAULT ('') FOR [FIELD108]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD109]  DEFAULT ('') FOR [FIELD109]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD110]  DEFAULT ('') FOR [FIELD110]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD111]  DEFAULT ('') FOR [FIELD111]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD112]  DEFAULT ('') FOR [FIELD112]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD113]  DEFAULT ('') FOR [FIELD113]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD114]  DEFAULT ('') FOR [FIELD114]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD115]  DEFAULT ('') FOR [FIELD115]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD116]  DEFAULT ('') FOR [FIELD116]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD117]  DEFAULT ('') FOR [FIELD117]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD118]  DEFAULT ('') FOR [FIELD118]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD119]  DEFAULT ('') FOR [FIELD119]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD120]  DEFAULT ('') FOR [FIELD120]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD121]  DEFAULT ('') FOR [FIELD121]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD122]  DEFAULT ('') FOR [FIELD122]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD123]  DEFAULT ('') FOR [FIELD123]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD124]  DEFAULT ('') FOR [FIELD124]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD125]  DEFAULT ('') FOR [FIELD125]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD126]  DEFAULT ('') FOR [FIELD126]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD127]  DEFAULT ('') FOR [FIELD127]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD128]  DEFAULT ('') FOR [FIELD128]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD129]  DEFAULT ('') FOR [FIELD129]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD130]  DEFAULT ('') FOR [FIELD130]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD131]  DEFAULT ('') FOR [FIELD131]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD132]  DEFAULT ('') FOR [FIELD132]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD133]  DEFAULT ('') FOR [FIELD133]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD134]  DEFAULT ('') FOR [FIELD134]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD135]  DEFAULT ('') FOR [FIELD135]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD136]  DEFAULT ('') FOR [FIELD136]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD137]  DEFAULT ('') FOR [FIELD137]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD138]  DEFAULT ('') FOR [FIELD138]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD139]  DEFAULT ('') FOR [FIELD139]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD140]  DEFAULT ('') FOR [FIELD140]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD141]  DEFAULT ('') FOR [FIELD141]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD142]  DEFAULT ('') FOR [FIELD142]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD143]  DEFAULT ('') FOR [FIELD143]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD144]  DEFAULT ('') FOR [FIELD144]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD145]  DEFAULT ('') FOR [FIELD145]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD146]  DEFAULT ('') FOR [FIELD146]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD147]  DEFAULT ('') FOR [FIELD147]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD148]  DEFAULT ('') FOR [FIELD148]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD149]  DEFAULT ('') FOR [FIELD149]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD150]  DEFAULT ('') FOR [FIELD150]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD151]  DEFAULT ('') FOR [FIELD151]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD152]  DEFAULT ('') FOR [FIELD152]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD153]  DEFAULT ('') FOR [FIELD153]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD154]  DEFAULT ('') FOR [FIELD154]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD155]  DEFAULT ('') FOR [FIELD155]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD156]  DEFAULT ('') FOR [FIELD156]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD157]  DEFAULT ('') FOR [FIELD157]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD158]  DEFAULT ('') FOR [FIELD158]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD159]  DEFAULT ('') FOR [FIELD159]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD160]  DEFAULT ('') FOR [FIELD160]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD161]  DEFAULT ('') FOR [FIELD161]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD162]  DEFAULT ('') FOR [FIELD162]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD163]  DEFAULT ('') FOR [FIELD163]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD164]  DEFAULT ('') FOR [FIELD164]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD165]  DEFAULT ('') FOR [FIELD165]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD166]  DEFAULT ('') FOR [FIELD166]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD167]  DEFAULT ('') FOR [FIELD167]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD168]  DEFAULT ('') FOR [FIELD168]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD169]  DEFAULT ('') FOR [FIELD169]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_FIELD170]  DEFAULT ('') FOR [FIELD170]
GO

ALTER TABLE [dbo].[UPLOADEDI] ADD  CONSTRAINT [DF_UPLOADEDI_MESSAGE]  DEFAULT ('') FOR [MESSAGE]
GO

