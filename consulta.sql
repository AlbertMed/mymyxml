   
SELECT     U_Starus , Anio, semana, Semana_A, SUM(VENCIDOS) AS VENCIDOS, SUM(semanaA) AS SemanaA, RIGHT(Anio, 1) * 100 AS Programa,SUM(semana1) AS Semana1, 
                      SUM(semana2) AS Semana2, SUM(semana3) AS Semana3, SUM(semana4) AS Semana4, SUM(semana5) AS Semana5, SUM(semana6) AS Semana6, SUM(semana7) 
                      AS Semana7, SUM(semana8) AS Semana8, SUM(semana9) AS Semana9, SUM(semana10) AS Semana10, SUM(semana11) AS Semana11, SUM(semana12) 
                      AS Semana12, SUM(semana13) AS Semana13, SUM(semana14) AS Semana14, SUM(semana15) AS Semana15, SUM(semana16) AS Semana16, SUM(semana17) 
                      AS Semana17, SUM(semana18) AS Semana18, SUM(semana19) AS Semana19, SUM(semana20) AS Semana20, SUM(semana21) AS Semana21, SUM(semana22) 
                      AS Semana22, SUM(CADENAS) AS Cadenas, SUM(TUTTO_PELLE) AS Tutto_pelle, SUM(RUTAS) AS Rutas, SUM(CINES) AS Cines, SUM(RESTO) AS Resto, 
                      prueba AS finsemana
     FROM         (SELECT   BP.U_Starus  , DATEPART(YY, GETDATE()) AS Anio, DATEPART(iso_week, GETDATE()) AS Semana_A,
                             CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE() )  as semana,
                             (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE() )) + 11 AS ssm,
                             CONVERT(int, SUBSTRING(CAST(DATEPART(YY, '31/12/2013') AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, '31/12/2013') As fss,
                             CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + 101 as tonces ,
                            CASE WHEN BP.OP IS NULL THEN datepart(iso_week, BP.FechaEntregaPedido) ELSE datepart(iso_week, BP.FENTREGA) END AS SEMANA_REG, 
                            7 - DATEPART(W, GETDATE()) AS Faltafinsemana, 
                            GETDATE() + (7 - DATEPART(W, GETDATE())) AS Finsemana, 
                            CONVERT(char, GETDATE() + (7 - DATEPART(W, GETDATE())), 103) AS prueba, BP.OP, BP.FENTREGA, 
                                    CASE WHEN BP.SEMANA2  < (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE() ))  THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS VENCIDOS, 
                                    CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE() ))  THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semanaA,                                     
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 1, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 1, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana1,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 2, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 2, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana2,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 3, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 3, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana3,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 4, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 4, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana4,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 5, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 5, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana5,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 6, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 6, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana6,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 7, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 7, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana7,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 8, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 8, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana8,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 9, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 9, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana9,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 10, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 10, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana10,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 11, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 11, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana11,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 12, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 12, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana12,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 13, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 13, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana13,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 14, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 14, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana14,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 15, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 15, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana15,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 16, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 16, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana16,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 17, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 17, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana17,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 18, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 18, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana18,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 19, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 19, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana19,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 20, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 20, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana20,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 21, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 21, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana21,
                                    CASE WHEN BP.SEMANA2  =  (SUBSTRING( CAST(year(DATEADD(week, 22, GETDATE())) as nvarchar(5)), 3, 2) * 100 + DATEPART(ISO_WEEK, DATEADD(week, 22, GETDATE()))) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END semana22,
                                    
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+1) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana1,                                     
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+2) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana2, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+3) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana3, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+4) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana4, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+5) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana5, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+6) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana6, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+7) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana7, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+8) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana8, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+9) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana9, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+10) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana10, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+11) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana11, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+12) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana12, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+13) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana13, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+14) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana14,
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+15) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana15, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+16) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana16, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+17) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana17, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+18) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana18, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+19) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana19, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+20) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana20, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+21) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana21, 
                                    --CASE WHEN BP.SEMANA2  = (CONVERT(int, SUBSTRING(CAST(DATEPART(YY, GETDATE ()) AS varchar(4)), 3, 2)) * 100 + DATEPART(iso_week, GETDATE())+22) THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS semana22, 
                                    
                                    CASE OCRG.GroupName WHEN 'CADENAS' THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS CADENAS, 
                                    CASE OCRG.GroupName WHEN 'TUTTO PELLE' THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS TUTTO_PELLE, 
                                    CASE OCRG.GroupName WHEN 'RUTAS' THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS RUTAS, 
                                    CASE OCRG.GroupName WHEN 'PROYECTOS' THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS CINES, 
                                    CASE WHEN (OCRG.GroupName <> 'CADENAS' AND OCRG.GroupName <> 'TUTTO PELLE' AND OCRG.GroupName <> 'RUTAS' AND 
                                              OCRG.GroupName <> 'PROYECTOS') THEN SUM(BP.Cantidad * BP.VSInd) ELSE 0 END AS RESTO, 
                                    CASE WHEN OP IS NULL AND Tipo = 'W' THEN 'S' ELSE 'N' END AS QUITAR
                       FROM          dbo.VwBackOrderProgramadoOP AS BP INNER JOIN
                                              dbo.OCRD AS O ON BP.CODIGO_CLIENTE = O.CardCode LEFT OUTER JOIN
                                              dbo.OCRG ON O.GroupCode = dbo.OCRG.GroupCode
                       WHERE      (BP.OP IS NOT NULL)
                       GROUP BY BP.U_Starus, OCRG.GroupName , DATEPART(iso_week, BP.FechaEntregaPedido), BP.OP, BP.FENTREGA, BP.Cantidad, BP.Tipo, SEMANA2 ) AS T0
            WHERE     (QUITAR = 'N')
            GROUP BY U_Starus , semana, Semana_A, Anio, prueba
