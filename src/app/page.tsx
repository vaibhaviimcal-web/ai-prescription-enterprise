import Link from 'next/link'
import { ArrowRight, Activity, Users, FileText, BarChart3, Shield, Zap } from 'lucide-react'

export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 via-white to-blue-50">
      {/* Header */}
      <header className="border-b bg-white/80 backdrop-blur-sm sticky top-0 z-50">
        <div className="container mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Activity className="h-8 w-8 text-primary" />
            <span className="text-2xl font-bold bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent">
              AI Prescription Enterprise
            </span>
          </div>
          <nav className="hidden md:flex items-center gap-6">
            <Link href="#features" className="text-gray-600 hover:text-primary transition">Features</Link>
            <Link href="#about" className="text-gray-600 hover:text-primary transition">About</Link>
            <Link href="/login" className="px-6 py-2 bg-primary text-white rounded-lg hover:bg-primary/90 transition">
              Get Started
            </Link>
          </nav>
        </div>
      </header>

      {/* Hero Section */}
      <section className="container mx-auto px-4 py-20 text-center">
        <div className="max-w-4xl mx-auto">
          <div className="inline-block mb-4 px-4 py-2 bg-primary/10 text-primary rounded-full text-sm font-semibold">
            🚀 Enterprise-Grade Medical Software
          </div>
          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-purple-600 via-blue-600 to-purple-600 bg-clip-text text-transparent">
            AI-Powered Prescription Generation
          </h1>
          <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
            Transform your medical practice with intelligent prescription generation, 
            comprehensive patient management, and powerful analytics - all in one platform.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link 
              href="/login" 
              className="px-8 py-4 bg-primary text-white rounded-lg hover:bg-primary/90 transition flex items-center justify-center gap-2 text-lg font-semibold"
            >
              Start Free Trial <ArrowRight className="h-5 w-5" />
            </Link>
            <Link 
              href="#features" 
              className="px-8 py-4 border-2 border-primary text-primary rounded-lg hover:bg-primary/5 transition text-lg font-semibold"
            >
              Learn More
            </Link>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="container mx-auto px-4 py-20">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-bold mb-4">Powerful Features</h2>
          <p className="text-xl text-gray-600">Everything you need to run a modern medical practice</p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div 
              key={index}
              className="p-6 bg-white rounded-xl shadow-lg hover:shadow-xl transition border border-gray-100"
            >
              <div className="w-12 h-12 bg-primary/10 rounded-lg flex items-center justify-center mb-4">
                <feature.icon className="h-6 w-6 text-primary" />
              </div>
              <h3 className="text-xl font-bold mb-2">{feature.title}</h3>
              <p className="text-gray-600">{feature.description}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Stats Section */}
      <section className="bg-gradient-to-r from-purple-600 to-blue-600 text-white py-20">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-4 gap-8 text-center">
            {stats.map((stat, index) => (
              <div key={index}>
                <div className="text-4xl font-bold mb-2">{stat.value}</div>
                <div className="text-purple-100">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="container mx-auto px-4 text-center">
          <div className="flex items-center justify-center gap-2 mb-4">
            <Activity className="h-6 w-6" />
            <span className="text-xl font-bold">AI Prescription Enterprise</span>
          </div>
          <p className="text-gray-400 mb-4">
            Enterprise-grade medical software for modern healthcare
          </p>
          <p className="text-gray-500 text-sm">
            © 2025 AI Prescription Enterprise. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  )
}

const features = [
  {
    icon: Zap,
    title: 'Multi-Provider AI',
    description: 'Powered by Gemini, OpenAI, and Groq with automatic fallback for 99.9% uptime'
  },
  {
    icon: Users,
    title: 'Patient Management',
    description: 'Complete patient profiles with medical history, allergies, and chronic conditions'
  },
  {
    icon: FileText,
    title: 'Smart Prescriptions',
    description: 'AI-generated prescriptions with drug interaction checking and safety alerts'
  },
  {
    icon: BarChart3,
    title: 'Advanced Analytics',
    description: 'Real-time insights into prescription trends, patient demographics, and revenue'
  },
  {
    icon: Shield,
    title: 'Enterprise Security',
    description: 'HIPAA-compliant with encryption, audit logs, and automated backups'
  },
  {
    icon: Activity,
    title: 'Clinic Automation',
    description: 'Appointments, billing, notifications, and multi-location management'
  }
]

const stats = [
  { value: '10,000+', label: 'Medicines Database' },
  { value: '99.9%', label: 'Uptime Guarantee' },
  { value: '3', label: 'AI Providers' },
  { value: '24/7', label: 'Support Available' }
]
