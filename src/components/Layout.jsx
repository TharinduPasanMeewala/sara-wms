import React from 'react';
import { Link } from 'react-router-dom';

const Layout = ({ children }) => {
  return (
    <div className="flex">
      <aside className="w-64 bg-gray-800 text-white p-4">
        <h2 className="text-lg font-bold mb-4">Sara WMS</h2>
        <nav>
          <ul>
            <li><Link to="/mobile/receiving">Mobile Receiving</Link></li>
            <li><Link to="/admin/settings">Settings</Link></li>
            <li><Link to="/admin/tenants">Tenant Management</Link></li>
            <li><Link to="/admin/roles">Role Configuration</Link></li>
            <li><Link to="/admin/users">User Management</Link></li>
            <li><Link to="/reports/stock-movements">Stock Movement</Link></li>
            <li><Link to="/reports/inventory-aging">Inventory Aging</Link></li>
            <li><Link to="/integrations/erp">ERP Monitor</Link></li>
            <li><Link to="/shipments">Shipments</Link></li>
          </ul>
        </nav>
      </aside>
      <main className="flex-1 p-6 bg-gray-100">
        {children}
      </main>
    </div>
  );
};

export default Layout;