# API Routes Documentation

## Authentication Routes

### POST /api/auth/register
Register a new user
```json
{
  "username": "string",
  "email": "string",
  "password": "string",
  "full_name": "string",
  "role": "student|educator|parent|moderator",
  "age_group": "string",
  "school": "string"
}
```

### POST /api/auth/login
User login
```json
{
  "email": "string",
  "password": "string"
}
```

### POST /api/auth/logout
User logout

---

## Reports Routes

### POST /api/reports
Create a new report
```json
{
  "report_type": "bullying|harassment|disrespect|inappropriate-joke|discrimination|other",
  "severity": "low|medium|high|critical",
  "description": "string",
  "location": "string",
  "is_anonymous": "boolean"
}
```

### GET /api/reports
Get all reports (with filters)
- Query params: status, severity, report_type, limit, offset

### GET /api/reports/:id
Get specific report details

### PUT /api/reports/:id
Update report status (for moderators)
```json
{
  "status": "pending|under_review|resolved|closed"
}
```

### GET /api/reports/user/:userId
Get user's reports

---

## AI Analysis Routes

### POST /api/ai/analyze
Analyze a report with AI
```json
{
  "report_id": "number",
  "text": "string"
}
```

### GET /api/ai/analysis/:reportId
Get AI analysis for a report

---

## Modules Routes

### GET /api/modules
Get all educational modules
- Query params: category, difficulty, limit, offset

### GET /api/modules/:id
Get specific module details

### POST /api/modules/:id/start
Start a module

### POST /api/modules/:id/complete
Mark module as complete
```json
{
  "score": "number",
  "completion_percentage": "number"
}
```

---

## User Progress Routes

### GET /api/users/progress
Get user's learning progress

### GET /api/users/progress/:moduleId
Get progress for specific module

### GET /api/users/stats
Get user statistics and achievements

---

## Moderator Routes

### GET /api/moderation/dashboard
Get moderation dashboard data

### POST /api/moderation/actions
Create moderation action
```json
{
  "report_id": "number",
  "action_type": "string",
  "description": "string",
  "resolution": "string"
}
```

### GET /api/moderation/reports
Get pending reports for moderation

---

## Educator Routes

### POST /api/educators/classrooms
Create a classroom
```json
{
  "classroom_name": "string",
  "school": "string",
  "grade_level": "string"
}
```

### GET /api/educators/classrooms
Get educator's classrooms

### POST /api/educators/classrooms/:id/students
Add student to classroom
```json
{
  "student_id": "number"
}
```

### GET /api/educators/classrooms/:id/reports
Get reports from classroom

---

## Admin Routes

### GET /api/admin/users
Manage users

### POST /api/admin/modules
Create new educational module

### GET /api/admin/analytics
Get platform analytics
