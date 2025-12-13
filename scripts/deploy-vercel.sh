#!/bin/bash

# Automated Vercel Deployment Script
# Deploys the application to Vercel with environment variables

set -e

echo "🚀 Deploying to Vercel..."
echo "========================"
echo ""

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "📦 Installing Vercel CLI..."
    npm i -g vercel
fi

# Check if .env.local exists
if [ ! -f .env.local ]; then
    echo "❌ Error: .env.local file not found"
    echo "Please run ./scripts/setup.sh first"
    exit 1
fi

# Load environment variables
source .env.local

# Deploy to Vercel
echo "🚀 Deploying to Vercel..."
vercel --prod \
  --env NEXT_PUBLIC_SUPABASE_URL="$NEXT_PUBLIC_SUPABASE_URL" \
  --env NEXT_PUBLIC_SUPABASE_ANON_KEY="$NEXT_PUBLIC_SUPABASE_ANON_KEY" \
  --env SUPABASE_SERVICE_ROLE_KEY="$SUPABASE_SERVICE_ROLE_KEY" \
  --yes

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Your application is now live!"
echo "Check the URL above to access your application."
echo ""
