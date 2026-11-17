# Global agent instructions

Applies to every project. Symlinked from dotfiles to `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`.

## Style

- Never use the em dash. Use a plain dash "-" instead.
- English is the default language for code, comments, docs and commit messages.

## Git

- When writing commit messages, NEVER auto-add your agent name as co-author.
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated.

## Verify before claiming "done"

Never report something as working without running it. "Done" means the relevant checks (tests,
linters, typecheck, dry-runs) pass and, for user-facing flows, the flow was exercised end to end.
If a check fails or a step was skipped, say so plainly with the output.

## Orchestrating the gate (builder/driver split)

- **Builders never drive the gate.** A builder agent builds, commits on its branch, and ends its
  task with a `HANDOFF: INTENT` paragraph - a thorough statement of what changed and why, for
  the reviewer. Its large transcript is read once and never resumed for gate-driving.
- **A fresh tiny driver agent per worktree** (cheap model, few-k-token context) runs the gate:
  it starts the review with the handed-off intent, monitors progress, and answers the gate's
  questions.
- **Gate rules for the driver:** apply auto-fixable findings; approve info-only findings; for
  anything that needs a human decision, PARK - quote the finding verbatim and end the task so
  the orchestrator can relay it to me, then resume the driver with my decision. Resume a
  builder only when a finding needs real code fixes.
- Never end a subagent's turn while a gate run is active - its background processes are
  orphaned the moment the turn ends.
- Cross-provider review (a different provider reviews than the one that built) is encouraged.
