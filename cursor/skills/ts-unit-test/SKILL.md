---
name: ts-unit-test
description: Write and update TypeScript unit tests with project-specific conventions. Use when the user asks to add, fix, refactor, or improve TypeScript unit tests, test coverage, or failing TypeScript tests.
---

# TS Unit Test

## Invocation signal

When this skill is invoked, start the first user-facing status/update line with `🧪` so it is obvious the skill is active.

## When to use

Use this skill when working on unit tests for TypeScript code, including:

- adding new tests for a function, class, or module
- fixing broken or flaky TypeScript unit tests
- improving test coverage for TypeScript behavior
- refactoring tests to match project standards

## Workflow

1. Inspect nearby tests first.
   - Match existing test runner, file naming, and assertion style.
   - Reuse local helpers and fixtures before introducing new patterns.
2. Identify behavior to validate.
   - Cover the main behavior first.
   - Add edge cases and failure paths that are likely to regress.
3. Implement tests with low coupling.
   - Structure each test using AAA: arrange, act, assert.
   - Assert outcomes, observable side effects, and contracts.
   - Prefer a single whole-object assertion when practical instead of many field-by-field assertions.
   - Avoid asserting internal implementation details.
   - Do not write tests or assertions that verify logging calls/messages; logs are not valuable behavior to test.
   - Default to parameterized tests when multiple scenarios share the same assertion shape.
4. Use lightweight test data.
   - Keep setup minimal and explicit.
   - If mock data is needed, create a dedicated mock-data factory function instead of defining mock objects inline in each test.
   - Avoid `as` casts in tests, especially for mock data shaping.
   - Treat extensive mocking as a design smell; prefer testing through stable public behavior with real collaborators where practical.
5. Run targeted tests and iterate.
   - Execute the most focused test command available.
   - Fix failures by improving behavior checks, not by weakening assertions.

## Project conventions

Follow these repository-specific rules:

- Test names should include "should" and describe behavior.
- Prefer parameterized tests as the default for multi-case behavior.
- Typically implement parameterization by iterating over an inline array of test-case objects, where each object provides the inputs and expected output for one case (for example via `forEach`).
- Avoid mocking when possible; use real values or simple hand-rolled objects.
- When tests require mock data, create a helper function that returns the mock object (for example `createMockUser(overrides)`), rather than building mock data inline in the test body.
- Avoid `as` type assertions in tests (including `as unknown as` patterns), especially when building mock objects.
- When a typed partial object is needed, prefer `fromPartial` instead of type assertions.
- Do not use mocking tools like `sinon` unless absolutely necessary; needing them often indicates brittle or poorly designed code boundaries.
- If a mock tool is truly required, keep usage minimal and justify why behavior cannot be validated with real/simple collaborators.
- Keep tests simple and specific; avoid broad fixtures that hide intent.
- Follow AAA structure consistently in each test block: arrange setup data, act by invoking behavior, assert expected outcomes.
- Prefer whole-object assertions over field-by-field assertions when possible so failure output shows full object context.
- Do not add tests or assertions for whether logging is triggered (for example `console.log`, logger info/debug/warn/error calls).
- When tests need to cover a non-exported function, add a test-only export alias with a `ForTests` suffix (for example `export { foo as fooForTests };`) so intent is explicit and the original symbol remains conceptually private.

## Quality checklist

Before finalizing tests, verify:

- tests are deterministic (no hidden time/random/network dependencies)
- each assertion is meaningful and tied to expected behavior
- happy path and key edge cases are covered
- failure behavior is tested where relevant
- no unnecessary coupling to private/internal implementation details
- test setup and naming make intent obvious
- mock data creation is centralized in helper factory functions, not duplicated inline
- each test follows clear AAA phases (arrange, act, assert)
- mocking tools are avoided unless absolutely necessary, and any unavoidable usage is minimal and justified
- tests avoid `as` type assertions; `fromPartial` is used when partial typed fixtures are required
- assertions prefer validating full objects in one check when practical, rather than many per-field checks
- tests do not assert logging behavior or logger call counts/messages
- non-exported functions are exposed for tests via explicit `ForTests` alias exports (for example `fooForTests`)

## Suggested output format

When reporting work, use this structure:

```markdown
🧪 Implemented TypeScript unit tests for: <module_or_symbol>

What I covered:
- <core behavior>
- <edge case or failure path>

Test cases added/updated:
- should <behavior 1>
- should <behavior 2>

Verification:
- Ran: <targeted test command>
- Result: <pass/fail + brief note>

Residual risks or gaps:
- <none or brief note>
```
