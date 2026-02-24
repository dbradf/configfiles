---
name: migrate-ts-best-practices
description: Migrate TypeScript files to follow best practices: named functions, minimal exports, exported functions at top, and test-only export aliases. Use when the user asks to migrate, refactor, or apply best practices to a TypeScript file.
---

# Migrate TS Best Practices

## When to use

Use this skill when the user asks to:

- migrate a TypeScript file to follow best practices
- refactor a TS file for consistency
- apply best practices to a TypeScript module

## Best practices (apply in order)

### 1. Named functions

Convert arrow functions and anonymous function expressions assigned to variables into named function declarations.

**Before:**
```typescript
const parseInput = (s: string) => s.trim();
const fetchData = async () => { ... };
const handler = function (e: Event) { ... };
```

**After:**
```typescript
function parseInput(s: string) { return s.trim(); }
async function fetchData() { ... }
function handler(e: Event) { ... }
```

- Preserve `async` when present.
- Do not change inline callbacks (e.g. `arr.map(x => x + 1)`) that are not assigned to variables.
- Do not change functions passed directly as arguments unless they are assigned to a variable first.

### 2. Minimal exports

Search the codebase for imports from this file. Remove `export` from symbols that are never imported elsewhere.

- Keep types and interfaces that are used for type-only imports.
- If unsure whether a symbol is used, search for imports before removing.

### 3. Test-only exports (functions only)

For **functions** imported only by test files (e.g. `*.test.ts`, `*.spec.ts`), remove the inline `export` and place `export { foo as fooForTests };` just before the function definition. This rule does not apply to types, interfaces, or other non-function exports — leave those as normal exports if used by tests.

**Before:**
```typescript
export function validateInput(s: string) { ... }
```

**After:**
```typescript
export { validateInput as validateInputForTests };
function validateInput(s: string) { ... }
```

- Use the `ForTests` suffix on the alias so intent is explicit.
- Place the export immediately above the function definition.

### 4. Exported functions at top

Reorder so exported functions appear before non-exported helpers. Respect dependency order: if `bar` calls `helper`, define `helper` before `bar`.

**Target structure:**
```typescript
// Types, interfaces, constants at top
export type Result = { ... };

// Exported functions (respecting call order)
export function publicApi() { return helper(); }

// Non-exported helpers
function helper() { ... }
```

- Types, interfaces, and constants can stay at top.
- Focus on function ordering: exported first, then private helpers.
- Do not break valid dependency order.

## Workflow

1. Apply named functions (step 1).
2. Search the codebase for imports from this file.
3. Identify which exports are used by production code vs. test-only.
4. For test-only functions: apply step 3 (export alias just before definition). Types used only by tests stay as normal exports.
5. For unused: remove export entirely (step 2).
6. Reorder functions so exported ones are at top (step 4).
7. Run lint/tests when available.

## Edge cases

- **Inline arrow callbacks** (e.g. `.map(x => x)`) — leave as-is.
- **Default exports** — leave unless the user specifies otherwise.
- **Classes** — `export class` follows the same "at top" principle; place exported classes before private helpers.
- **Circular dependencies** — reordering must preserve valid dependency order; do not introduce forward-reference errors.

## Quality checklist

Before finalizing:

- all arrow/anon functions assigned to variables are now named function declarations
- only symbols used outside the file are exported
- test-only function exports use `export { foo as fooForTests };` placed just before the function (types excluded)
- exported functions appear before non-exported helpers
- dependency order is preserved (no forward-reference errors)
- lint and tests pass

## Suggested output format

```markdown
Migrated <filename> to TS best practices

Changes applied:
- Named functions: <count> conversions
- Exports: removed <count> unused; <count> converted to ForTests
- Reordered: exported functions at top

Verification:
- Ran: <command or "not run">
- Result: <pass/fail/not run>
```
