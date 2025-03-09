# Database Setup - Firebase Firestore

This document contains essential information about the database structure for the Barbershop Management System.

## Collections Structure

### Users Collection
```
users/
  ├─ {userId}/
  │   ├─ email: string
  │   ├─ displayName: string
  │   ├─ photoURL: string (optional)
  │   ├─ role: string ("admin", "barber", "client")
  │   ├─ phoneNumber: string (optional)
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Barbers Collection
```
barbers/
  ├─ {barberId}/
  │   ├─ userId: string (reference to users collection)
  │   ├─ displayName: string
  │   ├─ photoURL: string
  │   ├─ bio: string
  │   ├─ specialties: array<string>
  │   ├─ workingHours: {
  │   │   ├─ monday: { start: string, end: string, isWorking: boolean }
  │   │   ├─ tuesday: { start: string, end: string, isWorking: boolean }
  │   │   ├─ wednesday: { start: string, end: string, isWorking: boolean }
  │   │   ├─ thursday: { start: string, end: string, isWorking: boolean }
  │   │   ├─ friday: { start: string, end: string, isWorking: boolean }
  │   │   ├─ saturday: { start: string, end: string, isWorking: boolean }
  │   │   └─ sunday: { start: string, end: string, isWorking: boolean }
  │   │ }
  │   ├─ rating: number
  │   ├─ reviewCount: number
  │   ├─ active: boolean
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Clients Collection
```
clients/
  ├─ {clientId}/
  │   ├─ userId: string (reference to users collection)
  │   ├─ displayName: string
  │   ├─ photoURL: string (optional)
  │   ├─ phoneNumber: string
  │   ├─ email: string
  │   ├─ preferredBarbers: array<string> (barber IDs)
  │   ├─ notes: string
  │   ├─ lastVisit: timestamp
  │   ├─ visitCount: number
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Services Collection
```
services/
  ├─ {serviceId}/
  │   ├─ name: string
  │   ├─ description: string
  │   ├─ price: number
  │   ├─ duration: number (in minutes)
  │   ├─ category: string
  │   ├─ image: string (optional)
  │   ├─ active: boolean
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Appointments Collection
```
appointments/
  ├─ {appointmentId}/
  │   ├─ clientId: string (reference to clients collection)
  │   ├─ barberId: string (reference to barbers collection)
  │   ├─ services: array<{
  │   │   ├─ serviceId: string
  │   │   ├─ name: string
  │   │   ├─ price: number
  │   │   └─ duration: number
  │   │ }>
  │   ├─ date: timestamp
  │   ├─ startTime: string (HH:MM format)
  │   ├─ endTime: string (HH:MM format)
  │   ├─ status: string ("scheduled", "completed", "cancelled", "no-show")
  │   ├─ totalPrice: number
  │   ├─ totalDuration: number
  │   ├─ notes: string
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Reviews Collection
```
reviews/
  ├─ {reviewId}/
  │   ├─ appointmentId: string (reference to appointments collection)
  │   ├─ clientId: string (reference to clients collection)
  │   ├─ barberId: string (reference to barbers collection)
  │   ├─ rating: number (1-5)
  │   ├─ comment: string
  │   ├─ createdAt: timestamp
  │   └─ updatedAt: timestamp
```

### Settings Collection
```
settings/
  ├─ business/
  │   ├─ name: string
  │   ├─ address: string
  │   ├─ phone: string
  │   ├─ email: string
  │   ├─ logo: string
  │   ├─ workingHours: {
  │   │   ├─ monday: { start: string, end: string, isOpen: boolean }
  │   │   ├─ tuesday: { start: string, end: string, isOpen: boolean }
  │   │   ├─ wednesday: { start: string, end: string, isOpen: boolean }
  │   │   ├─ thursday: { start: string, end: string, isOpen: boolean }
  │   │   ├─ friday: { start: string, end: string, isOpen: boolean }
  │   │   ├─ saturday: { start: string, end: string, isOpen: boolean }
  │   │   └─ sunday: { start: string, end: string, isOpen: boolean }
  │   │ }
  │   └─ updatedAt: timestamp
  ├─ appointments/
  │   ├─ minLeadTime: number (in minutes)
  │   ├─ maxLeadTime: number (in days)
  │   ├─ slotDuration: number (in minutes)
  │   ├─ bufferTime: number (in minutes)
  │   ├─ cancelationWindow: number (in hours)
  │   └─ updatedAt: timestamp
```

## Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isAdmin() {
      return isAuthenticated() && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
    
    function isBarber() {
      return isAuthenticated() && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'barber';
    }
    
    function isClient() {
      return isAuthenticated() && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'client';
    }
    
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }
    
    function isAppointmentBarber(barberId) {
      return isAuthenticated() && 
        exists(/databases/$(database)/documents/barbers/$(barberId)) &&
        get(/databases/$(database)/documents/barbers/$(barberId)).data.userId == request.auth.uid;
    }
    
    function isAppointmentClient(clientId) {
      return isAuthenticated() && 
        exists(/databases/$(database)/documents/clients/$(clientId)) &&
        get(/databases/$(database)/documents/clients/$(clientId)).data.userId == request.auth.uid;
    }
    
    // Rules for each collection
    match /users/{userId} {
      allow read: if isAuthenticated();
      allow create: if isAuthenticated();
      allow update: if isAdmin() || isOwner(userId);
      allow delete: if isAdmin();
    }
    
    match /barbers/{barberId} {
      allow read: if true; // Public read access
      allow create, update, delete: if isAdmin() || 
        (isAuthenticated() && get(/databases/$(database)/documents/barbers/$(barberId)).data.userId == request.auth.uid);
    }
    
    match /clients/{clientId} {
      allow read: if isAdmin() || isBarber() || 
        (isAuthenticated() && get(/databases/$(database)/documents/clients/$(clientId)).data.userId == request.auth.uid);
      allow create, update: if isAdmin() || 
        (isAuthenticated() && get(/databases/$(database)/documents/clients/$(clientId)).data.userId == request.auth.uid);
      allow delete: if isAdmin();
    }
    
    match /services/{serviceId} {
      allow read: if true; // Public read access
      allow create, update, delete: if isAdmin();
    }
    
    match /appointments/{appointmentId} {
      allow read: if isAdmin() || 
        isAppointmentBarber(resource.data.barberId) || 
        isAppointmentClient(resource.data.clientId);
      allow create: if isAuthenticated();
      allow update: if isAdmin() || 
        isAppointmentBarber(resource.data.barberId) || 
        isAppointmentClient(resource.data.clientId);
      allow delete: if isAdmin();
    }
    
    match /reviews/{reviewId} {
      allow read: if true; // Public read access
      allow create: if isAuthenticated() && isAppointmentClient(resource.data.clientId);
      allow update: if isAdmin() || 
        (isAuthenticated() && isAppointmentClient(resource.data.clientId));
      allow delete: if isAdmin();
    }
    
    match /settings/{document=**} {
      allow read: if true; // Public read access
      allow write: if isAdmin();
    }
  }
}
```

## Indexes

The following indexes are required for the application:

1. Appointments collection:
   - Composite index on `barberId` (ascending) and `date` (ascending) for fetching a barber's appointments by date
   - Composite index on `clientId` (ascending) and `date` (ascending) for fetching a client's appointments by date
   - Composite index on `date` (ascending) and `status` (ascending) for reporting and analytics

2. Reviews collection:
   - Composite index on `barberId` (ascending) and `createdAt` (descending) for displaying recent reviews

## Common Queries

### Appointment Scheduling

```typescript
// Check for barber availability
const checkBarberAvailability = async (
  barberId: string, 
  date: Date,
  startTime: string,
  endTime: string
): Promise<boolean> => {
  const startOfDay = new Date(date);
  startOfDay.setHours(0, 0, 0, 0);
  
  const endOfDay = new Date(date);
  endOfDay.setHours(23, 59, 59, 999);
  
  const appointmentsRef = firestore.collection('appointments');
  const conflictingAppointments = await appointmentsRef
    .where('barberId', '==', barberId)
    .where('date', '>=', startOfDay)
    .where('date', '<=', endOfDay)
    .where('status', '==', 'scheduled')
    .get();
  
  for (const appointment of conflictingAppointments.docs) {
    const data = appointment.data();
    // Check for time overlap
    if ((startTime >= data.startTime && startTime < data.endTime) ||
        (endTime > data.startTime && endTime <= data.endTime) ||
        (startTime <= data.startTime && endTime >= data.endTime)) {
      return false; // Conflict found
    }
  }
  
  return true; // No conflicts
};

// Create a new appointment
const createAppointment = async (appointmentData): Promise<string> => {
  const appointmentsRef = firestore.collection('appointments');
  const newAppointment = {
    ...appointmentData,
    status: 'scheduled',
    createdAt: firestore.FieldValue.serverTimestamp(),
    updatedAt: firestore.FieldValue.serverTimestamp()
  };
  
  const docRef = await appointmentsRef.add(newAppointment);
  return docRef.id;
};
```

### Dashboard Queries

```typescript
// Get today's appointments for a barber
const getTodayAppointments = async (barberId: string): Promise<Appointment[]> => {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  
  const appointmentsRef = firestore.collection('appointments');
  const snapshot = await appointmentsRef
    .where('barberId', '==', barberId)
    .where('date', '>=', today)
    .where('date', '<', tomorrow)
    .where('status', '==', 'scheduled')
    .orderBy('date')
    .orderBy('startTime')
    .get();
  
  return snapshot.docs.map(doc => ({
    id: doc.id,
    ...doc.data()
  }));
};

// Get monthly revenue
const getMonthlyRevenue = async (month: number, year: number): Promise<number> => {
  const startDate = new Date(year, month, 1);
  const endDate = new Date(year, month + 1, 0, 23, 59, 59, 999);
  
  const appointmentsRef = firestore.collection('appointments');
  const snapshot = await appointmentsRef
    .where('date', '>=', startDate)
    .where('date', '<=', endDate)
    .where('status', '==', 'completed')
    .get();
  
  return snapshot.docs.reduce((total, doc) => {
    const data = doc.data();
    return total + (data.totalPrice || 0);
  }, 0);
};
```