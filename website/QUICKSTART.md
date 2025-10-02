# Quick Start Guide

Get the Peon landing page up and running in 3 minutes!

## 🚀 Installation & Dev Server

```bash
# Navigate to the project
cd website

# Install dependencies
npm install

# Start development server
npm run dev
```

Open http://localhost:4321 in your browser. The page will hot-reload as you make changes.

## 🏗️ Build for Production

```bash
npm run build
```

This creates an optimized production build in the `dist/` directory.

## 👀 Preview Production Build

```bash
npm run preview
```

Preview the production build locally before deploying.

## 📂 Project Files

- `src/pages/index.astro` - Main landing page
- `src/layouts/Layout.astro` - Base layout with SEO
- `src/styles/global.css` - Global styles and Tailwind
- `public/favicon.svg` - Site favicon

## 🎨 Customization

### Colors

Edit the purple theme in `src/pages/index.astro`:
- Replace `purple-600` with your color
- Update gradient from `from-purple-600 to-pink-600`

### Content

All content is in `src/pages/index.astro`:
- Hero section (lines 32-91)
- Features (lines 94-185)
- How it works (lines 188-256)
- Case study (lines 259-367)
- Social proof (lines 370-383)
- Final CTA (lines 386-413)
- Footer (lines 416-472)

### SEO

Edit meta tags in `src/layouts/Layout.astro`:
- Title (line 21)
- Description (line 5)
- Open Graph tags (lines 13-17)

## 🌐 Deploy

Choose your platform:

**Vercel** (Recommended)
```bash
npm install -g vercel
vercel
```

**Netlify**
```bash
npm install -g netlify-cli
netlify deploy --prod
```

**Other Platforms**
See DEPLOYMENT.md for detailed instructions.

## 💡 Tips

1. Keep the build passing: `npm run build`
2. Check TypeScript: `npm run astro check`
3. The site is fully static - no runtime JavaScript needed
4. All images should go in `public/` directory
5. Use Tailwind classes for styling

## 🐛 Troubleshooting

**Build fails?**
```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

**Styles not showing?**
- Check that Tailwind is configured in `astro.config.mjs`
- Verify `global.css` is imported in Layout

**Port 4321 in use?**
```bash
npm run dev -- --port 3000
```

## 📚 Learn More

- [Astro Docs](https://docs.astro.build)
- [Tailwind CSS](https://tailwindcss.com)
- [Deployment Guide](./DEPLOYMENT.md)
- [Project Summary](./PROJECT-SUMMARY.md)

## ✅ Checklist

- [ ] Install dependencies
- [ ] Run dev server
- [ ] Customize content
- [ ] Update SEO meta tags
- [ ] Build for production
- [ ] Deploy to hosting
- [ ] Configure custom domain
- [ ] Add analytics (optional)

Happy building! 🎉
