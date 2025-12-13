-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable pgcrypto for encryption
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Create custom types
CREATE TYPE user_role AS ENUM ('admin', 'doctor', 'staff');
CREATE TYPE gender_type AS ENUM ('male', 'female', 'other');
CREATE TYPE appointment_status AS ENUM ('scheduled', 'completed', 'cancelled', 'no-show');
CREATE TYPE invoice_status AS ENUM ('paid', 'pending', 'cancelled');
CREATE TYPE ai_provider AS ENUM ('gemini', 'openai', 'groq', 'demo');

-- =====================================================
-- USERS TABLE (extends Supabase auth.users)
-- =====================================================
CREATE TABLE public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  role user_role NOT NULL DEFAULT 'doctor',
  clinic_id UUID,
  avatar_url TEXT,
  phone TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- CLINICS TABLE
-- =====================================================
CREATE TABLE public.clinics (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL,
  logo_url TEXT,
  letterhead_url TEXT,
  registration_number TEXT,
  gst_number TEXT,
  website TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- PATIENTS TABLE
-- =====================================================
CREATE TABLE public.patients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  age INTEGER NOT NULL CHECK (age > 0 AND age < 150),
  gender gender_type NOT NULL,
  phone TEXT NOT NULL,
  email TEXT,
  blood_group TEXT,
  allergies TEXT[] DEFAULT '{}',
  chronic_conditions TEXT[] DEFAULT '{}',
  address TEXT,
  emergency_contact TEXT,
  clinic_id UUID REFERENCES public.clinics(id),
  created_by UUID REFERENCES public.users(id),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- MEDICINES TABLE
-- =====================================================
CREATE TABLE public.medicines (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  generic_name TEXT,
  category TEXT NOT NULL,
  dosage_forms TEXT[] DEFAULT '{}',
  standard_dosages JSONB DEFAULT '{}',
  contraindications TEXT[] DEFAULT '{}',
  side_effects TEXT[] DEFAULT '{}',
  interactions TEXT[] DEFAULT '{}',
  pregnancy_category TEXT,
  lactation_safety TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- PRESCRIPTIONS TABLE
-- =====================================================
CREATE TABLE public.prescriptions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  patient_id UUID NOT NULL REFERENCES public.patients(id) ON DELETE CASCADE,
  doctor_id UUID NOT NULL REFERENCES public.users(id),
  clinic_id UUID REFERENCES public.clinics(id),
  symptoms TEXT NOT NULL,
  diagnosis TEXT NOT NULL,
  medicines JSONB NOT NULL DEFAULT '[]',
  advice TEXT,
  follow_up TEXT,
  ai_provider ai_provider NOT NULL DEFAULT 'demo',
  pdf_url TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- APPOINTMENTS TABLE
-- =====================================================
CREATE TABLE public.appointments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  patient_id UUID NOT NULL REFERENCES public.patients(id) ON DELETE CASCADE,
  doctor_id UUID NOT NULL REFERENCES public.users(id),
  clinic_id UUID REFERENCES public.clinics(id),
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  duration INTEGER DEFAULT 30,
  status appointment_status DEFAULT 'scheduled',
  notes TEXT,
  reminder_sent BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- INVOICES TABLE
-- =====================================================
CREATE TABLE public.invoices (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  invoice_number TEXT UNIQUE NOT NULL,
  patient_id UUID NOT NULL REFERENCES public.patients(id),
  clinic_id UUID REFERENCES public.clinics(id),
  prescription_id UUID REFERENCES public.prescriptions(id),
  items JSONB NOT NULL DEFAULT '[]',
  subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
  tax DECIMAL(10,2) NOT NULL DEFAULT 0,
  discount DECIMAL(10,2) NOT NULL DEFAULT 0,
  total DECIMAL(10,2) NOT NULL DEFAULT 0,
  status invoice_status DEFAULT 'pending',
  payment_method TEXT,
  paid_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- AUDIT LOGS TABLE
-- =====================================================
CREATE TABLE public.audit_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id),
  action TEXT NOT NULL,
  table_name TEXT NOT NULL,
  record_id UUID,
  old_data JSONB,
  new_data JSONB,
  ip_address TEXT,
  user_agent TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- Users indexes
CREATE INDEX idx_users_email ON public.users(email);
CREATE INDEX idx_users_role ON public.users(role);
CREATE INDEX idx_users_clinic_id ON public.users(clinic_id);

-- Patients indexes
CREATE INDEX idx_patients_name ON public.patients(name);
CREATE INDEX idx_patients_phone ON public.patients(phone);
CREATE INDEX idx_patients_clinic_id ON public.patients(clinic_id);
CREATE INDEX idx_patients_created_at ON public.patients(created_at DESC);

-- Medicines indexes
CREATE INDEX idx_medicines_name ON public.medicines(name);
CREATE INDEX idx_medicines_category ON public.medicines(category);
CREATE INDEX idx_medicines_generic_name ON public.medicines(generic_name);

-- Prescriptions indexes
CREATE INDEX idx_prescriptions_patient_id ON public.prescriptions(patient_id);
CREATE INDEX idx_prescriptions_doctor_id ON public.prescriptions(doctor_id);
CREATE INDEX idx_prescriptions_clinic_id ON public.prescriptions(clinic_id);
CREATE INDEX idx_prescriptions_created_at ON public.prescriptions(created_at DESC);

-- Appointments indexes
CREATE INDEX idx_appointments_patient_id ON public.appointments(patient_id);
CREATE INDEX idx_appointments_doctor_id ON public.appointments(doctor_id);
CREATE INDEX idx_appointments_date ON public.appointments(appointment_date);
CREATE INDEX idx_appointments_status ON public.appointments(status);

-- Invoices indexes
CREATE INDEX idx_invoices_patient_id ON public.invoices(patient_id);
CREATE INDEX idx_invoices_invoice_number ON public.invoices(invoice_number);
CREATE INDEX idx_invoices_status ON public.invoices(status);
CREATE INDEX idx_invoices_created_at ON public.invoices(created_at DESC);

-- Audit logs indexes
CREATE INDEX idx_audit_logs_user_id ON public.audit_logs(user_id);
CREATE INDEX idx_audit_logs_table_name ON public.audit_logs(table_name);
CREATE INDEX idx_audit_logs_created_at ON public.audit_logs(created_at DESC);

-- =====================================================
-- FUNCTIONS AND TRIGGERS
-- =====================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply updated_at trigger to all tables
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_clinics_updated_at BEFORE UPDATE ON public.clinics
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_patients_updated_at BEFORE UPDATE ON public.patients
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_medicines_updated_at BEFORE UPDATE ON public.medicines
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_prescriptions_updated_at BEFORE UPDATE ON public.prescriptions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_appointments_updated_at BEFORE UPDATE ON public.appointments
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_invoices_updated_at BEFORE UPDATE ON public.invoices
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to generate invoice number
CREATE OR REPLACE FUNCTION generate_invoice_number()
RETURNS TRIGGER AS $$
BEGIN
  NEW.invoice_number = 'INV-' || TO_CHAR(NOW(), 'YYYYMMDD') || '-' || LPAD(nextval('invoice_number_seq')::TEXT, 6, '0');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create sequence for invoice numbers
CREATE SEQUENCE invoice_number_seq START 1;

-- Apply invoice number trigger
CREATE TRIGGER generate_invoice_number_trigger BEFORE INSERT ON public.invoices
  FOR EACH ROW EXECUTE FUNCTION generate_invoice_number();

-- Function to log audit trail
CREATE OR REPLACE FUNCTION log_audit_trail()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO public.audit_logs (user_id, action, table_name, record_id, old_data)
    VALUES (auth.uid(), TG_OP, TG_TABLE_NAME, OLD.id, row_to_json(OLD));
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO public.audit_logs (user_id, action, table_name, record_id, old_data, new_data)
    VALUES (auth.uid(), TG_OP, TG_TABLE_NAME, NEW.id, row_to_json(OLD), row_to_json(NEW));
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO public.audit_logs (user_id, action, table_name, record_id, new_data)
    VALUES (auth.uid(), TG_OP, TG_TABLE_NAME, NEW.id, row_to_json(NEW));
    RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- Apply audit triggers to critical tables
CREATE TRIGGER audit_prescriptions AFTER INSERT OR UPDATE OR DELETE ON public.prescriptions
  FOR EACH ROW EXECUTE FUNCTION log_audit_trail();

CREATE TRIGGER audit_patients AFTER INSERT OR UPDATE OR DELETE ON public.patients
  FOR EACH ROW EXECUTE FUNCTION log_audit_trail();

-- =====================================================
-- ROW LEVEL SECURITY (RLS)
-- =====================================================

-- Enable RLS on all tables
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.clinics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.patients ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.medicines ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.prescriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.invoices ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

-- Users policies
CREATE POLICY "Users can view their own data" ON public.users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update their own data" ON public.users
  FOR UPDATE USING (auth.uid() = id);

-- Clinics policies
CREATE POLICY "Users can view their clinic" ON public.clinics
  FOR SELECT USING (
    id IN (SELECT clinic_id FROM public.users WHERE id = auth.uid())
  );

-- Patients policies
CREATE POLICY "Users can view patients in their clinic" ON public.patients
  FOR SELECT USING (
    clinic_id IN (SELECT clinic_id FROM public.users WHERE id = auth.uid())
    OR created_by = auth.uid()
  );

CREATE POLICY "Users can create patients" ON public.patients
  FOR INSERT WITH CHECK (
    created_by = auth.uid()
  );

CREATE POLICY "Users can update patients in their clinic" ON public.patients
  FOR UPDATE USING (
    clinic_id IN (SELECT clinic_id FROM public.users WHERE id = auth.uid())
    OR created_by = auth.uid()
  );

-- Medicines policies (read-only for all authenticated users)
CREATE POLICY "Authenticated users can view medicines" ON public.medicines
  FOR SELECT USING (auth.role() = 'authenticated');

-- Prescriptions policies
CREATE POLICY "Users can view prescriptions they created" ON public.prescriptions
  FOR SELECT USING (
    doctor_id = auth.uid()
    OR patient_id IN (SELECT id FROM public.patients WHERE created_by = auth.uid())
  );

CREATE POLICY "Users can create prescriptions" ON public.prescriptions
  FOR INSERT WITH CHECK (doctor_id = auth.uid());

-- Appointments policies
CREATE POLICY "Users can view their appointments" ON public.appointments
  FOR SELECT USING (
    doctor_id = auth.uid()
    OR patient_id IN (SELECT id FROM public.patients WHERE created_by = auth.uid())
  );

CREATE POLICY "Users can create appointments" ON public.appointments
  FOR INSERT WITH CHECK (doctor_id = auth.uid());

CREATE POLICY "Users can update their appointments" ON public.appointments
  FOR UPDATE USING (doctor_id = auth.uid());

-- Invoices policies
CREATE POLICY "Users can view invoices in their clinic" ON public.invoices
  FOR SELECT USING (
    clinic_id IN (SELECT clinic_id FROM public.users WHERE id = auth.uid())
  );

CREATE POLICY "Users can create invoices" ON public.invoices
  FOR INSERT WITH CHECK (
    clinic_id IN (SELECT clinic_id FROM public.users WHERE id = auth.uid())
  );

-- Audit logs policies (read-only)
CREATE POLICY "Users can view their own audit logs" ON public.audit_logs
  FOR SELECT USING (user_id = auth.uid());

-- =====================================================
-- GRANT PERMISSIONS
-- =====================================================

GRANT USAGE ON SCHEMA public TO authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO authenticated;
