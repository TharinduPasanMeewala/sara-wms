// System Performance Monitoring & Auto-Scaling Response (scheduled)
// Trigger: Scheduled every 60 seconds OR performance threshold breach event
// Steps: Performance Metrics Collection → Threshold Evaluation → Multi-Tenant Resource Isolation Check → Auto-Scaling Trigger → Database Query Optimization Response → Background Job Queue Management → CRITICAL Alert & Incident Creation → Recovery Validation & Scale-Down → Performance Trend Reporting

// Location & SKU Master Data Management (entity_update)
// Trigger: Location or SKU entity created or updated by warehouse staff
// Steps: Change Request Initiation → Data Validation & Business Rule Check → Impact Assessment → Approval Routing → Change Execution → Cascading Updates → ERP Master Data Sync → Audit Trail Creation

// ERP Integration Sync & Error Recovery (event)
// Trigger: StockMovement, Order, or Shipment entity updated OR scheduled every 15 minutes for batch sync
// Steps: Sync Event Capture → Tenant ERP Configuration Lookup → Payload Transformation & Validation → ERP API Call Execution → Response Validation & Success Confirmation → Retry Logic for Transient Failures → Permanent Failure Alerting & Manual Recovery → Batch Reconciliation Sync → Sync Health Dashboard Update

// User Onboarding & Role-Based Access Provisioning (entity_create)
// Trigger: User record created with status = PENDING_APPROVAL
// Steps: User Registration Intake → Tenant Isolation Validation → Manager Approval Request → Role Permission Review → Account Activation & Credential Setup → Access Provisioning → Welcome & Training Notification → Access Audit Logging

// Inventory Aging Alert & Disposition Workflow (scheduled)
// Trigger: Scheduled daily at 06:00 warehouse local time
// Steps: Aging Calculation Engine → Expiry Alert Generation → Slow-Moving Stock Identification → Automated FEFO Enforcement → Disposition Recommendation → Disposition Approval & Execution → Aging Report Distribution → ERP Financial Accrual Sync