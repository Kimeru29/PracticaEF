﻿DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'PrácticaEF.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '201802021730051_ModeloInicial'
BEGIN
    CREATE TABLE [dbo].[Genero] (
        [Id] [int] NOT NULL IDENTITY,
        [Nombre] [nvarchar](max),
        CONSTRAINT [PK_dbo.Genero] PRIMARY KEY ([Id])
    )
    CREATE TABLE [dbo].[Video] (
        [Id] [int] NOT NULL IDENTITY,
        [Nombre] [nvarchar](max),
        [FechaDeEstreno] [datetime] NOT NULL,
        CONSTRAINT [PK_dbo.Video] PRIMARY KEY ([Id])
    )
    CREATE TABLE [dbo].[VideoGeneros] (
        [RefVideoId] [int] NOT NULL,
        [RefGeneroId] [int] NOT NULL,
        CONSTRAINT [PK_dbo.VideoGeneros] PRIMARY KEY ([RefVideoId], [RefGeneroId])
    )
    CREATE INDEX [IX_RefVideoId] ON [dbo].[VideoGeneros]([RefVideoId])
    CREATE INDEX [IX_RefGeneroId] ON [dbo].[VideoGeneros]([RefGeneroId])
    ALTER TABLE [dbo].[VideoGeneros] ADD CONSTRAINT [FK_dbo.VideoGeneros_dbo.Video_RefVideoId] FOREIGN KEY ([RefVideoId]) REFERENCES [dbo].[Video] ([Id]) ON DELETE CASCADE
    ALTER TABLE [dbo].[VideoGeneros] ADD CONSTRAINT [FK_dbo.VideoGeneros_dbo.Genero_RefGeneroId] FOREIGN KEY ([RefGeneroId]) REFERENCES [dbo].[Genero] ([Id]) ON DELETE CASCADE
    CREATE TABLE [dbo].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201802021730051_ModeloInicial', N'PrácticaEF.Migrations.Configuration',  0x1F8B0800000000000400ED19CB6EE336F05EA0FF20E8D416592B8F4B1BD8BB489DB808BA7920CE2E7A0B6869EC10A54895A4021B453FA6DFD1430FFDA0FE42476F89942CC958048BB6C82526E73DC379E9EF3FFE9CBEDB86CC7901A9A8E033F76472EC3AC07D1150BE99B9B15EBFF9D67DF7F6CB2FA65741B8753E167067091C627235739FB58ECE3D4FF9CF10123509A92F85126B3DF145E8914078A7C7C7DF7927271E2009176939CEF421E69A8690FEC09F73C17D88744CD88D0880A9FC1C6F962955E79684A022E2C3CCBD977FFDEE6BEA93AB85EB5C304A508425B0B5EB10CE85261A053CFFA060A9A5E09B658407843DEE2240B835610A72C1CF2BF0A13A1C9F263A78156241CA8F9516E148822767B9513C13FD20D3BAA5D1D06C57685EBD4BB44E4D37737F000E52B88EC9EA7CCE6402D6B0EB24833E726A6747A5F3314692BF23671E331D4B987188B5240CC1E315A3FE8FB07B143F039FF198B1BA542817DE350EF0E85E8A08A4DE3DC03A97F53A701DAF89E79988255A0D27D3E39AEBB353D7B945E664C5A0747A4DE7A51612521D8986E09E680D92273420359BC5DDE0752BC29584821FC619BE15D7B921DBF7C037FA79E6E2BFAEB3A05B088A935C860F9CE2D342242D63B0D8DC9217BA492534187EA40108E53A0FC0D26BF54CA32CE827E9D553E62F845848113E0856E014174F8F446E40A3C8A2ED762962E91BF24CBD2A86F646564A6A6860A5C0FFC7D5EBC695C16601FE33B9842BA5257051B0BB44911F3125B76838344CCB283C3C4E8B486C8FD3228A87C4E98552C2A7A918F5402D4568EA74C50367AF3C994B4A4DD02D18A434C2B044DE33F71BCB4A5D14CB9758512C72F35E9253AFA691FD20B1826A42914E5DD9E410B6BAE571627DCCDFA7CA83C6943E21BA046DBAB632B621BCA57E934091C22CFCDC9C067A4D57834615433598D6203313429F8F4B912B69BDA1340AAFD66894729A29A7A95B4B2897BEACDA202FEB838A7EC9EB6898A637248A306BD41AA8FCC45966DDD3FCCD727C771166343C5FB53419A5B42527CC826403C62DB2464917542A8DA986AC489259E64168813522B723A80A56CDE0B49D55C45A019FFC9FE1D8DD8E895ED96E81EA8498C253CDC072B18D98F6AD8411D9524CE682C521EF2A48FBB08BF250A7509CD954A69E21BD691DCF328F11A7A6B507F9227F3987BA22CB06E33DD181F73938A28B8A5986EBD4CCBBD7776F3349B5F8B8CAC37B3C5901B53AACFDFD2449B6AD013613B66D9341BEC67E3025D7E6F3C42A25EFB162E535E070B13242E3E432CB89ED4CABAA9820652895D5C5A822D33CA3F7CFE6568ACF405C6CF8C50B1A0BD3FB72A73484930460B2FC85CD19C5E0AD006E08A76B503AEBF45D9C924F8D29FFF399B83DA5023668EC7EF561852636ED1D47FA3AFDBDF3097F2112B394FC2A24DBAFEBB4EC1964E42CF91FB7D6D0892D403975FFC436CEF88707ECDEBCDA0ADE95EFFA5D57E75573A135E65CF300B633F7D714EDDCB9FEE9A9C23C72EE24269C73E7D8F96DB4731BD28F96A0401D21C281636E6BAD34A798FEF1F6C4AAD177FC121868702EFC2CFDCE89F249601B2EA95C7BB91703A429C3A0A9385925C31A64F24609C312874F048B9CD50DDD4BCA7D1A11D6D0DB2ED543324BA25449CFBCB984087892325A541CC26E7F775252376CDC6783CEE5415FF8B4F5343507B6F8AEDD6DFFBA001AE1D2D78FA07D8DE4270FA1F6FD933DEC0F5930EDD92F659D2456BD55E2EA2C4F8ED93D75AF9EDA28B76FA55A09774ADEB8ED64D2B526EADF80958BAB9E4558C7BC6457016B9EEEDD7F3575B706BBE1ABAF610A175BB63E85DB27B196BC65EF725E4FE511DB3E7BFEC2F75AFB828A3943D14D4522F99ECAC16FBCD412E69AAF4591350C890A10A3D9B9014DB0D9241752D335F1355EFBA054FA75E2236131825C852B08AEF95DACA358A3CA10AE58E37B479278F6F14F579A4D99A77751FA11E153A88062D2A45FBEE3DFC79405A5DC8B964EAB834492D1F2F120F1A54EC684CDAEA4742BF84042B9F9CA44FC0861C49098BAE34BF20287C8F641C17BD8107F578CD1DD44FA1DD134FBF492928D24A1CA6954F8F813633808B76FFF01425FD48548200000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201802021807100_ConfiguradoMétodoSeed'
BEGIN
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201802021807100_ConfiguradoMétodoSeed', N'PrácticaEF.Migrations.Configuration',  0x1F8B0800000000000400ED19CB6EE336F05EA0FF20E8D416592B8F4B1BD8BB489DB808BA7920CE2E7A0B6869EC10A54895A4021B453FA6DFD1430FFDA0FE42476F89942CC958048BB6C82526E73DC379E9EF3FFE9CBEDB86CC7901A9A8E033F76472EC3AC07D1150BE99B9B15EBFF9D67DF7F6CB2FA65741B8753E167067091C627235739FB58ECE3D4FF9CF10123509A92F85126B3DF145E8914078A7C7C7DF7927271E2009176939CEF421E69A8690FEC09F73C17D88744CD88D0880A9FC1C6F962955E79684A022E2C3CCBD977FFDEE6BEA93AB85EB5C304A508425B0B5EB10CE85261A053CFFA060A9A5E09B658407843DEE2240B835610A72C1CF2BF0A13A1C9F263A78156241CA8F9516E148822767B9513C13FD20D3BAA5D1D06C57685EBD4BB44E4D37737F000E52B88EC9EA7CCE6402D6B0EB24833E726A6747A5F3314692BF23671E331D4B987188B5240CC1E315A3FE8FB07B143F039FF198B1BA542817DE350EF0E85E8A08A4DE3DC03A97F53A701DAF89E79988255A0D27D3E39AEBB353D7B945E664C5A0747A4DE7A51612521D8986E09E680D92273420359BC5DDE0752BC29584821FC619BE15D7B921DBF7C037FA79E6E2BFAEB3A05B088A935C860F9CE2D342242D63B0D8DC9217BA492534187EA40108E53A0FC0D26BF54CA32CE827E9D553E62F845848113E0856E014174F8F446E40A3C8A2ED762962E91BF24CBD2A86F646564A6A6860A5C0FFC7D5EBC695C16601FE33B9842BA5257051B0BB44911F3125B76838344CCB283C3C4E8B486C8FD3228A87C4E98552C2A7A918F5402D4568EA74C50367AF3C994B4A4DD02D18A434C2B044DE33F71BCB4A5D14CB9758512C72F35E9253AFA691FD20B1826A42914E5DD9E410B6BAE571627DCCDFA7CA83C6943E21BA046DBAB632B621BCA57E934091C22CFCDC9C067A4D57834615433598D6203313429F8F4B912B69BDA1340AAFD66894729A29A7A95B4B2897BEACDA202FEB838A7EC9EB6898A637248A306BD41AA8FCC45966DDD3FCCD727C771166343C5FB53419A5B42527CC826403C62DB2464917542A8DA986AC489259E64168813522B723A80A56CDE0B49D55C45A019FFC9FE1D8DD8E895ED96E81EA8498C253CDC072B18D98F6AD8411D9524CE682C521EF2A48FBB08BF250A7509CD954A69E21BD691DCF328F11A7A6B507F9227F3987BA22CB06E33DD181F73938A28B8A5986EBD4CCBBD7776F3349B5F8B8CAC37B3C5901B53AACFDFD2449B6AD013613B66D9341BEC67E3025D7E6F3C42A25EFB162E535E070B13242E3E432CB89ED4CABAA9820652895D5C5A822D33CA3F7CFE6568ACF405C6CF8C50B1A0BD3FB72A73484930460B2FC85CD19C5E0AD006E08A76B503AEBF45D9C924F8D29FFF399B83DA5023668EC7EF561852636ED1D47FA3AFDBDF3097F2112B394FC2A24DBAFEBB4EC1964E42CF91FB7D6D0892D403975FFC436CEF88707ECDEBCDA0ADE95EFFA5D57E75573A135E65CF300B633F7D714EDDCB9FEE9A9C23C72EE24269C73E7D8F96DB4731BD28F96A0401D21C281636E6BAD34A798FEF1F6C4AAD177FC121868702EFC2CFDCE89F249601B2EA95C7BB91703A429C3A0A9385925C31A64F24609C312874F048B9CD50DDD4BCA7D1A11D6D0DB2ED543324BA25449CFBCB984087892325A541CC26E7F775252376CDC6783CEE5415FF8B4F5343507B6F8AEDD6DFFBA001AE1D2D78FA07D8DE4270FA1F6FD933DEC0F5930EDD92F659D2456BD55E2EA2C4F8ED93D75AF9EDA28B76FA55A09774ADEB8ED64D2B526EADF80958BAB9E4558C7BC6457016B9EEEDD7F3575B706BBE1ABAF610A175BB63E85DB27B196BC65EF725E4FE511DB3E7BFEC2F75AFB828A3943D14D4522F99ECAC16FBCD412E69AAF4591350C890A10A3D9B9014DB0D9241752D335F1355EFBA054FA75E2236131825C852B08AEF95DACA358A3CA10AE58E37B479278F6F14F579A4D99A77751FA11E153A88062D2A45FBEE3DFC79405A5DC8B964EAB834492D1F2F120F1A54EC684CDAEA4742BF84042B9F9CA44FC0861C49098BAE34BF20287C8F641C17BD8107F578CD1DD44FA1DD134FBF492928D24A1CA6954F8F813633808B76FFF01425FD48548200000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201802021901562_ModificaRelacioTablasnVideoGeneroMuchosAUno'
BEGIN
    IF object_id(N'[dbo].[FK_dbo.VideoGeneros_dbo.Video_RefVideoId]', N'F') IS NOT NULL
        ALTER TABLE [dbo].[VideoGeneros] DROP CONSTRAINT [FK_dbo.VideoGeneros_dbo.Video_RefVideoId]
    IF object_id(N'[dbo].[FK_dbo.VideoGeneros_dbo.Genero_RefGeneroId]', N'F') IS NOT NULL
        ALTER TABLE [dbo].[VideoGeneros] DROP CONSTRAINT [FK_dbo.VideoGeneros_dbo.Genero_RefGeneroId]
    IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_RefVideoId' AND object_id = object_id(N'[dbo].[VideoGeneros]', N'U'))
        DROP INDEX [IX_RefVideoId] ON [dbo].[VideoGeneros]
    IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_RefGeneroId' AND object_id = object_id(N'[dbo].[VideoGeneros]', N'U'))
        DROP INDEX [IX_RefGeneroId] ON [dbo].[VideoGeneros]
    ALTER TABLE [dbo].[Video] ADD [GeneroId] [int] NOT NULL DEFAULT 0
    CREATE INDEX [IX_GeneroId] ON [dbo].[Video]([GeneroId])
    ALTER TABLE [dbo].[Video] ADD CONSTRAINT [FK_dbo.Video_dbo.Genero_GeneroId] FOREIGN KEY ([GeneroId]) REFERENCES [dbo].[Genero] ([Id]) ON DELETE CASCADE
    DROP TABLE [dbo].[VideoGeneros]
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201802021901562_ModificaRelacioTablasnVideoGeneroMuchosAUno', N'PrácticaEF.Migrations.Configuration',  0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB545D64AB297D6B077913A76617413075112F416D0D2D8214A912A4905368A3E4C9FA3871EFA407D858EFE25D23FB291045BB4C82526E77FBE19CED87FFFF1E7E0E32A62CE334845051FBA67BD53D7011E8890F2E5D04DF4E2DDB7EEC70F5F7E311887D1CA7928E9DEA774C8C9D5D07DD23AEE7B9E0A9E2022AA17D1400A2516BA1788C823A1F0CE4F4FBFF3CECE3C40112ECA729CC16DC2358D20FB801F47820710EB84B02B110253C539DEF89954E79A44A06212C0D0BD917FFD1E681A90F1C4752E182568820F6CE13A8473A1894603FBF70A7C2D055FFA311E1076B78E01E9168429280CEFD7E45D7D383D4F7DF06AC6525490282DA203059EBD2F82E299EC4785D6AD8286611B6378F53AF53A0BDDD0FD013848E13AA6AAFE88C994AC15D75E4E7DE234CE4EAAE42346D2BF136794309D48187248B4240CC99339A3C18FB0BE133F031FF284B1A6556817DEB50EF0E8468A18A45EDFC2A2B0751ABA8ED7E6F34CC68AADC193FB31E5FAFDB9EB5CA37232675025BDE1B3AF8584CC47A221BC215A83E4A90CC8C2666937745D8B682EA1D48738C35A719D2BB2FA047CA99F862EFEEB3A13BA82B03C296CB8E7144B0B99B44CC052734D9EE932B3D050F8404310CA756E8165D7EA89C639E87BD9D56399DD8914D1AD60254B71FE7847E412341A2C365CFA22918161CCC0AB01B4135699A4AEA8CA88FF07D5DB82CA503381E0895CC25869095C94EA2ED1E43BECC71B3CDC2D2EC7D0FE3875457A09E463915E827923D2CB32E882F40BA54440331B9A502FF5B7DD19F3D0D9654C9ED2CA094C2B829CC6086BD43C74BFB1E2B3456055C7B5C0321E6D8967AE5910337E090C34381741FE408D880A4868A706E311B64FB08640A620260CDF69040EA15CDB0547794063C276D86DF0742CD3D4A64ABA79730931F0B4C276C4BF8BDA1AC7B6F24A8711A87D7119780D10D95D14793472806CE22B3D8495DED05171A2299AAA2A2ADD844C2AD407DDF2081F8D1ADF06642CCCB505948F8EC55F60D8606FF86AC8A86AB641B2A9A6CDC0EFA9AACADEDA542B777BEAA821A20A97590E6DBF36748E2A8FF5D0EAE5536B39DD7A5BC6DBC11589636CF38D71B73871FC7CD61DBDF30F9F05A35C8617A80D2361656DA5099F2DB204E31655A3A5132A95C6B781CC49DAC447616491B550BB0550A5AA3630ED5C95382BE9D3FF731E7B36DD50D505DB04DD89D28E903DC8568A6DC66CCB208CC80DAFFF48B024E2DB5BD376EEF23D6F4A28CF6C2903CFB0DEEA425678ACB6DD8E76A75C1485736C2AF24E707826B6F07D0E89D826C59C9B9AD2CCBBEE52EB67A7296FFB63F4CA40B15A9A495269AF5A9BD1C206453BD9BFC65BFD252771713D10CF880FEC2DFE5A69887A2941CFFF858D18457F6B822BC2E90294CEF7021717EA73E30B81CF6739F7940A59A70DFDCD571B9AC674EFF272E05ED0DE66F833915822F2AB88ACBE6ECAB237960337CFFF78B4BAEE7721DAA95F62BFCBDCB766D3298EC7ABA1FB6BC6D477A63F3D967C27CE4C62A9F69D53E7B73DCA5F78132B87CEB7DD958C81F398DDEFA8756BEB50F43A1BD6BF65A7B287D82E4BD38E9D297FA4B0A0E6696E732C1FB24F6D5FA736497EFB4DAB1D80E6D8BC77B9B237B2D759A6EC090361D3F8390111ABE8B21691FEB8C0216801A6A299F28528916B585492181DF10A34C1764A2EA4A60B1268BC0E40A9ECDBBA07C2122419477308A77C96E838D1E8324473D6FAFE2FC5FF2EFDD9C6D8B679308BB3EFC35EC2053493A62FC28C7F9F501656764F3634E52D22D2C22A1EC034973A7D0897EB4AD2B5E01D0515E1ABFAC11D443143616AC67DF20CC7D876AFE0132C49B02E07C5ED42F627A21DF6C125254B492255C8A8F9F12362388C561FFE01861AF5B6551B0000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201802021910323_AñadidaColumnaClasificaciónALaTablaVideo'
BEGIN
    ALTER TABLE [dbo].[Video] ADD [Clasificacion] [tinyint] NOT NULL DEFAULT 0
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201802021910323_AñadidaColumnaClasificaciónALaTablaVideo', N'PrácticaEF.Migrations.Configuration',  0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB545D6B2B39736B077913A7161741D077176D1DB8296C60E518A54492AB051F461FA1C3DF4D007EA2B74A87F9196ED18D9608B16B944E4CC37C3F9E30CFDF71F7F0EDF6E62E63D825454F0913FE8F57D0F782822CAD7233FD5AB57DFFA6FDF7CF9C5F03A8A37DE8792EEB5A1434EAE46FE83D6C94510A8F00162A27A310DA55062A57BA188031289E0BCDFFF2E180C0240081FB13C6F7897724D63C83EF0732C7808894E099B8908982AD6716791A17A37240695901046FEADFCEBF750D3905C4F7CEF9251822A2C80AD7C8F702E34D1A8E0C57B050B2D055F2F125C20EC7E9B00D2AD085350287E51931F7B86FEB939435033965061AAB4889F0838785D1825B0D94F32AD5F190DCD768DE6D55B73EACC7423FF07E02085EFD9A22EC64C1AB2965D7B39F599D7583BAB9C8F3162FECEBC71CA742A61C421D59230244F978C863FC2F65EFC0C7CC453C69A5AA15EB8D75AC0A55B2912907A7B07AB42D769E47B419B2FB0192BB6064F7E8E29D7AFCF7DEF0685932583CAE98D332FB490909D9168886E89D620B9C180CC6C8E744BD68D8897124A791867982BBE37239B77C0D7FA61E4E3BFBE37A11B88CA954287F79C626A2193962938626EC8235D671A5A023FD00884F2BD3B60D9B67AA0491EF4BD6CEB63E9DD8914F19D60254BB1FEF19EC835685458ECD85C8854869632C3A00EA0BD6195211D1B5519F1FF41F5B24165899940F840AEE05A69095C94E2AE50E57BACC73B4EB81F2E8FA1C376DA8F326644D11546449815BFC20426BCAD9D43B89D195426C8A9195426C9CE0C2AD3EBB80C4AE346FE58E79BAA0923EBFAA23A2EAF5A20CF925F18531148B6C518CCC57DBFD56065DD0CE225C8E21CB76856E27B1F084BF1ABEF38A6453C37862E4807FB490D2EE535F9B96BE5DC9ECDC54BA54448338335CB54E9E3B6B86B1E79FB1C5EC76251EB6668409AA0C9D0BB23FF1B47FF0EC0AA06D78065CCB51107BE5DCCE6FC0A1868F02EC3BCB918131592C80D7FB446D45EC1FA07D21420C2B0C7C2A427946BB758521ED284B03D7A5B3C479658A353856EEF5C4102DC54C73DF63F466C5D835CE1950CCB5087EC320C1A41E4DE80C8A391A30AD34C75B3081BBD236BB11B2D12571555DA0E1903BA00DD3A115EF8750DB142C689B93640D93038FC450C5BEC8DB35A18555D6C90ECAA9BB6E10F6455A56FADAAE3BB0379D480A8CC65A743FB5C3BAA73E5C77AE008F289A39C4C828ED16438234982E5B131AA142BDE229F53C6AF164FEFE3E31C2308D58E76BED2B692842D075983B58BA251D309954AE3BD4E96C4DC24E32876C85A51DB1150A5A87660BABE2AE3ACA437FF1725DC992B766475C136C1E3C4A62264CD94E36297319B1009237247E736162C8D797769EAE62E7BB12642B9E6A20C034B7BA70A39E671CA76DBDA47F9A2489C535D915782A77BA283EF737044178ADDF336D1ECBDE351EB6BA789D77D197523594D6013CEDA7AE1E073CAA44D5249AFCAA555168745893AFCACE3D4AC9CC4C776563C62CC61BD5A6C9586B867087A8B5FD898513C6F4D30239CAE40E9BC8FF5CFFB8373EB81E8F379AC09948AD8512F362F3EEA5263D383C3EC1327BCF674CB1F89C4B4935FC564F37513CB9D609FF812F11FB7D6B1F37E847AEAE798F7B3E33BFDEE145BEECDC8FF3563BAF0A63F7D2CF9CEBCB9C454BDF0FADE6FCFF34C80E3E136D3622F5857189D382A965DF1CB0E7356477CCA707AD23CD8D9B57D9A11F0DF32F4B95DF63153DD9EA12EBFF1303B97C6B7792C3F65E0EB9EF77621BFFC28D83640B3AF3F38FDB923E3A799F6DC7605C3A6F15B1546ACA2EB1AC2FC72C5216C054C4533E52B5146AEA551496255B8196882B5995C4A4D5724D4B81D8252D95370F102761D2F219AF279AA9354E391215EB2D6E3B289FF7DF2B391B6ADF3709E648FA2CF710454939AEB65CEBF4F298B2ABD273B8A72078449ACE23635BED4E6565D6F2BA41BC18F042ACC57D5837B881386606ACE17E4114ED1EDBD8277B026E1B6EC3ABB410E3BA26DF6E115256B49625560D4FCF889311CC59B37FF00CF2E821FB21D0000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201802021959089_UsandoFluentAPIParaControlarLaDB'
BEGIN
    DECLARE @var0 nvarchar(128)
    SELECT @var0 = name
    FROM sys.default_constraints
    WHERE parent_object_id = object_id(N'dbo.Genero')
    AND col_name(parent_object_id, parent_column_id) = 'Nombre';
    IF @var0 IS NOT NULL
        EXECUTE('ALTER TABLE [dbo].[Genero] DROP CONSTRAINT [' + @var0 + ']')
    ALTER TABLE [dbo].[Genero] ALTER COLUMN [Nombre] [nvarchar](255) NOT NULL
    DECLARE @var1 nvarchar(128)
    SELECT @var1 = name
    FROM sys.default_constraints
    WHERE parent_object_id = object_id(N'dbo.Video')
    AND col_name(parent_object_id, parent_column_id) = 'Nombre';
    IF @var1 IS NOT NULL
        EXECUTE('ALTER TABLE [dbo].[Video] DROP CONSTRAINT [' + @var1 + ']')
    ALTER TABLE [dbo].[Video] ALTER COLUMN [Nombre] [nvarchar](255) NOT NULL
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201802021959089_UsandoFluentAPIParaControlarLaDB', N'PrácticaEF.Migrations.Configuration',  0x1F8B0800000000000400ED59CD6EE33610BE17E83B083A1659CBF6628136B0779175E2C2E83A0EE224E82DA0A5B143942255920A6C147D983E470F3DF481FA0A1DFD4BA4E53F64D32DB0C8252267BE19CE1F67E87FFEFC6BF0611D32E719A4A2820FDD5EA7EB3AC07D1150BE1ABAB15EBEF9DEFDF0FEDB6F065741B8761E0ABAB7091D727235749FB48ECE3D4FF94F1012D509A92F85124BDDF145E8914078FD6EF707AFD7F300215CC4729CC16DCC350D21FDC0CF91E03E443A266C2A02602A5FC79D798AEA5C931054447C18BA37F2EF3F7C4D7D7235769D0B4609AA3007B6741DC2B9D044A382E7F70AE65A0ABE9A47B840D8DD2602A45B12A62057FCBC223FF40CDD7E7206AF622CA0FC5869111E09D87B9B1BC533D94F32AD5B1A0DCD7685E6D59BE4D4A9E986EE8FC0410AD731459D8F984CC81A76ED64D4674E6DEDAC743EC648F277E68C62A66309430EB196842179BC60D4FF093677E217E0431E3356D70AF5C2BDC6022EDD481181D49B5B58E6BA4E02D7F19A7C9EC958B2D578B2734CB87EDB779D6B144E160C4AA7D7CE3CD742427A46A221B8215A83E40906A466B3A41BB2AE45B89050C8C338C35C719D29597F02BED24F43B7FFEE9DEB8CE91A826225D7E19E534C2D64D232862D3A1A72AFC9335DA52A1B1A3CD00084729D5B60E9B67AA25196059D74EBB170F7588AF056B082255F7FBC2372051A4F20B66CCE452C7D4399815745D4CE384B910E0DB394F86B94FDC75166C81D83FF442EE14A69095C14F22FF10C7758B18F86CB826ABFE176A38C1851748921E2A7E531B74912EFC6CEC9295564CCA9295564CDD6942AF2EDB0948AC35A4219E79BA83123ABEA2A3B2CD11A202F927018640148B6C1A0CCC47DDC6830D2700AE102647E8E1B342B719D07C262FCEA5A8E6910CF1243E7A4BDDDA4092EE51579DFB67266CFFAE28552C2A7A9C1EA75ABF07153DC150F9C5D0EAF62312F7E5334208DD064E8DDA1FB9DA57F0B6059942BC022E69A883DD7AC6E337E090C3438177ED67E8C88F24960873F5A2368AE604104995424C2B00BC3A427946BBB7A52EED388B01D7A1B3C07D6DC44A712DDDCB9840878522E77D8FF10B1550DB28597320C43EDB3CBC0AB05917D25228F468E324C53D5934558EB2D598BFD6A9EB82A2FDB66C824A073D08D13610750D5102364AC986B02141D84C59FC7B0C15E3BAB8151D6C51AC9B6BA691A7E4F5695FA56AA5ABEDB93473588D25C663A34CFB5A53A977EAC46122F9B498AD9C56B195E06531245581E6BC34CBEE2CCB34966F4667E7CA71F66189EAFB634FCA5B6A524EC41C80A8C5D148D9A8EA9541AEF75B220C94D320A428BAC11B52D0155886A06A6EDAB22CE0AFAE4FFBC845B93C796ACCED9C6789C30A908697765B9D8664C6748C288DCD2CA8D048B43DE5E9ADAB98BE6AC8E50ACD92803CFD0DEAA429679ACB2DDB4F641BEC813E754576495E0784FB4F07D098E6843317BDE3A9AB977386A75EDD4F1DA2FA37624A309ACC3195BAF1C7C569934494AE965B934CAE2202F51FB1F7EAC9A9591B8D8CE8A678C39AC57F38DD210761282CEFC57366214CF5B114C09A74B503AEB63DD7EB7D7379E90BE9CE71C4FA9801DF4A6F3EAB32F4D6CBA77BA3D72C26B8EBBFC99484C3B690FBC3B618F7CA6F86AB9A3DF0102D459BFC43B406A0AAB0F9E602BBE1EBABFA54CE7CEE4E7C782EFCC99494CE173A7EBFCFE32CF0738366E522D4E0AA91347C8A25B7EDD21CFE8944F195A4F9A135BBBB9CF331AFE5F8641BBFB3E64DADB31EC65372166E722F16D16CBC70C82ED73E036E4D71F119B06A8F7FB7BA7427B94FC3C53A0DDC660D8D47EE5C2885574554124BF7971F01B0153D24CF85214916B68549018156E0A9A606D261752D325F1356EFBA054FA669CBF8C5D850B08267C16EB28D678640817ACF10A9DC4FF2EF9E9A8DBD479308BD2C7D2973802AA4993EB65C63FC69405A5DEE32D45B9052249ACFC664D7CA9931B76B52991AE053F1028375F590FEE208C1882A9199F93673845B77B059F6045FC4DD18DB683EC7744D3EC834B4A5692842AC7A8F8F113633808D7EFFF05DB685994EC1D0000 , N'6.2.0-61023')
END

