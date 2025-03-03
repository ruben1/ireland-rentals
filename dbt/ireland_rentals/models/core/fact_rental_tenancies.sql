WITH rent_groups AS (
    SELECT *,
        -- Identify tenancy breaks (gaps longer than 1 week)
        SUM(
            CASE 
                WHEN prev_date IS NULL OR DATEDIFF('day', prev_date, rental_date) > 7
                THEN 1 ELSE 0 
            END
        ) OVER (
            PARTITION BY eircode ORDER BY rental_date 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS tenancy_group
    FROM {{ ref('dim_rentals') }}
),

tenancies AS (
SELECT 
    eircode,
    MIN(rental_date) AS tenancy_start,
    MAX(rental_date) AS tenancy_end
FROM rent_groups
GROUP BY eircode, tenancy_group
ORDER BY eircode, tenancy_start
)

SELECT eircode, tenancy_start, tenancy_end FROM tenancies

-- SELECT tenancy_start, tenancy_end, count(*) as c
-- FROM rental_start_end
-- GROUP BY tenancy_start, tenancy_end
-- ORDER BY c desc;