# AGENTS.md

This document provides essential guidelines for agents working in this repository. Follow these instructions to ensure consistency and maintainability.

## Build, Lint, and Test Commands

### Development
- Start the development server:
  ```bash
  npm run dev
  ```

### Build
- Build the application for production:
  ```bash
  npm run build
  ```

### Lint
- Run the linter to check for code style issues:
  ```bash
  npm run lint
  ```

### Testing
- Currently, no specific test scripts are defined in `package.json`. Add test scripts if needed.

## Code Style Guidelines

### General
- Follow the ESLint configuration defined in `.eslintrc.json`:
  ```json
  {
    "extends": "next/core-web-vitals"
  }
  ```
- Use the `next/core-web-vitals` rules for best practices in Next.js applications.

### Imports
- Group imports logically:
  - External libraries first.
  - Internal modules/components next.
  - Relative imports last.

### Formatting
- Use consistent indentation (2 spaces).
- Ensure proper spacing around operators and keywords.
- Avoid trailing spaces.

### Types
- Use TypeScript types where applicable (if TypeScript is added in the future).
- Prefer `PropTypes` for React components if TypeScript is not used.

### Naming Conventions
- Use camelCase for variables and functions.
- Use PascalCase for React components and classes.
- Use UPPER_SNAKE_CASE for constants.

### Error Handling
- Always handle errors gracefully.
- Use `try-catch` blocks for asynchronous operations.
- Log errors to the console for debugging during development.

### Environment Variables
- Define environment variables in `.env`.
- Use `.env.example` as a template for required variables.

### Docker and Terraform
- Use Docker for local MongoDB development:
  ```bash
  docker compose up -d
  ```
- Use Terraform for infrastructure management. Initialize and apply configurations as needed:
  ```bash
  terraform init
  terraform apply -var="cloud_provider=aws" -var-file="aws/example.tfvars"
  ```

Adhere to these guidelines to ensure a smooth development experience.