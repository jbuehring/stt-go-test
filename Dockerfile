FROM --platform=linux/arm64 golang:1.21-bullseye
ENV VERSION="v1.0.0"

# Set the working directory
WORKDIR /build

# Copy the Go code into the container
COPY . .

# Build the Go code
RUN CGO_ENABLED=1 GOOS=linux go build -o stt-go-test -ldflags="-X 'main.Version=$VERSION'"

# Run the application
CMD ["bash"]
