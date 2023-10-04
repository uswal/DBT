
WITH src_reviews AS (
    SELECT * FROM AIRBNB.DEV.src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null

AND review_date > (SELECT max(review_date) from AIRBNB.DEV.fct_reviews)
