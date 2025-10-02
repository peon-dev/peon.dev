# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains the landing page for **Peon** (peon.dev) - a virtual colleague tool for developers focused on automation. The site is a static landing page built with Astro that highlights time savings, cost benefits, and real-world case studies.

## Repository Structure

The repository uses a **dual-folder architecture** for source and deployment:

```
peon.dev/
├── website/           # Source code (Astro project)
│   ├── src/
│   │   ├── pages/index.astro      # Single-page landing site
│   │   └── layouts/Layout.astro   # Base layout with SEO
│   └── dist/                      # Build output (gitignored)
├── docs/              # Production build (committed to git)
│   ├── _astro/                    # Built CSS files
│   └── index.html                 # Optimized static HTML
└── texts/             # Marketing content source
```

**Important**: The `/docs` folder is the production build that gets deployed. It must be kept in sync with the source code in `/website`.

## Build & Development Commands

### Development
```bash
cd website
npm install          # First time setup
npm run dev          # Start dev server at http://localhost:4321
```

### Building for Production
```bash
cd website
npm run build        # Builds to website/dist/

# Update production build
cd ..
rm -rf docs/*
cp -r website/dist/* docs/

# Or use the convenience script from root:
./update-site.sh
```

### Preview Production Build
```bash
cd docs
python3 -m http.server 8080  # Test production build locally
```

## Architecture & Key Decisions

### CSS Architecture
- **Tailwind CSS v4** is configured via Vite plugin in `astro.config.mjs`
- All CSS (Tailwind + custom styles) is defined in `layouts/Layout.astro` using `<style is:global>` with `@import "tailwindcss"`
- During build, Astro extracts CSS to `/_astro/index.[hash].css` automatically
- **Critical**: Do NOT link to `/src/styles/global.css` in production - it won't exist. All styles must be in the Layout component for proper extraction.

### Single-Page Architecture
- The entire landing page is in `src/pages/index.astro`
- No routing, no client-side JS - pure static HTML/CSS
- Layout component (`src/layouts/Layout.astro`) handles SEO meta tags, structured data, and global styles

### SEO Strategy
All SEO is handled in the Layout component:
- Open Graph tags for social sharing
- Twitter Card meta tags
- JSON-LD structured data for search engines
- Custom title and description props passed from pages

### Content Source
Marketing content lives in `/texts` as Markdown files:
- Case studies (e.g., Carvago success story)
- Key metrics (30+ min saved/day, $12,500/month)
- Company logos and social proof
- This content is manually integrated into `index.astro` - it's not dynamically loaded

## Deployment Workflow

1. Make changes in `/website/src`
2. Build: `cd website && npm run build`
3. Update production: `cd .. && rm -rf docs/* && cp -r website/dist/* docs/`
4. Commit both source and production build
5. Push to GitHub - the `/docs` folder is served via GitHub Pages

The `update-site.sh` script automates steps 2-3.

## Design System

### Colors
- Primary: Purple `#7C3AED` (--accent: 124, 58, 237)
- Secondary: Pink gradient `from-purple-600 to-pink-600`
- Neutrals: Gray scale from 50-900

### Typography
- Font: Inter (loaded from Google Fonts)
- Responsive sizing: text-5xl to text-7xl for headings
- Uses Tailwind's default responsive breakpoints

### Page Sections (in order)
1. Fixed navigation with CTA
2. Hero with gradient headline + 3 stat cards
3. Features grid (6 cards)
4. How it works (4-step process)
5. Case study (before/after comparison)
6. Social proof (company logos)
7. Final CTA (gradient background)
8. Footer (4-column layout)

## Common Modifications

### Updating Metrics
Edit values in `src/pages/index.astro`:
- Hero stats cards (lines ~76-89)
- Case study ROI calculation (lines ~345-364)

### Changing Colors
Modify Tailwind classes in `index.astro`:
- Replace `purple-600` with desired color
- Update gradient: `from-purple-600 to-pink-600`

### Adding Analytics
Add tracking code to `src/layouts/Layout.astro` in the `<head>` section (after line 50)

### Modifying SEO
Edit props passed to Layout component in `index.astro` (lines 5-8) or modify defaults in `Layout.astro`

## Important Notes

- **Never** add runtime JavaScript - the site is fully static
- **Always** rebuild and update `/docs` after source changes
- The `/docs` folder should be committed to git (it's the deployment artifact)
- `website/dist/` is gitignored (temporary build output)
- Marketing content in `/texts` is reference material, not dynamically loaded
