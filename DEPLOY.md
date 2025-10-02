# Deployment Instructions

The production build is ready in the `/docs` folder and can be committed to git.

## ✅ What's Ready

- **Production Build**: `/docs` folder contains the optimized static site
- **Source Code**: `/website` folder contains the Astro source
- **Build Tested**: Successfully verified at http://localhost:8080

## 🚀 Deploy Options

### Option 1: GitHub Pages (Recommended for this setup)

The `/docs` folder is ready for GitHub Pages:

1. **Commit the production build:**
   ```bash
   git add docs/
   git add .gitignore
   git commit -m "Add production build for peon.dev landing page"
   git push origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Navigate to Settings → Pages
   - Under "Source", select: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/docs**
   - Click Save

3. **Configure custom domain (optional):**
   - In Settings → Pages, add your custom domain: `peon.dev`
   - Create a `CNAME` file in `/docs`:
     ```bash
     echo "peon.dev" > docs/CNAME
     git add docs/CNAME
     git commit -m "Add CNAME for custom domain"
     git push
     ```
   - Update your DNS records:
     - Add A records pointing to GitHub's IPs:
       - 185.199.108.153
       - 185.199.109.153
       - 185.199.110.153
       - 185.199.111.153
     - Or add a CNAME record: `peon.dev` → `yourusername.github.io`

### Option 2: Any Static File Server

The `/docs` folder can be served by any static file server:

**Using Python:**
```bash
cd docs
python3 -m http.server 8080
```

**Using Node.js http-server:**
```bash
npx http-server docs -p 8080
```

**Using Nginx:**
```nginx
server {
    listen 80;
    server_name peon.dev;
    root /path/to/peon.dev/docs;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

### Option 3: Vercel/Netlify (Deploy from website folder)

If you prefer Vercel or Netlify, use the source folder:

**Vercel:**
```bash
cd website
npm install -g vercel
vercel
```

**Netlify:**
```bash
cd website
npm install -g netlify-cli
netlify deploy --prod
```

## 🔄 Updating the Site

When you make changes to the source code:

1. **Edit files in `/website/src/`**

2. **Rebuild:**
   ```bash
   cd website
   npm run build
   ```

3. **Copy to docs:**
   ```bash
   cd ..
   rm -rf docs/*
   cp -r website/dist/* docs/
   ```

4. **Commit and push:**
   ```bash
   git add docs/
   git commit -m "Update landing page"
   git push
   ```

### Quick Update Script

Create `update-site.sh` in the root:

```bash
#!/bin/bash
cd website
npm run build
cd ..
rm -rf docs/*
cp -r website/dist/* docs/
echo "✅ Production build updated in /docs"
```

Make it executable:
```bash
chmod +x update-site.sh
./update-site.sh
```

## 📁 Project Structure

```
peon.dev/
├── docs/              # ← Production build (commit this!)
│   ├── index.html
│   └── favicon.svg
├── website/           # ← Source code
│   ├── src/
│   ├── public/
│   └── dist/         # ← Build output (gitignored)
├── texts/            # ← Marketing content
└── .gitignore        # ← Ignores node_modules, dist, etc.
```

## ✨ What's Included in Production Build

- **Optimized HTML**: Minified and compressed
- **Inline CSS**: Tailwind classes compiled and inlined
- **SEO Meta Tags**: All Open Graph and Twitter cards
- **Structured Data**: JSON-LD for search engines
- **Favicon**: Purple lightning bolt SVG
- **No Runtime JS**: Pure static HTML/CSS (fast!)

## 🔍 SEO Checklist

Once deployed:

- [ ] Verify site loads at your domain
- [ ] Check all links work
- [ ] Test on mobile devices
- [ ] Verify favicon displays
- [ ] Test social sharing (Twitter, LinkedIn)
- [ ] Submit sitemap to Google Search Console
- [ ] Add Google Analytics (optional)

## 🌐 Custom Domain DNS

For `peon.dev`:

**A Records (point to GitHub):**
```
@ → 185.199.108.153
@ → 185.199.109.153
@ → 185.199.110.153
@ → 185.199.111.153
```

**CNAME Record (for www):**
```
www → yourusername.github.io
```

**Or use a CNAME at root if your DNS provider supports it:**
```
peon.dev → yourusername.github.io
```

## 🐛 Troubleshooting

**Styles not loading:**
- Check that `/docs/index.html` exists
- Verify CSS is inlined in the HTML

**404 on subpages:**
- GitHub Pages automatically handles this for SPAs
- For custom servers, ensure you redirect all routes to `/index.html`

**Build fails:**
```bash
cd website
rm -rf node_modules package-lock.json
npm install
npm run build
```

## 📊 Analytics (Optional)

Add Google Analytics to `/website/src/layouts/Layout.astro`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

Then rebuild and redeploy.

## ✅ Ready to Deploy!

The production build in `/docs` is ready to commit and deploy. Just run:

```bash
git add .
git commit -m "Add Peon landing page production build"
git push origin main
```

Then enable GitHub Pages in your repository settings!
