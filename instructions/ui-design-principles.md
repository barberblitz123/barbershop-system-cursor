# UI Design Principles

This document outlines the design principles and UI guidelines for the Barbershop Management System.

## Color Palette

### Primary Colors
- Primary: `#0f766e` (Teal 700)
- Secondary: `#475569` (Slate 600)
- Accent: `#f97316` (Orange 500)
- Success: `#10b981` (Emerald 500)
- Warning: `#f59e0b` (Amber 500)
- Danger: `#ef4444` (Red 500)
- Info: `#0ea5e9` (Sky 500)

### Neutral Colors
- Background: `#f8fafc` (Light mode) / `#0f172a` (Dark mode)
- Surface: `#ffffff` (Light mode) / `#1e293b` (Dark mode)
- Border: `#e2e8f0` (Light mode) / `#334155` (Dark mode)
- Text Primary: `#0f172a` (Light mode) / `#f8fafc` (Dark mode)
- Text Secondary: `#64748b` (Light mode) / `#94a3b8` (Dark mode)

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
```jsx
<Button variant="primary">Book Appointment</Button>
```

- Background: Primary color
- Text: White
- Hover: Darken primary color by 10%
- Active: Darken primary color by 15%
- Disabled: Opacity 50%
- Padding: 0.5rem 1rem (8px 16px)
- Border Radius: 0.375rem (6px)
- Font Weight: Medium

#### Secondary Button
```jsx
<Button variant="secondary">Cancel</Button>
```

- Background: Transparent
- Border: 1px solid primary color
- Text: Primary color
- Hover: Primary color with 10% opacity background
- Padding: 0.5rem 1rem (8px 16px)
- Border Radius: 0.375rem (6px)

#### Icon Button
```jsx
<IconButton icon={<PlusIcon />} aria-label="Add" />
```

- Circular or square with rounded corners
- Consistent padding regardless of icon size
- Visual feedback on hover/active states

### Form Elements

#### Input Fields
```jsx
<Input
  label="Full Name"
  placeholder="Enter your full name"
  helperText="As it appears on your ID"
/>
```

- Background: Surface color
- Border: 1px solid border color
- Text: Text primary color
- Placeholder: Text secondary color
- Focus: Primary color border
- Padding: 0.5rem 0.75rem (8px 12px)
- Border Radius: 0.375rem (6px)

#### Select
```jsx
<Select
  label="Service"
  placeholder="Select a service"
  options={serviceOptions}
/>
```

- Match Input field styling
- Custom dropdown indicator using chevron icon
- Highlighted selected item
- Scrollable dropdown with fixed height for many options

#### Checkbox
```jsx
<Checkbox label="I agree to the terms and conditions" />
```

- Custom check mark using SVG
- Primary color when checked
- Animation for state changes

### Cards

```jsx
<Card>
  <CardHeader title="Appointment Details" />
  <CardContent>
    <p>Date: March 15, 2023</p>
    <p>Time: 2:00 PM</p>
    <p>Barber: John Doe</p>
  </CardContent>
  <CardFooter>
    <Button variant="primary">Confirm</Button>
    <Button variant="secondary">Cancel</Button>
  </CardFooter>
</Card>
```

- Surface background color
- Subtle shadow for elevation
- Consistent padding
- Border radius: 0.5rem (8px)
- Optional border

### Modals

```jsx
<Modal isOpen={isOpen} onClose={onClose} title="Edit Appointment">
  <ModalContent>
    <Form>
      {/* Form fields */}
    </Form>
  </ModalContent>
  <ModalFooter>
    <Button variant="secondary" onClick={onClose}>Cancel</Button>
    <Button variant="primary" onClick={onSave}>Save Changes</Button>
  </ModalFooter>
</Modal>
```

- Backdrop overlay with 50% opacity
- Centered on screen
- Responsive sizing (max-width based on content)
- Close button in header
- Focus trap for accessibility
- Exit animations

### Navigation

#### Top Bar
- Fixed position
- Shadow to indicate elevation
- Contains logo, main navigation items, and user menu
- Collapses to hamburger menu on mobile

#### Sidebar
- Collapsible/expandable
- Icon and text labels
- Active state indication
- Nested navigation groups

### Calendar Components

#### Month View
- Week starts on Monday
- Current day highlighted
- Appointments shown as colored blocks
- Condensed view for days with many appointments
- "More" indicator for overflowing appointments

#### Week View
- Hour gridlines
- Appointments with accurate time representation
- Color-coded by barber or service type
- Drag-and-drop interaction for rescheduling (admin only)

#### Day View
- Detailed view of single day
- Time slots clearly marked
- Appointment details visible
- Color-coded by status or barber

### Avatar Components

```jsx
<Avatar
  src="/avatars/john-doe.jpg"
  name="John Doe"
  size="md"
/>
```

- Circular by default
- Automatically show initials if image fails to load
- Various size options (sm, md, lg, xl)
- Status indicator option (online, busy, away)

## Responsive Breakpoints

- sm: 640px (Mobile)
- md: 768px (Tablet)
- lg: 1024px (Desktop)
- xl: 1280px (Large desktop)
- 2xl: 1536px (Extra large screens)

### Mobile-first Approach

All styles are written for mobile first, then enhanced for larger screens:

```css
/* Mobile (default) */
.calendar {
  display: block;
}

/* Tablet and larger */
@media (min-width: 768px) {
  .calendar {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
  }
}
```

## Accessibility Guidelines

- All interactive elements must have a minimum touch target size of 44x44px
- Color contrast must meet WCAG AA standards (minimum 4.5:1 for normal text)
- All form elements must have associated labels
- Focus states must be clearly visible
- All images must have alt text
- Use semantic HTML elements
- Support keyboard navigation
- Implement ARIA attributes where appropriate

## Dark Mode Support

All components should support both light and dark modes:

```jsx
// Component with dark mode support
const Card = ({ children, className, ...props }) => {
  const { isDarkMode } = useTheme();
  
  return (
    <div 
      className={`
        ${isDarkMode ? 'bg-slate-800 text-white' : 'bg-white text-slate-900'}
        rounded-lg shadow-md p-4
        ${className}
      `}
      {...props}
    >
      {children}
    </div>
  );
};
```

## Animation Guidelines

- Keep animations short (150-300ms)
- Use easing functions for natural movement
- Ensure animations can be disabled for users with vestibular disorders
- Consistent entrance/exit animations for similar components

## Icons

- Use a consistent icon set (Lucide React recommended)
- Keep icon sizing proportional to text
- Use semantic colors (e.g., red for delete actions)
- Include text labels with icons for clarity
- Ensure sufficient contrast for visibility

## Implementation with Tailwind CSS

```jsx
// Example button component using Tailwind CSS
const Button = ({ 
  children, 
  variant = 'primary', 
  size = 'md',
  disabled = false,
  className = '',
  ...props 
}) => {
  const baseClasses = 'inline-flex items-center justify-center font-medium rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 transition-colors';
  
  const variantClasses = {
    primary: 'bg-teal-700 text-white hover:bg-teal-800 focus:ring-teal-500',
    secondary: 'bg-white text-teal-700 border border-teal-700 hover:bg-teal-50 focus:ring-teal-500',
    danger: 'bg-red-500 text-white hover:bg-red-600 focus:ring-red-500',
  };
  
  const sizeClasses = {
    sm: 'px-2.5 py-1.5 text-xs',
    md: 'px-4 py-2 text-sm',
    lg: 'px-6 py-3 text-base',
  };
  
  const disabledClasses = disabled ? 'opacity-50 cursor-not-allowed' : '';
  
  return (
    <button
      className={`
        ${baseClasses}
        ${variantClasses[variant]}
        ${sizeClasses[size]}
        ${disabledClasses}
        ${className}
      `}
      disabled={disabled}
      {...props}
    >
      {children}
    </button>
  );
};
```

## Implementation Notes

- Use the `clsx` or `classnames` library for conditional class application
- Create a theme context for managing dark mode and theme preferences
- Extract common styles into utility components
- Follow component composition patterns
- Ensure consistent naming conventions

This UI design system serves as a foundation for developing the Barbershop Management System with a consistent, accessible, and visually appealing user interface.