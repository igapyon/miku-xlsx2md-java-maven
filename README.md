# miku-xlsx2md-java-maven

`miku-xlsx2md-java-maven` is the separated Maven plugin adapter for
[`miku-xlsx2md-java`](https://github.com/igapyon/miku-xlsx2md-java).

The plugin exposes XLSX to Markdown conversion through Maven goals while
keeping product processing behavior in the Java runtime artifact
`jp.igapyon:miku-xlsx2md`.

## Usage

Run the plugin from a Maven project directory. Use full plugin coordinates so
the execution does not depend on local Maven plugin group configuration.

If both artifacts are available from a Maven repository, no project POM change
is required for direct invocation.

Convert one XLSX file:

```bash
mvn jp.igapyon:miku-xlsx2md-maven-plugin:0.9.0:convert \
  -Dmiku-xlsx2md.inputFile=book.xlsx \
  -Dmiku-xlsx2md.outputFile=target/generated-markdown/book.md
```

Convert XLSX files in one directory:

```bash
mvn jp.igapyon:miku-xlsx2md-maven-plugin:0.9.0:convert-directory \
  -Dmiku-xlsx2md.inputDirectory=workbooks \
  -Dmiku-xlsx2md.outputDirectory=target/generated-markdown \
  -Dmiku-xlsx2md.recursive=true
```

Short-form invocation such as `mvn miku-xlsx2md:convert` requires Maven plugin
group configuration for `jp.igapyon`. Use full coordinates for reliable local
verification.

## Local Unreleased Setup

When the runtime or plugin has not been published yet, install both artifacts
into the local Maven repository before using the plugin from another project.

Install the compatible runtime artifact:

```bash
mvn -f ../miku-xlsx2md-java/pom.xml install
```

This installs the CLI/runtime jar as the Maven artifact
`jp.igapyon:miku-xlsx2md:0.9.0` in the local Maven repository. The plugin uses
that jar as a library dependency while the same jar can also be run with
`java -jar` as the CLI runtime.

Install this Maven plugin artifact:

```bash
mvn install
```

Then move to the Maven project that contains the XLSX files and run the full
coordinate commands shown in Usage.

The plugin depends on the runtime artifact by Maven coordinates:

```text
jp.igapyon:miku-xlsx2md:0.9.0
```

It does not use a source-tree dependency on `miku-xlsx2md-java`.

## Parameters

`convert`:

- `miku-xlsx2md.inputFile`: required XLSX input file
- `miku-xlsx2md.outputFile`: Markdown output file; defaults to the generated
  export file name
- `miku-xlsx2md.outputMode`: `display`, `raw`, or `both`; defaults to
  `display`
- `miku-xlsx2md.formattingMode`: `plain` or `github`; defaults to `plain`
- `miku-xlsx2md.tableDetectionMode`: table detection mode; defaults to
  `balanced`
- `miku-xlsx2md.encoding`: output encoding; defaults to `utf-8`
- `miku-xlsx2md.bom`: BOM mode; defaults to `off`
- `miku-xlsx2md.skip`: skip plugin execution
- `miku-xlsx2md.verbose`: emit verbose progress logs through the Maven logger

`convert-directory`:

- `miku-xlsx2md.inputDirectory`: required directory scanned for `.xlsx` files
- `miku-xlsx2md.outputDirectory`: Markdown output directory; defaults to
  writing next to each input file
- `miku-xlsx2md.recursive`: scan input directory recursively
- all Markdown and encoding parameters match `convert`

## Development

For development of this plugin repository, install the compatible runtime
artifact first when it is not already available from a Maven repository:

```bash
mvn -f ../miku-xlsx2md-java/pom.xml install
```

Then build and test this plugin:

```bash
mvn test
mvn package
sh scripts/smoke-maven-plugin.sh
```

## Repository Operation

`workplace/` is a local scratch area for reference checkouts, generated smoke
outputs, and temporary verification artifacts. Only `workplace/.gitkeep` is
tracked.

`.mvn/jvm.config` is tracked for repository-local Maven JVM settings.

## License

Apache License 2.0. See [LICENSE](./LICENSE).
