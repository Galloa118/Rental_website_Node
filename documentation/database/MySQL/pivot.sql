USE car_rental;

DROP VIEW IF EXISTS Revenue_Report;
CREATE VIEW Revenue_Report AS (
  SELECT Office_ID,
    CASE WHEN PickupMonth = 1 THEN Total END AS Jan,
    CASE WHEN PickupMonth = 2 THEN Total END AS Feb,
    CASE WHEN PickupMonth = 3 THEN Total END AS Mar,
    CASE WHEN PickupMonth = 4 THEN Total END AS Apr,
    CASE WHEN PickupMonth = 5 THEN Total END AS May,
    CASE WHEN PickupMonth = 6 THEN Total END AS Jun,
    CASE WHEN PickupMonth = 7 THEN Total END AS Jul,
    CASE WHEN PickupMonth = 8 THEN Total END AS Aug,
    CASE WHEN PickupMonth = 9 THEN Total END AS Sep,
    CASE WHEN PickupMonth = 10 THEN Total END AS Oct,
    CASE WHEN PickupMonth = 11 THEN Total END AS Nov,
    CASE WHEN PickupMonth = 12 THEN Total END AS December
  FROM (
	SELECT c.Office_ID, MONTH(b.Pickup_DateTime) AS PickupMonth, bl.Line_Total AS Total
	FROM car_rental.booking AS b
	INNER JOIN car_rental.booking_line AS bl
	ON b.Booking_ID = bl.Booking_ID
	INNER JOIN car_rental.car AS c
	ON bl.Car_ID = c.Car_ID
  ) AS rev
);

DROP VIEW IF EXISTS Revenue_Pivot;
CREATE VIEW Revenue_Pivot AS (
  SELECT Office_ID,
    SUM(Jan) as Jan,
    SUM(Feb) as Feb,
    SUM(Mar) as Mar,
    SUM(Apr) as Apr,
    SUM(May) as May,
    SUM(Jun) as Jun,
    SUM(Jul) as Jul,
    SUM(Aug) as Aug,
    SUM(Sep) as Sep,
    SUM(Oct) as Oct,
    SUM(Nov) as Nov,
    SUM(December) as 'Dec'
  FROM Revenue_Report
  GROUP BY Office_ID
);

SELECT * FROM Revenue_Pivot;

CALL monthly_revenue_by_office();