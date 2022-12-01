#!/bin/bash

# Clone git submodules
git submodule update --init

# Install development dependencies
cargo install sqlx-cli

# Build services

# Build tracker
cd ./tracker && cargo build && cd ..

# Build backend
cd ./index-backend &&
    cargo build &&
    echo "DATABASE_URL=sqlite://data.db?mode=rwc" >.env &&
    sqlx db setup &&
    cd ..

# Build frontend
cd ./index-frontend &&
    npm install &&
    echo "VITE_API_BASE_URL=http://0.0.0.0:3000" >.env &&
    npm run build &&
    cd ..
