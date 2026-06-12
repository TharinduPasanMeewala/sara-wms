-- Sample seed data INSERT statements

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at) VALUES
('W001', 'T001', 'WHS_001', 'Main Warehouse', '123 Warehouse St', NULL, 'Cityville', 'State', '12345', 'US', 'UTC', TRUE, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at) VALUES
('LOC001', 'W001', NULL, 'LOC_A', 'STORAGE', 'Location A', 'Main Warehouse/Location A', 1000, 200, 'ACTIVE', TRUE, TRUE, NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at) VALUES
('SKU001', 'T001', 'SKU001', 'Sample SKU', 'This is a sample SKU.', 'KG', '{}'::JSON, FALSE, FALSE, FALSE, NULL, 1.5, '{}'::JSON, 'ERP001', NULL, TRUE, NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at) VALUES
('LOT001', 'T001', 'SKU001', 'LOT', 'LOT123', NULL, '2023-01-01', '2025-01-01', '2023-06-01', 'SUP001', 'ACTIVE', 'US', NOW(), NOW());

INSERT INTO Order (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at)
VALUES
('ORD001', 'T001', 'ONLINE', 'ERP_ORDER_001', 'NEW', '2023-11-01', 'Customer A', '{}'::JSON, 'CARRIER001', '{}'::JSON, NULL, 'PENDING', NOW(), NOW());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES
('SHIP001', 'T001', 'ORD001', 'UPS', 'UPS_GROUND', 'TRACK1234', 'http://example.com/label1', 'PENDING', 10, '{}'::JSON, '2023-11-05', NULL, NULL, NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp) VALUES
('MOV001', 'T001', 'RECEIVE', 'SKU001', 'LOT001', NULL, 'LOC001', 100, 'KG', NULL, NULL, 'USER001', 'PENDING', 'Initial stock received', NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at) VALUES
('INV001', 'T001', 'LOC001', 'SKU001', 'LOT001', 100, 0, 100, 'KG', NOW(), NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at) VALUES
('ROLE001', 'T001', 'Admin', '{}'::JSON, 'Administrator role', TRUE, NOW(), NOW());