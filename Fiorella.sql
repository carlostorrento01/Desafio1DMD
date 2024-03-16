Create database DBfiorella;

USE DBfiorella;

SELECT * FROM SanMiguel;

-- Contar los productos más populares en SantaAna, SanSalvador y SanMiguel sin desagregar
SELECT
    'SantaAna' AS Departamento,
    'El Salvador' AS Pais,
    COUNT(CASE WHEN [Rosas] = 1 THEN 1 END) AS TotalRosas,
    COUNT(CASE WHEN [Claveles] = 1 THEN 1 END) AS TotalClaveles,
    COUNT(CASE WHEN [Macetas] = 1 THEN 1 END) AS TotalMacetas,
    COUNT(CASE WHEN [Tierra] = 1 THEN 1 END) AS TotalTierra,
    COUNT(CASE WHEN [Girasoles] = 1 THEN 1 END) AS TotalGirasoles,
    COUNT(CASE WHEN [Tarjetas] = 1 THEN 1 END) AS TotalTarjetas,
    COUNT(CASE WHEN [Orquidias] = 1 THEN 1 END) AS TotalOrquideas,
    COUNT(CASE WHEN [Carmesi] = 1 THEN 1 END) AS TotalCarmes,
    COUNT(CASE WHEN [Lirios] = 1 THEN 1 END) AS TotalLirios,
    COUNT(CASE WHEN [Aurora] = 1 THEN 1 END) AS TotalAurora,
    COUNT(CASE WHEN [Tulipanes] = 1 THEN 1 END) AS TotalTulipanes
FROM SantaAna

UNION ALL

SELECT
    'SanSalvador' AS Departamento,
    'El Salvador' AS Pais,
    COUNT(CASE WHEN [Rosas] = 1 THEN 1 END) AS TotalRosas,
    COUNT(CASE WHEN [Claveles] = 1 THEN 1 END) AS TotalClaveles,
    COUNT(CASE WHEN [Macetas] = 1 THEN 1 END) AS TotalMacetas,
    COUNT(CASE WHEN [Tierra] = 1 THEN 1 END) AS TotalTierra,
    COUNT(CASE WHEN [Girasoles] = 1 THEN 1 END) AS TotalGirasoles,
    COUNT(CASE WHEN [Tarjetas] = 1 THEN 1 END) AS TotalTarjetas,
    COUNT(CASE WHEN [Orquidias] = 1 THEN 1 END) AS TotalOrquideas,
    COUNT(CASE WHEN [Carmesi] = 1 THEN 1 END) AS TotalCarmes,
    COUNT(CASE WHEN [Lirios] = 1 THEN 1 END) AS TotalLirios,
    COUNT(CASE WHEN [Aurora] = 1 THEN 1 END) AS TotalAurora,
    COUNT(CASE WHEN [Tulipanes] = 1 THEN 1 END) AS TotalTulipanes
FROM [dbo].[SanSalvador]

UNION ALL

SELECT
    'SanMiguel' AS Departamento,
    'El Salvador' AS Pais,
    COUNT(CASE WHEN [Rosas] = 1 THEN 1 END) AS TotalRosas,
    COUNT(CASE WHEN [Claveles] = 1 THEN 1 END) AS TotalClaveles,
    COUNT(CASE WHEN [Macetas] = 1 THEN 1 END) AS TotalMacetas,
    COUNT(CASE WHEN [Tierra] = 1 THEN 1 END) AS TotalTierra,
    COUNT(CASE WHEN [Girasoles] = 1 THEN 1 END) AS TotalGirasoles,
    COUNT(CASE WHEN [Tarjetas] = 1 THEN 1 END) AS TotalTarjetas,
		COUNT(CASE WHEN [Orquidias] = 1 THEN 1 END) AS TotalOrquideas,
    COUNT(CASE WHEN [Carmesi] = 1 THEN 1 END) AS TotalCarmes,
    COUNT(CASE WHEN [Lirios] = 1 THEN 1 END) AS TotalLirios,
    COUNT(CASE WHEN [Aurora] = 1 THEN 1 END) AS TotalAurora,
    COUNT(CASE WHEN [Tulipanes] = 1 THEN 1 END) AS TotalTulipanes
FROM [dbo].[SanMiguel]

-- Combinaciones de productos más populares en SanSalvador
SELECT
   'SanSalvador' AS Departamento,
    'El Salvador' AS Pais,
    'Combinación de SanSalvador' AS Categoria,
    STUFF((
        SELECT ', ' + Nombre
        FROM (
            SELECT 'Rosas' AS Nombre, SanSalvador.[Rosas] AS Presente UNION ALL
            SELECT 'Claveles', SanSalvador.[Claveles] UNION ALL
            SELECT 'Macetas', SanSalvador.[Macetas] UNION ALL
            SELECT 'Tierra', SanSalvador.[Tierra] UNION ALL
            SELECT 'Girasoles', SanSalvador.[Girasoles] UNION ALL
            SELECT 'Hortensia', SanSalvador.[Hortensia] UNION ALL
            SELECT 'Globos', SanSalvador.[Globos] UNION ALL
            SELECT 'Tarjetas', SanSalvador.[Tarjetas] UNION ALL
            SELECT 'Orquidias', SanSalvador.[Orquidias] UNION ALL
            SELECT 'Carmesi', SanSalvador.[Carmesi] UNION ALL
            SELECT 'Lirios', SanSalvador.[Lirios] UNION ALL
            SELECT 'Aurora', SanSalvador.[Aurora] UNION ALL
            SELECT 'Tulipanes', SanSalvador.[Tulipanes] UNION ALL
            SELECT 'Liston', SanSalvador.[Liston]
        ) AS Productos
        WHERE Presente = 1
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Combinacion,
    COUNT(*) AS TotalVentas
FROM SanSalvador
GROUP BY
    SanSalvador.[Rosas],
    SanSalvador.[Claveles],
    SanSalvador.[Macetas],
    SanSalvador.[Tierra],
    SanSalvador.[Girasoles],
    SanSalvador.[Hortensia],
    SanSalvador.[Globos],
    SanSalvador.[Tarjetas],
    SanSalvador.[Orquidias],
    SanSalvador.[Carmesi],
    SanSalvador.[Lirios],
    SanSalvador.[Aurora],
    SanSalvador.[Tulipanes],
    SanSalvador.[Liston]
HAVING COUNT(*) > 0
ORDER BY TotalVentas DESC;

-- Combinaciones de productos más populares en SanMiguel
SELECT
    'SanMiguel' AS Departamento,
    'El Salvador' AS Pais,
    'Combinación' AS Categoria,
    STUFF((
        SELECT ', ' + Nombre
        FROM (
            SELECT 'Rosas' AS Nombre, SanMiguel.[Rosas] AS Presente UNION ALL
            SELECT 'Claveles', SanMiguel.[Claveles] UNION ALL
            SELECT 'Macetas', SanMiguel.[Macetas] UNION ALL
            SELECT 'Tierra', SanMiguel.[Tierra] UNION ALL
            SELECT 'Girasoles', SanMiguel.[Girasoles] UNION ALL
            SELECT 'Hortensia', SanMiguel.[Hortensia] UNION ALL
            SELECT 'Globos', SanMiguel.[Globos] UNION ALL
            SELECT 'Tarjetas', SanMiguel.[Tarjetas] UNION ALL
            SELECT 'Orquidias', SanMiguel.[Orquidias] UNION ALL
            SELECT 'Carmesi', SanMiguel.[Carmesi] UNION ALL
            SELECT 'Lirios', SanMiguel.[Lirios] UNION ALL
            SELECT 'Aurora', SanMiguel.[Aurora] UNION ALL
            SELECT 'Tulipanes', SanMiguel.[Tulipanes] UNION ALL
            SELECT 'Liston', SanMiguel.[Liston]
        ) AS Productos
        WHERE Presente = 1
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Combinacion,
    COUNT(*) AS TotalVentas
FROM SanMiguel
GROUP BY
    SanMiguel.[Rosas],
    SanMiguel.[Claveles],
    SanMiguel.[Macetas],
    SanMiguel.[Tierra],
    SanMiguel.[Girasoles],
    SanMiguel.[Hortensia],
    SanMiguel.[Globos],
    SanMiguel.[Tarjetas],
    SanMiguel.[Orquidias],
    SanMiguel.[Carmesi],
    SanMiguel.[Lirios],
    SanMiguel.[Aurora],
    SanMiguel.[Tulipanes],
    SanMiguel.[Liston]
HAVING COUNT(*) > 0
ORDER BY TotalVentas DESC;



-- Combinaciones de productos más populares en SantaAna
SELECT
    'SantaAna' AS Departamento,
    'El Salvador' AS Pais,
    'Combinación' AS Categoria,
    CONCAT_WS(',',
        CASE WHEN [Rosas] = 1 THEN 'Rosas' ELSE NULL END,
        CASE WHEN [Claveles] = 1 THEN 'Claveles' ELSE NULL END,
        CASE WHEN [Macetas] = 1 THEN 'Macetas' ELSE NULL END,
        CASE WHEN [Tierra] = 1 THEN 'Tierra' ELSE NULL END,
        CASE WHEN [Girasoles] = 1 THEN 'Girasoles' ELSE NULL END,
        CASE WHEN [Hortensia] = 1 THEN 'Hortensia' ELSE NULL END,
        CASE WHEN [Globos] = 1 THEN 'Globos' ELSE NULL END,
        CASE WHEN [Tarjetas] = 1 THEN 'Tarjetas' ELSE NULL END,
        CASE WHEN [Orquidias] = 1 THEN 'FOrquídias' ELSE NULL END,
        CASE WHEN [Carmesi] = 1 THEN 'Carmesí' ELSE NULL END,
        CASE WHEN [Lirios] = 1 THEN 'Lirios' ELSE NULL END,
        CASE WHEN [Aurora] = 1 THEN 'Aurora' ELSE NULL END,
        CASE WHEN [Tulipanes] = 1 THEN 'Tulipanes' ELSE NULL END,
        CASE WHEN [Liston] = 1 THEN 'Liston' ELSE NULL END
    ) AS Combinacion,
    COUNT(*) AS TotalVentas
FROM SantaAna
WHERE
    [Rosas] = 1 OR
    [Claveles] = 1 OR
    [Macetas] = 1 OR
    [Tierra] = 1 OR
    [Girasoles] = 1 OR
    [Hortensia] = 1 OR
    [Globos] = 1 OR
    [Tarjetas] = 1 OR
    [Orquidias] = 1 OR
    [Carmesi] = 1 OR
    [Lirios] = 1 OR
    [Aurora] = 1 OR
    [Tulipanes] = 1 OR
    [Liston] = 1
GROUP BY
    [Rosas],
    [Claveles],
    [Macetas],
    [Tierra],
    [Girasoles],
    [Hortensia],
    [Globos],
    [Tarjetas],
    [Orquidias],
    [Carmesi],
    [Lirios],
    [Aurora],
    [Tulipanes],
    [Liston]
HAVING COUNT(*) > 0
ORDER BY TotalVentas DESC;