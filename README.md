# Lucide Icons for Roblox

You are at the `v2` branch, an experimental version that is not functional yet!
This new version gives the plugin a complete redo to make the UI UX more native to Studio and ergonomic to use. As well as other benefits such as optimized icon listing. V2 uses Fusion (elttob), FusionStudioComponents (mvyasu), FusionRouter (frappedevs) to build its frontend.

V2 uses a way different icon datasheet structure that is not compatible with the current version.
## Contributing

When there's a new icon from Lucide, you may add it into this repository by submitting a PR (pull request), do the following steps when you are putting in the icons:

First, you have to convert & scale the original SVG to a PNG file, scaled to `1024x1024` (HiDPI purpose), this can be done with an UNIX tool called `rsvg-convert`. Afterward, invert the icon from black to white with `imagemagick`, finally put it into the icons directory inside this repository and submit a PR. The uploading is done by us with `tarmac`.

```bash
rsvg-convert -h 1024 svgFile > name.png
convert -channel RGB -negate pngFile
```

Note, the convert command is not suitable when the symbol is not BW.