-- Sample seed data INSERT statements

INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at)
VALUES
  ('1', 'tenant_1', 'INBOUND', 'ORDER', 'entity_1', NULL, 'COMPLETED', '{}', '{}', NULL, 0, NOW());

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at)
VALUES
  ('1', 'tenant_1', 'order_1', 'CarrierX', 'SERVICE_A', 'TRACK123', 'http://url.com/label', 'SHIPPED', 5.0, '{}', '2023-10-01', NOW(), NULL, NOW(), NOW());

INSERT INTO Order (order_id, tenant_id, order_type, erp_order_number, order_status, expected_date, supplier_or_customer_name, shipping_address, carrier_id, line_items, erp_last_sync_at, erp_sync_status, created_at, updated_at)
VALUES
  ('order_1', 'tenant_1', 'PURCHASE', 'ERP123', 'NEW', '2023-10-15', 'Supplier A', '{}', NULL, '{}', NOW(), 'PENDING', NOW(), NOW());

INSERT INTO StockMovement (movement_id, tenant_id, movement_type, sku_id, lot_serial_id, from_location_id, to_location_id, quantity, uom, reference_type, reference_id, performed_by_user_id, erp_sync_status, notes, movement_timestamp)
VALUES
  ('movement_1', 'tenant_1', 'IN', 'sku_1', NULL, 'loc_1', 'loc_2', 10.0, 'KG', 'ORDER', 'order_1', 'user_1', 'PENDING', 'Restocked 10 units.', NOW());

INSERT INTO Inventory (inventory_id, tenant_id, location_id, sku_id, lot_serial_id, quantity_on_hand, quantity_reserved, quantity_available, uom, last_count_date, created_at, updated_at)
VALUES
  ('inventory_1', 'tenant_1', 'loc_1', 'sku_1', NULL, 20.0, 5.0, 15.0, 'KG', NOW(), NOW(), NOW());

INSERT INTO LotSerial (lot_serial_id, tenant_id, sku_id, tracking_type, lot_number, serial_number, manufacture_date, expiry_date, receipt_date, supplier_lot_ref, status, country_of_origin, created_at, updated_at)
VALUES
  ('lot_1', 'tenant_1', 'sku_1', 'LOT_TRACKING', 'LOT123', 'SN123456', '2023-01-01', '2024-01-01', NOW(), 'Supplier Lot 001', 'ACTIVE', 'USA', NOW(), NOW());

INSERT INTO SKU (sku_id, tenant_id, sku_code, sku_name, description, base_uom, uom_conversions, is_lot_tracked, is_serial_tracked, is_expiry_tracked, shelf_life_days, weight_kg, dimensions_cm, erp_item_code, hazmat_class, is_active, created_at, updated_at)
VALUES
  ('sku_1', 'tenant_1', 'SKU001', 'SKU Name 1', 'Description of SKU 1', 'KG', '{}', TRUE, FALSE, TRUE, 365, 1.5, '{}', NULL, NULL, TRUE, NOW(), NOW());

INSERT INTO Location (location_id, warehouse_id, parent_location_id, location_code, location_type, location_name, path, max_weight_kg, max_volume_m3, location_status, is_pickable, is_receivable, created_at, updated_at)
VALUES
  ('loc_1', 'warehouse_1', NULL, 'LOC001', 'PICKING', 'Picking Location 1', '1/1', 100.0, 50.0, 'ACTIVE', TRUE, TRUE, NOW(), NOW());

INSERT INTO Warehouse (warehouse_id, tenant_id, warehouse_code, warehouse_name, address_line1, address_line2, city, state_province, postal_code, country_code, timezone, is_active, created_at, updated_at)
VALUES
  ('warehouse_1', 'tenant_1', 'WH001', 'Warehouse Name 1', '1234 Main St', NULL, 'CityX', 'StateY', '12345', 'US', 'America/New_York', TRUE, NOW(), NOW());

INSERT INTO Role (role_id, tenant_id, role_name, permissions, description, is_system_role, created_at, updated_at)
VALUES
  ('role_1', 'tenant_1', 'Admin', '{}', 'Administrator role', TRUE, NOW(), NOW());