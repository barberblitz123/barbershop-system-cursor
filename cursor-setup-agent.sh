#!/bin/bash

# Cursor Project Setup Agent - FINAL VERSION
# This script automatically creates all necessary Cursor files for a new project
# with pre-populated values and minimal input required.

# Print welcome message
echo "====================================================="
echo "🤖 CURSOR SETUP AGENT - FINAL VERSION 🤖"
echo "====================================================="
echo "This script will create all necessary Cursor files for your new project."
echo "Most values are pre-populated. Just answer a few simple questions."
echo "====================================================="
echo ""

# Ask only essential project information
read -p "Project name: " PROJECT_NAME
read -p "Project location (full path): " PROJECT_PATH
read -p "Brief project description: " PROJECT_DESCRIPTION
read -p "Frontend tech [React, Next.js, TypeScript, Tailwind CSS]: " FRONTEND
read -p "Backend tech [Next.js API routes]: " BACKEND
read -p "Database [Firebase Firestore]: " DATABASE

# Set defaults if empty
FRONTEND=${FRONTEND:-"React, Next.js, TypeScript, Tailwind CSS"}
BACKEND=${BACKEND:-"Next.js API routes"}
DATABASE=${DATABASE:-"Firebase Firestore"}

# Create project directory if it doesn't exist
mkdir -p "$PROJECT_PATH"
mkdir -p "$PROJECT_PATH/instructions"

# Create .cursorrules file with pre-populated values
cat > "$PROJECT_PATH/.cursorrules" << EOL
# $PROJECT_NAME

## Project Overview
This is a $PROJECT_DESCRIPTION.

## Personality
Teach me like a senior developer would. Be concise but thorough. Prioritize clean, maintainable code over complex solutions. The fewer lines of code, the better. Always explain your reasoning in comments.

## Tech Stack
- Frontend: $FRONTEND
- Backend: $BACKEND
- Database: $DATABASE
- Authentication: OAuth 2.0 / JWT
- Styling: Tailwind CSS
- State Management: React Context API / React Query
- Deployment: Vercel

## Environment Variables
\`\`\`
# Database
DATABASE_URL=
DATABASE_USERNAME=
DATABASE_PASSWORD=

# Authentication
AUTH_SECRET=
AUTH_URL=

# API Keys
API_KEY=

# Other
NODE_ENV=development
\`\`\`

## Current File Structure
\`\`\`
/src
  /app
    /api
    /pages
  /components
    /ui
    /features
  /lib
    /utils
    /services
    /hooks
  /types
/public
  /assets
\`\`\`

## GitHub Push Process
1. Check which branch you're on
2. Make sure to switch to your correct branch
3. Push with a clear commit message that describes the changes
4. Verify the push was successful

## Error Fixing Process
1. Explain the error in simple terms
2. Write three reasoning paragraphs analyzing what the error might be
3. Do not jump to conclusions
4. Propose a solution only after thorough analysis
5. Implement the fix with clear comments

## Important Instructions
- Always add detailed comments to explain complex logic
- Use TypeScript interfaces for all data structures
- Follow the existing folder structure
- Keep components modular and reusable
- Optimize for mobile responsiveness
- Implement proper error handling
- The fewer lines of code, the better
- Do not stop working until you've implemented features fully and completely

## Other Context
- This project is designed with a mobile-first approach
- The UI follows modern design principles with clean, simple interfaces
- We prioritize accessibility and performance

## Comments
Comments are extremely important in this codebase. Always include:
- Purpose of each file at the top
- Function descriptions
- Complex logic explanations
- TODO items for future improvements
- References to related files or components
EOL

# Create .cursorignoree file
cat > "$PROJECT_PATH/.cursorignoree" << EOL
# .cursorignoree - Files that Cursor should not modify

# Environment variables
.env
.env.local
.env.development
.env.production
.env.example

# Generated files
node_modules/
.next/
dist/
build/
out/
coverage/
.coverage/
.cache/

# Large data files
*.csv
*.json
*.xml
*.sql
*.db

# Binary files
*.jpg
*.jpeg
*.png
*.gif
*.ico
*.svg
*.pdf
*.zip
*.tar.gz
*.mp3
*.mp4
*.woff
*.woff2
*.ttf
*.eot

# Sensitive files
**/credentials*.json
**/key*.json
**/secret*.json
**/service-account*.json
*.pem
*.key
*.cert

# Specific project files that should not be modified
package-lock.json
yarn.lock
pnpm-lock.yaml
EOL

# Create instructions/database-setup.md
cat > "$PROJECT_PATH/instructions/database-setup.md" << EOL
# Database Setup - $DATABASE

This document contains essential information about the database structure for $PROJECT_NAME.

## Table Structure

### Users Table/Collection
\`\`\`
users/
  ├─ {userId}/
  │   ├─ email: string
  │   ├─ name: string
  │   ├─ role: string ("user", "admin")
  │   ├─ profileImage: string (optional)
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
\`\`\`

### Settings Table/Collection
\`\`\`
settings/
  ├─ {settingId}/
  │   ├─ key: string
  │   ├─ value: any
  │   ├─ description: string
  │   └─ updatedAt: timestamp
\`\`\`

## Security Rules

\`\`\`javascript
// Basic security rules
// 1. Users can only read/write their own data
// 2. Admins can read/write all data
// 3. Settings can be read by all authenticated users
\`\`\`

## Indexes

The following indexes are required for the application:

1. Users table/collection:
   - Index on \`email\` for faster lookup
   - Index on \`role\` for filtering by role

## Data Validation

- Emails must be unique
- Passwords must be at least 8 characters
- Required fields cannot be null or empty

## Common Queries

### Get User By Email
\`\`\`javascript
const getUserByEmail = async (email) => {
  // Query implementation depends on database technology
  // This is a pseudocode example
  return db.users.findOne({ email });
};
\`\`\`

### Update User Profile
\`\`\`javascript
const updateUserProfile = async (userId, profileData) => {
  // Query implementation depends on database technology
  // This is a pseudocode example
  return db.users.update(
    { id: userId },
    { 
      ...profileData,
      updatedAt: new Date()
    }
  );
};
\`\`\`
EOL

# Create instructions/ui-design-principles.md
cat > "$PROJECT_PATH/instructions/ui-design-principles.md" << EOL
# UI Design Principles

This document outlines the design principles and UI guidelines for $PROJECT_NAME.

## Color Palette

### Primary Colors
- Primary: \`#3498db\` (Blue)
- Secondary: \`#6366f1\` (Indigo)
- Accent: \`#f59e0b\` (Amber)
- Success: \`#10b981\` (Green)
- Warning: \`#f97316\` (Orange)
- Danger: \`#ef4444\` (Red)
- Info: \`#0ea5e9\` (Light Blue)

### Neutral Colors
- Background: \`#f9fafb\` (Light mode) / \`#111827\` (Dark mode)
- Surface: \`#ffffff\` (Light mode) / \`#1f2937\` (Dark mode)
- Border: \`#e5e7eb\` (Light mode) / \`#374151\` (Dark mode)
- Text Primary: \`#111827\` (Light mode) / \`#f9fafb\` (Dark mode)
- Text Secondary: \`#6b7280\` (Light mode) / \`#9ca3af\` (Dark mode)

## Typography

### Font Family
- Primary: Inter, system-ui, sans-serif
- Monospace: Menlo, Monaco, Consolas, monospace

### Font Sizes
- xs: 0.75rem (12px)
- sm: 0.875rem (14px)
- base: 1rem (16px)
- lg: 1.125rem (18px)
- xl: 1.25rem (20px)
- 2xl: 1.5rem (24px)
- 3xl: 1.875rem (30px)
- 4xl: 2.25rem (36px)
- 5xl: 3rem (48px)

### Font Weights
- Light: 300
- Normal: 400
- Medium: 500
- Semibold: 600
- Bold: 700

## Spacing

- xs: 0.25rem (4px)
- sm: 0.5rem (8px)
- md: 1rem (16px)
- lg: 1.5rem (24px)
- xl: 2rem (32px)
- 2xl: 2.5rem (40px)
- 3xl: 3rem (48px)

## Component Guidelines

### Buttons

#### Primary Button
- Background: Primary color
- Text: White
- Hover: Darken primary color by 10%
- Active: Darken primary color by 15%
- Disabled: Opacity 50%
- Padding: 0.5rem 1rem (8px 16px)
- Border Radius: default (4px)
- Font Weight: Medium

#### Secondary Button
- Background: Transparent
- Border: 1px solid primary color
- Text: Primary color
- Hover: Primary color with 10% opacity background
- Padding: 0.5rem 1rem (8px 16px)
- Border Radius: default (4px)

### Form Elements

#### Input Fields
- Background: Surface color
- Border: 1px solid border color
- Text: Text primary color
- Placeholder: Text secondary color
- Focus: Primary color border
- Padding: 0.5rem 0.75rem (8px 12px)
- Border Radius: default (4px)

## Responsive Breakpoints

- sm: 640px
- md: 768px
- lg: 1024px
- xl: 1280px
- 2xl: 1536px

## Accessibility Guidelines

- All interactive elements must have a minimum touch target size of 44x44px
- Color contrast must meet WCAG AA standards
- All form elements must have associated labels
- Focus states must be clearly visible
- All images must have alt text
- Use semantic HTML elements
EOL

# Create instructions/roadmap.md
cat > "$PROJECT_PATH/instructions/roadmap.md" << EOL
# Development Roadmap

This document outlines the current state, priorities, and future plans for $PROJECT_NAME.

## Current Focus (Active Development)

- **Core Infrastructure**: Setting up the project foundation
  - Project structure
  - Database setup
  - Authentication system
  - Basic UI components

- **MVP Features**: Building essential functionality
  - User registration and login
  - Main application screens
  - Data management

## Next Priorities (Coming Soon)

- **User Experience Enhancements**:
  - Improved UI/UX
  - Responsive design for mobile
  - Accessibility improvements

- **Advanced Features**:
  - Feature 1 (specific to the project)
  - Feature 2 (specific to the project)
  - Integration with external services

## Future Plans (Backlog)

- **Analytics and Reporting**:
  - User activity tracking
  - Performance metrics
  - Data visualization

- **Platform Expansion**:
  - Mobile app development
  - API for third-party integrations

## Technical Debt and Improvements

- Implement comprehensive test coverage
- Optimize performance for large datasets
- Refactor any complex components
- Improve error handling throughout the application

## Development Notes

- We're using a component-first approach
- Focus on building reusable UI components
- Follow the design system guidelines
- All new code should include comprehensive comments
EOL

# Create CURSOR_BEST_PRACTICES.md
cat > "$PROJECT_PATH/CURSOR_BEST_PRACTICES.md" << EOL
# Cursor Best Practices for $PROJECT_NAME

This document outlines the best practices for using Cursor with this project.

## Essential Files

### \`.cursorrules\`

The \`.cursorrules\` file in the root directory provides essential context about the project. It includes:

- Project overview and vision
- Personality instructions for Cursor
- Tech stack details
- Environment variables
- File structure
- Process definitions
- Important instructions

Always keep this file updated as the project evolves.

### \`.cursorignoree\`

The \`.cursorignoree\` file prevents Cursor from accidentally modifying sensitive files like:

- Environment variables
- Generated files
- Binary files
- Lock files

### Specialized Markdown Files

We maintain specialized markdown files in the \`instructions/\` directory:

- \`database-setup.md\`: Database structure, security rules, and common queries
- \`ui-design-principles.md\`: Design system, colors, typography, and component guidelines
- \`roadmap.md\`: Current focus, priorities, and future plans

Tag these files when working on related features to provide context.

## Prompting Techniques

### Effective Prompts

- **"The fewer lines of code, the better"**: Encourages minimal, clean implementations
- **"Proceed like a senior developer"**: Produces more professional, maintainable code
- **"Do not stop working until you've implemented this feature fully and completely"**: Reduces laziness
- **"Start by writing three reasoning paragraphs analyzing what the error might be"**: Forces thorough analysis before jumping to conclusions
- **"Answer in short"**: Reduces verbosity
- **"Do not delete comments"**: Preserves important context

### Prompt Structure

1. **Explanation**: 2-4 sentences explaining what you're doing
2. **File Tags**: Tag relevant files using \`@filename\`
3. **Instructions**: How to execute, what not to do
4. **Context**: Documentation, examples, or other relevant information
5. **Core Instruction**: Repeat the most important instruction
6. **Output Format**: Specify how you want the response formatted

## Comments

Comments are extremely important in this codebase:

- **File Headers**: Include file path and purpose at the top of each file
- **Function Documentation**: Document parameters, return values, and behavior
- **Complex Logic**: Explain non-obvious code
- **TODO Items**: Mark areas for future improvement
- **References**: Link to related files or components

Aim for 1 line of comments for every 3-4 lines of code.

## When to Use Different Tools

### Cursor Composer vs. Chat

- **Composer**: For making code changes, implementing features, or complex refactoring
- **Chat**: For asking questions, getting explanations, or listing information

### When to Create a New Composer

Create a new composer when:
- The context window seems overloaded
- Cursor starts behaving strangely or forgetting key information
- You're switching to a completely different task

Before switching, use the "summary of current state" prompt to capture important context.

## Error Fixing

When encountering errors:

1. Have Cursor explain what information it needs to debug
2. Provide the requested information
3. Ask Cursor to write three reasoning paragraphs before proposing a solution
4. Break down complex fixes into steps
5. Test after each step

Remember that Cursor has a knowledge cutoff date and may not be aware of the latest updates to libraries or frameworks. Always verify with official documentation when in doubt.
EOL

echo ""
echo "====================================================="
echo "✅ SUCCESS! All Cursor files have been created for $PROJECT_NAME"
echo "✅ Files created at: $PROJECT_PATH"
echo "✅ The files are pre-populated with sensible defaults."
echo "====================================================="
echo ""
echo "NEXT STEPS:"
echo "1. Open your project in Cursor"
echo "2. Start developing with improved AI assistance"
echo "3. For your next project, just run this script again!"
echo "====================================================="