# 🤝 Respect & Boundaries Platform

An AI-powered educational platform teaching the upcoming generation about boundaries, respect, accountability, and digital citizenship. A safe space to report inappropriate behavior and learn what's right and wrong.

## 🎯 Mission

We believe that education and community responsibility can transform behavior. This platform:
- **Teaches** boundaries, respect, consent, and accountability
- **Empowers** students to report inappropriate behavior anonymously
- **Analyzes** patterns using AI to provide targeted interventions
- **Supports** educators in creating respectful learning environments

## ✨ Features

### For Students
- 📚 Interactive educational modules on respect and boundaries
- 🔒 Anonymous reporting system for inappropriate behavior
- 📊 Track your learning progress with certificates
- 💬 Safe community discussions

### For Educators
- 🏫 Classroom management tools
- 📈 Student progress tracking
- 📋 Report review and moderation
- 🎓 Create custom educational content

### For Moderators
- ⚠️ Report management dashboard
- 🤖 AI-powered content analysis
- 📌 Pattern detection and intervention suggestions
- 📊 Community analytics

### Technology
- 🤖 AI-powered text analysis (Hugging Face)
- 📱 Responsive web interface
- 🔐 JWT authentication
- 💾 MySQL database
- 🐳 Docker containerization

## 🚀 Quick Start

### Prerequisites
- Python 3.10+
- MySQL 8.0+
- Docker & Docker Compose (optional)

### Setup with Docker (Recommended)

```bash
# Clone the repository
git clone https://github.com/Rainii-bit/respect-boundaries-platform.git
cd respect-boundaries-platform

# Copy environment file
cp .env.example .env

# Start services
docker-compose up --build

# Access:
# Frontend: http://localhost
# Backend API: http://localhost:5000
```

### Manual Setup

```bash
# Backend
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py

# Frontend
# Open index.html in your browser
```

## 📚 API Endpoints

- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `POST /api/reports` - Submit a report
- `GET /api/reports` - Get all reports
- `GET /api/modules` - Get educational modules
- `POST /api/modules/:id/complete` - Complete a module
- `POST /api/ai/analyze` - Analyze report with AI

## 📊 Key Features

✅ Anonymous Reporting System
✅ AI-Powered Content Analysis
✅ Educational Modules
✅ User Authentication
✅ Progress Tracking
✅ Responsive Design

## 🗺️ Roadmap

- [x] Landing page & authentication
- [x] Reporting system
- [x] Educational modules
- [ ] Mobile app
- [ ] Advanced analytics
- [ ] Parent portal

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📧 Support

Email: info@respectboundaries.com

## 📄 License

MIT License

---

**Together, we can build a more respectful future.** ⭐