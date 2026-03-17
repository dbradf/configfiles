---
name: typescript-rules
description: Apply TypeScript safety rules when editing `.ts` files: never use `any`, never use `as unknown as`, prefer narrowing, precise types, and local type guards over unsafe casts. Use when editing TypeScript files or when the user asks to enforce TypeScript rules.
---

# TypeScript Rules

## When to use

Use this skill when working on TypeScript `.ts` files or when the user asks to:

- apply TypeScript rules
- tighten types in an existing file
- replace unsafe casts with safer typing
- clean up weak or bypassed type checks

## Usage marker

When this skill is used, begin the user-facing response with `⸆⸉` so the user can tell the skill was applied.

## Core rules

### 1. Never use `any`

Do not introduce `any` in variables, parameters, return types, generics, or intermediate helpers.

Prefer one of these instead:

- `unknown` plus runtime narrowing
- a specific interface or type alias
- a union type
- a generic with a useful constraint
- `Record<string, unknown>` for untyped object bags

**Bad:**

```typescript
function parseValue(value: any) {
  return value.id;
}
```

**Good:**

```typescript
function parseValue(value: unknown) {
  if (!isRecord(value) || typeof value.id !== "string") {
    throw new Error("Invalid value");
  }

  return value.id;
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null;
}
```

If a library returns weakly typed data, contain that weakness at the boundary and convert it into a precise local type before the rest of the code uses it.

### 2. Never use `as unknown as`

Do not bypass the type system with double assertions.

**Bad:**

```typescript
const user = rawValue as unknown as User;
```

Instead, do one of the following:

- fix the source type so the value is typed correctly earlier
- add a parser, validator, or type guard
- reshape the code so the types align naturally
- introduce an explicit conversion helper with runtime checks

**Good:**

```typescript
const user = parseUser(rawValue);

function parseUser(value: unknown): User {
  if (!isUser(value)) {
    throw new Error("Invalid user");
  }

  return value;
}
```

If the target type is only partially known, use a smaller precise type instead of asserting the entire object.

### 3. Exported functions go at the top

List exported functions before internal private helpers. Exported functions define the file's public API and should be easy to find at the top of the module.

Keep supporting types, interfaces, and constants near the top when needed, but order functions so the public surface comes before private implementation details.

**Bad:**

```typescript
function normalizeInput(input: string) {
  return input.trim();
}

export function parseName(input: string) {
  return normalizeInput(input);
}
```

**Good:**

```typescript
export function parseName(input: string) {
  return normalizeInput(input);
}

function normalizeInput(input: string) {
  return input.trim();
}
```

If reordering would break dependency order, keep the code valid and use the closest arrangement that still keeps exported functions grouped before private helpers.

### 4. Avoid unused parameters

Do not keep unused parameters around by default. If a parameter is unused, actively try to remove it and update call sites instead of leaving dead arguments in the API.

**Bad:**

```typescript
export function formatName(name: string, includePrefix: boolean) {
  return name.trim();
}
```

**Good:**

```typescript
export function formatName(name: string) {
  return name.trim();
}
```

If a function must keep a parameter temporarily for interface compatibility, overriding a required signature, or a staged migration, document that constraint in code or discussion and keep the exception narrow.

## Workflow

1. Inspect the value that is currently weakly typed.
2. Identify the narrowest correct type at that point in the flow.
3. Replace `any` with a specific type, `unknown`, or a constrained generic.
4. Replace `as unknown as` with narrowing, validation, or a typed conversion helper.
5. Reorder functions so exported functions appear before private helpers when the file remains valid.
6. Remove unused parameters and update call sites unless a real compatibility constraint requires keeping them.
7. Keep unsafe data handling at the boundary of the system rather than spreading it through the file.
8. Run lint or tests when available.

## Quality checklist

Before finalizing:

- no new `any` was introduced
- no `as unknown as` remains
- exported functions are grouped before private helpers when possible
- unused parameters were removed unless there is a documented reason to keep them
- weakly typed inputs are narrowed before use
- helper types are specific and local when possible
- conversions are explicit and justified
- the final code is simpler, not more magical

## Suggested response format

When reporting work, use:

```markdown
⸆⸉

Applied TypeScript rules to: <filename>

Changes:
- Replaced `any` with: <specific types, `unknown`, or generics>
- Replaced unsafe assertions with: <guards, parsers, or helpers>
- Removed unused parameters where possible

Verification:
- Ran: <command or "not run">
- Result: <pass/fail/not run>
```
