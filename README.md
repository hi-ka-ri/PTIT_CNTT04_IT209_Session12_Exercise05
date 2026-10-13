# PTIT CNTT04 – IT209 Session 12 Exercise 05

Exercise project for troubleshooting a GitHub Actions CI/CD pipeline.

## Files
- `.github/workflows/broken-pipeline.yml`: corrected workflow.
- `gradlew`, `build.gradle`, `settings.gradle`: Gradle project.
- `Dockerfile`: container build file at repository root.
- `homework/session12/ex5/troubleshooting.md`: report.

## Local test (Linux / Git Bash with Java 21, curl, unzip)
```bash
chmod +x gradlew
./gradlew clean test build
```

## Required GitHub repository secrets
- `REGISTRY_USERNAME`: Docker Hub username.
- `REGISTRY_TOKEN`: Docker Hub access token with push permission.

The workflow pushes `REGISTRY_USERNAME/ptit-session12-ex5:latest` on pushes and manual runs. Ensure the Docker Hub account/repository permissions allow pushing.
