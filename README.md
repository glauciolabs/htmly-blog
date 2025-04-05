# htmly-blog
[![htmly-build](https://github.com/glauciolabs/htmly-blog/actions/workflows/build.yml/badge.svg)](https://github.com/glauciolabs/htmly-blog/actions/workflows/build.yml)

HTMLy is an open-source, databaseless blogging platform.  
All credits to the original creator: [danpros](https://github.com/danpros/htmly).

## Features

- Lightweight and fast.
- No database required—uses flat files for storage.
- Supports Markdown for content creation.
- Built-in multi-factor authentication (MFA) support.
- Easy to configure and extend.

## Configuration

To set up a user, you need to manually inject a `<user>.ini` and `config.ini` files with the following structure:

```ini
; Password
password = "<HASH>"

; Encryption. Set to "clear", and it will be changed to "password_hash" automatically during login.
encryption = "sha512"

; Role
role = "<ROLE>"

; MFA Secret - This is generated inside the admin area. Set to "disabled" to turn off MFA for a user.
mfa_secret = "<MFA-SECRET>"
```

### Container Configuration Paths

When deploying the container, ensure the following files are placed in the correct paths:

- `config.ini` → `/var/www/html/config/config.ini`
- `<username>.ini` → `/var/www/html/config/users/username.ini.example`

These files are required for the application to function correctly.

## Container Image

This project includes a containerized build for easy deployment.  
You can use the container image to quickly set up and run the application in any environment that supports Docker or similar container runtimes.

### Build and Start the Container

1. **Build the container image**:
   ```bash
   docker-compose build
   ```

2. **Start the container**:
   ```bash
   docker-compose up -d
   ```

3. **Access the application**:
   Open your browser and navigate to `http://localhost:8080`.

For more details on how to build and run the container, refer to the [official documentation](https://github.com/yourusername/htmly-blog/wiki).
