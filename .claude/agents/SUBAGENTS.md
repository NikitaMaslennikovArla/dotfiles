# Claude Code Subagents

A reference for all configured subagents — what they do and when to use them.

---

## code-reviewer
**Scope:** All projects (user-level)
**Invocation:** Automatic — triggered after every code change

Reviews code for quality, security, and maintainability immediately after writing or modifying code. Runs `git diff` to identify recent changes, then checks for readability, naming, duplication, error handling, exposed secrets, input validation, and performance. Delivers findings grouped by priority: critical issues, warnings, and suggestions — each with a concrete fix example.

**Example:** `"use the code-reviewer on the changes I just made"`

---

## debugger
**Scope:** All projects (user-level)
**Invocation:** Automatic — triggered when an error, failure, or unexpected behaviour is encountered

Specialises in root cause analysis when something breaks. Captures the error and stack trace, isolates the failure location, forms and tests hypotheses, and implements a minimal fix. Provides a root cause explanation with supporting evidence, the specific code fix, a testing approach, and prevention recommendations.

**Example:** `"use the debugger — I'm getting a TypeError on line 42"`

---

## code-simplifier
**Scope:** All projects (user-level)
**Invocation:** Automatic — triggered at the end of a long coding session

Cleans up code that has accumulated complexity during a session. Removes duplication, reduces complexity (breaks down large functions, flattens nesting), improves naming, and eliminates dead code — then applies all fixes directly. Summarises files changed and key improvements made.

**Example:** `"use the code-simplifier on today's changes"`

---

## test-writer
**Scope:** All projects (user-level) · Stack: Vitest + React Testing Library
**Invocation:** Manual only

Writes unit tests for functions and component tests for React components. Reads the source file first, then creates or extends the corresponding `.test.tsx` / `.test.ts` file. Follows best practices: queries by role/text/label, mocks only external dependencies, one behaviour per test. Does not modify source code — only test files.

**Example:** `"use the test-writer on QuickCaptureScreen"`

---

## performance-auditor
**Scope:** All projects (user-level)
**Invocation:** Manual only

Audits React/TypeScript apps for performance issues and applies fixes directly. Covers bundle size (large dependencies, missing code splitting, tree-shaking issues), render performance (unnecessary re-renders, missing memoisation, unstable keys), asset optimisation (images, fonts), and Core Web Vitals (LCP, CLS, INP). Estimates impact per fix.

**Example:** `"use the performance-auditor on the current project"`

---

## git-commit-writer
**Scope:** All projects (user-level)
**Invocation:** Manual only

Reads `git diff --staged` (or recent changes if nothing is staged) and writes a precise Conventional Commits message (`feat:`, `fix:`, `refactor:`, etc.). Outputs the message ready to copy-paste. Does not run `git commit` unless explicitly asked. Flags if changes should be split into multiple commits.

**Example:** `"use the git-commit-writer"`

---

## seo-agent
**Scope:** All projects (user-level) · Relevant for public-facing websites
**Invocation:** Manual only

Audits and fixes SEO issues across three areas: technical SEO (meta tags, Open Graph, structured data, canonical URLs), content SEO (heading hierarchy, alt text, link text), and performance SEO (Core Web Vitals impact — LCP, CLS, INP). Applies fixes directly and flags anything requiring content or design decisions.

**Example:** `"use the seo-agent on the homepage"`

---

## ux-reviewer
**Scope:** Non-Arla projects (user-level)
**Invocation:** Manual only

Reviews interfaces against universal UX best practices and applies fixes directly. Covers layout and spacing, copy and labels, navigation flow, and accessibility (WCAG AA contrast, focus states, touch targets, font sizes). Outputs a list of fixes applied and anything flagged for design decisions.

**Example:** `"use the ux-reviewer on the settings page"`

---

## arla-ux-subagent
**Scope:** Arla projects only (project-level at `/workspaces/Arla_Projects/`)
**Invocation:** Manual only

Same as ux-reviewer but with full Arla Foods CVI awareness: official color palette, Segoe UI typography, and Arla's clean/functional visual tone. Applies fixes directly and includes an Arla CVI notes section in its output.

**Example:** `"use the arla-ux-subagent on RedesignScreen"`
