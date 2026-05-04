# EventHub — Assignment 1

**Course:** Web Technologies  
**Semester:** 2026-10  
**Due Date:** April 20, 2026

## Description

EventHub is a university event management platform where community members can create, discover, and join campus events such as talks, workshops, sports activities, social gatherings, and study groups. This first assignment lays the foundation by defining user stories, a relational data model, and a static landing page.

## Group Members

| Name | Role |
|------|------|
| Jose Tomas Arevalo | Developer |
| Matias Keller | Developer |
| Maria Carolina Ruiz | Developer |

## Repository Structure

```
Assignment-1-Web-Technologies/
├── public_html/
│   ├── index.html          # Landing page (Bootstrap)
│   ├── style.css           # Custom styles
│   └── images/
│       ├── campus.jpg      # Hero background image
│       └── univ.jpg        # About section image
├── docs/
│   ├── user_stories.md     # User stories (Markdown)
│   └── data_model.png      # Relational data model diagram
├── README.md               # This file
└── .gitignore
```

## Deliverables

### 1. Landing Page
A static, responsive HTML page styled with Bootstrap located in `public_html/`. It includes:
- Navigation bar with links to Events, Categories, Login, and Sign Up
- Hero section with a call-to-action button ("Browse Events")
- About section explaining the platform
- Contact section with placeholder information
- Footer with team name, course, and year

### 2. User Stories
A complete set of user stories in `docs/user_stories.md` covering:
- Event creation and management
- Event discovery and browsing
- Registration and waiting list behavior
- Review and rating of past events
- Administrative actions (moderation)

### 3. Data Model
A relational diagram in `docs/data_model.png` created with [dbdiagram.io](https://dbdiagram.io). It includes the following entities:
- **Users** — id, name, email, password, role, created_at
- **Events** — id, title, description, location, date, max_capacity, status, organizer_id (FK), category_id (FK), created_at
- **Categories** — id, name, description
- **Registrations** — id, user_id (FK), event_id (FK), status, registered_at
- **Reviews** — id, user_id (FK), event_id (FK), rating, comment, created_at
- **Locations** - id, name, address, default_capacity

## Assignment 2 — Rails Application

The Rails application lives in the `event_hub/` subfolder.

### Tech stack
- Ruby on Rails 8.1
- PostgreSQL
- Bootstrap 5 (via CDN)
- bcrypt (`has_secure_password` for password hashing)

### Setup

\`\`\`bash
cd event_hub
bundle install
rails db:create db:migrate db:seed
rails server
\`\`\`

Open http://localhost:3000

### Seeded users
All seeded users have the password `password123` for testing purposes.

### Model changes from Assignment 1
- `Users.role`, `Events.status` and `Registrations.status` were converted from `varchar` to `integer` to use Rails enums idiomatically.
- `Users.password` was replaced by `password_digest` (used by Rails' `has_secure_password` with bcrypt). In Assignment 3 this will be migrated to Devise.

The updated relational diagram is available at `docs/data_model_v2.png`.
```


```
```bash
cd event_hub
bundle install
rails db:create db:migrate db:seed
rails server
```