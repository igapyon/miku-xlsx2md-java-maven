# Runtime Compatibility

This Maven plugin version is aligned with the Java runtime artifact:

```text
jp.igapyon:miku-xlsx2md:1.2.3
```

The runtime jar is both:

- the executable CLI runtime for `java -jar` usage in `miku-xlsx2md-java`
- the library dependency used by this Maven plugin

The plugin should be updated when the runtime API used by these Mojo classes
changes:

- `jp.igapyon.mikuxlsx2md.core.Core`
- `jp.igapyon.mikuxlsx2md.directoryconverter.DirectoryConverter`
- `jp.igapyon.mikuxlsx2md.markdownexport.MarkdownExport`
- `jp.igapyon.mikuxlsx2md.markdownoptions.MarkdownOptions`
- `jp.igapyon.mikuxlsx2md.textencoding.TextEncoding`
- `jp.igapyon.mikuxlsx2md.workbookloader.WorkbookLoader`
