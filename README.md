# Minesweeper App

Minesweeper is a simple Rails application that allows users to generate minesweeper boards as well as to view previously generated minesweeper boards.


## Technologies Used
- Ruby on Rails

## Setup
To set up the Good Night app, follow these steps:

1. Install the dependencies:
```bash
bundle install
```

2. Set up the database:
```bash
rails db:create
rails db:migrate
rails db:seed # this will create 15 random boards
```

3. Start the server:
```bash
rails server
```
Go to http://localhost:3000 to see the homepage