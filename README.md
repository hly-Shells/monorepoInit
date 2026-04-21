# monorepo-ci

`monorepo-ci` is a scaffold tool for creating full-stack monorepo projects with optional app modules and CI template.

## Features

- Generate a monorepo layout with `apps`, `packages`, and optional `services/api`
- Choose package manager: `npm`, `pnpm`, `yarn`
- Choose app modules: `admin`, `h5`, `mp`, `mobile`
- Choose mobile stack: `rn`, `flutter`, `native`
- Optional `OpenSpec` folder
- Optional GitHub Actions CI template
- Supports interactive mode and non-interactive CLI mode

## Quick Start (macOS)

Install globally:

```bash
curl -fsSL https://raw.githubusercontent.com/hly-Shells/monorepoInit/main/install.sh | bash
```

Then run:

```bash
monorepo-ci --help
```

## Local Usage (from source)

```bash
chmod +x create-monorepo.sh
./create-monorepo.sh
```

Non-interactive example:

```bash
./create-monorepo.sh \
  --interactive false \
  --project-name my-app \
  --package-manager pnpm \
  --apps admin,h5,mp,mobile \
  --include-api true \
  --mobile-stack rn \
  --include-openspec true \
  --include-github-ci true
```

## CLI Options

- `--project-name NAME` default: `multi-platform-project`
- `--package-manager PM` default: `yarn`, values: `npm|pnpm|yarn`
- `--apps LIST` values: `admin,h5,mp,mobile`
- `--include-api BOOL` values: `true|false`
- `--mobile-stack TYPE` default: `native`, values: `rn|flutter|native`
- `--include-openspec BOOL` values: `true|false`
- `--include-github-ci BOOL` default: `false`, values: `true|false`
- `--interactive BOOL` values: `true|false`
- `-h, --help`

## Suggested GitHub Repo Setup

1. Repository name: `monorepoInit` (current) or rename to `monorepo-ci` (recommended for clearer tool naming)
2. Add tags/topics:
   - `monorepo`
   - `scaffold`
   - `frontend`
   - `fullstack`
   - `github-actions`
3. Add a short description:
   - "CLI scaffold for optional full-stack monorepo projects with CI template."
4. Create first release after your first stable version, for example `v0.1.0`

## Roadmap

- Add template presets (React/Vue/Nest/Next)
- Add real CI jobs for each app template
- Add tests for generated project structure
