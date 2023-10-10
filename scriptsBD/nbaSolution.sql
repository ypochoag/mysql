--   A continuación, se deben realizar las siguientes consultas sobre la base de datos:
SELECT *
FROM equipos;

SELECT *
FROM estadisticas;

SELECT *
FROM jugadores;

SELECT *
FROM partidos;

-- 1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.
SELECT nombre
FROM jugadores
ORDER BY nombre ASC;

-- 2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras,
-- ordenados por nombre alfabéticamente.
SELECT nombre
FROM jugadores j
WHERE j.Posicion = 'C' AND j.Peso>200
ORDER BY nombre ASC;

-- 3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.
SELECT Nombre
FROM equipos e
ORDER BY Nombre ASC;

-- 4. Mostrar el nombre de los equipos del este (East).
SELECT Nombre
FROM equipos
WHERE Conferencia = 'East';

-- 5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
SELECT *
FROM equipos
WHERE Ciudad LIKE 'c%'
ORDER BY Nombre ASC;

-- 6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
SELECT Nombre, Nombre_equipo
FROM jugadores
ORDER BY Nombre_equipo ASC;

-- 7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
SELECT nombre, Nombre_equipo
FROM jugadores
WHERE Nombre_equipo = 'Raptors'
ORDER BY nombre ASC;

-- 8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
SELECT Puntos_por_partido
FROM estadisticas e
JOIN jugadores j
ON j.codigo = e.jugador
WHERE j.Nombre = 'Pau Gasol';

-- 9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
SELECT Puntos_por_partido
FROM estadisticas e
JOIN jugadores j
ON j.codigo = e.jugador
WHERE j.Nombre = 'Pau Gasol' and e.temporada = '04/05';

-- 10. Mostrar el número de puntos de cada jugador en toda su carrera.
SELECT j.Nombre, COUNT(e.Puntos_por_partido)
FROM estadisticas e
JOIN jugadores j
ON j.codigo = e.jugador
GROUP BY j.Nombre;

-- 11. Mostrar el número de jugadores de cada equipo.
SELECT Nombre_equipo, COUNT(Nombre)
FROM jugadores 
GROUP BY Nombre_equipo;

-- 12. Mostrar el jugador que más puntos ha realizado en toda su carrera.
SELECT j.Nombre, COUNT(e.Puntos_por_partido) AS Punto_Totales
FROM estadisticas e
JOIN jugadores j
ON j.codigo = e.jugador
GROUP BY j.Nombre
ORDER BY Punto_Totales DESC
LIMIT 1;

-- 13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.
SELECT j.Nombre_equipo, e.Conferencia, e.Division, j.Altura, j.Nombre
FROM jugadores j
JOIN equipos e
ON j.Nombre_equipo = e.Nombre
ORDER BY j.Altura DESC
LIMIT 1;

-- 14. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor
-- diferencia de puntos.
SELECT p.equipo_local, p.equipo_visitante,  ABS(p.puntos_local - p.puntos_visitante) AS Diferencia
FROM partidos p
ORDER BY Diferencia DESC
LIMIT 1;

-- 15. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante,
-- equipo_ganador), en caso de empate sera null.
SELECT p.codigo, p.equipo_local, p.equipo_visitante, p.puntos_local,  p.puntos_visitante,
	CASE 
		WHEN p.puntos_local > p.puntos_visitante THEN p.equipo_local
        WHEN p.puntos_local < p.puntos_visitante THEN p.equipo_visitante
        ELSE NULL
	END AS equipo_ganador
FROM partidos p;


