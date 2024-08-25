# CV Jan Kunkler

## How to use
- Update Jan_Kunkler_CV.yaml file with new information.
- Open Repository in Dev Container (requires Docker for local use).
- Run 
```code
rm -r rendercv_output && rendercv render Jan_Kunkler_CV.yaml
```

Note: If the folder rendercv_output exists, rendercv tends to throw an error. Delete the folder as described above to fix this.

Important: This code currently only runs on Windows Machines. On MacOS, even with the same Dev Container, it keeps throwing an error.