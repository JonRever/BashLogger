# BashLoger

Simple Bash logger for scripts with log levels (`DEBUG`, `INFO`, `WARNING`, `ERROR`) and file output.

Russian version: see `README.ru.md`.

## Features

- Single `Log()` function for all severity levels.
- Minimum log level filtering via `LogLevel`.
- Timestamped messages with a service mark prefix.
- Optional console output with `--print`.

## Requirements

- Bash 4+
- Linux/macOS (or any Bash-compatible environment)

## Quick Start

Source the script in your project:

```bash
source "./BashLoger.sh" "/var/log/myapp/app.log" "[MY_APP]" "INFO"
```

Then use:

```bash
Log -i --print "Application started"
Log -w "Low disk space"
Log -e --print "Cannot connect to database"
Log -d "Detailed debug message"
```

## Source Parameters

The script expects three arguments:

1. `logpath` - path to the log file.
2. `mark` - message prefix (service mark).
3. `LogLevel` - minimum log level (`DEBUG`, `INFO`, `WARNING`, `ERROR`).

Example:

```bash
source "./BashLoger.sh" "/tmp/example.log" "[EXAMPLE]" "DEBUG"
```

## Log Format

Example output:

```text
23.02.2026 14:30 [MY_APP] INFO: Application started
```

## Log Levels

- `DEBUG` - logs everything (`DEBUG`, `INFO`, `WARNING`, `ERROR`)
- `INFO` - logs `INFO`, `WARNING`, `ERROR`
- `WARNING` - logs `WARNING`, `ERROR`
- `ERROR` - logs only `ERROR`

## Repository Structure

- `BashLoger.sh` - main logger script
- `VERSION` - current project version
- `CHANGELOG.md` - change history
- `CONTRIBUTING.md` - contribution guidelines
- `LICENSE` - project license

## Code Style

- Keep compatibility with Bash.
- Use clear and consistent variable names.
- Write concise and readable log messages.
- Prefer simple, explicit logic over complex one-liners.

## Contributing

- Fork the repository and create a dedicated branch.
- Make focused changes and verify usage scenarios.
- Update documentation when behavior changes.
- Open a Pull Request with a clear explanation of why the change is needed.

For full contribution guidelines, see `CONTRIBUTING.md`.

## License

This project is licensed under the MIT License. See `LICENSE`.
