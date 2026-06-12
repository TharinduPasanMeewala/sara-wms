-- Complete SQL schema with CREATE TABLE statements
CREATE TYPE sync_direction AS ENUM ('INBOUND', 'OUTBOUND');
CREATE TYPE entity_type AS ENUM ('SHIPMENT', 'ORDER', 'STOCK_MOVEMENT', 'INVENTORY', 'LOT_SERIAL', 'SKU', 'LOCATION', 'WAREHOUSE', 'ROLE');
CREATE TYPE sync_status AS ENUM ('PENDING', 'SUCCESS', 'FAILED');
CREATE TYPE order_type AS ENUM ('PURCHASE', 'SALES');
CREATE TYPE shipment_status AS ENUM ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TYPE movement_type AS ENUM ('IN', 'OUT');
CREATE TYPE reference_type AS ENUM ('ORDER', 'SHIPMENT');
CREATE TYPE tracking_type AS ENUM ('LOT', 'SERIAL');
CREATE TYPE location_type AS ENUM ('WAREHOUSE', 'SHELF');
CREATE TYPE location_status AS ENUM ('ACTIVE', 'INACTIVE');
CREATE TABLE ERPSyncLog (
    sync_log_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    sync_direction sync_direction NOT NULL,
    entity_type entity_type NOT NULL,
    entity_id VARCHAR NOT NULL,
    erp_reference_id VARCHAR,
    sync_status sync_status NOT NULL,
    request_payload JSON,
    response_payload JSON,
    error_message TEXT,
    retry_count INTEGER NOT NULL,
    synced_at TIMESTAMP NOT NULL
);

CREATE TABLE Shipment (
    shipment_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    order_id VARCHAR NOT NULL,
    carrier_name VARCHAR NOT NULL,
    carrier_service_code VARCHAR NOT NULL,
    tracking_number VARCHAR,
    label_url VARCHAR,
    shipment_status shipment_status NOT NULL,
    weight_kg NUMERIC,
    dimensions_cm JSON,
    estimated_delivery_date DATE,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Order (
    order_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    order_type order_type NOT NULL,
    erp_order_number VARCHAR NOT NULL,
    order_status sync_status NOT NULL,
    expected_date DATE,
    supplier_or_customer_name VARCHAR NOT NULL,
    shipping_address JSON,
    carrier_id VARCHAR,
    line_items JSON NOT NULL,
    erp_last_sync_at TIMESTAMP,
    erp_sync_status sync_status NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE StockMovement (
    movement_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    movement_type movement_type NOT NULL,
    sku_id VARCHAR NOT NULL,
    lot_serial_id VARCHAR,
    from_location_id VARCHAR,
    to_location_id VARCHAR,
    quantity NUMERIC NOT NULL,
    uom VARCHAR NOT NULL,
    reference_type reference_type,
    reference_id VARCHAR,
    performed_by_user_id VARCHAR NOT NULL,
    erp_sync_status sync_status NOT NULL,
    notes TEXT,
    movement_timestamp TIMESTAMP NOT NULL
);

CREATE TABLE Inventory (
    inventory_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    location_id VARCHAR NOT NULL,
    sku_id VARCHAR NOT NULL,
    lot_serial_id VARCHAR,
    quantity_on_hand NUMERIC NOT NULL,
    quantity_reserved NUMERIC NOT NULL,
    quantity_available NUMERIC NOT NULL,
    uom VARCHAR NOT NULL,
    last_count_date TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE LotSerial (
    lot_serial_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    sku_id VARCHAR NOT NULL,
    tracking_type tracking_type NOT NULL,
    lot_number VARCHAR,
    serial_number VARCHAR,
    manufacture_date DATE,
    expiry_date DATE,
    receipt_date DATE NOT NULL,
    supplier_lot_ref VARCHAR,
    status sync_status NOT NULL,
    country_of_origin VARCHAR,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE SKU (
    sku_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    sku_code VARCHAR NOT NULL,
    sku_name VARCHAR NOT NULL,
    description TEXT,
    base_uom VARCHAR NOT NULL,
    uom_conversions JSON,
    is_lot_tracked BOOLEAN NOT NULL,
    is_serial_tracked BOOLEAN NOT NULL,
    is_expiry_tracked BOOLEAN NOT NULL,
    shelf_life_days INTEGER,
    weight_kg NUMERIC,
    dimensions_cm JSON,
    erp_item_code VARCHAR,
    hazmat_class VARCHAR,
    is_active BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Location (
    location_id VARCHAR PRIMARY KEY,
    warehouse_id VARCHAR NOT NULL,
    parent_location_id VARCHAR,
    location_code VARCHAR NOT NULL,
    location_type location_type NOT NULL,
    location_name VARCHAR NOT NULL,
    path VARCHAR NOT NULL,
    max_weight_kg NUMERIC,
    max_volume_m3 NUMERIC,
    location_status location_status NOT NULL,
    is_pickable BOOLEAN NOT NULL,
    is_receivable BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Warehouse (
    warehouse_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    warehouse_code VARCHAR NOT NULL,
    warehouse_name VARCHAR NOT NULL,
    address_line1 VARCHAR NOT NULL,
    address_line2 VARCHAR,
    city VARCHAR NOT NULL,
    state_province VARCHAR NOT NULL,
    postal_code VARCHAR NOT NULL,
    country_code VARCHAR NOT NULL,
    timezone VARCHAR NOT NULL,
    is_active BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Role (
    role_id VARCHAR PRIMARY KEY,
    tenant_id VARCHAR NOT NULL,
    role_name VARCHAR NOT NULL,
    permissions JSON NOT NULL,
    description TEXT,
    is_system_role BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);