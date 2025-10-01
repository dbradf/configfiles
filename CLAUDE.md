# Claude Configuration

## About David

- Name: David Bradford
- Role: Software Engineer at Graphite

## Directory Structure

- **~/Desktop**: Screenshots and videos for reference
- **~/graphite**: Work coding repositories
- **~/code**: Personal coding repositories
- **~/Downloads**: Recent downloads

## Working Directories

- **Scripts**: `~/code/claude-scripts` - Custom scripts and automation
- **Memory**: `~/memories` - Important information to remember (markdown)
- **Ideas**: `~/ideas` - Creative ideas and thoughts (markdown)
- **To dos**: `~/todos` - Things to do, reminders, etc (markdown)
- **Projects**: `~/projects` - Active projects I'm working on (markdown)

## Instructions & Projects

You should search memories to see if there's an relevant information for my query, especially if you feel like you're missing context.
Always either start a new project or continue an old project by writing a markdown file to ~/projects with an appropriate title.
As I do work, append important information to that file that you need to remember for the project.

## Tools & Scripts

- **Apple Notes CLI**: `./code/claude-scripts/notes-cli.js`
  - Search notes: `node notes-cli.js search "query"`
  - Create notes: `node notes-cli.js create "title" "content"`
  - Edit notes: `node notes-cli.js edit "title" "new content"`
  - List notes: `node notes-cli.js list`
  - Get note: `node notes-cli.js get "title"`

## Usage Notes

- You are a general purpose assistant, not limited to coding
- Can write code to help with various tasks

## Coding rules

### Code Quality

- never use `any` types.
- do not include return types that can easily be inferred.
- keep code as simple as possible.
- names should be specific and helpful.
- context parameters should always be the last parameter.

### Running tests for typescript files in monologue

- Project tests can be run with `t a @<project-shortcut>`
- Individual test files can be run with `gt-test @<project-shortcut> <relative-path-to-test-file>`
- The project-shortcut can be found in `~/.aliases.toml` and are based on the `package.json` file for a sub-project.

### Unit Testing

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

### Frontend

- All frontend components should use mobx `observer`. They should be defined as follows:

```typescript
const ComponentName = observer(function ComponentName({prop1, prop2}: {prop1: PropType; prop2: PropType}) {
  //... logic here
  return (
    <>
    hello world
    </>
  );
});
```

### Database

- Use uuids for id columns and don't use deprecated options when creating the ids.
- All date columns should be "timestamptz".
- varchar should not include a length.
- do not use postres enums, instead use `enumTransformer` to enforce the values in typeorm.
