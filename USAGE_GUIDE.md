# Cursor Setup Agent Usage Guide

This guide explains how to use the Cursor Setup Agent to streamline your development process with [Cursor](https://cursor.sh) - the AI-powered code editor.

## What is the Cursor Setup Agent?

The Cursor Setup Agent is an automation tool that creates all necessary configuration files for optimizing your experience with the Cursor code editor. It pre-populates project information, sets up AI guidance rules, and creates helpful documentation files to ensure your AI assistant has the context it needs to provide high-quality assistance.

## Getting Started

### Prerequisites

- [Cursor](https://cursor.sh) installed on your computer
- Basic understanding of command line operations
- A new or existing project you want to enhance with Cursor

### Installation Options

#### Option 1: Use the Scripts in This Repository

1. Clone this repository:
   ```bash
   git clone https://github.com/barberblitz123/barbershop-system-cursor.git
   cd barbershop-system-cursor
   ```

2. Make the script executable (Mac/Linux only):
   ```bash
   chmod +x cursor-setup-agent.sh
   ```

3. Run the appropriate script for your platform:
   - Mac/Linux: `./cursor-setup-agent.sh`
   - Windows: Double-click `cursor-setup-agent.bat`

#### Option 2: Download Just the Script

1. Download only the script file:
   - Mac/Linux: [cursor-setup-agent.sh](https://raw.githubusercontent.com/barberblitz123/barbershop-system-cursor/main/cursor-setup-agent.sh)
   - Windows: [cursor-setup-agent.bat](https://raw.githubusercontent.com/barberblitz123/barbershop-system-cursor/main/cursor-setup-agent.bat)

2. Make the script executable (Mac/Linux only):
   ```bash
   chmod +x cursor-setup-agent.sh
   ```

3. Run the script

## Using the Cursor Setup Agent

### Step 1: Provide Basic Project Information

When you run the script, you'll be prompted to enter some basic information about your project:

```
Project name: [Enter your project name]
Project location (full path): [Enter the path where you want the files created]
Brief project description: [Enter a short description of your project]
Frontend tech [React, Next.js, TypeScript, Tailwind CSS]: [Press Enter for default or enter your own]
Backend tech [Next.js API routes]: [Press Enter for default or enter your own]
Database [Firebase Firestore]: [Press Enter for default or enter your own]
```

The script will use default values for technology choices if you press Enter without typing anything.

### Step 2: Generated Files

After providing the information, the script will create the following files:

1. `.cursorrules` - The main configuration file that guides Cursor's AI behavior
2. `.cursorignoree` - Specifies which files Cursor should not modify
3. `instructions/` directory with specialized documentation:
   - `database-setup.md` - Database structure and common queries
   - `ui-design-principles.md` - Design system guidelines
   - `roadmap.md` - Project phases and priorities
4. `CURSOR_BEST_PRACTICES.md` - Guide for optimal Cursor usage

### Step 3: Using Cursor with the Generated Files

1. Open your project in Cursor
2. Cursor will automatically detect the `.cursorrules` file and use it for context
3. When working with specific features, reference the relevant instruction files:
   ```
   @file:instructions/database-setup.md
   I need help creating a new database query for appointment conflicts
   ```

## Best Practices for Using Cursor with These Files

### Effective Prompting

For the best results with Cursor, use these prompting techniques:

1. **Be specific and detailed**
   ```
   Help me implement a function to check for appointment conflicts based on the data structure in database-setup.md
   ```

2. **Reference relevant files**
   ```
   @file:src/components/Calendar.tsx
   @file:instructions/ui-design-principles.md
   How should I style this calendar component according to our design system?
   ```

3. **Use the preferred phrases**
   ```
   The fewer lines of code, the better. Help me refactor this function to be more concise.
   ```

4. **For error fixing, provide context**
   ```
   I'm getting this error: "Cannot read property 'date' of undefined"
   Please write three reasoning paragraphs analyzing what might be causing it before proposing a solution.
   ```

### Updating Configuration Files

As your project evolves, you should periodically update the configuration files:

1. `.cursorrules` - Update when project structure or requirements change
2. `.cursorignoree` - Update when adding new types of files that should be protected
3. Instruction files - Update as you implement new features or change designs

## Troubleshooting

### Script Issues

- **"Permission denied" error**: Run `chmod +x cursor-setup-agent.sh` on Mac/Linux
- **Script doesn't create files**: Ensure you have write permissions for the target directory

### Cursor Issues

- **Cursor ignores .cursorrules**: Restart Cursor or create a new Composer
- **AI seems confused**: Your .cursorrules might have conflicting instructions; simplify and focus on key information

## Help and Support

If you encounter any issues or have questions:

1. Refer to the [Cursor documentation](https://cursor.sh/docs)
2. Check the [GitHub repository](https://github.com/barberblitz123/barbershop-system-cursor) for updates
3. Submit an issue on GitHub if you find a bug

## Advanced Usage

### Creating Desktop Shortcuts

#### Mac
1. Open Script Editor
2. Create a new script with:
   ```applescript
   do shell script "/path/to/cursor-setup-agent.sh"
   ```
3. Save as an application

#### Windows
1. Create a shortcut to cursor-setup-agent.bat
2. Right-click, select Properties
3. Add an icon and change the start in directory

### Integrating with Project Templates

You can integrate the Cursor Setup Agent with your project templates:

1. Include the script in your template repository
2. Add a post-template hook to run the script
3. Pre-populate project-specific values

## Contributing

We welcome contributions to improve the Cursor Setup Agent:

1. Fork the repository
2. Make your changes
3. Submit a pull request

Please follow the existing code style and include documentation for any new features.

## License

This project is licensed under the MIT License - see the LICENSE file for details.