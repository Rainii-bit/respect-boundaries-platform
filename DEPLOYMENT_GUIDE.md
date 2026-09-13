# DEPLOYMENT GUIDE - Render (Free, No Credit Card)

## 🚀 Step-by-Step Deployment to Render

### Prerequisites
- GitHub account (already have it ✅)
- Render account (free, no credit card)

### Step 1: Create Render Account
1. Go to https://render.com
2. Click "Sign up with GitHub"
3. Authorize and confirm

### Step 2: Create MySQL Database
1. In Render dashboard, click "New +"
2. Select "MySQL"
3. Configuration:
   - Name: `respect-boundaries-db`
   - Database: `respect_boundaries`
   - Username: `admin`
   - Password: (generate strong one)
   - Region: Choose closest to you
4. Click "Create Database"
5. **Copy the Internal Database URL** (you'll need it)

### Step 3: Deploy Backend
1. In Render dashboard, click "New +"
2. Select "Web Service"
3. Configuration:
   - Connect your GitHub repository
   - Select `respect-boundaries-platform`
   - Name: `respect-boundaries-api`
   - Environment: `Python 3`
   - Build Command: `pip install -r backend/requirements.txt`
   - Start Command: `gunicorn backend.app:app`
   - Region: Same as database
   - Plan: **Free**

4. Add Environment Variables:
   ```
   DATABASE_URL = mysql+pymysql://admin:YOUR_PASSWORD@YOUR_DB_HOST:3306/respect_boundaries
   JWT_SECRET_KEY = generate-long-random-string-here
   FLASK_ENV = production
   ```

5. Click "Deploy"
6. Wait 3-5 minutes for deployment
7. **Copy your API URL** (e.g., `https://respect-boundaries-api.onrender.com`)

### Step 4: Deploy Frontend
1. In Render dashboard, click "New +"
2. Select "Static Site"
3. Configuration:
   - Connect your GitHub repository
   - Name: `respect-boundaries-web`
   - Build Command: (leave empty)
   - Publish directory: `frontend`
   - Region: Same as backend

4. Click "Deploy"
5. Wait 2-3 minutes
6. **Copy your site URL** (e.g., `https://respect-boundaries-web.onrender.com`)

### Step 5: Update Frontend API URL
Edit `frontend/js/main.js`:
```javascript
const API_URL = 'https://respect-boundaries-api.onrender.com';

// Update all fetch calls:
fetch(`${API_URL}/api/auth/login`, {...})
```

Edit `frontend/auth/login.html`, `frontend/auth/signup.html`, `frontend/dashboard/index.html` similarly.

### Step 6: Initialize Database
SSH into Render MySQL and run:
```bash
mysql -h YOUR_HOST -u admin -p < backend/database/schema.sql
```

---

## 📊 Your Live URLs (After Deployment)

```
🌐 Website:  https://respect-boundaries-web.onrender.com
🔌 API:      https://respect-boundaries-api.onrender.com
📊 DB:       YOUR_RENDER_MYSQL_URL
```

---

## ✅ Features on Free Tier

- ✅ Unlimited deployments
- ✅ Free SSL certificate
- ✅ Auto-deployment from GitHub
- ✅ 500 free database hours/month (plenty!)
- ✅ Automatic rebuilds on push
- ✅ 100GB/month bandwidth

---

## 🔄 Auto-Deploy from GitHub

Every time you push to `main` branch:
1. Render automatically detects changes
2. Rebuilds the application
3. Deploys new version (2-5 minutes)
4. Zero downtime deployment

---

## 🆘 Troubleshooting

**Database connection failing?**
- Check DATABASE_URL format
- Verify password doesn't have special chars (or URL encode)
- Ensure firewall allows connections

**API returning 404?**
- Verify Build Command includes `backend/`
- Check Start Command is `gunicorn backend.app:app`
- View logs in Render dashboard

**Frontend not loading?**
- Clear browser cache
- Verify Publish directory is `frontend`
- Check all API URLs are updated

---

## 📱 Testing Live

```bash
# Test API
curl https://respect-boundaries-api.onrender.com/api/health

# Expected response:
# {"status": "API is running"}
```

---

**Your platform is now live! 🎉**