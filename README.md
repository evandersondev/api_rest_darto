# Todo API REST with Darto framework

A RESTful API built with Darto framework for managing todos, using a SQLite database for persistence in memory.

## Features

- CRUD operations for todos
- SQLite database integration
- RESTful endpoints

## API Endpoints

### GET /todos

Retrieves all todos from the database

### GET /todos/:id

Retrieves a specific todo by ID

### POST /todos

Creates a new todo

```json
{
  "title": "Todo title",
  "description": "Todo description",
  "isDone": false
}
```

### PUT /todos/:id

Updates an existing todo

```json
{
  "title": "Updated title",
  "description": "Updated description",
  "isDone": true
}
```

### DELETE /todos/:id

Deletes a todo by ID

## Todo Model Structure

- id: Integer
- title: String
- description: String
- isDone: Boolean

## Technologies

- Dart
- Darto Framework
- SQLite Database

## Getting Started

1. Clone the repository
2. Install dependencies
3. Run the server

## Response Status Codes

- 200: Success
- 404: Todo not found
