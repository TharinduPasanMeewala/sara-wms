// routes.js
const express = require('express');
const router = express.Router();
const controller = require('./controllers');

// Dashboard Overview
router.get('/dashboard/overview', controller.getDashboardOverview);

// ERP Sync
router.post('/erp-sync/test-connection', controller.testErpConnection);
router.put('/erp-sync/settings', controller.updateErpSettings);
router.get('/erp-sync/settings', controller.getErpSettings);
router.post('/erp-sync/trigger-partial', controller.triggerPartialSync);
router.post('/erp-sync/trigger', controller.triggerFullSync);
router.get('/erp-sync-logs/status', controller.getErpSyncLogsStatus);
router.post('/erp-sync-logs/:logId/retry', controller.retryErpSyncLog);
router.delete('/erp-sync-logs/:logId', controller.deleteErpSyncLog);
router.patch('/erp-sync-logs/:logId', controller.partialUpdateErpSyncLog);
router.put('/erp-sync-logs/:logId', controller.updateErpSyncLog);
router.get('/erp-sync-logs/:logId', controller.getErpSyncLogDetails);

module.exports = router;