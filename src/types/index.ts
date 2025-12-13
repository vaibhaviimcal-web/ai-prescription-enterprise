// User Types
export type UserRole = 'admin' | 'doctor' | 'staff'

export interface User {
  id: string
  email: string
  name: string
  role: UserRole
  clinicId?: string
  createdAt: string
  updatedAt: string
}

// Patient Types
export interface Patient {
  id: string
  name: string
  age: number
  gender: 'male' | 'female' | 'other'
  phone: string
  email?: string
  bloodGroup?: string
  allergies: string[]
  chronicConditions: string[]
  address?: string
  emergencyContact?: string
  createdAt: string
  updatedAt: string
}

// Medicine Types
export interface Medicine {
  id: string
  name: string
  genericName?: string
  category: string
  dosageForms: string[]
  standardDosages: {
    adult?: string
    child?: string
    elderly?: string
  }
  contraindications: string[]
  sideEffects: string[]
  interactions: string[]
  pregnancy?: string
  lactation?: string
}

// Prescription Types
export interface Prescription {
  id: string
  patientId: string
  doctorId: string
  clinicId?: string
  symptoms: string
  diagnosis: string
  medicines: PrescriptionMedicine[]
  advice: string
  followUp: string
  aiProvider: 'gemini' | 'openai' | 'groq' | 'demo'
  createdAt: string
  updatedAt: string
}

export interface PrescriptionMedicine {
  medicineId?: string
  name: string
  dosage: string
  frequency: string
  duration: string
  instructions: string
  warnings?: string[]
}

// Appointment Types
export interface Appointment {
  id: string
  patientId: string
  doctorId: string
  clinicId?: string
  date: string
  time: string
  duration: number
  status: 'scheduled' | 'completed' | 'cancelled' | 'no-show'
  notes?: string
  createdAt: string
  updatedAt: string
}

// Clinic Types
export interface Clinic {
  id: string
  name: string
  address: string
  phone: string
  email: string
  logo?: string
  letterhead?: string
  registrationNumber?: string
  gstNumber?: string
  createdAt: string
  updatedAt: string
}

// Invoice Types
export interface Invoice {
  id: string
  patientId: string
  clinicId?: string
  prescriptionId?: string
  items: InvoiceItem[]
  subtotal: number
  tax: number
  discount: number
  total: number
  status: 'paid' | 'pending' | 'cancelled'
  paymentMethod?: string
  paidAt?: string
  createdAt: string
  updatedAt: string
}

export interface InvoiceItem {
  description: string
  quantity: number
  rate: number
  amount: number
}

// Analytics Types
export interface AnalyticsData {
  totalPrescriptions: number
  totalPatients: number
  totalRevenue: number
  avgMedicinesPerPrescription: number
  prescriptionTrends: TrendData[]
  topMedicines: MedicineStats[]
  patientDemographics: DemographicData
}

export interface TrendData {
  date: string
  count: number
}

export interface MedicineStats {
  name: string
  count: number
  percentage: number
}

export interface DemographicData {
  ageGroups: { range: string; count: number }[]
  genderDistribution: { gender: string; count: number }[]
}

// API Response Types
export interface ApiResponse<T = any> {
  success: boolean
  data?: T
  error?: string
  message?: string
}

// Form Types
export interface LoginForm {
  email: string
  password: string
}

export interface SignupForm extends LoginForm {
  name: string
  role: UserRole
}

export interface PatientForm {
  name: string
  age: number
  gender: 'male' | 'female' | 'other'
  phone: string
  email?: string
  bloodGroup?: string
  allergies: string
  chronicConditions: string
  address?: string
  emergencyContact?: string
}

export interface PrescriptionForm {
  patientId: string
  symptoms: string
  diagnosis?: string
  aiProvider: 'gemini' | 'openai' | 'groq' | 'demo'
  apiKey?: string
}
