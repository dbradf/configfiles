# CLAUDE Development

## Running tests for typescript files in monologue

- Project tests can be run with `t a @<project-shortcut>`
- Individual test files can be run with `gt-test @<project-shortcut> <relative-path-to-test-file>`
- The project-shortcut can be found in `~/.aliases.toml` and are based on the `package.json` file for a sub-project.

## Code Quality

- Never use `any` types.
- Keep code as simple as possible.

## Unit Testing

- Try to use parameterized tests for unit tests.
  - Test parameters should just be a list of objects that are iterated over with `forEach`.
  - Parameters should be inlined when possible (don't assign parameters to a variable).
- Avoid mocking when possible.
  - Don't use jest for mocks unless working in front-end code.
  - Prefer creating a mock object with `fromPartial`.
  - Use sinon for mocks if needed.
  - Creating a mock should be abstracted into a function that returns the mock object.
- Use "chia" style assertions for typescript/javascript code.
- ALWAYS use "should" when describing a test case.
