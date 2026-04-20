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
- **Events** — id, title, description, location, date, max_capacity, organizer_id (FK), category_id (FK), created_at
- **Categories** — id, name, description
- **Registrations** — id, user_id (FK), event_id (FK), status, registered_at
- **Reviews** — id, user_id (FK), event_id (FK), rating, comment, created_at
