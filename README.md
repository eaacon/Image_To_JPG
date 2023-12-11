# Image_To_JPG
Converts images to jpg format with a simple drag.

Works with formats supported by the Godot engine:

BMP (.bmp) - No support for 16-bit per pixel images. Only 1-bit, 4-bit, 8-bit, 24-bit, and 32-bit per pixel images are supported.

DirectDraw Surface (.dds) - If mipmaps are present in the texture, they will be loaded directly. This can be used to achieve effects using custom mipmaps.

Khronos Texture (.ktx) - Decoding is done using libktx. Only supports 2D images. Cubemaps, texture arrays and de-padding are not supported.

OpenEXR (.exr) - Supports HDR (highly recommended for panorama skies).

Radiance HDR (.hdr) - Supports HDR (highly recommended for panorama skies).

JPEG (.jpg, .jpeg) - Doesn't support transparency per the format's limitations.

PNG (.png) - Precision is limited to 8 bits per channel upon importing (no HDR images).

Truevision Targa (.tga)

SVG (.svg) - SVGs are rasterized using ThorVG when importing them. Support is limited; complex vectors may not render correctly. You can check whether ThorVG can render a certain vector correctly using its web-based viewer. For complex vectors, rendering them to PNGs using Inkscape is often a better solution. This can be automated thanks to its command-line interface.

WebP (.webp) - WebP files support transparency and can be compressed lossily or losslessly. The precision is limited to 8 bits per channel.
