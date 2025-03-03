WITH rentals as (
    SELECT
        *,
        LAG(rental_date) OVER (PARTITION BY eircode ORDER BY rental_date) AS prev_date
    FROM {{ ref('staging_rentals') }}
    ORDER BY year, month, day ASC
)

SELECT * FROM rentals
