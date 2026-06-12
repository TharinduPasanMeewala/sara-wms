import React from 'react';
import { Link, NavLink } from 'react-router-dom';

function Layout({ children }) {
  return (
    <div className="flex">
      <nav className="w-64 bg-blue-600 h-screen p-4">
        <h2 className="text-white text-lg font-semibold mb-6">Sara WMS</h2>
        <ul className="space-y-2">
          <li><NavLink to="/mobile/receiving" className="text-white hover:bg-blue-500 p-2 rounded">Mobile Receiving</NavLink></li>
          <li><NavLink to="/admin/settings" className="text-white hover:bg-blue-500 p-2 rounded">Settings</NavLink></li>
          <li><NavLink to="/admin/tenants" className="text-white hover:bg-blue-500 p-2 rounded">Tenants</NavLink></li>
          <li><NavLink to="/admin/roles" className="text-white hover:bg-blue-500 p-2 rounded">Roles</NavLink></li>
          <li><NavLink to="/admin/users" className="text-white hover:bg-blue-500 p-2 rounded">Users</NavLink></li>
          <li><NavLink to="/reports/stock-movements" className="text-white hover:bg-blue-500 p-2 rounded">Stock Movements</NavLink></li>
          <li><NavLink to="/reports/inventory-aging" className="text-white hover:bg-blue-500 p-2 rounded">Inventory Aging</NavLink></li>
          <li><NavLink to="/integrations/erp" className="text-white hover:bg-blue-500 p-2 rounded">ERP Integration</NavLink></li>
          <li><NavLink to="/shipments" className="text-white hover:bg-blue-500 p-2 rounded">Shipments</NavLink></li>
        </ul>
      </nav>
      <main className="flex-1 p-6">{children}</main>
    </div>
  );
}

export default Layout;