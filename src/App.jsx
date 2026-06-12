import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Layout from './components/Layout.jsx'
import DashboardPage from './pages/Dashboard.jsx'
import ERPSyncLogPage from './pages/ERPSyncLog.jsx'
import ShipmentPage from './pages/Shipment.jsx'
import OrderPage from './pages/Order.jsx'
import StockMovementPage from './pages/StockMovement.jsx'
import InventoryPage from './pages/Inventory.jsx'
import LotSerialPage from './pages/LotSerial.jsx'
import MobileReceivingPutawayPage from './pages/MobileReceivingPutaway.jsx'
import SystemSettingsConfigurationPage from './pages/SystemSettingsConfiguration.jsx'
import TenantManagementPage from './pages/TenantManagement.jsx'

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route element={<Layout />}>
          <Route path="/" element={<DashboardPage />} />
          <Route path="/erpsynclog" element={<ERPSyncLogPage />} />
          <Route path="/shipment" element={<ShipmentPage />} />
          <Route path="/order" element={<OrderPage />} />
          <Route path="/stockmovement" element={<StockMovementPage />} />
          <Route path="/inventory" element={<InventoryPage />} />
          <Route path="/lotserial" element={<LotSerialPage />} />
          <Route path="/mobile/receiving" element={<MobileReceivingPutawayPage />} />
          <Route path="/admin/settings" element={<SystemSettingsConfigurationPage />} />
          <Route path="/admin/tenants" element={<TenantManagementPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}