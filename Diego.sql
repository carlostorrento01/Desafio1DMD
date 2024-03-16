Create database DBdiego;

USE DBdiego;

/*drop database DBdiego;*/

SELECT * FROM SpaCentro;
SELECT * FROM SpaEscalon;
SELECT * FROM SpaSantaTecla;
--CONSULTAS PARA FIDELIZACION DE SPAS

--PERSONAS QUE USAN LOS GRUPOS POR SUCURSALES (SAUNA,MASAJE,HIDRO Y YOGA)
--SUCURSAL DEL CENTRO

SELECT 'Sauna' AS SPACENTRO,COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaCentro
UNION ALL
SELECT 'Masaje' AS grupo,COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaCentro
UNION ALL
SELECT 'Hidro' AS grupo,COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaCentro
UNION ALL
SELECT'Yoga' AS grupo,COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaCentro
ORDER BY cantidad DESC;

--SUCURSAL DEL ESCALON

SELECT 'Sauna' AS SPAESCALON,COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaEscalon
UNION ALL
SELECT 'Masaje' AS grupo,COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaEscalon
UNION ALL
SELECT 'Hidro' AS grupo,COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaEscalon
UNION ALL
SELECT'Yoga' AS grupo,COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaEscalon
ORDER BY cantidad DESC;

--SUCURSAL DEL ESCALON

SELECT 'Sauna' AS SPASANTATECLA,COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaSantaTecla
UNION ALL
SELECT 'Masaje' AS grupo,COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaSantaTecla
UNION ALL
SELECT 'Hidro' AS grupo,COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaSantaTecla
UNION ALL
SELECT'Yoga' AS grupo,COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS cantidad FROM SpaSantaTecla
ORDER BY cantidad DESC;

--PERSONAS QUE USAN LOS GRUPOS EN TODA LA EMPRESA (SAUNA,MASAJE,HIDRO Y YOGA)
-------------------------------------------------------------------------
SELECT 'Total' AS "Total de personas en el grupo",
       SUM(Cantidad_Sauna) AS T_sauna,
       SUM(Cantidad_Masaje) AS T_Masaje,
       SUM(Cantidad_Hidro) AS T_Hidro,
       SUM(Cantidad_Yoga) AS T_Yoga
FROM (
    SELECT 'SpaCentro' AS Sucursal,
           COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS Cantidad_Sauna,
           COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS Cantidad_Masaje,
           COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS Cantidad_Hidro,
           COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS Cantidad_Yoga
    FROM SpaCentro
    
    UNION ALL
    
    SELECT 'SpaEscalon' AS Sucursal,
           COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS Cantidad_Sauna,
           COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS Cantidad_Masaje,
           COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS Cantidad_Hidro,
           COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS Cantidad_Yoga
    FROM SpaEscalon
    
    UNION ALL
    
    SELECT 'SpaSantaTecla' AS Sucursal,
           COUNT(CASE WHEN Sauna = 1 THEN 1 ELSE NULL END) AS Cantidad_Sauna,
           COUNT(CASE WHEN Masaje = 1 THEN 1 ELSE NULL END) AS Cantidad_Masaje,
           COUNT(CASE WHEN Hidro = 1 THEN 1 ELSE NULL END) AS Cantidad_Hidro,
           COUNT(CASE WHEN Yoga = 1 THEN 1 ELSE NULL END) AS Cantidad_Yoga
    FROM SpaSantaTecla

) AS TotalGeneral;


----------------------------------------------------------------------------
--MEDIA DE EDAD DE LAS PERSONAS QUE USAN LOS GRUPOS POR SUCURSAL(SAUNA,MASAJE,HIDRO Y YOGA)
--SUCURSAL ESCALON
SELECT grupo,
       AVG(Edad) AS Media_Edad_SPAESCALON
FROM (
    SELECT 'Sauna' AS grupo, Edad FROM SpaEscalon WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaEscalon WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaEscalon WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaEscalon WHERE Yoga = 1
) AS Subconsulta
GROUP BY grupo;

--SUCURSAL CENTRO
SELECT grupo,
       AVG(Edad) AS Media_Edad_SPACENTRO
FROM (
    SELECT 'Sauna' AS grupo, Edad FROM SpaCentro WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaCentro WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaCentro WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaCentro WHERE Yoga = 1
) AS Subconsulta
GROUP BY grupo;

--SUCURSAL SANTATECLA
SELECT grupo,
       AVG(Edad) AS Media_Edad_SPASANTATECLA
FROM (
    SELECT 'Sauna' AS grupo, Edad FROM SpaSantaTecla WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaSantaTecla WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaSantaTecla WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaSantaTecla WHERE Yoga = 1
) AS Subconsulta
GROUP BY grupo;

----------------------------------------------------------------------------
SELECT grupo,
       AVG(Edad) AS "Promedio de edad en la empresa por grupos"
FROM (
    SELECT 'Sauna' AS grupo, Edad FROM SpaCentro WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaCentro WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaCentro WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaCentro WHERE Yoga = 1

    UNION ALL

    SELECT 'Sauna' AS grupo, Edad FROM SpaSantaTecla WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaSantaTecla WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaSantaTecla WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaSantaTecla WHERE Yoga = 1

    UNION ALL

    SELECT 'Sauna' AS grupo, Edad FROM SpaEscalon WHERE Sauna = 1
    UNION ALL
    SELECT 'Masaje' AS grupo, Edad FROM SpaEscalon WHERE Masaje = 1
    UNION ALL
    SELECT 'Hidro' AS grupo, Edad FROM SpaEscalon WHERE Hidro = 1
    UNION ALL
    SELECT 'Yoga' AS grupo, Edad FROM SpaEscalon WHERE Yoga = 1
) AS Promedio
GROUP BY grupo;





