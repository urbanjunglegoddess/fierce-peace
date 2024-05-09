-- Businesses table
CREATE TABLE businesses(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(100),
    registration_number VARCHAR(100),
    registration_date DATE,
    registration_authority VARCHAR(255),
    business_description TEXT,
    industry VARCHAR(255),
    legal_structure VARCHAR(100),
    tax_id VARCHAR(100),
    business_owner VARCHAR(255),
    owner_email VARCHAR(255),
    owner_phone VARCHAR(20),
    owner_address TEXT,
    business_address TEXT,
    country_of_registration VARCHAR(100),
    state_of_registration VARCHAR(100),
    city_of_registration VARCHAR(100),
    website VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    logo VARCHAR(255),
    cover_photo VARCHAR(255),
    profile_picture VARCHAR(255),
    bio TEXT,
    founding_date DATE,
    number_of_employees INT,
    annual_revenue DECIMAL(18, 2),
    business_social_links TEXT,
    business_additional_info TEXT,
    business_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    business_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    business_rating DECIMAL(3, 2),
    business_reviews TEXT,
    business_hours TEXT,
    business_location_latitude DECIMAL(10, 8),
    business_location_longitude DECIMAL(11, 8),
    business_location_map_url TEXT,
    business_categories TEXT[],
    business_keywords TEXT[],
    business_verification_status VARCHAR(20),
    verification_code VARCHAR(20),
    verification_expiry TIMESTAMP,
    subscription_status VARCHAR(20),
    subscription_plan VARCHAR(255),
    subscription_start_date DATE,
    subscription_end_date DATE,
    subscription_payment_method VARCHAR(100),
    subscription_billing_address TEXT,
    subscription_invoice_history TEXT[],
    business_legal_documents TEXT[], -- Documents related to the legal status of the business
    business_certifications TEXT[], -- Certifications or licenses held by the business
    business_insurance_details TEXT, -- Details of insurance policies held by the business
    business_assets TEXT[], -- List of assets owned by the business
    business_liabilities TEXT[], -- List of liabilities or debts of the business
    business_partners TEXT[], -- Names and contact information of business partners or stakeholders
    business_milestones TEXT[], -- Significant milestones or achievements in the history of the business
    business_success_stories TEXT[], -- Success stories or case studies related to the business
    business_clients TEXT[], -- List of clients or customers served by the business
    business_projects TEXT[], -- Details of projects undertaken by the business
    business_services TEXT[], -- List of services offered by the business
    business_products TEXT[], -- List of products offered by the business
    business_technologies_used TEXT[], -- Technologies or tools used by the business
    business_target_market TEXT[], -- Description of the target market or customer demographics
    business_growth_strategy TEXT, -- Strategy or plan for business growth and expansion
    business_financial_reports TEXT[], -- Financial reports and statements
    business_operating_procedures TEXT[], -- Standard operating procedures (SOPs)
    business_quality_standards TEXT[], -- Quality standards or certifications
    business_customer_feedback TEXT[], -- Feedback or reviews provided by customers
    business_supplier_information TEXT[], -- Information about suppliers or vendors
    business_legal_disputes TEXT[], -- Records of legal disputes or litigations
    business_ownership_structure TEXT[], -- Detailed ownership structure of the business
    business_financial_forecasts TEXT[], -- Forecasts or projections of future financial performance
    business_accreditation TEXT[], -- Accreditations or affiliations of the business
    business_sustainability_practices TEXT[], -- Practices for environmental sustainability
    business_community_involvement TEXT[], -- Involvement in community initiatives
    business_regulatory_compliance TEXT[], -- Compliance with regulations and legal requirements
    business_security_policies TEXT[], -- Policies for data and asset security
    business_disaster_recovery_plan TEXT[], -- Plan for disaster recovery and continuity
    business_ethics_policy TEXT[] -- Code of ethics or conduct
    -- Additional fields can be added here
    CONSTRAINT valid_verification_status CHECK (business_verification_status IN ('verified', 'pending', 'rejected')),
    CONSTRAINT valid_subscription_status CHECK (subscription_status IN ('active', 'inactive', 'expired', 'canceled'))
);
