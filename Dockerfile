# Stage 1: Build the Go code with a recent version of GCC, using both C and C++, and a recent version of Golang
ARG version="v1.0.0"

FROM --platform=linux/arm64 golang:1.21-bullseye AS builder

# Set the working directory
WORKDIR /build

# Copy the Go code into the container
COPY . .

# Build the Go code
RUN CGO_ENABLED=1 GOOS=linux go build -o stt-processor -ldflags="-X 'main.Version=$version'"

# Stage 2: Create the final image
FROM --platform=linux/arm64 debian:bullseye-slim

# Set the working directory
WORKDIR /app

# Copy the executable from the build stage
COPY --from=builder /build/stt-go-test /app/

# Run the application
CMD ["bash"]
