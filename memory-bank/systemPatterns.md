# System Patterns: bat

## System Architecture
- Monolithic CLI application written in Rust.
- Modular codebase with a module-per-concern structure (e.g., syntax highlighting, paging, Git integration, configuration, output formatting).
- Main binary target is `bat`.
- Assets (themes, syntaxes) are managed in dedicated folders and loaded at runtime.
- Build scripts in `build/` handle asset compilation and other pre-build steps.
- Diagnostics and utility scripts are separated in the `diagnostics/` folder.

## Key Technical Decisions
- Written in idiomatic Rust for safety, performance, and maintainability.
- No unsafe code unless explicitly documented and justified.
- Uses `syntect` for syntax highlighting.
- Integrates with `git2` for Git status and change detection.
- Supports cross-platform operation (Linux, macOS, Windows).
- Uses `clap` for command-line argument parsing.
- Supports profile-guided optimisation (PGO) via `cargo-pgo`.
- Follows a minimal public API surface, hiding internal modules.

## Design Patterns
- Single Responsibility Principle: Each module handles a distinct concern (e.g., paging, syntax mapping, output formatting).
- Prefer `impl` blocks for method organisation.
- Use of constants in SCREAMING_SNAKE_CASE and types in PascalCase.
- Error handling via `Result` and `thiserror` for custom errors.
- Extensive use of unit and integration tests for regression prevention.

## Component Relationships
- The CLI entrypoint parses arguments and dispatches to core logic modules.
- Syntax highlighting and theming modules interact with the output formatter.
- Git integration is optional and only invoked when relevant.
- Paging and output modules coordinate to provide auto-paging and configurable output.
- Configuration is loaded at startup and influences all relevant modules.
- Build scripts ensure assets are up-to-date before compilation.