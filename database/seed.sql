-- Sample seed data INSERT statements

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at)
VALUES
('WH1', 'TENANT1', 'WH001', 'Main Warehouse', '1234 Main St', NULL, 'Anytown', 'CA', '90210', 'US', 'UTC-8', TRUE, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at)
VALUES
('ROLE1', 'TENANT1', 'Admin', '{"read": true, "write": true}', 'Administrator Role', TRUE, NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at)
VALUES
('SKU1', 'TENANT1', 'SKU001', 'Sample SKU', 'A sample SKU for testing.', 'kg', '[]', FALSE, FALSE, FALSE, NULL, 1.5, '{}', 'ERP001', NULL, TRUE, NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at)
VALUES
('LOT1', 'TENANT1', 'SKU1', 'LOT', 'LOT001', NULL, '2023-01-01', '2025-01-01', NOW(), NULL, 'ACTIVE', 'US', NOW(), NOW());