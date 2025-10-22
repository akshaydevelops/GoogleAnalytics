#!/bin/bash

# Script to help publish GoogleAnalytics SPM package to GitHub
# Run this script after creating a GitHub repository

echo "🚀 Publishing GoogleAnalytics SPM Package to GitHub"
echo "=================================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository. Please run 'git init' first."
    exit 1
fi

# Check if remote origin is set
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "📝 No remote origin found. Please add your GitHub repository URL:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/GoogleAnalytics.git"
    echo ""
    echo "   Or if you want to set it now, enter your GitHub repository URL:"
    read -p "GitHub repository URL: " repo_url
    if [ ! -z "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ Remote origin added: $repo_url"
    else
        echo "❌ No URL provided. Please add the remote manually."
        exit 1
    fi
fi

# Show current status
echo "📊 Current git status:"
git status --short

echo ""
echo "🔄 Pushing to GitHub..."

# Push to main branch
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully published to GitHub!"
    echo "📦 Your SPM package is now available at:"
    git remote get-url origin
    echo ""
    echo "🔗 To use this package in your projects, add:"
    echo "   .package(url: \"$(git remote get-url origin)\", from: \"3.20.0\")"
else
    echo "❌ Failed to push to GitHub. Please check your credentials and try again."
    exit 1
fi
