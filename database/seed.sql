-- Sample seed data INSERT statements

INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at) VALUES
('log_1', 'tenant_1', 'IN', 'ORDER', 'order_1', 'erp_ref_1', 'COMPLETED', '{}', '{}', NULL, 0, NOW());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES
('shipment_1', 'tenant_1', 'order_1', 'Carrier A', 'CS001', 'TRACK12345', 'http://label.url', 'SHIPPED', 10.5, '{}', '2023-12-25', NOW(), NULL, NOW(), NOW());

INSERT INTO "Order" (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at) VALUES
('order_1', 'tenant_1', 'PURCHASE', 'ERP001', 'COMPLETED', '2023-12-20', 'Supplier A', '{}', 'carrier_1', '{}', NOW(), 'COMPLETED', NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp) VALUES
('movement_1', 'tenant_1', 'INBOUND', 'sku_1', NULL, 'location_1', 'location_2', 100.0, 'KG', 'ORDER', 'order_1', 'user_1', 'COMPLETED', 'Initial stock', NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at) VALUES
('inventory_1', 'tenant_1', 'location_1', 'sku_1', NULL, 200.0, 50.0, 150.0, 'KG', NOW(), NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at) VALUES
('lot_1', 'tenant_1', 'sku_1', 'LOT', 'LOT001', NULL, '2023-01-01', '2025-01-01', NOW(), 'SUPPLIER001', 'ACTIVE', 'USA', NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at) VALUES
('sku_1', 'tenant_1', 'SKU001', 'SKU Name', 'Description of SKU', 'KG', '{}', true, false, false, 365, 1.5, '{}', 'ERP_Sku001', NULL, true, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at) VALUES
('location_1', 'warehouse_1', NULL, 'LOC001', 'PICK', 'Main Pick Location', 'pickup/path', 500.0, 100.0, 'ACTIVE', true, true, NOW(), NOW());

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at) VALUES
('warehouse_1', 'tenant_1', 'WH001', 'Main Warehouse', '123 Warehouse St', NULL, 'Cityville', 'State', '12345', 'US', 'UTC', true, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at) VALUES
('role_1', 'tenant_1', 'Admin', '{}', 'Administrator role', true, NOW(), NOW());