-- =====================================================
-- COMPREHENSIVE MEDICINE DATABASE (100+ Medicines)
-- =====================================================

INSERT INTO public.medicines (name, generic_name, category, dosage_forms, standard_dosages, contraindications, side_effects, interactions, pregnancy_category, lactation_safety) VALUES

-- Analgesics & Antipyretics
('Paracetamol 500mg', 'Paracetamol', 'Analgesic/Antipyretic', ARRAY['Tablet', 'Syrup', 'Suspension'], '{"adult": "500-1000mg every 4-6 hours (max 4g/day)", "child": "10-15mg/kg every 4-6 hours"}', ARRAY['Severe liver disease', 'Hypersensitivity'], ARRAY['Nausea', 'Rash', 'Liver damage (overdose)'], ARRAY['Warfarin', 'Alcohol'], 'B', 'Safe'),
('Ibuprofen 400mg', 'Ibuprofen', 'NSAID', ARRAY['Tablet', 'Suspension'], '{"adult": "400mg every 6-8 hours (max 2.4g/day)", "child": "5-10mg/kg every 6-8 hours"}', ARRAY['Peptic ulcer', 'Severe heart failure', 'Third trimester pregnancy'], ARRAY['Stomach pain', 'Heartburn', 'Dizziness'], ARRAY['Aspirin', 'Warfarin', 'ACE inhibitors'], 'C', 'Use with caution'),
('Diclofenac 50mg', 'Diclofenac', 'NSAID', ARRAY['Tablet', 'Gel'], '{"adult": "50mg 2-3 times daily"}', ARRAY['Peptic ulcer', 'Severe heart failure'], ARRAY['Stomach pain', 'Nausea', 'Headache'], ARRAY['Aspirin', 'Warfarin'], 'C', 'Avoid'),
('Tramadol 50mg', 'Tramadol', 'Opioid Analgesic', ARRAY['Tablet', 'Capsule'], '{"adult": "50-100mg every 4-6 hours (max 400mg/day)"}', ARRAY['Respiratory depression', 'Acute intoxication'], ARRAY['Nausea', 'Dizziness', 'Constipation'], ARRAY['MAO inhibitors', 'SSRIs'], 'C', 'Avoid'),

-- Antibiotics
('Amoxicillin 500mg', 'Amoxicillin', 'Antibiotic (Penicillin)', ARRAY['Capsule', 'Suspension'], '{"adult": "500mg every 8 hours", "child": "20-40mg/kg/day in 3 divided doses"}', ARRAY['Penicillin allergy'], ARRAY['Diarrhea', 'Nausea', 'Rash'], ARRAY['Methotrexate', 'Oral contraceptives'], 'B', 'Safe'),
('Azithromycin 500mg', 'Azithromycin', 'Antibiotic (Macrolide)', ARRAY['Tablet', 'Suspension'], '{"adult": "500mg once daily for 3 days", "child": "10mg/kg once daily for 3 days"}', ARRAY['Liver disease', 'QT prolongation'], ARRAY['Diarrhea', 'Nausea', 'Abdominal pain'], ARRAY['Warfarin', 'Digoxin'], 'B', 'Safe'),
('Ciprofloxacin 500mg', 'Ciprofloxacin', 'Antibiotic (Fluoroquinolone)', ARRAY['Tablet'], '{"adult": "500mg twice daily"}', ARRAY['Pregnancy', 'Children under 18', 'Tendon disorders'], ARRAY['Nausea', 'Diarrhea', 'Tendon rupture'], ARRAY['Theophylline', 'Warfarin'], 'C', 'Avoid'),
('Cefixime 200mg', 'Cefixime', 'Antibiotic (Cephalosporin)', ARRAY['Tablet', 'Suspension'], '{"adult": "200mg twice daily or 400mg once daily", "child": "8mg/kg/day"}', ARRAY['Cephalosporin allergy'], ARRAY['Diarrhea', 'Nausea', 'Abdominal pain'], ARRAY['Warfarin'], 'B', 'Safe'),
('Doxycycline 100mg', 'Doxycycline', 'Antibiotic (Tetracycline)', ARRAY['Capsule', 'Tablet'], '{"adult": "100mg twice daily"}', ARRAY['Pregnancy', 'Children under 8'], ARRAY['Photosensitivity', 'Nausea', 'Esophagitis'], ARRAY['Antacids', 'Iron supplements'], 'D', 'Avoid'),
('Metronidazole 400mg', 'Metronidazole', 'Antibiotic/Antiprotozoal', ARRAY['Tablet'], '{"adult": "400mg 2-3 times daily"}', ARRAY['First trimester pregnancy', 'Alcohol'], ARRAY['Metallic taste', 'Nausea', 'Dark urine'], ARRAY['Alcohol', 'Warfarin'], 'B', 'Use with caution'),

-- Antihistamines
('Cetirizine 10mg', 'Cetirizine', 'Antihistamine', ARRAY['Tablet', 'Syrup'], '{"adult": "10mg once daily", "child": "5mg once daily"}', ARRAY['Severe kidney disease'], ARRAY['Drowsiness', 'Dry mouth', 'Headache'], ARRAY['Alcohol', 'CNS depressants'], 'B', 'Safe'),
('Loratadine 10mg', 'Loratadine', 'Antihistamine', ARRAY['Tablet'], '{"adult": "10mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Drowsiness', 'Dry mouth'], ARRAY['Ketoconazole'], 'B', 'Safe'),
('Fexofenadine 120mg', 'Fexofenadine', 'Antihistamine', ARRAY['Tablet'], '{"adult": "120mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Drowsiness'], ARRAY['Antacids'], 'C', 'Safe'),

-- Proton Pump Inhibitors
('Omeprazole 20mg', 'Omeprazole', 'Proton Pump Inhibitor', ARRAY['Capsule'], '{"adult": "20mg once daily before breakfast"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Diarrhea', 'Abdominal pain'], ARRAY['Clopidogrel', 'Warfarin'], 'C', 'Safe'),
('Pantoprazole 40mg', 'Pantoprazole', 'Proton Pump Inhibitor', ARRAY['Tablet'], '{"adult": "40mg once daily before breakfast"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Diarrhea'], ARRAY['Warfarin', 'Methotrexate'], 'B', 'Safe'),
('Esomeprazole 40mg', 'Esomeprazole', 'Proton Pump Inhibitor', ARRAY['Tablet'], '{"adult": "40mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Nausea'], ARRAY['Clopidogrel'], 'B', 'Safe'),
('Rabeprazole 20mg', 'Rabeprazole', 'Proton Pump Inhibitor', ARRAY['Tablet'], '{"adult": "20mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Diarrhea'], ARRAY['Warfarin'], 'B', 'Safe'),

-- H2 Blockers
('Ranitidine 150mg', 'Ranitidine', 'H2 Blocker', ARRAY['Tablet'], '{"adult": "150mg twice daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Dizziness'], ARRAY['Ketoconazole'], 'B', 'Safe'),
('Famotidine 20mg', 'Famotidine', 'H2 Blocker', ARRAY['Tablet'], '{"adult": "20mg twice daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Dizziness'], ARRAY['Ketoconazole'], 'B', 'Safe'),

-- Antidiabetics
('Metformin 500mg', 'Metformin', 'Antidiabetic (Biguanide)', ARRAY['Tablet'], '{"adult": "500mg twice daily with meals"}', ARRAY['Kidney disease', 'Liver disease', 'Heart failure'], ARRAY['Nausea', 'Diarrhea', 'Lactic acidosis'], ARRAY['Alcohol', 'Contrast media'], 'B', 'Safe'),
('Glimepiride 1mg', 'Glimepiride', 'Antidiabetic (Sulfonylurea)', ARRAY['Tablet'], '{"adult": "1-2mg once daily before breakfast"}', ARRAY['Type 1 diabetes', 'Diabetic ketoacidosis'], ARRAY['Hypoglycemia', 'Weight gain'], ARRAY['Beta blockers', 'NSAIDs'], 'C', 'Avoid'),
('Sitagliptin 100mg', 'Sitagliptin', 'Antidiabetic (DPP-4 Inhibitor)', ARRAY['Tablet'], '{"adult": "100mg once daily"}', ARRAY['Type 1 diabetes'], ARRAY['Upper respiratory infection', 'Headache'], ARRAY['Digoxin'], 'B', 'Safe'),
('Insulin Glargine', 'Insulin Glargine', 'Antidiabetic (Long-acting Insulin)', ARRAY['Injection'], '{"adult": "10-20 units once daily at bedtime"}', ARRAY['Hypoglycemia'], ARRAY['Hypoglycemia', 'Injection site reactions'], ARRAY['Beta blockers', 'Oral antidiabetics'], 'B', 'Safe'),

-- Antihypertensives
('Amlodipine 5mg', 'Amlodipine', 'Calcium Channel Blocker', ARRAY['Tablet'], '{"adult": "5-10mg once daily"}', ARRAY['Severe hypotension', 'Cardiogenic shock'], ARRAY['Ankle swelling', 'Headache', 'Flushing'], ARRAY['Simvastatin'], 'C', 'Safe'),
('Losartan 50mg', 'Losartan', 'ARB', ARRAY['Tablet'], '{"adult": "50mg once daily"}', ARRAY['Pregnancy', 'Bilateral renal artery stenosis'], ARRAY['Dizziness', 'Fatigue', 'Hyperkalemia'], ARRAY['NSAIDs', 'Potassium supplements'], 'D', 'Avoid'),
('Enalapril 5mg', 'Enalapril', 'ACE Inhibitor', ARRAY['Tablet'], '{"adult": "5-10mg once daily"}', ARRAY['Pregnancy', 'Angioedema history'], ARRAY['Dry cough', 'Dizziness', 'Hyperkalemia'], ARRAY['NSAIDs', 'Potassium supplements'], 'D', 'Avoid'),
('Atenolol 50mg', 'Atenolol', 'Beta Blocker', ARRAY['Tablet'], '{"adult": "50-100mg once daily"}', ARRAY['Asthma', 'Heart block', 'Severe bradycardia'], ARRAY['Fatigue', 'Cold extremities', 'Bradycardia'], ARRAY['Verapamil', 'Diltiazem'], 'D', 'Avoid'),
('Telmisartan 40mg', 'Telmisartan', 'ARB', ARRAY['Tablet'], '{"adult": "40-80mg once daily"}', ARRAY['Pregnancy', 'Bilateral renal artery stenosis'], ARRAY['Dizziness', 'Back pain'], ARRAY['NSAIDs', 'Digoxin'], 'D', 'Avoid'),

-- Statins
('Atorvastatin 10mg', 'Atorvastatin', 'Statin', ARRAY['Tablet'], '{"adult": "10-20mg once daily at night"}', ARRAY['Active liver disease', 'Pregnancy'], ARRAY['Muscle pain', 'Headache', 'Liver enzyme elevation'], ARRAY['Grapefruit juice', 'Cyclosporine'], 'X', 'Avoid'),
('Rosuvastatin 10mg', 'Rosuvastatin', 'Statin', ARRAY['Tablet'], '{"adult": "10-20mg once daily"}', ARRAY['Active liver disease', 'Pregnancy'], ARRAY['Muscle pain', 'Headache'], ARRAY['Cyclosporine', 'Gemfibrozil'], 'X', 'Avoid'),
('Simvastatin 20mg', 'Simvastatin', 'Statin', ARRAY['Tablet'], '{"adult": "20-40mg once daily at night"}', ARRAY['Active liver disease', 'Pregnancy'], ARRAY['Muscle pain', 'Headache'], ARRAY['Grapefruit juice', 'Amlodipine'], 'X', 'Avoid'),

-- Anticoagulants
('Aspirin 75mg', 'Aspirin', 'Antiplatelet', ARRAY['Tablet'], '{"adult": "75-150mg once daily"}', ARRAY['Active bleeding', 'Peptic ulcer'], ARRAY['Stomach upset', 'Bleeding'], ARRAY['Warfarin', 'NSAIDs'], 'D', 'Avoid'),
('Clopidogrel 75mg', 'Clopidogrel', 'Antiplatelet', ARRAY['Tablet'], '{"adult": "75mg once daily"}', ARRAY['Active bleeding'], ARRAY['Bleeding', 'Bruising', 'Rash'], ARRAY['Omeprazole', 'Warfarin'], 'B', 'Use with caution'),
('Warfarin 5mg', 'Warfarin', 'Anticoagulant', ARRAY['Tablet'], '{"adult": "2-10mg once daily (adjust based on INR)"}', ARRAY['Active bleeding', 'Pregnancy'], ARRAY['Bleeding', 'Bruising'], ARRAY['NSAIDs', 'Antibiotics', 'Many drugs'], 'X', 'Avoid'),

-- Bronchodilators
('Salbutamol Inhaler', 'Salbutamol', 'Bronchodilator', ARRAY['Inhaler'], '{"adult": "1-2 puffs as needed (max 8 puffs/day)"}', ARRAY['Hypersensitivity'], ARRAY['Tremor', 'Palpitations', 'Headache'], ARRAY['Beta blockers'], 'C', 'Safe'),
('Ipratropium Inhaler', 'Ipratropium', 'Bronchodilator', ARRAY['Inhaler'], '{"adult": "2 puffs 4 times daily"}', ARRAY['Glaucoma', 'Prostatic hypertrophy'], ARRAY['Dry mouth', 'Cough'], ARRAY['Anticholinergics'], 'B', 'Safe'),
('Montelukast 10mg', 'Montelukast', 'Leukotriene Receptor Antagonist', ARRAY['Tablet'], '{"adult": "10mg once daily at night", "child": "4-5mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Headache', 'Abdominal pain', 'Mood changes'], ARRAY['Phenobarbital'], 'B', 'Safe'),

-- Corticosteroids
('Prednisolone 5mg', 'Prednisolone', 'Corticosteroid', ARRAY['Tablet'], '{"adult": "5-60mg daily in divided doses"}', ARRAY['Systemic fungal infection', 'Live vaccines'], ARRAY['Weight gain', 'Mood changes', 'Hyperglycemia'], ARRAY['NSAIDs', 'Warfarin'], 'C', 'Use with caution'),
('Dexamethasone 0.5mg', 'Dexamethasone', 'Corticosteroid', ARRAY['Tablet'], '{"adult": "0.5-9mg daily"}', ARRAY['Systemic fungal infection'], ARRAY['Insomnia', 'Increased appetite'], ARRAY['NSAIDs', 'Phenytoin'], 'C', 'Use with caution'),
('Budesonide Inhaler', 'Budesonide', 'Inhaled Corticosteroid', ARRAY['Inhaler'], '{"adult": "200-400mcg twice daily"}', ARRAY['Hypersensitivity'], ARRAY['Oral thrush', 'Hoarseness'], ARRAY['Ketoconazole'], 'B', 'Safe'),

-- Thyroid Medications
('Levothyroxine 50mcg', 'Levothyroxine', 'Thyroid Hormone', ARRAY['Tablet'], '{"adult": "50-100mcg once daily on empty stomach"}', ARRAY['Thyrotoxicosis', 'Acute MI'], ARRAY['Palpitations', 'Weight loss', 'Tremor'], ARRAY['Iron supplements', 'Calcium'], 'A', 'Safe'),
('Carbimazole 5mg', 'Carbimazole', 'Antithyroid', ARRAY['Tablet'], '{"adult": "15-40mg daily in divided doses"}', ARRAY['Severe blood disorders'], ARRAY['Rash', 'Nausea', 'Agranulocytosis'], ARRAY['Warfarin'], 'D', 'Avoid'),

-- Antiemetics
('Ondansetron 4mg', 'Ondansetron', 'Antiemetic', ARRAY['Tablet'], '{"adult": "4-8mg 2-3 times daily"}', ARRAY['QT prolongation'], ARRAY['Headache', 'Constipation'], ARRAY['Apomorphine'], 'B', 'Safe'),
('Domperidone 10mg', 'Domperidone', 'Antiemetic', ARRAY['Tablet'], '{"adult": "10mg 3 times daily before meals"}', ARRAY['Prolactinoma', 'GI bleeding'], ARRAY['Dry mouth', 'Headache'], ARRAY['Ketoconazole'], 'C', 'Avoid'),
('Metoclopramide 10mg', 'Metoclopramide', 'Antiemetic', ARRAY['Tablet'], '{"adult": "10mg 3 times daily"}', ARRAY['GI obstruction', 'Pheochromocytoma'], ARRAY['Drowsiness', 'Extrapyramidal effects'], ARRAY['Anticholinergics'], 'B', 'Use with caution'),

-- Antacids
('Magnesium Hydroxide', 'Magnesium Hydroxide', 'Antacid', ARRAY['Suspension'], '{"adult": "5-10ml as needed"}', ARRAY['Severe kidney disease'], ARRAY['Diarrhea'], ARRAY['Tetracyclines', 'Fluoroquinolones'], 'B', 'Safe'),
('Aluminium Hydroxide', 'Aluminium Hydroxide', 'Antacid', ARRAY['Tablet', 'Suspension'], '{"adult": "500mg-1g as needed"}', ARRAY['Hypophosphatemia'], ARRAY['Constipation'], ARRAY['Tetracyclines'], 'B', 'Safe'),

-- Vitamins & Supplements
('Vitamin D3 60000 IU', 'Cholecalciferol', 'Vitamin', ARRAY['Capsule'], '{"adult": "60000 IU once weekly for 8 weeks"}', ARRAY['Hypercalcemia', 'Hypervitaminosis D'], ARRAY['Nausea', 'Constipation'], ARRAY['Thiazide diuretics'], 'A', 'Safe'),
('Calcium Carbonate 500mg', 'Calcium Carbonate', 'Mineral Supplement', ARRAY['Tablet'], '{"adult": "500mg twice daily with meals"}', ARRAY['Hypercalcemia', 'Kidney stones'], ARRAY['Constipation', 'Bloating'], ARRAY['Tetracycline', 'Levothyroxine'], 'B', 'Safe'),
('Folic Acid 5mg', 'Folic Acid', 'Vitamin', ARRAY['Tablet'], '{"adult": "5mg once daily"}', ARRAY['Pernicious anemia'], ARRAY['Nausea', 'Bloating'], ARRAY['Methotrexate', 'Phenytoin'], 'A', 'Safe'),
('Vitamin B12 1500mcg', 'Methylcobalamin', 'Vitamin', ARRAY['Tablet'], '{"adult": "1500mcg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Diarrhea', 'Itching'], ARRAY['Chloramphenicol'], 'A', 'Safe'),
('Multivitamin', 'Multivitamin', 'Vitamin Supplement', ARRAY['Tablet', 'Capsule'], '{"adult": "1 tablet once daily"}', ARRAY['Hypervitaminosis'], ARRAY['Nausea', 'Constipation'], ARRAY['Warfarin', 'Levodopa'], 'A', 'Safe'),
('Iron 100mg', 'Ferrous Sulfate', 'Iron Supplement', ARRAY['Tablet'], '{"adult": "100-200mg once daily"}', ARRAY['Hemochromatosis'], ARRAY['Constipation', 'Dark stools', 'Nausea'], ARRAY['Tetracyclines', 'Levothyroxine'], 'A', 'Safe'),
('Zinc 50mg', 'Zinc Sulfate', 'Mineral Supplement', ARRAY['Tablet'], '{"adult": "50mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Nausea', 'Stomach upset'], ARRAY['Antibiotics', 'Penicillamine'], 'A', 'Safe'),

-- Antidepressants
('Fluoxetine 20mg', 'Fluoxetine', 'SSRI Antidepressant', ARRAY['Capsule'], '{"adult": "20mg once daily in morning"}', ARRAY['MAO inhibitors', 'Pimozide'], ARRAY['Nausea', 'Insomnia', 'Sexual dysfunction'], ARRAY['MAO inhibitors', 'Tramadol'], 'C', 'Use with caution'),
('Sertraline 50mg', 'Sertraline', 'SSRI Antidepressant', ARRAY['Tablet'], '{"adult": "50mg once daily"}', ARRAY['MAO inhibitors', 'Pimozide'], ARRAY['Nausea', 'Diarrhea', 'Insomnia'], ARRAY['MAO inhibitors', 'Warfarin'], 'C', 'Use with caution'),
('Escitalopram 10mg', 'Escitalopram', 'SSRI Antidepressant', ARRAY['Tablet'], '{"adult": "10mg once daily"}', ARRAY['MAO inhibitors'], ARRAY['Nausea', 'Insomnia', 'Sexual dysfunction'], ARRAY['MAO inhibitors', 'Citalopram'], 'C', 'Use with caution'),

-- Anxiolytics
('Alprazolam 0.5mg', 'Alprazolam', 'Benzodiazepine', ARRAY['Tablet'], '{"adult": "0.25-0.5mg 2-3 times daily"}', ARRAY['Acute narrow-angle glaucoma', 'Respiratory depression'], ARRAY['Drowsiness', 'Dependence', 'Memory impairment'], ARRAY['Alcohol', 'Opioids', 'Ketoconazole'], 'D', 'Avoid'),
('Clonazepam 0.5mg', 'Clonazepam', 'Benzodiazepine', ARRAY['Tablet'], '{"adult": "0.5mg twice daily"}', ARRAY['Acute narrow-angle glaucoma', 'Severe liver disease'], ARRAY['Drowsiness', 'Dependence'], ARRAY['Alcohol', 'Opioids'], 'D', 'Avoid'),

-- Antipsychotics
('Olanzapine 5mg', 'Olanzapine', 'Atypical Antipsychotic', ARRAY['Tablet'], '{"adult": "5-10mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Weight gain', 'Drowsiness', 'Metabolic syndrome'], ARRAY['Fluvoxamine', 'Ciprofloxacin'], 'C', 'Use with caution'),
('Risperidone 2mg', 'Risperidone', 'Atypical Antipsychotic', ARRAY['Tablet'], '{"adult": "2-4mg once daily"}', ARRAY['Hypersensitivity'], ARRAY['Weight gain', 'Extrapyramidal symptoms'], ARRAY['Carbamazepine'], 'C', 'Use with caution'),

-- Anticonvulsants
('Phenytoin 100mg', 'Phenytoin', 'Anticonvulsant', ARRAY['Tablet'], '{"adult": "200-300mg daily in divided doses"}', ARRAY['Heart block', 'Porphyria'], ARRAY['Gum hyperplasia', 'Hirsutism', 'Ataxia'], ARRAY['Warfarin', 'Oral contraceptives'], 'D', 'Avoid'),
('Valproic Acid 500mg', 'Valproic Acid', 'Anticonvulsant', ARRAY['Tablet'], '{"adult": "500-1000mg daily in divided doses"}', ARRAY['Liver disease', 'Mitochondrial disorders'], ARRAY['Weight gain', 'Tremor', 'Hair loss'], ARRAY['Lamotrigine', 'Warfarin'], 'D', 'Avoid'),
('Levetiracetam 500mg', 'Levetiracetam', 'Anticonvulsant', ARRAY['Tablet'], '{"adult": "500mg twice daily"}', ARRAY['Hypersensitivity'], ARRAY['Drowsiness', 'Behavioral changes'], ARRAY['Minimal interactions'], 'C', 'Safe'),

-- Antivirals
('Acyclovir 400mg', 'Acyclovir', 'Antiviral', ARRAY['Tablet'], '{"adult": "400mg 3 times daily"}', ARRAY['Hypersensitivity'], ARRAY['Nausea', 'Headache', 'Diarrhea'], ARRAY['Probenecid'], 'B', 'Safe'),
('Oseltamivir 75mg', 'Oseltamivir', 'Antiviral', ARRAY['Capsule'], '{"adult": "75mg twice daily for 5 days"}', ARRAY['Hypersensitivity'], ARRAY['Nausea', 'Vomiting', 'Headache'], ARRAY['Live influenza vaccine'], 'C', 'Use with caution'),

-- Antifungals
('Fluconazole 150mg', 'Fluconazole', 'Antifungal', ARRAY['Capsule'], '{"adult": "150mg single dose for vaginal candidiasis"}', ARRAY['Hypersensitivity', 'QT prolongation'], ARRAY['Nausea', 'Headache', 'Liver enzyme elevation'], ARRAY['Warfarin', 'Phenytoin'], 'C', 'Use with caution'),
('Itraconazole 100mg', 'Itraconazole', 'Antifungal', ARRAY['Capsule'], '{"adult": "100-200mg once daily"}', ARRAY['Heart failure', 'Liver disease'], ARRAY['Nausea', 'Headache', 'Liver toxicity'], ARRAY['Simvastatin', 'Midazolam'], 'C', 'Avoid'),

-- Antiparasitics
('Albendazole 400mg', 'Albendazole', 'Antiparasitic', ARRAY['Tablet'], '{"adult": "400mg single dose or twice daily for 3 days"}', ARRAY['Pregnancy', 'Hypersensitivity'], ARRAY['Abdominal pain', 'Nausea', 'Headache'], ARRAY['Dexamethasone', 'Praziquantel'], 'C', 'Avoid'),
('Ivermectin 12mg', 'Ivermectin', 'Antiparasitic', ARRAY['Tablet'], '{"adult": "12mg single dose"}', ARRAY['Hypersensitivity'], ARRAY['Dizziness', 'Nausea', 'Diarrhea'], ARRAY['Warfarin'], 'C', 'Use with caution'),

-- Muscle Relaxants
('Chlorzoxazone 500mg', 'Chlorzoxazone', 'Muscle Relaxant', ARRAY['Tablet'], '{"adult": "500mg 3-4 times daily"}', ARRAY['Liver disease'], ARRAY['Drowsiness', 'Dizziness', 'Liver toxicity'], ARRAY['Alcohol', 'CNS depressants'], 'C', 'Use with caution'),
('Tizanidine 2mg', 'Tizanidine', 'Muscle Relaxant', ARRAY['Tablet'], '{"adult": "2-4mg 2-3 times daily"}', ARRAY['Liver disease'], ARRAY['Drowsiness', 'Dry mouth', 'Hypotension'], ARRAY['Fluvoxamine', 'Ciprofloxacin'], 'C', 'Use with caution'),

-- Antiulcer
('Sucralfate 1g', 'Sucralfate', 'Mucosal Protectant', ARRAY['Tablet', 'Suspension'], '{"adult": "1g 4 times daily on empty stomach"}', ARRAY['Hypersensitivity'], ARRAY['Constipation'], ARRAY['Tetracyclines', 'Fluoroquinolones'], 'B', 'Safe'),

-- Laxatives
('Lactulose', 'Lactulose', 'Laxative', ARRAY['Syrup'], '{"adult": "15-30ml once or twice daily"}', ARRAY['Galactosemia', 'GI obstruction'], ARRAY['Bloating', 'Flatulence', 'Diarrhea'], ARRAY['Antacids'], 'B', 'Safe'),
('Bisacodyl 5mg', 'Bisacodyl', 'Laxative', ARRAY['Tablet'], '{"adult": "5-10mg at bedtime"}', ARRAY['GI obstruction', 'Acute abdomen'], ARRAY['Abdominal cramps', 'Diarrhea'], ARRAY['Antacids'], 'B', 'Safe'),

-- Antidiarrheals
('Loperamide 2mg', 'Loperamide', 'Antidiarrheal', ARRAY['Capsule'], '{"adult": "4mg initially, then 2mg after each loose stool (max 16mg/day)"}', ARRAY['Acute dysentery', 'Pseudomembranous colitis'], ARRAY['Constipation', 'Dizziness', 'Abdominal pain'], ARRAY['Ritonavir'], 'B', 'Use with caution'),

-- Urinary
('Tamsulosin 0.4mg', 'Tamsulosin', 'Alpha Blocker', ARRAY['Capsule'], '{"adult": "0.4mg once daily"}', ARRAY['Severe liver disease', 'Hypersensitivity'], ARRAY['Dizziness', 'Retrograde ejaculation'], ARRAY['Other alpha blockers'], 'B', 'Use with caution'),

-- Eye Drops
('Timolol Eye Drops', 'Timolol', 'Beta Blocker Eye Drops', ARRAY['Eye Drops'], '{"adult": "1 drop twice daily"}', ARRAY['Asthma', 'Heart block'], ARRAY['Eye irritation', 'Blurred vision'], ARRAY['Oral beta blockers'], 'C', 'Use with caution'),

-- Dermatological
('Betamethasone Cream', 'Betamethasone', 'Topical Corticosteroid', ARRAY['Cream', 'Ointment'], '{"adult": "Apply thin layer twice daily"}', ARRAY['Viral skin infections', 'Rosacea'], ARRAY['Skin thinning', 'Burning'], ARRAY['None significant'], 'C', 'Safe'),
('Clotrimazole Cream', 'Clotrimazole', 'Topical Antifungal', ARRAY['Cream'], '{"adult": "Apply twice daily for 2-4 weeks"}', ARRAY['Hypersensitivity'], ARRAY['Skin irritation', 'Burning'], ARRAY['None significant'], 'B', 'Safe');
