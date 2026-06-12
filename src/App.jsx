import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import MobileReceiving from './pages/MobileReceiving';
import AdminSettings from './pages/AdminSettings';
import AdminTenants from './pages/AdminTenants';
import AdminRoles from './pages/AdminRoles';
import AdminUsers from './pages/AdminUsers';
import StockMovementReport from './pages/StockMovementReport';
import InventoryAgingReport from './pages/InventoryAgingReport';
import ERPIntegrationMonitor from './pages/ERPIntegrationMonitor';
import ShipmentDetail from './pages/ShipmentDetail';
import ShipmentManagement from './pages/ShipmentManagement';
import Layout from './components/Layout';

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path='/mobile/receiving' element={<MobileReceiving />} />
          <Route path='/admin/settings' element={<AdminSettings />} />
          <Route path='/admin/tenants' element={<AdminTenants />} />
          <Route path='/admin/roles' element={<AdminRoles />} />
          <Route path='/admin/users' element={<AdminUsers />} />
          <Route path='/reports/stock-movements' element={<StockMovementReport />} />
          <Route path='/reports/inventory-aging' element={<InventoryAgingReport />} />
          <Route path='/integrations/erp' element={<ERPIntegrationMonitor />} />
          <Route path='/shipments/:shipmentId' element={<ShipmentDetail />} />
          <Route path='/shipments' element={<ShipmentManagement />} />
        </Routes>
      </Layout>
    </Router>
  );
}

export default App;