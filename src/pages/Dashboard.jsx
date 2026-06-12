export default function DashboardPage() {
  const stats = [
    { label: 'ERPSyncLog', value: 12, color: 'bg-blue-500' },
    { label: 'Shipment', value: 24, color: 'bg-blue-500' },
    { label: 'Order', value: 36, color: 'bg-blue-500' },
    { label: 'StockMovement', value: 48, color: 'bg-blue-500' },
  ];
  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-8 py-4 flex items-center justify-between">
        <h1 className="text-xl font-bold text-gray-900">Sara WMS </h1>
        <span className="text-sm text-gray-500">warehouse system</span>
      </header>
      <main className="p-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-2">Dashboard</h2>
        <p className="text-gray-500 mb-8">Welcome to Sara WMS </p>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
          {stats.map((s) => (
            <div key={s.label} className="bg-white rounded-xl border border-gray-200 p-5 flex items-center gap-4">
              <div className={`w-10 h-10 rounded-lg ${s.color} opacity-80 flex-shrink-0`} />
              <div>
                <p className="text-2xl font-bold text-gray-900">{s.value}</p>
                <p className="text-sm text-gray-500">{s.label}</p>
              </div>
            </div>
          ))}
        </div>
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-4">Modules</h3>
            <ul className="space-y-2">
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />Mobile Receiving & Putaway</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />System Settings & Configuration</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />Tenant Management</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />Role & Permission Configuration</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />User Management</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0" />Stock Movement Summary Report</li>
            </ul>
          </div>
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-4">Data Entities</h3>
            <ul className="space-y-2">
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />ERPSyncLog</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />Shipment</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />Order</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />StockMovement</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />Inventory</li>
              <li className="flex items-center gap-3 text-sm text-gray-700"><span className="w-2 h-2 rounded-full bg-green-500 flex-shrink-0" />LotSerial</li>
            </ul>
          </div>
        </div>
      </main>
    </div>
  )
}