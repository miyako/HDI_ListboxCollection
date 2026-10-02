# HDI_ListboxCollection

![4D](https://img.shields.io/badge/4D-21.1%2B-blue) ![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows-lightgrey) ![License](https://img.shields.io/badge/license-MIT-green)

A "How do I" (HDI) example showing how to display a **collection in a listbox** with the collection listbox type of 4D. The original 4D v17 binary example has been converted to a 4D project and modernised with **GitHub Copilot**.

## Origin

Originally a binary `.4DB` example database distributed with 4D v17, converted to the project architecture (`.4DProject`) with the binary-to-project conversion tool of 4D 21.

- **Blog post:** https://blog.4d.com/display-a-collection-in-a-listbox/
- **Original download:** https://download.4d.com/Demos/4D_v17/HDI_ListboxCollection.zip

## Features

The demo is a tabbed form; each tab explains one aspect of the collection listbox, with a live listbox where relevant.

- Collection listbox type bound to a collection of objects (`This.attribute1`, `This.attribute2`)
- Listbox vs. column properties
- Single and multiple row selection, exposed through `currentItemSource`, `currentItemPositionSource` and `selectedItemsSource`
- Row and cell styling with a meta expression (`metaSource`)
- Tab titles and explanatory (styled) text stored in the `[INFO]` table and loaded at runtime

## Points of interest

| Area | Where to look |
|------|---------------|
| Startup splash: `CALL WORKER`, non-blocking `DIALOG(...; *)`, window reuse | `Methods/00_Start`, `Forms/HDI` |
| Meta expression for rows/cells | `Methods/Decorate` (called as `Decorate(This)` from the `List Box2` listbox in `Forms/HDI2`) |
| Theme-aware meta colours: hidden reference rectangles + `OBJECT GET RGB COLORS` | `Forms/HDI2/method.4dm`, `Methods/RGBToHex`, `styleSheets.css` |
| Dark mode: `automatic` / `automaticAlternate` values and `prefers-color-scheme` | `styleSheets.css`, `Forms/*/form.4DForm` |
| macOS Tahoe (Liquid Glass) button height via `form-theme` media queries | `styleSheets_mac.css` |
| Localisation (English, Japanese) with `:xliff:` and `Localized string` | `Resources/en.lproj`, `Resources/ja.lproj` |
| Standard actions in the menu bar instead of wrapper methods | `menus.json` |
| Sample data auto-imported on first launch | `Resources/INFO.4ie`, `Resources/INFO.4si` |

## Requirements

- 4D 21.1 or later (the project `compatibilityVersion` is 21.1)
- The splash form checks the minimum 4D version declared in `00_Start` and returns to design mode when it is not met

## Project layout

```
Project/Sources/
  Methods/         00_Start (entry point), Decorate, RGBToHex, Compiler_*
  Forms/HDI        splash / about form
  Forms/HDI2       main demo form (tabs, listboxes)
  TableForms/1     [INFO] input and output forms
  styleSheets*.css cross-platform, macOS and Windows styles
Resources/
  en.lproj, ja.lproj   XLIFF files (menus, forms, messages)
  INFO.4ie / .4si      sample data for the [INFO] table
```

## Usage

Open `Project/HDI_ListboxCollection.4DProject` with 4D. The splash form opens on startup; click **Demo** to open the example. The same entry point is available from **File > Demo**.

## Modernisation notes

- `var` / `#DECLARE` instead of `C_*` declarations
- XLIFF localisation of menus, forms, help tips and messages
- Standard `quit` menu action instead of a wrapper method
- Subroutines hidden from the Run Method dialog (`invisible`)
- Dark mode and Liquid Glass ready; all listboxes use `truncateMode: none` and `resizingMode: legacy`

## References

- [Collection listbox type](https://developer.4d.com/docs/FormObjects/listbox_overview)
- [Form stylesheets (CSS)](https://developer.4d.com/docs/FormEditor/stylesheets)
- [`OBJECT GET RGB COLORS`](https://developer.4d.com/docs/commands/object-get-rgb-colors)
- [`CALL WORKER`](https://developer.4d.com/docs/commands/call-worker)
- [`Localized string`](https://developer.4d.com/docs/commands/localized-string)
