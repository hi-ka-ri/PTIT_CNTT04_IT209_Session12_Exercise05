# Build the application
FROM gradle:8.10.2-jdk21 AS build
WORKDIR /app
COPY . .
RUN chmod +x gradlew && ./gradlew --no-daemon clean installDist

# Run the application using a smaller runtime image
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/install/PTIT_CNTT04_IT209_Session12_Exercise05/ ./
EXPOSE 8080
CMD ["./bin/PTIT_CNTT04_IT209_Session12_Exercise05"]
