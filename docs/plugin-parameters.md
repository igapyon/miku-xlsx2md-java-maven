# Plugin Parameters

## `convert`

Goal:

```text
miku-xlsx2md:convert
```

Parameters:

- `miku-xlsx2md.inputFile`: required XLSX input file
- `miku-xlsx2md.outputFile`: Markdown output file
- `miku-xlsx2md.outputMode`: output value mode; defaults to `display`
- `miku-xlsx2md.formattingMode`: Markdown formatting mode; defaults to
  `plain`
- `miku-xlsx2md.tableDetectionMode`: table detection mode; defaults to
  `balanced`
- `miku-xlsx2md.encoding`: output encoding; defaults to `utf-8`
- `miku-xlsx2md.bom`: BOM mode; defaults to `off`
- `miku-xlsx2md.skip`: skip plugin execution
- `miku-xlsx2md.verbose`: log selected inputs before processing

## `convert-directory`

Goal:

```text
miku-xlsx2md:convert-directory
```

Parameters:

- `miku-xlsx2md.inputDirectory`: required directory scanned for `.xlsx` files
- `miku-xlsx2md.outputDirectory`: Markdown output directory; defaults to
  writing next to each input file
- `miku-xlsx2md.recursive`: scan input directory recursively
- `miku-xlsx2md.outputMode`: output value mode; defaults to `display`
- `miku-xlsx2md.formattingMode`: Markdown formatting mode; defaults to
  `plain`
- `miku-xlsx2md.tableDetectionMode`: table detection mode; defaults to
  `balanced`
- `miku-xlsx2md.encoding`: output encoding; defaults to `utf-8`
- `miku-xlsx2md.bom`: BOM mode; defaults to `off`
- `miku-xlsx2md.skip`: skip plugin execution
- `miku-xlsx2md.verbose`: log selected inputs before processing
