# Contributing

Thank you for your interest in BashLoger.

## How to Contribute

1. Fork the repository.
2. Create a separate branch for your changes.
3. Implement the changes and verify usage scenarios.
4. Update `README.md` and `CHANGELOG.md` if needed.
5. Open a Pull Request with a clear motivation and result description.

## Code Guidelines

- Keep Bash compatibility.
- Use clear names for variables and log messages.
- Avoid breaking backward compatibility unless necessary.
- Use full multi-line syntax for all control-flow constructs (`if`, `for`, `while`, `until`, `case`).
- Do not put commands or control-flow constructs on one line using `;`.
- Do not write one-line forms like `if ...; then`.
- Use `[[ ... ]]` for conditions instead of `[ ... ]` or `test`.
- Exception: one-line form with `;` is allowed only when capturing a command exit code into a variable.
- Any other use of `;` in project code is not allowed.

Example:

```bash
some_command; exit_code=$?
```

## Commit Messages

Recommended style:

- `docs: update usage examples`
- `fix: correct log level behavior`
- `refactor: simplify parameter parsing`
