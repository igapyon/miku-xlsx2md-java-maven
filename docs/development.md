# Development

Install the compatible runtime artifact before building this plugin when it is
not already available from a Maven repository:

```bash
mvn -f ../miku-xlsx2md-java/pom.xml install
```

Then run the plugin repository checks:

```bash
mvn test
mvn package
sh scripts/smoke-maven-plugin.sh
```

The smoke script generates minimal XLSX fixtures at runtime. Generated smoke
artifacts are written under `workplace/` and are intentionally ignored by Git.
