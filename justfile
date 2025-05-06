# justfile
set dotenv-load := true

default:
    just build

build:
    cargo build --workspace

release:
    cargo build --all-features --release --workspace

# Run all tests (unit, integration, Mooneye)
test:
    cargo test --workspace --all-features

nextest:
    cargo nextest run --all-features --workspace --no-fail-fast --test-threads=-6

fmt:
    cargo +nightly fmt --all

clippy:
    cargo +nightly clippy --workspace --all-features

clean:
    cargo clean

watch:
    cargo watch -x run

# Run criterion benchmarks with detailed output
bench:
    cargo criterion --workspace --message-format=json
    cargo criterion --workspace --plotting-backend=plotters

# Profile Guided Optimization commands
pgo-clean:
    clean
    rm -rf ./target/pgo-profiles

pgo-build:
    cargo pgo build

pgo-test:
    cargo pgo test

pgo-bench:
    cargo pgo bench

pgo-optimize:
    cargo pgo optimize

# Run full PGO pipeline
pgo: pgo-clean pgo-build pgo-test pgo-bench pgo-optimize
    @echo "PGO optimization complete"

# Run both benchmarks and PGO
perf: bench pgo
    @echo "Performance testing and optimization complete"

lint: fmt clippy

run:
    cargo run -p cli

check:
    cargo check --workspace --all-features

update:
    cargo update && cargo outdated || true

cover:
    cargo tarpaulin --workspace --all-features --out Lcov

# Run GitHub Actions workflows locally using act
act workflow="":
    if [ "${workflow:-}" = "" ]; then \
        act; \
    else \
        act --workflows "${workflow}"; \
    fi