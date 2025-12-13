# Database Schema Documentation

## Overview

The AI Prescription Enterprise system uses PostgreSQL (via Supabase) with a comprehensive schema designed for healthcare data management.

## Tables

### 1. Users Table
Extends Supabase auth.users with additional profile information.

```sql
CREATE TABLE public.users (
  id UUID PRIMARY KEY,
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
```

**Roles:**
- `admin`: Full system access
- `doctor`: Can manage patients and prescriptions
- `staff`: Limited access for administrative tasks

### 2. Clinics Table
Stores clinic/hospital information.

```sql
CREATE TABLE public.clinics (
  id UUID PRIMARY KEY,
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
```

### 3. Patients Table
Complete patient profiles with medical history.

```sql
CREATE TABLE public.patients (
  id UUID PRIMARY KEY,
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
```

### 4. Medicines Table
Comprehensive medicine database with interactions.

```sql
CREATE TABLE public.medicines (
  id UUID PRIMARY KEY,
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
```

### 5. Prescriptions Table
AI-generated prescriptions with full audit trail.

```sql
CREATE TABLE public.prescriptions (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL REFERENCES public.patients(id),
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
```

### 6. Appointments Table
Appointment scheduling and management.

```sql
CREATE TABLE public.appointments (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL REFERENCES public.patients(id),
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
```

### 7. Invoices Table
Billing and payment tracking.

```sql
CREATE TABLE public.invoices (
  id UUID PRIMARY KEY,
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
```

### 8. Audit Logs Table
Complete audit trail for compliance.

```sql
CREATE TABLE public.audit_logs (
  id UUID PRIMARY KEY,
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
```

## Indexes

Performance indexes on frequently queried columns:

- **Users**: email, role, clinic_id
- **Patients**: name, phone, clinic_id, created_at
- **Medicines**: name, category, generic_name
- **Prescriptions**: patient_id, doctor_id, clinic_id, created_at
- **Appointments**: patient_id, doctor_id, appointment_date, status
- **Invoices**: patient_id, invoice_number, status, created_at
- **Audit Logs**: user_id, table_name, created_at

## Triggers

### 1. Updated At Trigger
Automatically updates `updated_at` timestamp on record modification.

### 2. Invoice Number Generator
Auto-generates unique invoice numbers in format: `INV-YYYYMMDD-XXXXXX`

### 3. Audit Trail Logger
Automatically logs all INSERT, UPDATE, DELETE operations on critical tables.

## Row Level Security (RLS)

All tables have RLS enabled with policies:

- **Users**: Can view/update own data
- **Clinics**: Can view own clinic
- **Patients**: Can view/manage patients in own clinic
- **Medicines**: Read-only for authenticated users
- **Prescriptions**: Can view own prescriptions
- **Appointments**: Can view/manage own appointments
- **Invoices**: Can view invoices in own clinic
- **Audit Logs**: Can view own audit logs

## Relationships

```
users ──┬─> patients (created_by)
        ├─> prescriptions (doctor_id)
        ├─> appointments (doctor_id)
        └─> audit_logs (user_id)

clinics ──┬─> users (clinic_id)
          ├─> patients (clinic_id)
          ├─> prescriptions (clinic_id)
          ├─> appointments (clinic_id)
          └─> invoices (clinic_id)

patients ──┬─> prescriptions (patient_id)
           ├─> appointments (patient_id)
           └─> invoices (patient_id)

prescriptions ──> invoices (prescription_id)
```

## Migration Instructions

1. Create Supabase project
2. Run migration: `supabase/migrations/20250101000000_initial_schema.sql`
3. Run seed data: `supabase/seed.sql`
4. Update `.env.local` with Supabase credentials

## Security Features

- ✅ Row Level Security (RLS) on all tables
- ✅ Encrypted sensitive data
- ✅ Audit logging for compliance
- ✅ Role-based access control
- ✅ Automatic timestamp tracking
- ✅ Data validation constraints
