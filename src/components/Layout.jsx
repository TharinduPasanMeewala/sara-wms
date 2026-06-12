import React from 'react';
import { Link } from 'react-router-dom';

const Layout = ({ children }) => {
  return (
    <div className="flex">
      <nav className="w-64 bg-gray-800 text-white h-screen p-5">
        <ul>
          <li><Link to="/mobile/receiving">Mobile Receiving</Link></li>
          <li><Link to="/admin/settings">Admin Settings</Link></li>
          <li><Link to="/admin/tenants">Tenants</Link></li>
          <li><Link to="/admin/roles">Roles</Link></li>
          <li><Link to="/admin/users">Users</Link></li>
          <li><Link to="/reports/stock-movements">Stock Movements</Link></li>
          <li><Link to="/reports/inventory-aging">Inventory Aging</Link></li>
          <li><Link to="/integrations/erp">ERP Integration</Link></li>
          <li><Link to="/shipments">Shipments</Link></li>
        </ul>
      </nav>
      <main className="flex-1 p-5">{children}</main>
    </div>
  );
};

export default Layout;