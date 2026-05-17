# Maven Plugin Separation Worklog

This document records the local separation work for `miku-xlsx2md-java-maven`.

## Scope

- Target repository changed in this work: `miku-xlsx2md-java-maven`
- Reference repository: <https://github.com/igapyon/miku-xlsx2md-java>
- Local reference checkout used during this work: `../miku-xlsx2md-java`
- Runtime repository policy: do not edit `miku-xlsx2md-java` in this work

## Intended Separation

- Keep XLSX parsing, Markdown generation, asset semantics, CLI behavior,
  diagnostics, directory conversion behavior, and runtime tests in
  `miku-xlsx2md-java`.
- Keep this repository focused on the Maven plugin adapter:
  - Maven plugin coordinates
  - Mojo classes
  - goal names
  - Maven parameters
  - plugin descriptor generation
  - plugin tests
  - plugin smoke commands and documentation
- Depend on the runtime artifact `jp.igapyon:miku-xlsx2md`, instead of keeping
  a parent reactor relationship with `miku-xlsx2md-java`.

## Steps Performed

1. Confirmed that this repository initially contained only `LICENSE`.
2. Inspected the existing `miku-xlsx2md-maven-plugin` module in the adjacent
   runtime repository.
3. Inspected same-layer sister repositories:
   - `../miku-docx2md-java-maven`
   - `../miku-indexgen-java-maven`
4. Copied only the existing Maven adapter source and plugin tests from the old
   module into this repository.
5. Replaced the copied module POM with a standalone Maven plugin POM.
6. Added repository documentation, compatibility notes, development notes, an
   example Maven project, a smoke script, and repository convention files.

## Boundary Notes

- This repository uses `jp.igapyon:miku-xlsx2md:1.0.0` as a normal Maven
  dependency.
- This repository does not use `../miku-xlsx2md-java` as a reactor module,
  submodule, subtree, or build input.
- The old runtime repository module has been removed from `miku-xlsx2md-java`.
  This repository owns Maven plugin adapter behavior.

## Verification Performed

- `mvn test`
  - Purpose: verify this repository builds and tests without the old reactor
    layout.
  - Result: passed with 32 tests, 0 failures, 0 skipped.
- `mvn package`
  - Purpose: verify plugin descriptor generation, tests, and jar packaging.
  - Result: passed.
- `sh scripts/smoke-maven-plugin.sh`
  - Purpose: verify full-coordinate `convert` and `convert-directory`
    execution from a minimal Maven project.
  - Result: passed.
