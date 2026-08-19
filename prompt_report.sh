#!/bin/bash

REPORT="prompt_report.md"

echo "# Prompt-Based Automation Report" > "$REPORT"
echo "" >> "$REPORT"

echo "## Summary" >> "$REPORT"
echo "" >> "$REPORT"

if [ -f output.txt ]; then
    echo "- Automation log file: PRESENT" >> "$REPORT"
    echo "- Recent automation entries:" >> "$REPORT"
    tail -n 5 output.txt >> "$REPORT"
else
    echo "- ERROR: output.txt is missing." >> "$REPORT"
fi

echo "" >> "$REPORT"
echo "## Error Detection" >> "$REPORT"
echo "" >> "$REPORT"

ERROR_COUNT=0

if [ -f output.txt ]; then
    ERROR_COUNT=$(grep -i -E "error|failed|failure|fatal" output.txt | wc -l)
fi

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo "- No errors detected in the automation log." >> "$REPORT"
else
    echo "- $ERROR_COUNT possible error(s) detected." >> "$REPORT"
fi

echo "" >> "$REPORT"
echo "## Actionable Recommendations" >> "$REPORT"
echo "" >> "$REPORT"

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo "1. Continue monitoring scheduled automation." >> "$REPORT"
    echo "2. Verify GitHub Actions workflow results." >> "$REPORT"
    echo "3. Review generated logs periodically." >> "$REPORT"
else
    echo "1. Inspect the detected errors." >> "$REPORT"
    echo "2. Check the GitHub Actions workflow logs." >> "$REPORT"
    echo "3. Correct the failing script and rerun the pipeline." >> "$REPORT"
fi

echo "" >> "$REPORT"
echo "## Generated At" >> "$REPORT"
date >> "$REPORT"

echo "Prompt-based report generated: $REPORT"
