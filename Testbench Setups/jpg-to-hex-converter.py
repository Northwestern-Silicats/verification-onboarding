from PIL import Image

# Load the image and convert to RGB
img = Image.open('Mount-Fuji-with-cherry-blossom-at-Lake-kawaguchiko.jpg').convert('RGB') # Make sure to change this!
width, height = img.size

with open('image_pixels.hex', 'w') as f:
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))
            # Combine RGB into a single 24-bit hex value (R_G_B)
            f.write(f"{r:02x}{g:02x}{b:02x}\n")
