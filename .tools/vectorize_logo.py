"""Trace the supplied brand artwork into smooth, two-color vector paths."""
from pathlib import Path
import sys
import re
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).parent / 'logo-vectorizer'))
import numpy as np
from PIL import Image, ImageFilter
import vtracer

root = Path(__file__).resolve().parents[1]
temp = root / 'frontend/build/logo_trace'
temp.mkdir(parents=True, exist_ok=True)
source = Image.open(root / 'frontend/assets/logos/logo.jpg').convert('RGB')
pixels = np.asarray(source).astype(float)
r, g, b = pixels.transpose(2, 0, 1)
foreground = (r + g + b) / 3 > 65
green = foreground & (g - r > -3) & (g - b > 10)
beige = foreground & ~green
ns = '{http://www.w3.org/2000/svg}'
paths = []
for name, mask in [('green', green), ('beige', beige)]:
    bitmap = Image.fromarray(np.where(mask, 0, 255).astype('uint8'))
    bitmap = bitmap.filter(ImageFilter.MedianFilter(3))
    png = temp / f'{name}.png'
    svg = temp / f'{name}.svg'
    bitmap.save(png)
    vtracer.convert_image_to_svg_py(str(png), str(svg), colormode='binary',
        mode='spline', filter_speckle=12, corner_threshold=70,
        length_threshold=4, splice_threshold=45, path_precision=2)
    for element in ET.parse(svg).getroot().iter(f'{ns}path'):
        # Preserve the original outlined lettering; rebuild the large symbol
        # with clean Bezier curves to avoid tracing JPEG texture and shadows.
        coordinates = re.findall(r'-?\d+(?:\.\d+)?', element.get('transform', ''))
        if len(coordinates) < 2 or float(coordinates[1]) < 880:
            continue
        element.set('fill', f'url(#{name})')
        paths.append(ET.tostring(element, encoding='unicode').replace('ns0:', '').replace(':ns0', ''))

paths.extend([
    '<path fill="url(#green)" d="M348 242 C393 245 429 279 429 327 L429 548 C475 514 527 505 569 511 C670 517 714 590 724 665 C735 738 785 796 855 814 C797 832 733 799 698 764 C661 729 651 695 644 661 C628 603 582 578 537 587 C481 587 446 617 429 659 L429 824 H348 Z"/>',
    '<path fill="url(#beige)" d="M548 487 C590 381 717 328 817 370 C909 406 965 501 950 605 C944 658 920 702 894 732 L847 685 C886 637 903 581 883 526 C864 460 811 422 756 421 C695 414 641 450 615 499 C592 490 570 485 548 487 Z"/>',
    '<path fill="url(#beige)" d="M732 678 L789 677 C808 674 819 681 837 699 L960 823 H903 C862 824 840 808 809 777 Z"/>',
    '<path fill="url(#beige)" d="M532 704 L539 711 L518 732 L539 753 L532 761 L505 732 Z"/>',
    '<path fill="url(#beige)" d="M568 704 L595 732 L568 761 L561 753 L582 732 L561 711 Z"/>',
])

output = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="245 215 780 815" role="img" aria-labelledby="title">
<title id="title">Huda Qddo logo</title>
<defs>
  <linearGradient id="green" x1="0" y1="0" x2="0.8" y2="1">
    <stop stop-color="#ADB597"/><stop offset="1" stop-color="#74805B"/>
  </linearGradient>
  <linearGradient id="beige" x1="0" y1="0" x2="0.6" y2="1">
    <stop stop-color="#E8E0D0"/><stop offset="1" stop-color="#C5B69C"/>
  </linearGradient>
</defs>
''' + '\n'.join(paths) + '\n</svg>\n'
(root / 'frontend/assets/logos/logo.svg').write_text(output, encoding='utf-8')
print(f'Created SVG with {len(paths)} vector paths, {len(output)} characters; no embedded bitmap.')
