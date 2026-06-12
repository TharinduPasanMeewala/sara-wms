-- Sample seed data INSERT statements
INSERT INTO ERPSyncLog (sync_log_id, tenant_id, sync_direction, entity_type, entity_id, erp_reference_id, sync_status, request_payload, response_payload, error_message, retry_count, synced_at) VALUES
('log_1', 'tenant_1', 'INBOUND', 'ORDER', 'entity_1', NULL, 'SUCCESS', '{}', '{}', NULL, 0, '2023-01-01 12:00:00');

INSERT INTO Shipment (shipment_id, tenant_id, order_id, carrier_name, carrier_service_code, tracking_number, label_url, shipment_status, weight_kg, dimensions_cm, estimated_delivery_date, shipped_at, delivered_at, created_at, updated_at) VALUES
('shipment_1', 'tenant_1', 'order_1', 'CarrierX', 'ServiceY', '123456', 'http://label.url', 'SHIPPED', 10.5, '{