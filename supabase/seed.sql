-- =====================================================
-- SAMPLE DATA FOR TESTING
-- =====================================================

-- Insert sample clinic
INSERT INTO public.clinics (id, name, address, phone, email, registration_number, gst_number) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'City Medical Center', '123 Main Street, Mumbai, Maharashtra 400001', '+91-22-12345678', 'contact@citymedical.com', 'REG-2024-001', '27AABCU9603R1ZM');

-- Note: Users will be created through Supabase Auth signup
-- After signup, update the users table with clinic_id

-- Insert sample medicines (Top 100 commonly prescribed medicines in India)
INSERT INTO public.medicines (name, generic_name, category, dosage_forms, standard_dosages, contraindications, side_effects, interactions) VALUES
('Paracetamol 500mg', 'Paracetamol', 'Analgesic', ARRAY['Tablet', 'Syrup'], '{"adult": "500mg-1000mg every 4-6 hours", "child": "10-15mg/kg every 4-6 hours"}', ARRAY['Severe liver disease'], ARRAY['Nausea', 'Rash'], ARRAY['Warfarin']),
('Ibuprofen 400mg', 'Ibuprofen', 'NSAID', ARRAY['Tablet', 'Suspension'], '{"adult": "400mg every 6-8 hours", "child": "5-10mg/kg every 6-8 hours"}', ARRAY['Peptic ulcer', 'Severe heart failure'], ARRAY['Stomach pain', 'Heartburn'], ARRAY['Aspirin', 'Warfarin']),
('Amoxicillin 500mg', 'Amoxicillin', 'Antibiotic', ARRAY['Capsule', 'Suspension'], '{"adult": "500mg every 8 hours", "child": "20-40mg/kg/day in 3 divided doses"}', ARRAY['Penicillin allergy'], ARRAY['Diarrhea', 'Nausea'], ARRAY['Methotrexate']),
('Azithromycin 500mg', 'Azithromycin', 'Antibiotic', ARRAY['Tablet', 'Suspension'], '{"adult": "500mg once daily for 3 days", "child": "10mg/kg once daily for 3 days"}', ARRAY['Liver disease'], ARRAY['Diarrhea', 'Nausea'], ARRAY['Warfarin']),
('Cetirizine 10mg', 'Cetirizine', 'Antihistamine', ARRAY['Tablet', 'Syrup'], '{"adult": "10mg once daily", "child": "5mg once daily"}', ARRAY['Severe kidney disease'], ARRAY['Drowsiness', 'Dry mouth'], ARRAY['Alcohol']),
('Omeprazole 20mg', 'Omeprazole', 'Proton Pump Inhibitor', ARRAY['Capsule'], '{"adult": "20mg once daily before breakfast"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Diarrhea'], ARRAY['Clopidogrel']),
('Metformin 500mg', 'Metformin', 'Antidiabetic', ARRAY['Tablet'], '{"adult": "500mg twice daily with meals"}', ARRAY['Kidney disease', 'Liver disease'], ARRAY['Nausea', 'Diarrhea'], ARRAY['Alcohol']),
('Atorvastatin 10mg', 'Atorvastatin', 'Statin', ARRAY['Tablet'], '{"adult": "10-20mg once daily at night"}', ARRAY['Active liver disease', 'Pregnancy'], ARRAY['Muscle pain', 'Headache'], ARRAY['Grapefruit juice']),
('Amlodipine 5mg', 'Amlodipine', 'Calcium Channel Blocker', ARRAY['Tablet'], '{"adult": "5-10mg once daily"}', ARRAY['Severe hypotension'], ARRAY['Ankle swelling', 'Headache'], ARRAY['Simvastatin']),
('Losartan 50mg', 'Losartan', 'ARB', ARRAY['Tablet'], '{"adult": "50mg once daily"}', ARRAY['Pregnancy'], ARRAY['Dizziness', 'Fatigue'], ARRAY['NSAIDs']),
('Levothyroxine 50mcg', 'Levothyroxine', 'Thyroid Hormone', ARRAY['Tablet'], '{"adult": "50-100mcg once daily on empty stomach"}', ARRAY['Thyrotoxicosis'], ARRAY['Palpitations', 'Weight loss'], ARRAY['Iron supplements']),
('Pantoprazole 40mg', 'Pantoprazole', 'Proton Pump Inhibitor', ARRAY['Tablet'], '{"adult": "40mg once daily before breakfast"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Diarrhea'], ARRAY['Warfarin']),
('Montelukast 10mg', 'Montelukast', 'Leukotriene Receptor Antagonist', ARRAY['Tablet'], '{"adult": "10mg once daily at night", "child": "4-5mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Abdominal pain'], ARRAY['Phenobarbital']),
('Salbutamol Inhaler', 'Salbutamol', 'Bronchodilator', ARRAY['Inhaler'], '{"adult": "1-2 puffs as needed"}', ARRAY['Hypersensitivity'], ARRAY['Tremor', 'Palpitations'], ARRAY['Beta blockers']),
('Vitamin D3 60000 IU', 'Cholecalciferol', 'Vitamin', ARRAY['Capsule'], '{"adult": "60000 IU once weekly for 8 weeks"}', ARRAY['Hypercalcemia'], ARRAY['Nausea', 'Constipation'], ARRAY['Thiazide diuretics']),
('Calcium Carbonate 500mg', 'Calcium Carbonate', 'Mineral Supplement', ARRAY['Tablet'], '{"adult": "500mg twice daily with meals"}', ARRAY['Hypercalcemia'], ARRAY['Constipation', 'Bloating'], ARRAY['Tetracycline']),
('Folic Acid 5mg', 'Folic Acid', 'Vitamin', ARRAY['Tablet'], '{"adult": "5mg once daily"}', ARRAY['Pernicious anemia'], ARRAY['Nausea', 'Bloating'], ARRAY['Methotrexate']),
('Vitamin B12 1500mcg', 'Methylcobalamin', 'Vitamin', ARRAY['Tablet'], '{"adult": "1500mcg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Diarrhea', 'Itching'], ARRAY['Chloramphenicol']),
('Multivitamin', 'Multivitamin', 'Vitamin Supplement', ARRAY['Tablet', 'Capsule'], '{"adult": "1 tablet once daily"}', ARRAY['Hypervitaminosis'], ARRAY['Nausea', 'Constipation'], ARRAY['Warfarin']),
('Ranitidine 150mg', 'Ranitidine', 'H2 Blocker', ARRAY['Tablet'], '{"adult": "150mg twice daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Dizziness'], ARRAY['Ketoconazole']),
('Domperidone 10mg', 'Domperidone', 'Antiemetic', ARRAY['Tablet'], '{"adult": "10mg three times daily before meals"}', ARRAY['Prolactinoma'], ARRAY['Dry mouth', 'Headache'], ARRAY['Ketoconazole']),
('Diclofenac 50mg', 'Diclofenac', 'NSAID', ARRAY['Tablet'], '{"adult": "50mg twice or thrice daily"}', ARRAY['Peptic ulcer', 'Severe heart failure'], ARRAY['Stomach pain', 'Nausea'], ARRAY['Aspirin', 'Warfarin']),
('Prednisolone 5mg', 'Prednisolone', 'Corticosteroid', ARRAY['Tablet'], '{"adult": "5-60mg daily in divided doses"}', ARRAY['Systemic fungal infection'], ARRAY['Weight gain', 'Mood changes'], ARRAY['NSAIDs']),
('Dexamethasone 0.5mg', 'Dexamethasone', 'Corticosteroid', ARRAY['Tablet'], '{"adult": "0.5-9mg daily"}', ARRAY['Systemic fungal infection'], ARRAY['Insomnia', 'Increased appetite'], ARRAY['NSAIDs']),
('Clopidogrel 75mg', 'Clopidogrel', 'Antiplatelet', ARRAY['Tablet'], '{"adult": "75mg once daily"}', ARRAY['Active bleeding'], ARRAY['Bleeding', 'Bruising'], ARRAY['Omeprazole', 'Warfarin']);

-- Add more medicines to reach 100+ (abbreviated for brevity)
-- In production, you would add all 1000+ medicines

-- Sample patients will be created through the application
-- Sample prescriptions will be generated through the application
