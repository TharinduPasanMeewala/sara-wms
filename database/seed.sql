-- Sample seed data
INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at) VALUES
('1', 'tenant1', 'UPLOAD', 'ORDER', 'order123', NULL, 'SUCCESS', '{}'::json, '{}'::json, NULL, 0, NOW());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES
('shipment1', 'tenant1', 'order123', 'CarrierX', 'ServiceA', 'TRACK123', 'http://example.com/label.pdf', 'SHIPPED', 5.0, '{}'::json, '2023-10-10', NOW(), NULL, NOW(), NOW());

INSERT INTO "Order" (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at) VALUES
('order123', 'tenant1', 'ONLINE', 'ERP123', 'PENDING', '2023-10-02', 'Customer A', '{}'::json, NULL, '{}'::json, NOW(), 'PENDING', NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp) VALUES
('movement1', 'tenant1', 'INBOUND', 'sku1', NULL, 'location1', 'location2', 10, 'kg', 'ORDER', 'order123', 'user1', 'PENDING', NULL, NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at) VALUES
('inventory1', 'tenant1', 'location1', 'sku1', NULL, 100, 20, 80, 'kg', NOW(), NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at) VALUES
('lot1', 'tenant1', 'sku1', 'LOT', 'LOT123', 'SERIAL123', '2022-01-01', '2023-12-31', NOW(), 'SupplierX', 'ACTIVE', 'USA', NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at) VALUES
('sku1', 'tenant1', 'SKU123', 'Sample SKU', 'A sample SKU', 'kg', '{}'::json, TRUE, FALSE, FALSE, 365, NULL, '{}'::json, 'ERP-SKU-123', NULL, TRUE, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at) VALUES
('location1', 'warehouse1', NULL, 'LOC1', 'WAREHOUSE', 'Main Location', '/WAREHOUSE/LOC1', 1000, 50, 'ACTIVE', TRUE, TRUE, NOW(), NOW());

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at) VALUES
('warehouse1', 'tenant1', 'WH123', 'Main Warehouse', '123 Warehouse St', NULL, 'City', 'State', '12345', 'USA', 'UTC', TRUE, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at) VALUES
('role1', 'tenant1', 'Admin', '{}'::json, 'Administrator Role', TRUE, NOW(), NOW());