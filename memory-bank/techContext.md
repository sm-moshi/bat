# Tech Context: bat

## Technologies Used
- Rust (edition 2021)
- syntect (syntax highlighting)
- git2 (Git integration)
- clap (CLI argument parsing)
- thiserror (custom error types)
- cargo-pgo (profile-guided optimisation)
- tarpaulin (test coverage)
- assert_cmd, expect-test, serial_test, predicates, tempfile (testing)

## Development Setup
- Build system: Cargo
- Formatting: rustfmt (nightly)
- Linting: clippy (nightly)
- CI: GitHub Actions (with local testing via act)
- Justfile for common workflows (build, test, lint, PGO, etc)
- Asset management scripts in build/
- Diagnostics scripts in diagnostics/
- Documentation in README.md and doc/

## Technical Constraints
- No unsafe code unless explicitly documented
- Cross-platform support (Linux, macOS, Windows)
- CLI only (no GUI)
- Minimal public API surface
- High test coverage expected

## Dependencies
- See Cargo.toml for full list
- Key runtime dependencies: syntect, git2, clap, thiserror, console, etc.
- Key dev dependencies: assert_cmd, expect-test, serial_test, predicates, tempfile, nix (unix)
- Build dependencies: anyhow, indexmap, itertools, once_cell, regex, serde, toml, walkdir, etc.