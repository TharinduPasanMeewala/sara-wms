import React from 'react';
import { Link } from 'react-router-dom';

function Layout({ children }) {
  return (
    <div className="flex">
      <nav className="bg-gray-800 w-64 h-screen">
        <div className="p-4">
          <h2 className="text-white text-lg font-semibold">Sara WMS</h2>
        </div>
        <ul className="mt-6">
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/mobile/receiving'>Mobile Receiving</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/admin/settings'>Settings</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/admin/tenants'>Tenants</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/admin/roles'>Roles</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/admin/users'>Users</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/reports/stock-movements'>Stock Movements</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/reports/inventory-aging'>Inventory Aging</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/integrations/erp'>ERP Integration</Link></li>
          <li><Link className="text-gray-300 hover:bg-gray-700 hover:text-white block p-2" to='/shipments'>Shipments</Link></li>
        </ul>
      </nav>
      <main className="flex-1 p-6">{children}</main>
    </div>
  );
}

export default Layout;