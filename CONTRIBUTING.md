# Contributing to Respect & Boundaries Platform

We're excited to have you contribute to this important project! Whether you're a developer, designer, educator, or just someone passionate about making a difference, there are many ways to help.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/respect-boundaries-platform.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Commit with clear messages: `git commit -m 'Add: description of your change'`
6. Push to your fork: `git push origin feature/your-feature-name`
7. Create a Pull Request

## Development Setup

### Frontend
```bash
cd frontend
npm install
npm start
```

### Backend
```bash
cd backend
pip install -r requirements.txt
cp config/config.example.json config/config.json
# Update config.json with your settings
python app.py
```

### Database
```bash
mysql -u root -p < backend/database/schema.sql
```

## Code Standards

- Write clean, readable code
- Add comments for complex logic
- Use meaningful variable names
- Follow the existing code style
- Write tests for new features

## Types of Contributions

### Content/Educational
- Create educational modules
- Write scenario-based case studies
- Develop interactive quizzes
- Improve existing content

### Code/Development
- Fix bugs
- Add new features
- Improve performance
- Write tests

### Design
- Improve UI/UX
- Create illustrations
- Design infographics
- Improve accessibility

### Community
- Report issues
- Suggest improvements
- Help moderate reports
- Provide feedback

## Reporting Issues

When reporting issues, please include:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable
- Your environment (OS, browser, etc.)

## Pull Request Process

1. Update README.md with any new features
2. Add tests for new functionality
3. Ensure all tests pass: `npm test` or `pytest`
4. Request review from maintainers
5. Address review feedback
6. Await approval and merge

## Code of Conduct

This project is dedicated to creating a respectful environment. All contributors must:
- Treat others with respect
- Be inclusive and welcoming
- Report inappropriate behavior
- Focus on constructive feedback
- Respect diverse perspectives

## Questions?

Feel free to open an issue or email us at contributors@respectboundaries.com

Thank you for contributing! 🙏
