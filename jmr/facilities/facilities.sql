CREATE SCHEMA facilities;


CREATE TABLE facilities_info
(
    facility_id INT PRIMARY KEY,
    facility_name VARCHAR(100) ,
    facility_sec_name VARCHAR(100) ,
    facility_type VARCHAR(100) ,
    facility_description VARCHAR(1000) ,
    facility_products VARCHAR(1000) ,
    facility_services VARCHAR(1000) ,
    facility_features VARCHAR(1000)
);

CREATE TABLE facility_images
(
    facility_image_id INT PRIMARY KEY,
    facility_id INT ,
    facility_image_path VARCHAR(1000) ,
    FOREIGN KEY (facility_id) REFERENCES facilities(facility_id)
);

CREATE TABLE facility_reviews
(
    facility_review_id INT PRIMARY KEY,
    facility_id INT ,
    facility_reviewer_name VARCHAR(100) ,
    facility_reviewer_email VARCHAR(100) ,
    facility_reviewer_phone VARCHAR(100) ,
    facility_reviewer_review VARCHAR(1000) ,
    facility_reviewer_rating INT ,
    FOREIGN KEY (facility_id) REFERENCES facilities(facility_id)
);

CREATE TABLE facility_ratings
(
    facility_rating_id INT PRIMARY KEY,
    facility_id INT ,
    facility_rating INT ,
    FOREIGN KEY (facility_id) REFERENCES facilities(facility_id)
);


INSERT INTO facilities_info (facility_id, facility_name, facility_sec_name, facility_type, facility_description, facility_products, facility_services, facility_features)
VALUES
    (1, 'Ngake Nganga','Nature''s Remedy', 'Medicinal Certified Clinic', 'Our state-of-the-art clinic combines modern medical practices with indigenous healing modalities, offering holistic healthcare consultations and specialized therapies for various illnesses and conditions.','','','State-of-the-art medical facility, comfortable patient rooms, advanced diagnostic equipment, specialized treatment rooms, comfortable waiting areas') ,
    (2,'Zamani Kungu','Ancient Spring', 'Medicinal/ Relaxation Spa','Experience tranquility and rejuvenation at our relaxation spa, where certified specialists perform a wide array of organic and natural procedures, including massages, beauty care, and therapeutic treatments.','','','Tranquil spa environment, soothing ambiance, private treatment rooms' ),
    (3, 'Ile Adura','House of Serenity','Personal Sanctuary Store','Explore our store, filled with curated furniture, home decor, and accessories that create a soothing and personal sanctuary within your living space.','','','Bohemian-inspired decor, curated selection of furniture and home accessories, unique gifts and decor items'),
    (4, 'Iyarú','Nature''s Essence','Organic Body care Products Line ','Discover our organic body care product line, carefully crafted to nourish and enhance the natural beauty of your skin and hair, along with other black-owned body care products.','','',''),
    (5, 'Asanya Tunu','Earth''s Harvest','Holistic/Vegan Cafe','Indulge in a health-promoting culinary experience at our café, offering a menu of vegan, holistic, and raw diet options that promote vitality and well-being.','','','Cozy cafe ambiance, comfortable seating, natural lighting'),
    (6, 'Bundu Shango','Nature''s Healing Force','Herbal Apothecary ','Find a wide range of herbs, herbal remedies, tinctures, and natural materials at our herbal dispensary and apothecary, empowering individuals to harness the healing power of nature.','','',''),
    (7, 'Gbengbadun','Strength of the Panther','Fitness Studio ','Engage in physical fitness and wellness programs designed to support your overall well-being. Our gym and studios offer state-of-the-art equipment and professional guidance.','','','Well-equipped gym with cardio and strength training equipment, separate studios for fitness classes and yoga, personal training services'),
    (8, 'Khetheku Sezwe','The Nation''s Nursery','Organic Garden/Farm','Immerse yourself in the beauty of nature at our organic garden and farm, providing fresh produce for our café, marketplace, and herbal dispensary.','','','Lush organic garden and farm, outdoor seating areas, farm-to-table concept, seasonal produce and herbs'),
    (9, 'Soko Rudisha','The Reviving Market','Farmers Market ','Discover a vibrant marketplace filled with organic and wild-crafted products, local vendors, and a food court offering nourishing meals and artisanal delights.','','',' Vibrant marketplace with various vendors, communal seating areas, fresh produce and artisanal products, Rental spaces for farmers, organic product vendors, and organic food vendors'),
    (10, 'Ile Adura Oke','Exalted Spiritual House','Metaphysical Supply Store and Spiritual Space','Explore your spiritual journey with our metaphysical supply and spiritual space, offering tools, guidance, and resources to enhance your spiritual practices.','','',' Tranquil and serene environment, dedicated meditation and ritual space, unique selection of metaphysical and spiritual items, and sacred space for spiritual exploration and personal growth'),
    (11, 'Segomunye','We Are One" with nature','Botanical Garden Sanctuary','Experience the tranquility of our ethereal sanctuary, surrounded by lush foliage, nature trails, and peaceful seating areas, providing an oasis for relaxation and reflection.','','','Scenic nature trails, lush botanical gardens, peaceful seating areas, outdoor meditation spaces and yoga platforms'),
    (12, 'Iremoje','Serenity Awaits','Resort Accommodations','','','','Comfortable and well-appointed accommodations, amenities for a relaxing stay'),
    (13, 'Umzali Wendlela','The Ancestral Path','Jungle Book Guide','A physical and digital reference guide that provides information on safe spaces for Afro-Diaspora individuals and resources for seeking help if needed.','','','Online platform providing information on fruits, vegetables, herbs, their health benefits, and usage, holistic lifestyles and practices, metaphysical realtions, and other related topics');

SELECT * FROM facilities_info;

