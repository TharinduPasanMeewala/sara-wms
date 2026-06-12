import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import MobileReceiving from './pages/MobileReceiving';
import AdminSettings from './pages/AdminSettings';
import TenantManagement from './pages/TenantManagement';
import RoleConfiguration from './pages/RoleConfiguration';
import UserManagement from './pages/UserManagement';
import StockMovementReport from './pages/StockMovementReport';
import InventoryAgingReport from './pages/InventoryAgingReport';
import ERPIntegrationMonitor from './pages/ERPIntegrationMonitor';
import ShipmentDetail from './pages/ShipmentDetail';
import ShipmentManagement from './pages/ShipmentManagement';
import Dashboard from './pages/Dashboard';
import Layout from './components/Layout';

const App = () => {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path='/' element={<Dashboard />} />
          <Route path='/mobile/receiving' element={<MobileReceiving />} />
          <Route path='/admin/settings' element={<AdminSettings />} />
          <Route path='/admin/tenants' element={<TenantManagement />} />
          <Route path='/admin/roles' element={<RoleConfiguration />} />
          <Route path='/admin/users' element={<UserManagement />} />
          <Route path='/reports/stock-movements' element={<StockMovementReport />} />
          <Route path='/reports/inventory-aging' element={<InventoryAgingReport />} />
          <Route path='/integrations/erp' element={<ERPIntegrationMonitor />} />
          <Route path='/shipments/:shipmentId' element={<ShipmentDetail />} />
          <Route path='/shipments' element={<ShipmentManagement />} />
        </Routes>
      </Layout>
    </Router>
  );
};

export default App;