# Copilot Instructions for AI Agents

## Project Overview
- This is a minimal Java HTTP server that serves random motivational quotes via a REST API at `/` (port 8000).
- Quotes are loaded from `quotes.txt` (one quote per line, required at startup).
- The main logic is in `src/Main.java` using `com.sun.net.httpserver.HttpServer`.
- The app is Dockerized for easy deployment (see `Dockerfile`).

## Key Files
- `src/Main.java`: Main application logic, HTTP server, file I/O for quotes.
- `quotes.txt`: List of quotes, one per line. Must exist for the app to start.
- `Dockerfile`: Containerizes the app for deployment.
- `README.md`: Build/run instructions, project structure, and usage examples.

## Build & Run Workflows
- **Local (no Maven):**
  - Compile: `javac src/Main.java -d out`
  - Run: `java -cp out Main`
- **Docker:**
  - Build: `docker build -t motivational-quotes-api .`
  - Run: `docker run -p 8000:8000 motivational-quotes-api`
- **API Test:** `curl http://localhost:8000/` (returns JSON: `{ "quote": "..." }`)

## Project Conventions
- Quotes are externalized; edit `quotes.txt` to change output (restart required).
- No frameworks or external dependencies beyond JDK standard library.
- No Maven/Gradle build files; manual `javac`/`java` or Docker only.
- All logic is in a single file (`Main.java`), no package structure.
- Error handling: If `quotes.txt` is missing or empty, the app logs an error and exits.
- JSON responses are constructed manually (no library).

## Patterns & Integration Points
- HTTP server uses Java's built-in `com.sun.net.httpserver.HttpServer`.
- File I/O for quotes is synchronous and blocking at startup only.
- Random quote selection uses `java.util.Random`.
- No authentication, persistence, or external APIs.

## Examples
- To add a new quote: append a line to `quotes.txt` and restart the app.
- To change the port or add endpoints: edit `Main.java` (see `server.createContext`).

## Recommendations for AI Agents
- Follow the single-file, minimal-dependency style unless refactoring is requested.
- When adding features, keep the API simple and stateless.
- Reference `README.md` for up-to-date build/run instructions.
- If introducing new files or dependencies, update the `README.md` accordingly.
