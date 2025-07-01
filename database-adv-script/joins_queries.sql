-- 1. LEFT JOIN: Get all properties and their reviews (including properties without reviews)
SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Properties p
LEFT JOIN 
    Reviews r ON p.property_id = r.property_id;


-- 2. CHECK: List only properties with NO reviews (r.review_id is NULL)
SELECT 
    p.property_id,
    p.property_name
FROM 
    Properties p
LEFT JOIN 
    Reviews r ON p.property_id = r.property_id
WHERE 
    r.review_id IS NULL;


-- 3. CHECK: Compare total properties vs joined result to verify completeness
-- Total number of properties
SELECT COUNT(*) AS total_properties FROM Properties;

-- Total number of unique properties after join
SELECT COUNT(DISTINCT p.property_id) AS total_properties_in_join
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id;


-- 4. FRIENDLY VIEW: Show all properties and reviews, using IFNULL to mark missing data
SELECT 
    p.property_id,
    p.property_name,
    IFNULL(r.review_id, 'No Review') AS review_id,
    IFNULL(r.rating, 'N/A') AS rating,
    IFNULL(r.comment, 'No Comment') AS comment
FROM 
    Properties p
LEFT JOIN 
    Reviews r ON p.property_id = r.property_id;
