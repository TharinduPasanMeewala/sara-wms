-- Sample seed data INSERT statements
INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at) VALUES
('log1', 'tenant1', 'IN', 'Shipment', 'entity1', 'ref1', 'SUCCESS', '{}', '{}', NULL, 0, NOW());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES
('shipment1', 'tenant1', 'order1', 'Carrier Inc.', 'CARRIER_CODE', 'TRACK123', 'http://label.url', 'SHIPPED', 10.5, '{"length": 10, "width": 5, "height": 4}', '2023-12-01', NOW(), NULL, NOW(), NOW());

INSERT INTO "Order" (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at) VALUES
('order1', 'tenant1', 'PURCHASE', 'ERP123', 'PENDING', '2023-11-01', 'Supplier Co.', '{"street":"123 Main St", "city":"Anytown"}', 'carrier1', '{"items": [{"sku_id": "sku1", "qty": 1}]}', NOW(), 'PENDING', NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp) VALUES
('movement1', 'tenant1', 'ADDITION', 'sku1', 'lot1', 'loc1', 'loc2', 100, 'EACH', 'ORDER', 'order1', 'user1', 'PENDING', 'Initial stock addition', NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at) VALUES
('inventory1', 'tenant1', 'loc1', 'sku1', 'lot1', 150, 10, 140, 'EACH', NOW(), NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at) VALUES
('lot1', 'tenant1', 'sku1', 'LOT', 'LOT001', 'SERIAL001', '2023-01-01', '2024-01-01', NOW(), 'supplier1', 'ACTIVE', 'USA', NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at) VALUES
('sku1', 'tenant1', 'SKU001', 'Sample SKU', 'A sample SKU for testing.', 'EACH', '{}', TRUE, TRUE, TRUE, 365, 0.5, '{"length": 10, "width": 5, "height": 2}', 'ERP-001', NULL, TRUE, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at) VALUES
('loc1', 'wh1', NULL, 'LOC001', 'WAREHOUSE', 'Main Warehouse', 'Main > Warehouse', 1000, 200, 'ACTIVE', TRUE, TRUE, NOW(), NOW());

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at) VALUES
('wh1', 'tenant1', 'WH001', 'Main Warehouse', '123 Warehouse Rd', NULL, 'Anytown', 'State', '12345', 'US', 'UTC', TRUE, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at) VALUES
('role1', 'tenant1', 'Admin', '{}', 'Administrator role with full access', TRUE, NOW(), NOW());