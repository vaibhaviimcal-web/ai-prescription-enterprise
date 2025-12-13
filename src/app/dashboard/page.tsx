'use client'

import { useAuth } from '@/hooks/useAuth'
import { Activity, Users, FileText, Calendar, LogOut, Loader2 } from 'lucide-react'

export default function DashboardPage() {
  const { user, loading, signOut } = useAuth()

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <Activity className="h-8 w-8 text-primary" />
              <div>
                <h1 className="text-2xl font-bold text-gray-900">AI Prescription Enterprise</h1>
                <p className="text-sm text-gray-600">Welcome back, {user?.name}</p>
              </div>
            </div>
            <button
              onClick={signOut}
              className="flex items-center gap-2 px-4 py-2 text-gray-700 hover:text-red-600 transition"
            >
              <LogOut className="h-5 w-5" />
              <span>Sign Out</span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Stats Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <StatCard
            icon={Users}
            title="Total Patients"
            value="0"
            color="bg-blue-500"
          />
          <StatCard
            icon={FileText}
            title="Prescriptions"
            value="0"
            color="bg-green-500"
          />
          <StatCard
            icon={Calendar}
            title="Appointments"
            value="0"
            color="bg-purple-500"
          />
          <StatCard
            icon={Activity}
            title="Active Today"
            value="0"
            color="bg-orange-500"
          />
        </div>

        {/* Welcome Message */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-8 text-center">
          <div className="max-w-2xl mx-auto">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">
              🎉 Welcome to AI Prescription Enterprise!
            </h2>
            <p className="text-lg text-gray-600 mb-6">
              Your account has been created successfully. The full dashboard with patient management,
              prescription generation, and analytics will be available in the next steps.
            </p>
            <div className="bg-primary/10 border border-primary/20 rounded-lg p-4">
              <p className="text-sm text-primary font-medium">
                <strong>Role:</strong> {user?.role?.toUpperCase()} | <strong>Email:</strong> {user?.email}
              </p>
            </div>
          </div>
        </div>
      </main>
    </div>
  )
}

function StatCard({ icon: Icon, title, value, color }: {
  icon: any
  title: string
  value: string
  color: string
}) {
  return (
    <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
      <div className="flex items-center justify-between">
        <div>
          <p className="text-sm text-gray-600 mb-1">{title}</p>
          <p className="text-3xl font-bold text-gray-900">{value}</p>
        </div>
        <div className={`${color} p-3 rounded-lg`}>
          <Icon className="h-6 w-6 text-white" />
        </div>
      </div>
    </div>
  )
}
