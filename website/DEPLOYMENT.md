# Deployment Guide

This guide covers deploying the Peon landing page to various hosting platforms.

## Prerequisites

- Node.js 18+ installed
- Project built successfully (`npm run build`)

## Vercel

### Quick Deploy

```bash
npm install -g vercel
vercel
```

### Vercel Configuration

Create `vercel.json`:

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "devCommand": "npm run dev",
  "installCommand": "npm install"
}
```

## Netlify

### Quick Deploy

```bash
npm install -g netlify-cli
netlify deploy --prod
```

### Netlify Configuration

Create `netlify.toml`:

```toml
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

## Cloudflare Pages

1. Push code to GitHub/GitLab
2. Connect repository in Cloudflare Pages dashboard
3. Set build settings:
   - Build command: `npm run build`
   - Build output directory: `dist`
   - Root directory: `/website`

## GitHub Pages

### Manual Deploy

```bash
npm run build
cd dist
git init
git add .
git commit -m "Deploy to GitHub Pages"
git branch -M gh-pages
git remote add origin <your-repo-url>
git push -f origin gh-pages
```

### Automated with GitHub Actions

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm install
      - run: npm run build
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist
```

## Custom Server

### Using a simple HTTP server

```bash
npm run build
cd dist
npx http-server -p 8080
```

### Using Nginx

```nginx
server {
    listen 80;
    server_name peon.dev;
    root /var/www/peon/dist;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # Enable gzip compression
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

## Environment Variables

No environment variables are required for this static site.

## Domain Configuration

After deploying, configure your custom domain:

1. Add DNS records pointing to your hosting provider
2. Enable SSL/HTTPS (automatic on Vercel, Netlify, Cloudflare)
3. Verify site is accessible at https://peon.dev

## Performance Optimization

The site is already optimized with:
- Static generation (no JavaScript required for rendering)
- Tailwind CSS (minimal CSS)
- No external dependencies on page load
- Optimized fonts (Google Fonts with preconnect)

## Monitoring

Recommended tools:
- Google Analytics (add to layout)
- Vercel Analytics
- Cloudflare Analytics
- Plausible (privacy-friendly)

## Troubleshooting

### Build fails

```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Styles not loading

- Check that `src/styles/global.css` is imported in Layout
- Verify Tailwind configuration in `astro.config.mjs`

### 404 errors

- Ensure hosting platform serves `index.html` for all routes
- Check that `dist/` directory contains `index.html`
