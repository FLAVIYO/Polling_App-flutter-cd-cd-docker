# Use a pre-built Flutter image as the base
FROM cirrusci/flutter:2.10.5

# Set the working directory
WORKDIR /app

# Copy the pubspec files and get dependencies
COPY pubspec.yaml pubspec.lock 
RUN flutter pub get

# Copy the entire project
COPY . .

# Enable Flutter's Android toolchain
RUN flutter doctor --android-licenses

# Build the Flutter Android app
RUN flutter build apk --release

# To run the app, expose necessary ports and simulate an Android environment
CMD ["flutter", "run", "--release"]
