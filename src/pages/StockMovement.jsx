import { useState, useEffect } from 'react'

const API = 'http://localhost:3000/api/stockmovements'

export default function StockMovementPage() {
  const [stockMovements, setStockMovements] = useState([])
  const [loading, setLoading] = useState(true)
  const [showForm, setShowForm] = useState(false)
  const [form, setForm] = useState({movement_id: '', tenant_id: '', movement_type: '', sku_id: '', lot_serial_id: ''})
  const [editing, setEditing] = useState(null)

  useEffect(() => { load() }, [])

  async function load() {
    setLoading(true)
    try {
      const res = await fetch(API)
      if (res.ok) setStockMovements(await res.json())
    } catch(e) { console.error(e) }
    setLoading(false)
  }

  async function save() {
    const method = editing ? 'PUT' : 'POST'
    const url = editing ? `${API}/${editing}` : API
    await fetch(url, { method, headers: {'Content-Type':'application/json'}, body: JSON.stringify(form) })
    setShowForm(false); setEditing(null); setForm({movement_id: '', tenant_id: '', movement_type: '', sku_id: '', lot_serial_id: ''}); load()
  }

  async function remove(id) {
    if (!confirm('Delete this record?')) return
    await fetch(`${API}/${id}`, { method: 'DELETE' })
    load()
  }

  function edit(item) {
    setForm({...item}); setEditing(item.id); setShowForm(true)
  }

  return (
    <div className="p-6">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">StockMovement</h1>
          <p className="text-sm text-gray-500 mt-0.5">Manage StockMovement records</p>
        </div>
        <button onClick={() => { setShowForm(true); setEditing(null); setForm({movement_id: '', tenant_id: '', movement_type: '', sku_id: '', lot_serial_id: ''}) }} className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-blue-700 transition-colors">
          + Add StockMovement
        </button>
      </div>

      {showForm && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl shadow-xl p-6 w-full max-w-md">
            <h2 className="text-lg font-bold text-gray-900 mb-4">{editing ? 'Edit' : 'New'} StockMovement</h2>
            <div className="space-y-4">
              
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">movement_id</label>
              <input className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value={form.movement_id || ''} onChange={e => setForm(p => ({...p, movement_id: e.target.value}))} />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">tenant_id</label>
              <input className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value={form.tenant_id || ''} onChange={e => setForm(p => ({...p, tenant_id: e.target.value}))} />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">movement_type</label>
              <input className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value={form.movement_type || ''} onChange={e => setForm(p => ({...p, movement_type: e.target.value}))} />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">sku_id</label>
              <input className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value={form.sku_id || ''} onChange={e => setForm(p => ({...p, sku_id: e.target.value}))} />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">lot_serial_id</label>
              <input className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value={form.lot_serial_id || ''} onChange={e => setForm(p => ({...p, lot_serial_id: e.target.value}))} />
            </div>
            </div>
            <div className="flex gap-3 mt-6">
              <button onClick={save} className="flex-1 bg-blue-600 text-white py-2 rounded-lg text-sm font-medium hover:bg-blue-700">Save</button>
              <button onClick={() => { setShowForm(false); setEditing(null) }} className="flex-1 border border-gray-300 text-gray-700 py-2 rounded-lg text-sm font-medium hover:bg-gray-50">Cancel</button>
            </div>
          </div>
        </div>
      )}

      {loading ? (
        <div className="flex items-center justify-center py-16">
          <div className="w-6 h-6 border-2 border-blue-500/30 border-t-blue-500 rounded-full animate-spin" />
        </div>
      ) : stockMovements.length === 0 ? (
        <div className="text-center py-16 border-2 border-dashed border-gray-200 rounded-2xl">
          <p className="text-gray-400 text-sm">No StockMovement records yet.</p>
          <button onClick={() => setShowForm(true)} className="mt-3 text-blue-600 text-sm font-medium hover:underline">Add the first one</button>
        </div>
      ) : (
        <div className="bg-white rounded-2xl border border-gray-200 overflow-hidden">
          <table className="w-full">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
              <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase">movement_id</th>
              <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase">tenant_id</th>
              <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase">movement_type</th>
              <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase">sku_id</th>
              <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase">lot_serial_id</th>
                <th className="px-4 py-3 text-right text-xs font-semibold text-gray-500 uppercase">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {stockMovements.map(item => (
                <tr key={item.id} className="hover:bg-gray-50 transition-colors">
                  <td className="px-4 py-3 text-sm text-gray-700">{String(item.movement_id ?? '')}</td>
                  <td className="px-4 py-3 text-sm text-gray-700">{String(item.tenant_id ?? '')}</td>
                  <td className="px-4 py-3 text-sm text-gray-700">{String(item.movement_type ?? '')}</td>
                  <td className="px-4 py-3 text-sm text-gray-700">{String(item.sku_id ?? '')}</td>
                  <td className="px-4 py-3 text-sm text-gray-700">{String(item.lot_serial_id ?? '')}</td>
                  <td className="px-4 py-3 text-right">
                    <button onClick={() => edit(item)} className="text-blue-600 hover:text-blue-800 text-xs font-medium mr-3">Edit</button>
                    <button onClick={() => remove(item.id)} className="text-red-500 hover:text-red-700 text-xs font-medium">Delete</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}