#!/bin/bash

# AI Prescription Enterprise - Automated Setup Script
# This script automates the entire deployment process

set -e

echo "🚀 AI Prescription Enterprise - Automated Setup"
echo "================================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if required tools are installed
echo "📋 Checking prerequisites..."

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed. Please install Node.js 18+ first.${NC}"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed. Please install npm first.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Node.js and npm are installed${NC}"
echo ""

# Prompt for Supabase credentials
echo "🔑 Supabase Configuration"
echo "========================="
echo ""
echo "Please provide your Supabase credentials:"
echo "(You can find these in Supabase Dashboard → Settings → API)"
echo ""

read -p "Supabase Project URL: " SUPABASE_URL
read -p "Supabase Anon Key: " SUPABASE_ANON_KEY
read -sp "Supabase Service Role Key: " SUPABASE_SERVICE_ROLE_KEY
echo ""
echo ""

# Create .env.local file
echo "📝 Creating environment file..."
cat > .env.local << EOF
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=$SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY=$SUPABASE_SERVICE_ROLE_KEY

# Application Configuration
NEXT_PUBLIC_APP_URL=http://localhost:3000
NODE_ENV=development

# AI Provider API Keys (Optional - can add later)
GEMINI_API_KEY=
OPENAI_API_KEY=
GROQ_API_KEY=

# Email Configuration (Optional - can add later)
SENDGRID_API_KEY=
SENDGRID_FROM_EMAIL=

# SMS Configuration (Optional - can add later)
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_PHONE_NUMBER=
EOF

echo -e "${GREEN}✅ Environment file created${NC}"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install
echo -e "${GREEN}✅ Dependencies installed${NC}"
echo ""

# Setup database
echo "🗄️ Setting up database..."
echo "Please run the following SQL in your Supabase SQL Editor:"
echo ""
echo -e "${YELLOW}1. Go to Supabase Dashboard → SQL Editor${NC}"
echo -e "${YELLOW}2. Copy content from: supabase/migrations/20250101000000_initial_schema.sql${NC}"
echo -e "${YELLOW}3. Paste and click 'Run'${NC}"
echo -e "${YELLOW}4. Copy content from: supabase/seed_medicines.sql${NC}"
echo -e "${YELLOW}5. Paste and click 'Run'${NC}"
echo ""
read -p "Press Enter when database setup is complete..."
echo -e "${GREEN}✅ Database setup confirmed${NC}"
echo ""

# Build the application
echo "🔨 Building application..."
npm run build
echo -e "${GREEN}✅ Application built successfully${NC}"
echo ""

# Start development server
echo "🎉 Setup Complete!"
echo "=================="
echo ""
echo -e "${GREEN}Your AI Prescription Enterprise is ready!${NC}"
echo ""
echo "To start the development server:"
echo -e "${YELLOW}npm run dev${NC}"
echo ""
echo "Then open: http://localhost:3000"
echo ""
echo "📚 Next Steps:"
echo "1. Create your first account at /signup"
echo "2. Add patients at /dashboard/patients"
echo "3. Browse medicines at /dashboard/medicines"
echo ""
echo "🚀 To deploy to production:"
echo "1. Push to GitHub (already done)"
echo "2. Connect to Vercel"
echo "3. Add environment variables in Vercel"
echo "4. Deploy!"
echo ""
