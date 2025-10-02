#!/bin/bash

echo "🔨 Building production site..."
cd website
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "📦 Copying to docs folder..."
cd ..
rm -rf docs/*
cp -r website/dist/* docs/

echo "✅ Production build updated in /docs"
echo ""
echo "To deploy, run:"
echo "  git add docs/"
echo "  git commit -m 'Update landing page'"
echo "  git push"
