# Contributing to Order With Friends

First off, thank you for considering contributing to _Order With Friends_! It's people like you that make _Order With Friends_ such a great tool for everyone.

## Technology Stack

_Order With Friends_ is built with:
- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Frontend**: Bootstrap
- **Future Plans**: PWA support, possible Flutter mobile app

## Development Environment Setup

### Prerequisites

- Ruby (version 3.0.0 or newer)
- Rails (version 7.0.0 or newer)
- PostgreSQL (version 13 or newer)
- Node.js and Yarn for asset compilation
- Git

### Setting Up Local Development

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/OrderWithFriends.git
   cd OrderWithFriends
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Loads sample data
   ```

4. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your local configuration
   ```

5. **Start the server**
   ```bash
   rails server
   ```

6. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## Code Style Guidelines

### Ruby/Rails

- Follow the [Ruby Style Guide](https://rubystyle.guide/)
- Use 2 spaces for indentation
- Keep lines under 100 characters
- Write self-documenting code with clear variable and method names
- Document complex methods with comments
- Use Rails conventions for naming and file structure

### Database

- Follow Rails conventions for migration names
- Add appropriate indexes to foreign keys
- Document complex queries
- Write reversible migrations when possible

### Frontend

- Follow Bootstrap conventions and best practices
- Keep HTML semantic and accessible
- Write modular CSS/SCSS
- Use JavaScript/Stimulus for interactivity

## Git Workflow

1. **Create a new branch from main**
   ```bash
   git checkout main
   git pull origin main
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Commit early and often
   - Write meaningful commit messages
   - Reference issue numbers in commit messages when applicable

3. **Keep your branch updated with main**
   ```bash
   git fetch origin
   git rebase origin/main
   ```

4. **Push your branch to GitHub**
   ```bash
   git push origin feature/your-feature-name
   ```

## Pull Request Process

1. **Create a Pull Request (PR)**
   - Use the PR template if available
   - Describe your changes clearly
   - Link any related issues
   - Add screenshots for UI changes

2. **Code Review**
   - Address review comments
   - Make requested changes
   - Push additional commits as needed

3. **Passing Checks**
   - Ensure all tests pass
   - Fix any linting issues
   - Maintain or improve code coverage

4. **Merge**
   - A maintainer will merge your PR when it's ready
   - Clean up your branch after merge

## Issue Reporting

### Bug Reports

Please include:
- Clear steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots if applicable
- Your environment (browser, OS, etc.)

### Feature Requests

Please include:
- Clear description of the feature
- The problem it solves
- Any alternatives you've considered
- Mockups or wireframes if applicable

## Testing Guidelines

- Write tests for new features
- Maintain existing tests when changing code
- Aim for comprehensive test coverage
- Test structure should follow Rails conventions:
  - Model specs for logic and validations
  - Controller specs for request/response cycle
  - System/integration tests for end-to-end flows

## Documentation

- Update README.md if needed
- Add inline documentation for complex code
- Update the wiki for significant changes
- Document new features, config options, and APIs

## PWA Development

When contributing to the Progressive Web App aspects:
- Test on multiple devices and browsers
- Follow PWA best practices for performance and caching

## Future Mobile Development

While the Flutter app is planned for the future, keep in mind:
- Design APIs with mobile consumption in mind
- Consider mobile-friendly UI patterns
- Document potential mobile use cases

---

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## Questions?

If you have any questions, please reach out to [Robertovbj](https://github.com/Robertovbj) or open an issue with your question.

Thank you for contributing to _Order With Friends_!
