# Active Context: bat

## Current Work Focus
- Maintaining and improving the core CLI functionality of bat.
- Ensuring compatibility with the latest Rust edition and dependencies.
- Streamlining the development workflow using justfile and modern Rust tooling (e.g., cargo-pgo).
- Keeping documentation, changelog, and tests up to date with all changes.

## Recent Changes
- Refactored and enhanced the justfile for clarity, maintainability, and developer ergonomics.
- Integrated correct PGO workflow using cargo-pgo.
- Created a comprehensive Cursor ruleset for the project.
- Initialised and populated the Memory Bank with project context and documentation.

## Next Steps
- Continue to maintain high test coverage and documentation quality.
- Monitor for dependency updates and apply as needed.
- Add regression tests for all new features and bugfixes.
- Update the changelog and documentation for all user-facing or build/CI changes.
- Review and refine the Memory Bank as the project evolves.

## Active Decisions and Considerations
- All code and documentation must use British English.
- Commit messages must include the 🐹 emoji and be concise.
- Unsafe code is forbidden unless explicitly documented.
- All functional changes require regression tests and changelog entries.
- Use justfile for all common workflows and cargo-pgo for PGO.