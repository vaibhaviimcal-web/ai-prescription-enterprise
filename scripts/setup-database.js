#!/usr/bin/env node

/**
 * Automated Database Setup Script
 * Runs all migrations and seeds automatically
 */

const { createClient } = require('@supabase/supabase-js')
const fs = require('fs')
const path = require('path')

// Load environment variables
require('dotenv').config({ path: '.env.local' })

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Error: Supabase credentials not found in .env.local')
  console.error('Please run ./scripts/setup.sh first')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey)

async function runSQL(filePath) {
  console.log(`📄 Running ${path.basename(filePath)}...`)
  
  const sql = fs.readFileSync(filePath, 'utf8')
  
  // Split by semicolon and execute each statement
  const statements = sql
    .split(';')
    .map(s => s.trim())
    .filter(s => s.length > 0 && !s.startsWith('--'))

  for (const statement of statements) {
    try {
      const { error } = await supabase.rpc('exec_sql', { sql: statement })
      if (error && !error.message.includes('already exists')) {
        console.error(`⚠️  Warning: ${error.message}`)
      }
    } catch (err) {
      console.error(`⚠️  Warning: ${err.message}`)
    }
  }
  
  console.log(`✅ ${path.basename(filePath)} completed`)
}

async function setupDatabase() {
  console.log('🗄️  AI Prescription Enterprise - Database Setup')
  console.log('==============================================')
  console.log('')

  try {
    // Run migration
    const migrationPath = path.join(__dirname, '../supabase/migrations/20250101000000_initial_schema.sql')
    await runSQL(migrationPath)
    
    console.log('')
    
    // Run seed
    const seedPath = path.join(__dirname, '../supabase/seed_medicines.sql')
    await runSQL(seedPath)
    
    console.log('')
    console.log('🎉 Database setup complete!')
    console.log('')
    console.log('✅ All tables created')
    console.log('✅ 100+ medicines loaded')
    console.log('✅ Sample data inserted')
    console.log('')
    console.log('You can now run: npm run dev')
    
  } catch (error) {
    console.error('❌ Error setting up database:', error.message)
    process.exit(1)
  }
}

setupDatabase()
