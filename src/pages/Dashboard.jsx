import { Link } from 'react-router-dom'

const STATS = [
    { label: 'ERPSyncLog', icon: '📦', color: 'bg-blue-500', route: '/erpsynclog' },
    { label: 'Shipment', icon: '🛒', color: 'bg-emerald-500', route: '/shipment' },
    { label: 'Order', icon: '👥', color: 'bg-violet-500', route: '/order' },
    { label: 'StockMovement', icon: '⚙️', color: 'bg-amber-500', route: '/stockmovement' },
]

export default function DashboardPage() {
  return (
    <div className="p-6 max-w-5xl">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-500 text-sm mt-1">Welcome to Sara WMS </p>
      </div>
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {STATS.map(s => (
          <Link to={s.route} key={s.label} className="bg-white rounded-2xl border border-gray-200 p-5 flex items-center gap-4 hover:border-blue-300 hover:shadow-sm transition-all">
            <div className={`w-11 h-11 rounded-xl ${s.color} flex items-center justify-center text-xl flex-shrink-0`}>{s.icon}</div>
            <div>
              <p className="text-xs text-gray-500">{s.label}</p>
              <p className="text-xl font-bold text-gray-900">—</p>
            </div>
          </Link>
        ))}
      </div>
      <div className="bg-white rounded-2xl border border-gray-200 p-5">
        <h2 className="font-semibold text-gray-900 mb-4">Quick Navigation</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
            <a href="/erpsynclog" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">📦</span>
              <span className="flex-1">ERPSyncLog</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
            <a href="/shipment" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">🛒</span>
              <span className="flex-1">Shipment</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
            <a href="/order" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">👥</span>
              <span className="flex-1">Order</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
            <a href="/stockmovement" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">⚙️</span>
              <span className="flex-1">StockMovement</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
            <a href="/inventory" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">📋</span>
              <span className="flex-1">Inventory</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
            <a href="/lotserial" className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-blue-50 hover:text-blue-700 transition-colors text-sm font-medium text-gray-700 group">
              <span className="text-xl">🔧</span>
              <span className="flex-1">LotSerial</span>
              <span className="text-gray-400 group-hover:text-blue-500">→</span>
            </a>
        </div>
      </div>
    </div>
  )
}