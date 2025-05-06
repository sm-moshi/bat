# Product Context: bat

## Why this project exists
The traditional `cat` utility is widely used for viewing file contents, but it lacks modern features such as syntax highlighting, Git integration, and user-friendly output. Developers and users increasingly expect tools that are visually informative, customisable, and integrate well with modern workflows. `bat` was created to address these gaps, providing a modern, feature-rich alternative to `cat`.

## Problems it solves
- Lack of syntax highlighting in standard file viewers.
- No visual indication of Git changes in files.
- Poor readability for code and configuration files.
- Inconsistent or limited cross-platform support in existing tools.
- Limited customisation and extensibility in traditional utilities.

## How it should work
- Users invoke `bat` from the command line, passing one or more files or using standard input.
- Output is syntax-highlighted, with clear visual cues for Git modifications.
- The tool automatically pages output if it exceeds the terminal height, unless configured otherwise.
- Supports custom themes, syntax definitions, and configuration files.
- Behaves as a drop-in replacement for `cat` when used in scripts or pipelines.

## User experience goals
- Fast, responsive, and reliable output for all supported platforms.
- Intuitive command-line interface with helpful documentation and error messages.
- Visually appealing output that enhances code and text readability.
- Seamless integration with existing developer workflows, including Git and shell scripting.
- Easy to customise and extend for advanced users.