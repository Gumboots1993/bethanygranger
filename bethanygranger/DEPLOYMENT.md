# Flutter Web Deployment Guide - Bluehost

This guide explains how to deploy a Flutter web application to Bluehost hosting in a subdirectory.

## Prerequisites

- Flutter SDK installed and configured
- Bluehost hosting account with available site slots
- FTP access or File Manager access to your hosting
- Your app's subdirectory path (e.g., `/website_98bf1315/`)

## Step 1: Build the Flutter Web App

The most important step is building with the correct **base-href** path for your subdirectory.

```bash
# Navigate to your Flutter project root
cd /path/to/your/flutter/project

# Build for web with the correct subdirectory path
flutter build web --release --base-href "/your-subdirectory-name/"
```

**Important Notes:**
- Replace `/your-subdirectory-name/` with your actual path
- The path MUST start and end with a forward slash `/`
- Examples:
  - `--base-href "/portfolio/"`
  - `--base-href "/website_98bf1315/"`
  - `--base-href "/app/"`

**Common Mistake:** Building without `--base-href` or with the wrong path will result in a blank page with 404 errors for resources.

## Step 2: Create a Deployment Package

Create a zip file for easy upload:

```bash
# From your project root, navigate to build directory
cd build

# Create a zip file of the web folder
zip -r myapp-web.zip web/

# Copy to an accessible location (example for WSL)
cp myapp-web.zip /mnt/c/Users/YOUR_USERNAME/Downloads/
```

The build output will be in `build/web/` and contains:
- `index.html` - Main entry point
- `main.dart.js` - Compiled Dart code
- `flutter.js` & `flutter_bootstrap.js` - Flutter framework
- `flutter_service_worker.js` - Service worker for caching
- `assets/` - App assets (images, fonts)
- `canvaskit/` - Graphics rendering engine
- `icons/` - App icons
- `manifest.json` - Web app manifest
- `favicon.png` - Browser icon

## Step 3: Prepare Bluehost Directory

1. **Log into Bluehost cPanel**
2. **Open File Manager** (or connect via FTP)
3. **Navigate to your target directory:**
   - For subdirectory: `public_html/your-subdirectory/`
   - For subdomain: The folder created when you set up the subdomain
   - For main domain: `public_html/` (not recommended if you have existing content)

4. **Clear the directory:**
   - Delete any existing files (EXCEPT `cgi-bin/` if present)
   - Be careful not to delete files from other sites!

## Step 4: Upload Files

### Method A: File Manager Upload

1. **Extract the zip file on your computer:**
   - Right-click `myapp-web.zip` → Extract All
   - Navigate INTO the `web` folder

2. **Upload contents to Bluehost:**
   - In File Manager, navigate to your target directory
   - Click "Upload" button
   - Select ALL files and folders from INSIDE the `web` folder
   - Upload them (this may take a few minutes for ~20-30 MB)

3. **Verify file structure:**
   ```
   your-subdirectory/
   ├── cgi-bin/              (if it was there)
   ├── index.html            ← Should be directly here
   ├── main.dart.js
   ├── flutter.js
   ├── flutter_bootstrap.js
   ├── flutter_service_worker.js
   ├── manifest.json
   ├── favicon.png
   ├── version.json
   ├── assets/               ← Folder
   ├── canvaskit/            ← Folder
   └── icons/                ← Folder
   ```

**Common Mistake:** Uploading the `web` folder itself instead of its contents creates an extra nesting level.

### Method B: FTP Upload

1. **Connect to Bluehost via FTP:**
   - Use FileZilla or another FTP client
   - Use your Bluehost FTP credentials

2. **Navigate to target directory:**
   - Remote path: `/public_html/your-subdirectory/`

3. **Upload the contents:**
   - From your local `build/web/` folder
   - Upload all files and folders to the remote directory

## Step 5: Test Your Deployment

1. **Visit your URL in a web browser:**
   ```
   http://yourdomain.com/your-subdirectory/
   ```
   Or for subdomain:
   ```
   https://subdomain.yourdomain.com
   ```

2. **If you see a blank page:**
   - Press `Ctrl+Shift+I` (or `F12`) to open Developer Tools
   - Click the "Console" tab
   - Look for errors

3. **Common issues:**

   **404 Errors for resources:**
   - Wrong `--base-href` path during build
   - Files not uploaded correctly
   - Extra nesting (web folder inside your directory)

   **Blank page with no errors:**
   - Browser cache issue - try `Ctrl+F5` (hard refresh)
   - Or `Ctrl+Shift+Delete` to clear cache completely

   **"Failed to load resource" errors:**
   - Check file structure is correct (no extra `web/` folder)
   - Verify all files uploaded successfully

4. **Clear your browser cache:**
   - Hard refresh: `Ctrl+F5` (Windows/Linux) or `Cmd+Shift+R` (Mac)
   - Or clear all browsing data if issues persist

## Step 6: Update Your App

When you make changes to your Flutter app and need to redeploy:

1. **Rebuild with the same base-href:**
   ```bash
   flutter build web --release --base-href "/your-subdirectory/"
   ```

2. **Create new zip file:**
   ```bash
   cd build
   zip -r myapp-web-updated.zip web/
   ```

3. **On Bluehost:**
   - Delete OLD files from your directory (except `cgi-bin`)
   - Upload NEW files from the updated build

4. **Clear browser cache and test**

## Deployment Checklist

Before deploying, verify:

- [ ] Built with correct `--base-href` path
- [ ] Path starts and ends with `/`
- [ ] All files in `build/web/` are included
- [ ] Target directory on Bluehost is cleared (except `cgi-bin`)
- [ ] Files uploaded to correct location (no extra nesting)
- [ ] `index.html` is directly in target directory
- [ ] Browser cache cleared when testing

## Troubleshooting

### Issue: Page loads but shows old version
**Solution:** Clear browser cache with `Ctrl+F5` or clear all browsing data

### Issue: 404 errors in console
**Solution:** Check `index.html` on server - look at line 17, the `<base href>` should match your subdirectory path

### Issue: Blank page when opening index.html locally
**Solution:** This is expected - Flutter web apps must be served from a web server, not opened as local files

### Issue: Files seem to upload but don't update
**Solution:** Some hosting providers cache files. Try:
- Deleting files first, then uploading
- Renaming the file temporarily
- Waiting a few minutes for cache to clear

## Alternative Deployment Options

### Deploy to Root Domain
```bash
flutter build web --release --base-href "/"
```
Upload to `public_html/` (only if you're not using it for other sites)

### Deploy to Subdomain
1. Create subdomain in Bluehost (e.g., `app.yourdomain.com`)
2. Build with root path: `--base-href "/"`
3. Upload files to the subdomain's folder (usually `public_html/app/`)

### Deploy with Custom Domain
If your subdirectory will eventually have its own domain:
1. Build with root path: `--base-href "/"`
2. Set up domain to point to the subdirectory
3. No path prefix needed in URLs

## File Size Considerations

Typical Flutter web app sizes:
- Minimal app: ~5-10 MB
- With assets/images: ~10-30 MB
- Large apps: ~30-50+ MB

Bluehost upload limits:
- File Manager: Usually 64-256 MB per file
- FTP: No practical limit

For large apps, FTP is recommended over File Manager.

## Security Notes

- Bluehost automatically serves files over HTTPS for purchased domains
- Service workers enable offline functionality and caching
- No server-side configuration needed for basic Flutter web apps
- For SPA routing, you may need `.htaccess` rules (see below)

## Optional: .htaccess for Clean URLs

If you want to support direct URLs to routes (e.g., `/about`, `/contact`):

Create a `.htaccess` file in your deployment directory:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /your-subdirectory/
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule ^.*$ index.html [L]
</IfModule>
```

Replace `/your-subdirectory/` with your actual path.

## Summary

1. Build: `flutter build web --release --base-href "/path/"`
2. Package: Create zip of `build/web/` contents
3. Clear: Remove old files from Bluehost directory
4. Upload: Transfer contents (not folder) to target directory
5. Test: Visit URL and clear cache if needed

Following these steps will ensure successful deployment of your Flutter web app to Bluehost hosting.
