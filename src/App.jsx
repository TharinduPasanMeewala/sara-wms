import { BrowserRouter, Routes, Route } from 'react-router-dom'
import DashboardPage from './pages/Dashboard.jsx'
import MobileReceivingPutawayPage from './pages/MobileReceivingPutaway.jsx'
import SystemSettingsConfigurationPage from './pages/SystemSettingsConfiguration.jsx'
import TenantManagementPage from './pages/TenantManagement.jsx'
import RolePermissionConfigurationPage from './pages/RolePermissionConfiguration.jsx'
import UserManagementPage from './pages/UserManagement.jsx'
import StockMovementSummaryReportPage from './pages/StockMovementSummaryReport.jsx'
import InventoryAgingReportPage from './pages/InventoryAgingReport.jsx'
import ERPIntegrationMonitorPage from './pages/ERPIntegrationMonitor.jsx'

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<DashboardPage />} />
        <Route path="/mobile/receiving" element={<MobileReceivingPutawayPage />} />
        <Route path="/admin/settings" element={<SystemSettingsConfigurationPage />} />
        <Route path="/admin/tenants" element={<TenantManagementPage />} />
        <Route path="/admin/roles" element={<RolePermissionConfigurationPage />} />
        <Route path="/admin/users" element={<UserManagementPage />} />
        <Route path="/reports/stock-movements" element={<StockMovementSummaryReportPage />} />
        <Route path="/reports/inventory-aging" element={<InventoryAgingReportPage />} />
        <Route path="/integrations/erp" element={<ERPIntegrationMonitorPage />} />
      </Routes>
    </BrowserRouter>
  )
}