CREATE SCHEMA herbs;
DROP TABLE IF EXISTS herbs_info;
DROP TABLE IF EXISTS herb_categories;
DROP TABLE IF EXISTS herb_parts;
DROP TABLE IF EXISTS herb_energetics;
DROP TABLE IF EXISTS herb_uses;
DROP TABLE IF EXISTS prep_methods;
DROP TABLE IF EXISTS herb_class;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Functions

-- Function to generate a random number between 100 and 999
CREATE OR REPLACE FUNCTION generate_randomized_id()
    RETURNS TEXT AS
$$
DECLARE
    random_number NUMERIC(3);
BEGIN
    random_number := FLOOR(RANDOM() * 900) + 100; -- Generate a random number between 100 and 999
    RETURN LPAD(random_number::TEXT, 3, '0'); -- Convert to text and pad with leading zeros
END;
$$ LANGUAGE plpgsql;

-- Function to generate a unique herb id
CREATE OR REPLACE FUNCTION generate_herb_id()
RETURNS TEXT AS $$
DECLARE
    randomized_id TEXT;
    new_herb_id TEXT;
BEGIN
    LOOP
        randomized_id := generate_randomized_id();
        new_herb_id := CONCAT('HERB-', randomized_id);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM herbs_info WHERE id = new_herb_id);
    END LOOP;
    RETURN new_herb_id;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Custom Data Types
CREATE TYPE type_name AS (
   element_data_type
);
-- Create a custom data type to store an array of herb ids named herb_id_array
CREATE TYPE herb_id_array AS TEXT[];

-- Create a custom data type to store an array of herb classifications named herb_classification_array
CREATE TYPE herb_classification_array AS TEXT[];

-- Create a custom data type to store an array of herb energetics named herb_energetics_array
CREATE TYPE herb_energetics_array AS TEXT[];

--Create a custom data type to store an array of herb parts named herb_parts_array
CREATE TYPE herb_parts_array AS TEXT[];


------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM herbs_info;
SELECT * FROM herb_parts;
SELECT * FROM herb_energetics;
SELECT * FROM prep_methods;
SELECT * FROM herb_class;
SELECT * FROM herb_categories;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herbal Information

-- Create a table to store information about different herbs
CREATE TABLE herbs_info
(
    id             VARCHAR(10) PRIMARY KEY,
    name            VARCHAR(250),
    description     TEXT,
    scientific_name VARCHAR(250),
    other_names     VARCHAR(250),
    herb_family     VARCHAR(100),
    origin_region   VARCHAR(100)
);
-- Insert  herb names and generate random herb ids into the table
INSERT INTO herbs_info (id, name)
VALUES (generate_herb_id(), 'Aconite'),
       (generate_herb_id(), 'Agrimony'),
       (generate_herb_id(), 'Alfalfa'),
       (generate_herb_id(), 'Alkanet'),
       (generate_herb_id(), 'Allspice'),
       (generate_herb_id(), 'Alma'),
       (generate_herb_id(), 'Aloe Vera'),
       (generate_herb_id(), 'Angelica'),
       (generate_herb_id(), 'Aritha'),
       (generate_herb_id(), 'Ashwagandha'),
       (generate_herb_id(), 'Astragalus'),
       (generate_herb_id(), 'Baobab'),
       (generate_herb_id(), 'Bay Leaves'),
       (generate_herb_id(), 'Bayberry'),
       (generate_herb_id(), 'Bhringraj'),
       (generate_herb_id(), 'Bilberry'),
       (generate_herb_id(), 'Billberry'),
       (generate_herb_id(), 'Black Cohosh'),
       (generate_herb_id(), 'Black Cumin'),
       (generate_herb_id(), 'Bladderwrack'),
       (generate_herb_id(), 'Blessed Thistle'),
       (generate_herb_id(), 'Blood Root'),
       (generate_herb_id(), 'Blue Cohosh'),
       (generate_herb_id(), 'Blue Vervain'),
       (generate_herb_id(), 'Boneset'),
       (generate_herb_id(), 'Brahmi'),
       (generate_herb_id(), 'Buckthorn'),
       (generate_herb_id(), 'Buckwheat'),
       (generate_herb_id(), 'Burdock'),
       (generate_herb_id(), 'Butterbur'),
       (generate_herb_id(), 'Calendula'),
       (generate_herb_id(), 'Cascara Sagrada'),
       (generate_herb_id(), 'Cat’s Claw'),
       (generate_herb_id(), 'Catnip'),
       (generate_herb_id(), 'Chamomile'),
       (generate_herb_id(), 'Chaste Tree'),
       (generate_herb_id(), 'Chives'),
       (generate_herb_id(), 'Chrysanthemum'),
       (generate_herb_id(), 'Cinchona'),
       (generate_herb_id(), 'Cinnamon Sticks'),
       (generate_herb_id(), 'Cleavers'),
       (generate_herb_id(), 'Cloves'),
       (generate_herb_id(), 'Comfrey'),
       (generate_herb_id(), 'Coriander'),
       (generate_herb_id(), 'Coriander/Cilantro'),
       (generate_herb_id(), 'Cumin'),
       (generate_herb_id(), 'Curry Leaves'),
       (generate_herb_id(), 'Dahlia'),
       (generate_herb_id(), 'Damiana'),
       (generate_herb_id(), 'Dandelion'),
       (generate_herb_id(), 'Dong Quai'),
       (generate_herb_id(), 'Echinacea Angustifolia'),
       (generate_herb_id(), 'Echinacea Purple Coneflower'),
       (generate_herb_id(), 'Echinacea Purpurea'),
       (generate_herb_id(), 'ElderBerry'),
       (generate_herb_id(), 'Elderflower'),
       (generate_herb_id(), 'Eleuthero Root'),
       (generate_herb_id(), 'Eucaluptus'),
       (generate_herb_id(), 'Eyebright Powder'),
       (generate_herb_id(), 'Fennel'),
       (generate_herb_id(), 'Fenugreek'),
       (generate_herb_id(), 'Fern Dill'),
       (generate_herb_id(), 'Feverfew Tops'),
       (generate_herb_id(), 'Fine Walnut Shell'),
       (generate_herb_id(), 'Flaxseed'),
       (generate_herb_id(), 'Genovese Basil'),
       (generate_herb_id(), 'Gentian'),
       (generate_herb_id(), 'German Chamomile'),
       (generate_herb_id(), 'Ginger'),
       (generate_herb_id(), 'Ginko Bibloa'),
       (generate_herb_id(), 'Ginseng Root'),
       (generate_herb_id(), 'Goldenseal'),
       (generate_herb_id(), 'Goldseal'),
       (generate_herb_id(), 'Gotu Kola'),
       (generate_herb_id(), 'Greek Oregano'),
       (generate_herb_id(), 'Henna Nupur'),
       (generate_herb_id(), 'Hibiscus'),
       (generate_herb_id(), 'Hops'),
       (generate_herb_id(), 'Horehound'),
       (generate_herb_id(), 'Horsetail'),
       (generate_herb_id(), 'Hyssop'),
       (generate_herb_id(), 'Italian Essence Parsley'),
       (generate_herb_id(), 'Jamaican Sarsaparilla'),
       (generate_herb_id(), 'Jasmine'),
       (generate_herb_id(), 'Juniper'),
       (generate_herb_id(), 'Kava Kava Root'),
       (generate_herb_id(), 'Lavender'),
       (generate_herb_id(), 'Lemon Balm'),
       (generate_herb_id(), 'Lemon Verbena'),
       (generate_herb_id(), 'Licorice Root'),
       (generate_herb_id(), 'Life Everlasting'),
       (generate_herb_id(), 'Linden'),
       (generate_herb_id(), 'Lobelia'),
       (generate_herb_id(), 'Marshmellow'),
       (generate_herb_id(), 'Meadowsweet'),
       (generate_herb_id(), 'Milk Thistle'),
       (generate_herb_id(), 'Moringa'),
       (generate_herb_id(), 'Motherwort'),
       (generate_herb_id(), 'Mugwort Herb'),
       (generate_herb_id(), 'Muira Puama'),
       (generate_herb_id(), 'Mullein'),
       (generate_herb_id(), 'Multani Mitti'),
       (generate_herb_id(), 'Neem Leaf'),
       (generate_herb_id(), 'Nettle'),
       (generate_herb_id(), 'Oat Straw Green Tops'),
       (generate_herb_id(), 'Orchids'),
       (generate_herb_id(), 'Orris Root'),
       (generate_herb_id(), 'Pacific Beauty Calendula'),
       (generate_herb_id(), 'Passion Flower'),
       (generate_herb_id(), 'Pau dArco'),
       (generate_herb_id(), 'Peppermint'),
       (generate_herb_id(), 'Pink Rose Buds'),
       (generate_herb_id(), 'Plantain'),
       (generate_herb_id(), 'Psylium Husk'),
       (generate_herb_id(), 'Red Clover'),
       (generate_herb_id(), 'Red Clover Blossoms'),
       (generate_herb_id(), 'Red Raspberry'),
       (generate_herb_id(), 'Rhodiola'),
       (generate_herb_id(), 'Roman Chamomile'),
       (generate_herb_id(), 'Rosemary'),
       (generate_herb_id(), 'Sage'),
       (generate_herb_id(), 'Saint Johns Wort'),
       (generate_herb_id(), 'Sassafras'),
       (generate_herb_id(), 'Schizandra'),
       (generate_herb_id(), 'Shikaki'),
       (generate_herb_id(), 'Skullcap'),
       (generate_herb_id(), 'Slipper Elm'),
       (generate_herb_id(), 'Soapnut'),
       (generate_herb_id(), 'Sorrel'),
       (generate_herb_id(), 'Spearmint'),
       (generate_herb_id(), 'Spirulina'),
       (generate_herb_id(), 'Star Anise'),
       (generate_herb_id(), 'Sweet Basil'),
       (generate_herb_id(), 'Sweet Marjoram'),
       (generate_herb_id(), 'Thyme'),
       (generate_herb_id(), 'True Lavender'),
       (generate_herb_id(), 'Tulips'),
       (generate_herb_id(), 'Tulsi Holy Basil'),
       (generate_herb_id(), 'Tumeric'),
       (generate_herb_id(), 'Uva Ursi'),
       (generate_herb_id(), 'Valerian'),
       (generate_herb_id(), 'Vitamin C'),
       (generate_herb_id(), 'White Oak'),
       (generate_herb_id(), 'White Willow'),
       (generate_herb_id(), 'Wormwood'),
       (generate_herb_id(), 'Yarrow'),
       (generate_herb_id(), 'Yellow Dock'),
       (generate_herb_id(), 'Yerba Mate'),
       (generate_herb_id(), 'Yerba Santa'),
       (generate_herb_id(), 'Yohimbe'),
       (generate_herb_id(), 'Maqui'),
       (generate_herb_id(), 'Camu Camu'),
       (generate_herb_id(), 'Maca Root'),
       (generate_herb_id(), 'Lucian');

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herbs Parts used for Medicinal Purposes

 -- Create a table to store the different parts of the herb that can be used for medicinal purposes
CREATE TABLE herb_parts
(
    id               INT PRIMARY KEY,
    part             VARCHAR(100),
    part_description TEXT,
    herb_id          VARCHAR(10)
);

-- Insert the different parts of the herb that can be used for medicinal purposes
INSERT INTO herb_parts (id,part)
VALUES (1 , 'flowers'),
       (2, 'leaves'),
       (3, 'aerial parts'),
       (4, 'seeds'),
       (5, 'roots'),
       (6, 'rhizomes'),
       (7, 'bark'),
       (8, 'berries'),
       (9, 'stems'),
       (10, 'fruits'),
       (11, 'bulbs'),
       (12, 'gum'),
       (13, 'resin'),
       (14, 'wood'),
       (15, 'sap'),
       (16, 'buds');

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herb Preparation Methods

-- Create a table to store the different methods of preparing herbs for medicinal use
    CREATE TABLE prep_methods
(
    id                INT PRIMARY KEY,
    method             VARCHAR(100),
    method_description TEXT,
    herb_id            VARCHAR(10)

);
-- Insert the different types of herbal preparation methods
INSERT INTO prep_methods (id, method)
VALUES  (1, 'tablets'),
        (2, 'capsules'),
        (3, 'tinctures'),
        (4, 'teas'),
        (5, 'infusions'),
        (6, 'decoctions'),
        (7, 'extracts'),
        (8, 'salves'),
        (9, 'oils'),
        (10, 'poultices'),
        (11, 'syrups'),
        (12, 'liniments'),
        (13, 'compresses'),
        (14, 'plasters'),
        (15, 'pills'),
        (16, 'powders'),
        (17, 'creams'),
        (18, 'lotions'),
        (19, 'gargles'),
        (20, 'suppositories'),
        (21, 'douches'),
        (22, 'enemas'),
        (23, 'inhalations'),
        (24, 'vaporizations'),
        (25, 'fumigations'),
        (26, 'fomentations'),
        (27, 'macerates'),
        (28, 'sponges'),
        (29, 'soaks'),
        (30,'glycerites'),
        (31, 'suspensions'),
        (32, 'solutions'),
        (33, 'tonics'),
        (34, 'washes'),
        (35, 'wines'),
        (36, 'elixirs'),
        (37,'liquid capsules' ),
        (38, 'standardized extracts'),
        (39,'essential oils'),
        (40,'beer'),
        (41,'vinegar'),
        (42,'ointments'),
        (43,'balms'),
        (44,'tea concentrates'),
        (45, 'tincture powder concentrates'),
        (46,'cough drops');
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herb Classifications

CREATE TABLE herb_class
(
    id                         INT PRIMARY KEY,
    classification             VARCHAR(100),
    classification_description TEXT,
    herb_id                    VARCHAR(10)
);

--Insert the different classifications of herbs
INSERT INTO herb_class (id, classification)
VALUES ( 1, 'adaptogen'),
       ( 2, 'alterative'),
       ( 3, 'analgesic'),
       ( 4, 'anodyne'),
       ( 5, 'antibacterial'),
       ( 6, 'antibiotic'),
       ( 7, 'antifungal'),
       ( 8, 'anti-inflammatory'),
       ( 9, 'antimicrobial'),
       (10, 'antioxidant'),
       (11, 'antiparasitic'),
       (12, 'antipyretic'),
       (13, 'antiseptic'),
       (14, 'antispasmodic'),
       (15, 'antiviral'),
       (16, 'aphrodisiac'),
       (17, 'astringent'),
       (18, 'bitter'),
       (19, 'carminative'),
       (20, 'cholagogue'),
       (21, 'demulcent'),
       (22, 'diaphoretic'),
       (23, 'digestive'),
       (24, 'diuretic'),
       (25, 'emmenagogue'),
       (26, 'expectorant'),
       (27, 'galactagogue'),
       (28, 'hepatoprotective'),
       (29, 'hypotensive'),
       (30, 'laxative'),
       (31, 'mucilaginous'),
       (32, 'nervine'),
       (33, 'nutritive'),
       (34, 'sedative'),
       (35, 'stimulant'),
       (36, 'tonic'),
       (37, 'vulnerary');

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herb Categories

CREATE TABLE herb_categories (
    category_id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL,
    category_taste TEXT,
    category_properties TEXT,
    category_purpose TEXT,
    category_notes TEXT,

);

INSERT INTO herb_categories (category_name, category_taste, category_properties, category_purpose, category_notes)
VALUES
    ('Pungent Herbs', 'Hot, spicy, pungent', 'Stimulate circulation, digestion, and sweating', 'Circulatory tonic, digestive aid, expectorant', 'Often used in small amounts due to their potency'),
    ('Aromatic Herbs', 'Strong, fragrant aroma and taste', 'Carminative, digestive, anti-spasmodic', 'Relieve gas, improve digestion, calm nerves', 'Often used in cooking and aromatherapy'),
    ('Simple/Non Alkaloidal Bitters', 'Bitter', 'Digestive tonic, appetite stimulant', 'Improve digestion, increase bile flow', 'Considered milder and safer than alkaloidal bitters'),
    ('Alkaloidal Bitters', 'Intensely bitter', 'Tonic, antimicrobial, pain-relieving', 'Digestive tonic, fever reducer, analgesic', 'Potent and should be used with caution'),
    ('Fragrant Bitters', 'Bitter with pleasant aroma', 'Digestive tonic, carminative', 'Improve digestion, relieve gas', 'Combines bitter and aromatic properties'),
    ('Acid Herbs', 'Sour, acidic', 'Astringent, cooling, diuretic', 'Reduce inflammation, cool the body, promote urination', 'Often used in beverages or topically'),
    ('Astringent Herbs', 'Dry, puckering taste', 'Contract and tighten tissues, anti-inflammatory', 'Wound healing, reduce inflammation, tone tissues', 'Often used topically or as douches/gargles'),
    ('Sour Herbs', 'Tart, sour', 'Digestive, cleansing, diuretic', 'Improve digestion, promote elimination, cleanse the body', 'Often used in beverages or tonics'),
    ('Salty Herbs', 'Salty', 'Mineral-rich tonic, diuretic', 'Replenish minerals, promote urination', 'Often used in small amounts due to their saltiness'),
    ('Sweet Herbs', 'Sweet', 'Demulcent, tonic, nutritive', 'Soothe and protect tissues, provide nourishment', 'Often used in teas or tonics'),
    ('Mucilant Herbs', 'Thick, mucilaginous texture', 'Soothing, protective, demulcent', 'Soothe and protect mucous membranes', 'Often used for respiratory and digestive issues'),
    ('Oily Herbs', 'Rich, oily texture', 'Moisturizing, emollient, anti-inflammatory', 'Nourish the skin, reduce inflammation', 'Often used topically or in skincare products')
;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herb Energetics
-- Create a table to store the energetics of different herbs
CREATE TABLE herb_energetics
(
    id              INT PRIMARY KEY,
    energetics      VARCHAR(100),
    energetics_description TEXT,
    herb_id        anyarray
);

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Herbal Recipes

-- Create a table that will house different recipes for herbal products
CREATE TABLE herbal_recipes
(
    id          INT PRIMARY KEY,
    recipe_name VARCHAR(250),
    recipe      TEXT,
    herb_id     VARCHAR(10)
);


------------------------------------------------------------------------------------------------------------------------------------------------------
--Create a foreign key constraint that references the id of the herbs_info table
ALTER TABLE herb_parts
    ADD CONSTRAINT fk_herb_id FOREIGN KEY (herb_id) REFERENCES herbs_info (id);
ALTER TABLE herb_energetics
   ADD CONSTRAINT fk_herb_id FOREIGN KEY (herb_id) REFERENCES herbs_info (id);
ALTER TABLE prep_methods
    ADD CONSTRAINT fk_herb_id FOREIGN KEY (herb_id) REFERENCES herbs_info (id);
ALTER TABLE herb_class
    ADD CONSTRAINT fk_herb_id FOREIGN KEY (herb_id) REFERENCES herbs_info (id);
ALTER TABLE herb_categories
    ADD CONSTRAINT fk_herb_id FOREIGN KEY (herb_id) REFERENCES herbs_info (id);