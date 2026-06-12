import React from 'react';

const Dashboard = () => {
  return (
    <div className="p-4">
      <h1 className="text-3xl font-bold mb-4">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-white p-6 rounded-lg shadow-md">
          <h2 className="text-xl font-semibold">Stock Movement Summary</h2>
          <p>Overview of stock movements...</p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow-md">
          <h2 className="text-xl font-semibold">Inventory Aging Report</h2>
          <p>Report on inventory aging...</p>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;