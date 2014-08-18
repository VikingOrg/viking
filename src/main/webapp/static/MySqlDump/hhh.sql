SELECT
         c.manufacturer_id AS manufacturerId,
         c.name_rus,
         COUNT(*) AS count 
     FROM
         machines a 
	 JOIN models b ON a.model_id = b.model_id
     RIGHT JOIN manufacturers c ON a.stevidor_id = c.stevidor_id 
     GROUP BY
         c.manufacturer_id 
     ORDER BY
         c.manufacturer_id