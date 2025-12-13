import { createClientComponentClient } from '@supabase/auth-helpers-nextjs'
import { createClient } from '@supabase/supabase-js'

// Client-side Supabase client (for use in React components)
export const supabase = createClientComponentClient()

// Server-side Supabase client with service role (for API routes)
export const supabaseAdmin = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!,
  {
    auth: {
      autoRefreshToken: false,
      persistSession: false
    }
  }
)

// Type-safe database types
export type Database = {
  public: {
    Tables: {
      users: {
        Row: {
          id: string
          email: string
          name: string
          role: 'admin' | 'doctor' | 'staff'
          clinic_id: string | null
          avatar_url: string | null
          phone: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['users']['Row'], 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['users']['Insert']>
      }
      patients: {
        Row: {
          id: string
          name: string
          age: number
          gender: 'male' | 'female' | 'other'
          phone: string
          email: string | null
          blood_group: string | null
          allergies: string[]
          chronic_conditions: string[]
          address: string | null
          emergency_contact: string | null
          clinic_id: string | null
          created_by: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['patients']['Row'], 'id' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['patients']['Insert']>
      }
      prescriptions: {
        Row: {
          id: string
          patient_id: string
          doctor_id: string
          clinic_id: string | null
          symptoms: string
          diagnosis: string
          medicines: any[]
          advice: string | null
          follow_up: string | null
          ai_provider: 'gemini' | 'openai' | 'groq' | 'demo'
          pdf_url: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['prescriptions']['Row'], 'id' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['prescriptions']['Insert']>
      }
      medicines: {
        Row: {
          id: string
          name: string
          generic_name: string | null
          category: string
          dosage_forms: string[]
          standard_dosages: any
          contraindications: string[]
          side_effects: string[]
          interactions: string[]
          pregnancy_category: string | null
          lactation_safety: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['medicines']['Row'], 'id' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['medicines']['Insert']>
      }
      appointments: {
        Row: {
          id: string
          patient_id: string
          doctor_id: string
          clinic_id: string | null
          appointment_date: string
          appointment_time: string
          duration: number
          status: 'scheduled' | 'completed' | 'cancelled' | 'no-show'
          notes: string | null
          reminder_sent: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['appointments']['Row'], 'id' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['appointments']['Insert']>
      }
      invoices: {
        Row: {
          id: string
          invoice_number: string
          patient_id: string
          clinic_id: string | null
          prescription_id: string | null
          items: any[]
          subtotal: number
          tax: number
          discount: number
          total: number
          status: 'paid' | 'pending' | 'cancelled'
          payment_method: string | null
          paid_at: string | null
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['invoices']['Row'], 'id' | 'invoice_number' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['invoices']['Insert']>
      }
      clinics: {
        Row: {
          id: string
          name: string
          address: string
          phone: string
          email: string
          logo_url: string | null
          letterhead_url: string | null
          registration_number: string | null
          gst_number: string | null
          website: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: Omit<Database['public']['Tables']['clinics']['Row'], 'id' | 'created_at' | 'updated_at'>
        Update: Partial<Database['public']['Tables']['clinics']['Insert']>
      }
    }
  }
}
