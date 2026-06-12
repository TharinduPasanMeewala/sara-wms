import React from 'react';
import { NavLink } from 'react-router-dom';

const Layout = ({ children }) => {
    return (
        <div className="flex">
            <nav className="bg-gray-800 text-white w-64 min-h-screen p-4">
                <h2 className="text-2xl mb-4">Sara WMS</h2>
                <ul>
                    <li><NavLink to="/mobile/receiving" className="block py-2">Mobile Receiving</NavLink></li>
                    <li><NavLink to="/admin/settings" className="block py-2">System Settings</NavLink></li>
                    <li><NavLink to="/admin/tenants" className="block py-2">Tenant Management</NavLink></li>
                    <li><NavLink to="/admin/roles" className="block py-2">Roles & Permissions</NavLink></li>
                    <li><NavLink to="/admin/users" className="block py-2">User Management</NavLink></li>
                    <li><NavLink to="/reports/stock-movements" className="block py-2">Stock Movement Report</NavLink></li>
                    <li><NavLink to="/reports/inventory-aging" className="block py-2">Inventory Aging Report</NavLink></li>
                    <li><NavLink to="/integrations/erp" className="block py-2">ERP Integration Monitor</NavLink></li>
                    <li><NavLink to="/shipments" className="block py-2">Shipment Management</NavLink></li>
                </ul>
            </nav>
            <main className="flex-1 p-6 bg-gray-100">
                {children}
            </main>
        </div>
    );
};

export default Layout;