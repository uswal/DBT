
WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT * FROM AIRBNB.raw.raw_reviews
)
SELECT 
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
FROM 
    raw_reviews
),src_reviews AS (
    SELECT * FROM __dbt__cte__src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null

AND review_date > (SELECT max(review_date) from AIRBNB.DEV.fct_reviews)
