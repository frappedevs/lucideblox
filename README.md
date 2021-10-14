# Lucide Icons

Open source, community port of Lucide Icons for Roblox.

## Contributing

When there's a new icon from Lucide, you may add it into this repository by submitting a PR (pull request), do the following steps when you are putting in the icons:

First, you have to convert & scale the original SVG to a PNG file, scaled to `1024x1024` (HiDPI purpose), this can be done with an UNIX tool called `rsvg-convert`. Afterward, invert the icon from black to white with `imagemagick`, finally put it into the icons directory inside this repository and submit a PR. The uploading is done by us with `tarmac`.

```bash
rsvg-convert -h 1024 svgFile > name.png
convert -channel RGB -negate pngFile
```

Note, the convert command is not suitable when the symbol is not BW.