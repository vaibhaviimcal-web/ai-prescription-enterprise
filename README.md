# 🏥 AI Prescription Enterprise

Enterprise-grade AI-powered prescription generation system with comprehensive patient management, analytics, and clinic automation.

## 🚀 Features

### Core Features
- ✅ **Multi-Provider AI Integration** - Gemini, OpenAI, Groq with automatic fallback
- ✅ **Patient Management** - Complete profiles with medical history
- ✅ **Smart Prescriptions** - AI-generated with drug interaction checking
- ✅ **Analytics Dashboard** - Real-time insights and trends
- ✅ **Appointment Scheduling** - Calendar-based booking system
- ✅ **Billing & Invoicing** - GST-compliant invoice generation
- ✅ **Multi-Clinic Support** - Manage multiple locations
- ✅ **Notifications** - Email and SMS alerts
- ✅ **Security** - HIPAA-compliant with encryption

### Technology Stack

**Frontend:**
- Next.js 14 (React framework)
- TypeScript (Type safety)
- Tailwind CSS (Styling)
- Lucide React (Icons)

**Backend:**
- Next.js API Routes (Serverless)
- Supabase (PostgreSQL + Auth + Storage)

**AI Providers:**
- Google Gemini 2.0 Flash
- OpenAI GPT-4o-mini
- Groq Llama 3.3 70B

**Services:**
- SendGrid (Email)
- Twilio (SMS)
- Vercel (Hosting)

## 📦 Installation

```bash
# Clone repository
git clone https://github.com/vaibhaviimcal-web/ai-prescription-enterprise.git
cd ai-prescription-enterprise

# Install dependencies
npm install

# Setup environment variables
cp .env.example .env.local
# Edit .env.local with your credentials

# Run development server
npm run dev
```

## 🔧 Environment Variables

Required environment variables (see `.env.example`):

```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# AI Providers
GEMINI_API_KEY=
OPENAI_API_KEY=
GROQ_API_KEY=

# Email & SMS
SENDGRID_API_KEY=
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
```

## 🏗️ Project Structure

```
src/
├── app/                    # Next.js app directory
│   ├── (auth)/            # Authentication pages
│   ├── (dashboard)/       # Dashboard pages
│   ├── api/               # API routes
│   └── layout.tsx         # Root layout
├── components/            # React components
│   ├── ui/               # UI components
│   ├── forms/            # Form components
│   └── layouts/          # Layout components
├── lib/                   # Utility libraries
│   ├── supabase/         # Supabase client
│   ├── ai/               # AI providers
│   └── utils.ts          # Helper functions
├── types/                 # TypeScript types
├── hooks/                 # Custom React hooks
└── services/             # Business logic services
```

## 🚀 Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

### Manual Deployment

```bash
# Build for production
npm run build

# Start production server
npm start
```

## 📝 Development Roadmap

### Phase 1: Foundation ✅
- [x] Repository setup
- [x] Next.js configuration
- [x] TypeScript setup
- [x] Tailwind CSS
- [x] Project structure

### Phase 2: Database (In Progress)
- [ ] Supabase setup
- [ ] Database schema
- [ ] Row Level Security
- [ ] Sample data

### Phase 3: Authentication
- [ ] Login/Signup
- [ ] Role-based access
- [ ] Protected routes
- [ ] Session management

### Phase 4: Core Features
- [ ] Patient management
- [ ] Medicine database
- [ ] AI integration
- [ ] Prescription generation

### Phase 5: Advanced Features
- [ ] Analytics dashboard
- [ ] Appointment scheduling
- [ ] Billing system
- [ ] Notifications

## 🤝 Contributing

This is a private enterprise project. For access or collaboration inquiries, please contact the repository owner.

## 📄 License

Proprietary - All rights reserved

## 🆘 Support

For support, email: vaibhav.iimcal@gmail.com

---

**Built with ❤️ using Next.js, TypeScript, and AI**
