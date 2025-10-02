# Peon Landing Page

Beautiful, modern landing page for [Peon](https://peon.dev) - Your Virtual Colleague for Code Automation.

## 🚀 Quick Start

**View the live site:**
```bash
cd docs
python3 -m http.server 8080
# Visit http://localhost:8080
```

**Edit and rebuild:**
```bash
cd website
npm install
npm run dev
# Visit http://localhost:4321
```

## 📁 Project Structure

```
peon.dev/
├── docs/              # Production build (ready to deploy)
├── website/           # Astro source code
│   ├── src/
│   │   ├── pages/index.astro      # Landing page
│   │   ├── layouts/Layout.astro   # SEO & layout
│   │   └── styles/global.css      # Tailwind CSS
│   ├── public/favicon.svg
│   └── README.md
├── texts/             # Marketing content & case studies
├── DEPLOY.md          # Deployment instructions
└── update-site.sh     # Build & update script
```

## 🎨 Features

- **Modern Design** - Purple/pink gradient theme, Inter font
- **SEO Optimized** - Meta tags, Open Graph, structured data
- **Fast Loading** - Static HTML/CSS, no runtime JavaScript
- **Fully Responsive** - Mobile-first design
- **Developer-Focused** - Technical but approachable content

## 🔧 Development

```bash
# Install dependencies
cd website
npm install

# Start dev server (http://localhost:4321)
npm run dev

# Build for production
npm run build
```

## 📦 Updating the Site

Use the provided script:

```bash
./update-site.sh
```

Or manually:

```bash
cd website && npm run build && cd ..
rm -rf docs/* && cp -r website/dist/* docs/
```

## 🚢 Deployment

The `/docs` folder is ready for deployment. See [DEPLOY.md](./DEPLOY.md) for detailed instructions.

**Quick deploy to GitHub Pages:**

1. Commit the production build:
   ```bash
   git add .
   git commit -m "Add Peon landing page"
   git push origin main
   ```

2. Enable GitHub Pages in repository settings:
   - Settings → Pages
   - Source: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/docs**

## 📚 Documentation

- [DEPLOY.md](./DEPLOY.md) - Full deployment guide
- [website/README.md](./website/README.md) - Technical details
- [website/QUICKSTART.md](./website/QUICKSTART.md) - 3-minute setup
- [website/PROJECT-SUMMARY.md](./website/PROJECT-SUMMARY.md) - Complete overview

## 🎯 What's Built

### Landing Page Sections

1. **Hero** - Value proposition with key metrics
2. **Features** - 6 core capabilities
3. **How It Works** - 4-step process
4. **Case Study** - Carvago success story ($12,500/month savings)
5. **Social Proof** - Customer logos
6. **Final CTA** - Strong call-to-action
7. **Footer** - Navigation and links

### Key Metrics Highlighted

- **30+ minutes** saved per developer daily
- **$12,500** monthly savings for companies
- **100%** open source

## 🛠️ Tech Stack

- Astro 5.x - Static site generator
- Tailwind CSS 4.x - Utility-first styling
- TypeScript - Type safety
- Inter Font - Modern typography

## 📝 Content

Based on marketing materials in `/texts`:
- Developer time savings
- Cost benefits for companies
- Real-world case studies (Carvago)
- Open source emphasis

## 🌐 Live Site

Once deployed, the site will be available at:
- **Production**: https://peon.dev
- **App**: https://app.peon.dev
- **GitHub**: https://github.com/peon-dev

## ✅ Production Ready

The site is fully tested and ready for deployment:

- ✅ Production build created
- ✅ Static files optimized
- ✅ SEO configured
- ✅ Mobile responsive
- ✅ All links working
- ✅ Fast loading
- ✅ Git-ready

## 📞 Support

For issues or questions:
- Check [DEPLOY.md](./DEPLOY.md) for deployment help
- Review [website/README.md](./website/README.md) for technical details
- Visit [Peon GitHub](https://github.com/peon-dev)

---

Built with ❤️ by developers, for developers.
