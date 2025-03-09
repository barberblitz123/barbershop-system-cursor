# Barbershop Management System

A comprehensive management system for barbershops with appointment scheduling, customer management, barber profiles, service management, and reporting.

## Project Overview

This system aims to streamline operations for barbershop owners and provide a better experience for customers. It includes:

- **Appointment Scheduling**: Book, view, and manage appointments
- **Customer Management**: Track customer information and preferences
- **Barber Profiles**: Manage barber schedules, specialties, and availability
- **Service Management**: Configure services, pricing, and duration
- **Reporting**: View business metrics and performance analytics

## Tech Stack

- **Frontend**: Next.js 14, React, TypeScript, Tailwind CSS
- **Backend**: Next.js API routes, Firebase/Firestore
- **Database**: Firebase Firestore
- **Authentication**: NextAuth.js with Firebase
- **Styling**: Tailwind CSS, shadcn/ui components
- **State Management**: React Context API, React Query
- **Deployment**: Vercel

## Getting Started

### Prerequisites

- Node.js 18.x or later
- npm or yarn
- Firebase account

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/barberblitz123/barbershop-system-cursor.git
   cd barbershop-system-cursor
   ```

2. Install dependencies:
   ```bash
   npm install
   # or
   yarn install
   ```

3. Set up environment variables:
   - Copy `.env.example` to `.env.local`
   - Fill in your Firebase and NextAuth credentials

4. Run the development server:
   ```bash
   npm run dev
   # or
   yarn dev
   ```

5. Open [http://localhost:3000](http://localhost:3000) in your browser to see the application.

## Cursor AI Integration

This repository includes special files that enhance development with [Cursor AI](https://cursor.sh):

- `.cursorrules`: Provides project context and instructions for Cursor AI
- `.cursorignoree`: Prevents Cursor from modifying certain files
- Various instruction files in the `instructions/` directory

These files help Cursor AI provide more relevant and accurate assistance during development.

## Project Structure

```
/src
  /app
    /api
      /auth
      /appointments
      /barbers
      /services
    /calendar
    /dashboard
    /settings
  /components
    /ui
    /dashboard
    /calendar
  /lib
    /services
    /firebase.ts
    /auth
    /db
  /hooks
  /types
/public
  /avatars
/instructions
  /database-setup.md
  /ui-design-principles.md
  /roadmap.md
```

## Development Process

1. Follow the clean code principles documented in the repository
2. Use the Cursor automation tools to streamline development
3. Ensure proper TypeScript typing for all components
4. Write meaningful comments for complex logic
5. Test thoroughly before submitting pull requests

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- This project was built with assistance from Cursor AI
- UI components based on shadcn/ui
- Calendar functionality inspired by Fresha's scheduling interface