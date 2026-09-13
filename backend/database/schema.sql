-- Users Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    role ENUM('student', 'educator', 'parent', 'moderator', 'admin') DEFAULT 'student',
    age_group VARCHAR(50),
    school VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Reports Table
CREATE TABLE reports (
    id SERIAL PRIMARY KEY,
    reporter_id INT,
    report_type VARCHAR(100) NOT NULL,
    severity ENUM('low', 'medium', 'high', 'critical') NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255),
    is_anonymous BOOLEAN DEFAULT FALSE,
    status ENUM('pending', 'under_review', 'resolved', 'closed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (reporter_id) REFERENCES users(id)
);

-- Educational Modules Table
CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    content TEXT,
    difficulty_level ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- User Progress Table
CREATE TABLE user_progress (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    completion_percentage INT DEFAULT 0,
    score INT DEFAULT 0,
    completed BOOLEAN DEFAULT FALSE,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (module_id) REFERENCES modules(id),
    UNIQUE KEY unique_user_module (user_id, module_id)
);

-- AI Analysis Log Table
CREATE TABLE ai_analysis (
    id SERIAL PRIMARY KEY,
    report_id INT NOT NULL,
    analysis_text TEXT,
    severity_score INT,
    recommended_action VARCHAR(255),
    keywords LONGTEXT,
    pattern_detected VARCHAR(255),
    analyzed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_id) REFERENCES reports(id)
);

-- Moderation Actions Table
CREATE TABLE moderation_actions (
    id SERIAL PRIMARY KEY,
    report_id INT NOT NULL,
    moderator_id INT NOT NULL,
    action_type VARCHAR(100),
    description TEXT,
    resolution TEXT,
    taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_id) REFERENCES reports(id),
    FOREIGN KEY (moderator_id) REFERENCES users(id)
);

-- Educator Classroom Table
CREATE TABLE classrooms (
    id SERIAL PRIMARY KEY,
    educator_id INT NOT NULL,
    classroom_name VARCHAR(255),
    school VARCHAR(255),
    grade_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (educator_id) REFERENCES users(id)
);

-- Classroom Students Relationship
CREATE TABLE classroom_students (
    id SERIAL PRIMARY KEY,
    classroom_id INT NOT NULL,
    student_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id),
    FOREIGN KEY (student_id) REFERENCES users(id),
    UNIQUE KEY unique_enrollment (classroom_id, student_id)
);

-- Indexes for Performance
CREATE INDEX idx_reports_status ON reports(status);
CREATE INDEX idx_reports_severity ON reports(severity);
CREATE INDEX idx_reports_created ON reports(created_at);
CREATE INDEX idx_user_progress_user ON user_progress(user_id);
CREATE INDEX idx_ai_analysis_report ON ai_analysis(report_id);
CREATE INDEX idx_moderation_report ON moderation_actions(report_id);