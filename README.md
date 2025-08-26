# QuickDrop

**Drop it. Find it. Done.**

A minimalist note-taking app built with Rails 8 that lets you save text, links, and snippets instantly. No folders, no complexity - just drop it in and find it when you need it.

[quickdrop.sharecon.space](https://quickdrop.sharecon.space/)

https://github.com/user-attachments/assets/0fe4ddc1-5fff-476f-b771-d0ce88d8b6cd

## Features

### Core Functionality
- **Instant Note Creation** - Save text, links, code snippets, or ideas fast
- **Lightning Fast Search** - Find any note instantly with real-time search
- **Public Sharing** - Generate shareable links for any note with one click
- **Auto-linking** - URLs in notes become clickable links automatically
- **Responsive Design** - Works perfectly on desktop and mobile via web interface

### User Experience
- **Keyboard Shortcuts** - Press Enter to save, Shift+Enter for new lines
- **Auto-resize Text Areas** - Content areas grow as you type
- **Real-time Search** - Filter notes as you type without page refreshes
- **Clean Interface** - Distraction-free design focused on content

### Sharing & Privacy
- **One-click Sharing** - Toggle note sharing on/off instantly
- **Custom Share URLs** - Each shared note gets a unique, clean URL
- **Privacy Controls** - Disable sharing anytime to make notes private again
- **Guest-friendly** - Shared notes include call-to-action for new users

## Tech Stack

### Backend
- **Ruby on Rails 8** - Latest Rails with modern defaults
- **PostgreSQL** - Production database
- **Devise** - User authentication and registration

### Frontend
- **HTML + ERB** - It's actually enough for this app
- **Tailwind CSS** - Makes styling easy

### Infrastructure
- **Docker** - Containerized application
- **Kamal** - Zero-downtime deployments
- **Postmark** - TBA for password reset

## Live Demo

Visit [quickdrop.sharecon.space](https://quickdrop.sharecon.space) to see QuickDrop in action.

## Installation

### Prerequisites
- Ruby 3.2+
- PostgreSQL
- Node.js (for asset compilation)

### Setup
```bash
# Clone the repository
git clone https://github.com/your-username/quickdrop.git
cd quickdrop

# Install dependencies
bundle install

# Setup database
bin/rails db:create db:migrate

# Start the server
bin/rails server
```

Visit `http://localhost:3000` to access the application.

### Environment Variables
For development, create `.env` file:
```env
POSTMARK_API_TOKEN=your_postmark_token
```

## Deployment

QuickDrop uses [Kamal](https://kamal-deploy.org) for production deployment with zero-downtime deploys.

### Prerequisites
- Docker Hub account
- VPS with Docker installed
- Domain name configured

### Deploy to Production
```bash
# Configure your deploy.yml with server details
# Set up .kamal/secrets with required credentials

# Initial deployment
kamal setup

# Deploy application
kamal deploy

# Setup database
kamal app exec 'bin/rails db:create db:migrate'
```

### Environment Configuration
Required secrets in `.kamal/secrets`:
```bash
KAMAL_REGISTRY_PASSWORD=your_docker_hub_token
RAILS_MASTER_KEY=your_rails_master_key
QUICKDROP_DATABASE_PASSWORD=your_database_password
POSTMARK_API_TOKEN=your_postmark_api_token
```

## Development

### Database
Development uses PostgreSQL. To reset:
```bash
bin/rails db:drop db:create db:migrate
```

### Testing
```bash
# Run tests
bin/rails test

# System tests
bin/rails test:system
```

### Code Quality
```bash
# Run RuboCop
bundle exec rubocop

# Security scan
bundle exec brakeman
```

## API Design

QuickDrop follows RESTful conventions with clean, semantic routes:

```ruby
# User authentication
POST   /users/sign_in
POST   /users/sign_up
DELETE /users/sign_out

# Notes management
GET    /notes           # List all notes
POST   /notes           # Create new note
GET    /notes/:id       # Show specific note
PATCH  /notes/:id       # Update note
DELETE /notes/:id       # Delete note

# Sharing
PATCH  /notes/:id/toggle_sharing  # Enable/disable sharing
GET    /shared/:id                # View shared note (public)
```

## Architecture Decisions

### Why Rails 8?
- **Modern defaults** - Solid Queue, Solid Cache, and Solid Cable included
- **Simplified deployment** - Better Docker and Kamal integration
- **Performance** - Improved asset pipeline and caching

### Why PostgreSQL?
- **Production-ready** - Reliable, scalable database
- **Full-text search** - Built-in search capabilities
- **Data integrity** - ACID compliance and constraints

### Why Kamal?
- **Zero-downtime deploys** - Rolling deployments with health checks
- **Docker-native** - Modern containerized deployment
- **SSL automation** - Let's Encrypt integration
- **Simple secrets management** - Environment variable handling

### Why Tailwind CSS?
- **Utility-first** - Rapid UI development
- **Responsive design** - Mobile-first approach
- **Consistent spacing** - Design system baked in

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests for new functionality
5. Ensure RuboCop passes (`bundle exec rubocop`)
6. Commit your changes (`git commit -m 'Add amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

### Development Guidelines
- Follow Rails conventions and idioms
- Write tests for new features
- Keep views simple and semantic
- Use Stimulus for JavaScript interactions
- Maintain responsive design principles

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Built by [@imasharc](https://github.com/imasharc)

Project Link: [https://github.com/imsharc/quickdrop](https://github.com/imasharc/quickdrop)

Live Demo: [https://quickdrop.sharecon.space](https://quickdrop.sharecon.space)

---

**QuickDrop** - I wanted fast and easy note taking so I made myself one. You can try it too.
