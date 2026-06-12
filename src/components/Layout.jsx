import { Link, useLocation, Outlet } from 'react-router-dom'

const NAV = [
    { path: '/', label: 'Dashboard', icon: '📊' },
    { path: '/erpsynclog', label: 'ERPSyncLog', icon: '📦' },
    { path: '/shipment', label: 'Shipment', icon: '🛒' },
    { path: '/order', label: 'Order', icon: '👥' },
    { path: '/stockmovement', label: 'StockMovement', icon: '⚙️' },
    { path: '/inventory', label: 'Inventory', icon: '📋' },
    { path: '/lotserial', label: 'LotSerial', icon: '🔧' },
    { path: '/mobile/receiving', label: 'Mobile Receiving & Putaway', icon: '📈' },
    { path: '/admin/settings', label: 'System Settings & Configuration', icon: '🏷️' },
    { path: '/admin/tenants', label: 'Tenant Management', icon: '📁' },
]

export default function Layout() {
  const { pathname } = useLocation()
  return (
    <div className="flex min-h-screen bg-gray-50">
      <aside className="w-60 bg-gray-900 flex flex-col flex-shrink-0">
        <div className="px-5 py-5 border-b border-gray-700/50">
          <h1 className="text-white font-bold text-base truncate">Sara WMS </h1>
          <p className="text-gray-400 text-xs mt-0.5">warehouse system</p>
        </div>
        <nav className="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
          {NAV.map(item => (
            <Link
              key={item.path}
              to={item.path}
              className={`flex items-center gap-3 px-3 py-2 rounded-lg text-sm font-medium transition-colors ${
                pathname === item.path
                  ? 'bg-blue-600 text-white'
                  : 'text-gray-300 hover:bg-gray-800 hover:text-white'
              }`}
            >
              <span className="text-base">{item.icon}</span>
              <span>{item.label}</span>
            </Link>
          ))}
        </nav>
      </aside>
      <main className="flex-1 overflow-auto">
        <Outlet />
      </main>
    </div>
  )
}