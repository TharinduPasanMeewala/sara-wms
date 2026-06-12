-- Sample seed data INSERT statements

INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at) VALUES 
('1', 'tenant123', 'OUTBOUND', 'SHIPMENT', 'shipment1', null, 'SUCCESS', '{}'::json, '{}'::json, null, 0, now()),
('2', 'tenant123', 'INBOUND', 'ORDER', 'order1', null, 'FAILURE', '{}'::json, '{}'::json, 'Error description', 1, now());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES 
('shipment1', 'tenant123', 'order1', 'Carrier A', 'SERVICE123', 'TRACKING123', 'http://example.com/label', 'SHIPPED', 10.5, '{}'::json, '2023-11-01', NOW(), NULL, NOW(), NOW());

INSERT INTO "Order" (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at) VALUES 
('order1', 'tenant123', 'STANDARD', 'ERPORDER001', 'NEW', '2023-10-31', 'Acme Corp', '{}'::json, null, '{}'::json, now(), 'SYNCHED', NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp) VALUES 
('movement1', 'tenant123', 'ADD', 'sku123', null, 'location1', 'location2', 100.0, 'KG', null, null, 'user1', 'SYNCHED', 'Initial stock', NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at) VALUES 
('inventory1', 'tenant123', 'location1', 'sku123', null, 100.0, 10.0, 90.0, 'KG', NOW(), NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at) VALUES 
('lot123', 'tenant123', 'sku123', 'LOT', 'LOT001', 'SN123', '2022-01-01', '2023-01-01', NOW(), 'SUP123', 'ACTIVE', 'USA', NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at) VALUES 
('sku123', 'tenant123', 'SKU001', 'Sample SKU', 'Description of SKU', 'KG', '{}'::json, true, false, false, 30, 1.0, '{}'::json, 'ERP001', 'HAZMAT', true, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at) VALUES 
('location1', 'warehouse1', null, 'LOC001', 'STORAGE', 'Warehouse Location 1', 'Path/to/location', 1000.0, 50.0, 'ACTIVE', true, true, NOW(), NOW());

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at) VALUES 
('warehouse1', 'tenant123', 'WH001', 'Main Warehouse', '123 Street', 'Suite 200', 'City', 'State', '12345', 'US', 'UTC', true, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at) VALUES 
('role1', 'tenant123', 'Admin', '{}'::json, 'Administrator role', true, NOW(), NOW());