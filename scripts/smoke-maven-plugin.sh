#!/bin/sh
set -eu

VERSION="${1:-1.2.3}"
ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
WORK_DIR="$ROOT_DIR/workplace/smoke-maven-plugin-$$"

create_workbook() {
  OUT_FILE="$1"
  TEXT="$2"
  BUILD_DIR="$WORK_DIR/build-$(basename "$OUT_FILE" .xlsx)"

  mkdir -p "$BUILD_DIR/xl/_rels" "$BUILD_DIR/xl/worksheets"
  printf '%s' '<?xml version="1.0" encoding="UTF-8"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Sheet1" r:id="rId1"/></sheets></workbook>' > "$BUILD_DIR/xl/workbook.xml"
  printf '%s' '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Target="worksheets/sheet1.xml"/></Relationships>' > "$BUILD_DIR/xl/_rels/workbook.xml.rels"
  printf '%s' "<?xml version=\"1.0\" encoding=\"UTF-8\"?><sst xmlns=\"http://schemas.openxmlformats.org/spreadsheetml/2006/main\"><si><t>$TEXT</t></si></sst>" > "$BUILD_DIR/xl/sharedStrings.xml"
  printf '%s' '<?xml version="1.0" encoding="UTF-8"?><styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><borders count="1"><border><left/><right/><top/><bottom/></border></borders><cellXfs count="1"><xf numFmtId="0" borderId="0" fontId="0"/></cellXfs></styleSheet>' > "$BUILD_DIR/xl/styles.xml"
  printf '%s' '<?xml version="1.0" encoding="UTF-8"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><sheetData><row r="1"><c r="A1" t="s"><v>0</v></c></row></sheetData></worksheet>' > "$BUILD_DIR/xl/worksheets/sheet1.xml"

  (cd "$BUILD_DIR" && jar cf "$OUT_FILE" xl)
}

mvn -q -f "$ROOT_DIR/pom.xml" install

mkdir -p "$WORK_DIR/input" "$WORK_DIR/output"
cp "$ROOT_DIR/examples/smoke-project/pom.xml" "$WORK_DIR/pom.xml"
create_workbook "$WORK_DIR/input/single.xlsx" "Single"
create_workbook "$WORK_DIR/input/display-format-sample01.xlsx" "Directory"

cd "$WORK_DIR"

mvn -q -N "jp.igapyon:miku-xlsx2md-maven-plugin:$VERSION:convert" \
  -Dmiku-xlsx2md.inputFile=input/single.xlsx \
  -Dmiku-xlsx2md.outputFile=output/single.md

test -f output/single.md

mvn -q -N "jp.igapyon:miku-xlsx2md-maven-plugin:$VERSION:convert-directory" \
  -Dmiku-xlsx2md.inputDirectory=input \
  -Dmiku-xlsx2md.outputDirectory=output/directory \
  -Dmiku-xlsx2md.recursive=false

test -f output/directory/single.md
test -f output/directory/display-format-sample01.md

echo "miku-xlsx2md Maven plugin smoke test passed."
