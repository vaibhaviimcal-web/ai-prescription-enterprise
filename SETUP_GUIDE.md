# 🚀 AI Prescription Enterprise - Setup Guide

## Quick Start (5 Minutes)

Follow these steps to get your application running:

---

## Step 1: Create Supabase Project (2 minutes)

1. Go to https://supabase.com
2. Click "Start your project"
3. Sign in with GitHub
4. Click "New Project"
5. Fill in:
   - **Name:** ai-prescription-enterprise
   - **Database Password:** (create a strong password - SAVE THIS!)
   - **Region:** Choose closest to you
6. Click "Create new project"
7. Wait 2 minutes for project to be ready

---

## Step 2: Setup Database (2 minutes)

1. In your Supabase project, click **SQL Editor** (left sidebar)
2. Click **New Query**
3. Copy the entire content from `supabase/migrations/20250101000000_initial_schema.sql`
4. Paste into the SQL editor
5. Click **Run** (or press Ctrl+Enter)
6. Wait for "Success" message

7. Click **New Query** again
8. Copy the entire content from `supabase/seed_medicines.sql`
9. Paste into the SQL editor
10. Click **Run**
11. Wait for "Success" message

✅ **Database is now ready with 8 tables and 100+ medicines!**

---

## Step 3: Get Supabase Credentials (1 minute)

1. In Supabase, click **Settings** (gear icon, bottom left)
2. Click **API** in the settings menu
3. You'll see:
   - **Project URL** (starts with https://)
   - **anon public** key (long string)
   - **service_role** key (long string - keep secret!)

4. **COPY THESE THREE VALUES** - you'll need them next!

---

## Step 4: Deploy to Vercel (2 minutes)

### Option A: Automatic Deployment (Recommended)

1. Go to https://vercel.com
2. Sign in with GitHub
3. Click "Add New" → "Project"
4. Import `vaibhaviimcal-web/ai-prescription-enterprise`
5. Click "Deploy"

### Option B: Using Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

---

## Step 5: Add Environment Variables (1 minute)

1. In Vercel, go to your project
2. Click **Settings** → **Environment Variables**
3. Add these variables:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

4. Click **Save**
5. Go to **Deployments** tab
6. Click **⋯** on latest deployment → **Redeploy**

---

## Step 6: Test Your Application! 🎉

1. Wait 1-2 minutes for redeployment
2. Click on your Vercel URL (e.g., `https://ai-prescription-enterprise.vercel.app`)
3. You should see the landing page!

### Create Your First Account:

1. Click **"Get Started"** or **"Sign Up"**
2. Fill in:
   - Name: Your name
   - Email: Your email
   - Password: At least 6 characters
   - Role: Doctor (or Admin)
3. Click **"Create Account"**
4. You'll be redirected to the dashboard!

### Test Features:

✅ **Dashboard** - See welcome message
✅ **Patients** - Click "Add Patient" to create a patient
✅ **Medicines** - Browse 100+ medicines with search

---

## 🎯 What You Can Test Now:

### 1. Authentication
- ✅ Sign up with email/password
- ✅ Login
- ✅ Sign out
- ✅ Password reset (optional)

### 2. Patient Management
- ✅ Add new patient
- ✅ View patient list
- ✅ Search patients
- ✅ Filter by gender
- ✅ View patient profile
- ✅ Delete patient

### 3. Medicine Database
- ✅ Browse 100+ medicines
- ✅ Search medicines
- ✅ Filter by category
- ✅ View medicine details

---

## 🔧 Troubleshooting

### Issue: "Failed to fetch"
**Solution:** Check environment variables are set correctly in Vercel

### Issue: "Database error"
**Solution:** Make sure you ran both SQL files in Supabase

### Issue: "Can't sign up"
**Solution:** Check Supabase Auth is enabled (Settings → Authentication)

### Issue: "No medicines showing"
**Solution:** Run the `seed_medicines.sql` file in Supabase SQL Editor

---

## 📱 Test on Mobile

Your app is fully responsive! Test on:
- ✅ iPhone/Android
- ✅ Tablet
- ✅ Desktop

---

## 🎨 What's Working:

### ✅ Completed Features (Steps 1-5):
1. ✅ **Repository & CI/CD** - GitHub + Vercel auto-deploy
2. ✅ **Database** - 8 tables with RLS and triggers
3. ✅ **Authentication** - Login/Signup with role-based access
4. ✅ **Patient Management** - Full CRUD with search
5. ✅ **Medicine Database** - 100+ medicines with details

### 🚧 Coming Next (Steps 6-20):
6. Multi-Provider AI Integration
7. Prescription Generation
8. PDF Generation
9. Prescription History
10. Analytics Dashboard
11. Appointment Scheduling
12. Notification System
13. Billing & Invoicing
14. Multi-Clinic Support
15. Advanced AI Features
16. Mobile Responsive UI
17. Security & Compliance
18. Performance Optimization
19. Testing & Quality
20. Production Deployment

---

## 🆘 Need Help?

If you encounter any issues:
1. Check the console for errors (F12 in browser)
2. Verify all environment variables are set
3. Make sure both SQL files were executed successfully
4. Check Supabase project is active

---

## 🎉 You're All Set!

Your AI Prescription Enterprise is now live and ready to use!

**Next Steps:**
1. Test all features
2. Add some patients
3. Browse medicines
4. Give feedback for next 15 steps!

---

**Deployment URL:** Check your Vercel dashboard for the live URL
**Supabase Dashboard:** https://supabase.com/dashboard
**GitHub Repo:** https://github.com/vaibhaviimcal-web/ai-prescription-enterprise
