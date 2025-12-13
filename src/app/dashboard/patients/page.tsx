'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/hooks/useAuth'
import { Search, Plus, Users, Loader2, Filter, UserCircle } from 'lucide-react'
import type { Patient } from '@/types'

export default function PatientsPage() {
  const router = useRouter()
  const { user } = useAuth()
  const [patients, setPatients] = useState<Patient[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [genderFilter, setGenderFilter] = useState<'all' | 'male' | 'female' | 'other'>('all')

  useEffect(() => {
    fetchPatients()
  }, [])

  const fetchPatients = async () => {
    try {
      let query = supabase
        .from('patients')
        .select('*')
        .eq('is_active', true)
        .order('created_at', { ascending: false })

      const { data, error } = await query

      if (error) throw error
      setPatients(data || [])
    } catch (error) {
      console.error('Error fetching patients:', error)
    } finally {
      setLoading(false)
    }
  }

  const filteredPatients = patients.filter(patient => {
    const matchesSearch = 
      patient.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      patient.phone.includes(searchQuery) ||
      patient.email?.toLowerCase().includes(searchQuery.toLowerCase())
    
    const matchesGender = genderFilter === 'all' || patient.gender === genderFilter

    return matchesSearch && matchesGender
  })

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <Users className="h-8 w-8 text-primary" />
              <div>
                <h1 className="text-2xl font-bold text-gray-900">Patients</h1>
                <p className="text-sm text-gray-600">Manage patient records</p>
              </div>
            </div>
            <button
              onClick={() => router.push('/dashboard/patients/new')}
              className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-lg hover:bg-primary/90 transition"
            >
              <Plus className="h-5 w-5" />
              Add Patient
            </button>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Search and Filters */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
          <div className="flex flex-col md:flex-row gap-4">
            {/* Search */}
            <div className="flex-1 relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400" />
              <input
                type="text"
                placeholder="Search by name, phone, or email..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent outline-none"
              />
            </div>

            {/* Gender Filter */}
            <div className="flex items-center gap-2">
              <Filter className="h-5 w-5 text-gray-400" />
              <select
                value={genderFilter}
                onChange={(e) => setGenderFilter(e.target.value as any)}
                className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent outline-none"
              >
                <option value="all">All Genders</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
              </select>
            </div>
          </div>

          {/* Results Count */}
          <div className="mt-4 text-sm text-gray-600">
            Showing {filteredPatients.length} of {patients.length} patients
          </div>
        </div>

        {/* Patients List */}
        {loading ? (
          <div className="flex items-center justify-center py-12">
            <Loader2 className="h-8 w-8 animate-spin text-primary" />
          </div>
        ) : filteredPatients.length === 0 ? (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-12 text-center">
            <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h3 className="text-lg font-semibold text-gray-900 mb-2">No patients found</h3>
            <p className="text-gray-600 mb-6">
              {searchQuery || genderFilter !== 'all'
                ? 'Try adjusting your search or filters'
                : 'Get started by adding your first patient'}
            </p>
            {!searchQuery && genderFilter === 'all' && (
              <button
                onClick={() => router.push('/dashboard/patients/new')}
                className="inline-flex items-center gap-2 px-6 py-3 bg-primary text-white rounded-lg hover:bg-primary/90 transition"
              >
                <Plus className="h-5 w-5" />
                Add First Patient
              </button>
            )}
          </div>
        ) : (
          <div className="grid gap-4">
            {filteredPatients.map((patient) => (
              <PatientCard
                key={patient.id}
                patient={patient}
                onClick={() => router.push(`/dashboard/patients/${patient.id}`)}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

function PatientCard({ patient, onClick }: { patient: Patient; onClick: () => void }) {
  return (
    <div
      onClick={onClick}
      className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition cursor-pointer"
    >
      <div className="flex items-start justify-between">
        <div className="flex items-start gap-4 flex-1">
          {/* Avatar */}
          <div className="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center flex-shrink-0">
            <UserCircle className="h-8 w-8 text-primary" />
          </div>

          {/* Patient Info */}
          <div className="flex-1 min-w-0">
            <h3 className="text-lg font-semibold text-gray-900 mb-1">{patient.name}</h3>
            <div className="flex flex-wrap gap-4 text-sm text-gray-600">
              <span>{patient.age} years</span>
              <span className="capitalize">{patient.gender}</span>
              <span>{patient.phone}</span>
              {patient.email && <span>{patient.email}</span>}
            </div>

            {/* Medical Info */}
            <div className="mt-3 flex flex-wrap gap-2">
              {patient.blood_group && (
                <span className="px-2 py-1 bg-red-100 text-red-700 text-xs font-medium rounded">
                  {patient.blood_group}
                </span>
              )}
              {patient.allergies && patient.allergies.length > 0 && (
                <span className="px-2 py-1 bg-orange-100 text-orange-700 text-xs font-medium rounded">
                  {patient.allergies.length} Allergies
                </span>
              )}
              {patient.chronic_conditions && patient.chronic_conditions.length > 0 && (
                <span className="px-2 py-1 bg-blue-100 text-blue-700 text-xs font-medium rounded">
                  {patient.chronic_conditions.length} Conditions
                </span>
              )}
            </div>
          </div>
        </div>

        {/* Created Date */}
        <div className="text-sm text-gray-500 text-right">
          {new Date(patient.created_at).toLocaleDateString('en-IN', {
            day: 'numeric',
            month: 'short',
            year: 'numeric'
          })}
        </div>
      </div>
    </div>
  )
}
