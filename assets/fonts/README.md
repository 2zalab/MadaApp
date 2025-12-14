# Fonts Directory

This directory contains custom font files for the MadaApp.

## Currently Used

The app uses Google Fonts (Poppins) loaded dynamically via the `google_fonts` package.

## Custom Fonts (if needed)

If you want to add custom fonts:

1. Place `.ttf` or `.otf` font files here
2. Update `pubspec.yaml` to register the fonts:
   ```yaml
   fonts:
     - family: CustomFont
       fonts:
         - asset: assets/fonts/CustomFont-Regular.ttf
         - asset: assets/fonts/CustomFont-Bold.ttf
           weight: 700
   ```

## Font Guidelines

- Use web-safe or licensed fonts only
- Include regular, bold, and italic variants
- Keep font files optimized (subset if possible)
