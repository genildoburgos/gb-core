# Branching Guidelines — Monorepo (Concise)

This document contains the essential rules for branches, commits, pull requests, CI/CD and deploys in this Monorepo. Use it as the quick-reference policy for day-to-day development.

## 1. Core Principle

- Branches represent intentions to change, not services.
- Create branches by work item (feature, fix, hotfix), not by application.
- A single branch may modify multiple apps (API, front, infra) if the changes belong to the same work item.

## 2. Main Branches

- `main` — Production. Always stable. Only release-ready code is merged here.
- `develop` — Integration branch. All completed work targets `develop` before release.

Workflow:
- Day-to-day work branches are created off `develop`.
- Hotfixes may be merged directly into `main`; afterward merge `main` back into `develop`.

## 3. Work Branches (Naming)

Use structured names: `<type>/<scope>-<short-description>`

Types:
- `feature` — new functionality or planned change
- `fix` — bug fix (non-urgent)
- `hotfix` — emergency fix to production

Scopes (identifier only): `api`, `front`, `infra`, `shared`.

Examples:
- `feature/user-registration-flow`
- `feature/infra-s3-public-assets`
- `fix/api-auth-nullpointer`
- `hotfix/api-login-broken`

Guidelines:
- Keep branch scope focused to a single purpose.
- Merge frequently to avoid long-running divergent branches.

## 4. Commits (Required Standard)

Follow Conventional Commits: `<type>(scope): short description`

Common types:
- `feat` — new feature
- `fix` — bug fix
- `chore` — maintenance / infra / config
- `refactor` — code restructure without behavior change
- `test` — tests

Examples:
- `feat(api): add POST /users endpoint`
- `fix(front): validate registration form`
- `chore(infra): update docker-compose` 

Benefits:
- Clean, machine-readable history
- Automated changelogs and selective CI logic

## 5. Pull Requests (PR)

Best practices:
- One PR per work item (feature or fix).
- Keep PRs small and focused.
- A PR may touch multiple apps if they're part of the same scope.
- Describe clearly: what changed, why, and the impact (affected apps).

What to avoid:
- Large, unfocused PRs
- Mixing unrelated features or refactor + feature in the same PR

PR template (minimal):
- Title: `<type>(scope): short summary`
- Description: what was done, why, and impact (list affected apps)
- Checklist: tests, lint, migration notes (if any)

## 6. CI/CD (Recommended Strategy)

Use a single pipeline with selective execution based on changed paths.

Path-based triggers (examples):
- Changes under `apps/api/**` → run API build & tests
- Changes under `apps/front/**` → run Frontend build & tests
- Changes under `infra/**` → run infra/ops pipeline

Benefits:
- Reduced compute/time cost
- Faster feedback for developers
- Scalable for large repositories

Implementation notes:
- Use path filters or conditional steps in your CI provider (GitHub Actions, GitLab CI, etc.).
- Cache artifacts per-app to speed up repeated builds.

## 7. Versioning & Deploy

- Each application is versioned independently (even within the Monorepo).
- Tag format: `<app>@<semver>` (e.g. `api@1.4.2`, `front@2.1.0`).
- Deploys are per-application, triggered by tag or release on that app's pipeline.

Tagging & release flow (recommended):
- Finalize release branch into `main`.
- Tag `main` with the app-specific version(s).
- Trigger deploy pipeline for the specific app(s).

## 8. Quick Checklist

- Create branch from `develop`.
- Commit with Conventional Commits.
- Open small PR to `develop` with clear description and impact.
- CI runs the selective pipelines for modified apps.
- Merge to `develop`, then release to `main` when ready.

---

If you want, I can replace or link this summary in the repository `README.md` or `CONTRIBUTING.md` for immediate visibility. Which file should I update?
