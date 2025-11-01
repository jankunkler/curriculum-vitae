# CV Jan Kunkler

## How to use

### Using Makefile (Recommended)
```bash
make render  # Generate CV (automatically updates date)
make view    # Generate and open CV
make clean   # Remove generated files
make all     # Clean, render, and view
```

### Manual Rendering
- Update Jan_Kunkler_CV.yaml file with new information.
- Run:
```bash
rm -r rendercv_output && .venv/bin/python -m rendercv render Jan_Kunkler_CV.yaml
```

Note: If the folder rendercv_output exists, rendercv tends to throw an error. Delete the folder as described above to fix this.

## Notes
- **Website**: The website field is currently commented out in the YAML (line 6). Uncomment and re-enable once https://www.jankunkler.de is serving content again.
- **GitHub**: GitHub link is currently commented out (line 10-11). Most work is on internal repos, so public GitHub isn't representative. Uncomment if needed in the future.
- The "Last updated" date is automatically set to today's date when using `make render`
- Works on both macOS and Windows (previous note about Windows-only was outdated)