# justfile for bat 🐹
#
# Project: bat (A cat(1) clone with wings)
# Maintainer: David Peter <mail@david-peter.de>
#
# This justfile provides common developer workflows for building, testing,
# linting, formatting, benchmarking, and maintaining the project.
#
# All commands are phony by default (no file targets).
#
# Usage: just <recipe> [arguments]

# Load .env files automatically
set dotenv-load := true

# Common cargo flags
CARGO_FLAGS := "--workspace --all-features"

# List all available recipes (default)
default:
    @just --list --list-heading $'bat development recipes:\n'

# Build in debug mode
build:
    cargo build {{CARGO_FLAGS}}

# Build in release mode
release:
    cargo build --release {{CARGO_FLAGS}}

# Run the CLI (pass additional args after --)
run *ARGS:
    cargo run {{CARGO_FLAGS}} --bin bat -- {{ARGS}}

# Test all features
# Use nextest if available for faster test runs
# (install with: cargo install cargo-nextest)
test:
    cargo test {{CARGO_FLAGS}}

nextest:
    cargo nextest run {{CARGO_FLAGS}} --no-fail-fast --test-threads=-6

# Format code using nightly
fmt:
    cargo +nightly fmt --all

# Lint code using clippy (nightly)
clippy:
    cargo +nightly clippy {{CARGO_FLAGS}}

# Lint = format + clippy
lint: fmt clippy

# Clean build artifacts
clean:
    cargo clean

# Watch for changes and run the CLI
watch:
    cargo watch -x run

# Run criterion benchmarks
bench:
    cargo criterion {{CARGO_FLAGS}} --message-format=json
    cargo criterion {{CARGO_FLAGS}} --plotting-backend=plotters

# Profile Guided Optimisation (PGO) using cargo-pgo
# See: https://kobzol.github.io/rust/cargo/2023/07/28/rust-cargo-pgo.html
# and https://github.com/kobzol/cargo-pgo

pgo-install:
    cargo install cargo-pgo

# Build instrumented binary for PGO
pgo-build:
    cargo pgo build

# Run instrumented binary on representative workloads to gather profiles
# (You may also use pgo-test or pgo-bench to gather profiles from tests/benchmarks)
pgo-test:
    cargo pgo test

pgo-bench:
    cargo pgo bench

# Optimise using gathered profiles
pgo-optimize:
    cargo pgo optimize

# Full PGO pipeline: build, test, optimise
pgo: pgo-build pgo-test pgo-optimize
    @echo "PGO optimisation complete"

# BOLT (optional, for further optimisation)
bolt-build:
    cargo pgo bolt build

bolt-optimize:
    cargo pgo bolt optimize

# Run both benchmarks and PGO
perf: bench pgo
    @echo "Performance testing and optimisation complete"

# Check code without building
check:
    cargo check {{CARGO_FLAGS}}

# Update dependencies and show outdated
update:
    cargo update && cargo outdated || true

# Code coverage (requires cargo-tarpaulin)
cover:
    cargo tarpaulin {{CARGO_FLAGS}} --out Lcov

# Generate and open documentation
# (use --no-deps to skip dependencies if desired)
doc:
    cargo doc {{CARGO_FLAGS}} --open

# Install the CLI locally (force overwrite)
install:
    cargo install --path . --locked --force

# Generate shell completions (usage: just completions <shell>)
completions shell="bash":
    bat --completion {{shell}}

# Run GitHub Actions workflows locally using act
act workflow="":
    if [ "${workflow:-}" = "" ]; then \
        act; \
    else \
        act --workflows "${workflow}"; \
    fi

# Check minimum supported Rust version (MSRV)
check-msrv:
    cargo +nightly msrv verify

# List all available recipes (alias)
list:
    just --list --list-heading $'bat development recipes:\n'