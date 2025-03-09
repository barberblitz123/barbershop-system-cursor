# Cursor Best Practices for Barbershop Management System

This document outlines the best practices for using Cursor with this project.

## Essential Files

### `.cursorrules`

The `.cursorrules` file in the root directory provides essential context about the project. It includes:

- Project overview and vision
- Personality instructions for Cursor
- Tech stack details
- Environment variables
- File structure
- Process definitions
- Important instructions

Always keep this file updated as the project evolves.

### `.cursorignoree`

The `.cursorignoree` file prevents Cursor from accidentally modifying sensitive files like:

- Environment variables
- Generated files
- Binary files
- Lock files

### Specialized Markdown Files

We maintain specialized markdown files in the `instructions/` directory:

- `database-setup.md`: Database structure, security rules, and common queries
- `ui-design-principles.md`: Design system, colors, typography, and component guidelines
- `roadmap.md`: Current focus, priorities, and future plans

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
2. **File Tags**: Tag relevant files using `@filename`
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

## MVP Approach

When building features with Cursor:

1. **Start with the simplest working version**
   - Get a basic version working first
   - Start with UI/UX and add functionality later
   - Break large features into smaller, manageable chunks

2. **Iterate with small, testable changes**
   - Add one feature at a time
   - Test each addition thoroughly
   - Commit changes frequently

3. **Fill in gaps last**
   - Handle edge cases after the main functionality works
   - Add error handling and validation as refinements
   - Optimize performance after features are complete

## Technical Debt Management

Use dedicated comments for technical debt:

```typescript
// TODO(tech-debt): This implementation is temporary and should be replaced with a more efficient solution
// FIXME: This approach has performance issues with large datasets
// OPTIMIZATION: Consider using memoization here to avoid redundant calculations
```

## Web Searches

When seeking external information:
- Be specific about versions (React 18, Next.js 14, etc.)
- Include error messages verbatim
- Specify the context (e.g., "in a Next.js app router project")

## Error Fixing

When encountering errors:

1. Have Cursor explain what information it needs to debug
2. Provide the requested information
3. Ask Cursor to write three reasoning paragraphs before proposing a solution
4. Break down complex fixes into steps
5. Test after each step

Remember that Cursor has a knowledge cutoff date and may not be aware of the latest updates to libraries or frameworks. Always verify with official documentation when in doubt.