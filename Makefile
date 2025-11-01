.PHONY: render clean view help install

# Default target
help:
	@echo "CV Makefile Commands:"
	@echo "  make render  - Generate the CV PDF from YAML"
	@echo "  make clean   - Remove generated output files"
	@echo "  make view    - Open the generated PDF"
	@echo "  make install - Install/update dependencies"
	@echo "  make all     - Clean, render, and view the CV"

# Render the CV
render:
	@echo "Rendering CV..."
	@rm -rf rendercv_output
	@# Update the date in the YAML file to today
	@sed -i.bak "s/date: \"[0-9-]*\"/date: \"$$(date +%Y-%m-%d)\"/" Jan_Kunkler_CV.yaml && rm Jan_Kunkler_CV.yaml.bak
	@.venv/bin/python -m rendercv render Jan_Kunkler_CV.yaml
	@echo "✓ CV rendered successfully!"

# Clean generated files
clean:
	@echo "Cleaning output files..."
	@rm -rf rendercv_output
	@echo "✓ Output files removed"

# View the generated PDF
view: render
	@echo "Opening CV..."
	@open rendercv_output/Dr._Jan_Kunkler_CV.pdf

# Install/update dependencies
install:
	@echo "Installing dependencies..."
	@python3 -m venv .venv
	@.venv/bin/pip install --upgrade pip
	@.venv/bin/pip install rendercv
	@echo "✓ Dependencies installed"

# All: clean, render, and view
all: clean render view
