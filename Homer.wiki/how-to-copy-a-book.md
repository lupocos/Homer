# How to copy a book #

Place the book in the center of the cardboard box, so that the pages to be scanned are parallel to the camera's lens. Depending on the shape of your box, you may need to put some stuff under one end of the scanner to correct its inclination. 

Pay attention to the position of the light in order to avoid any glare on the glass. If your digital camera supports it, try to adjust the [white balance][15] to attain the best possible colours. Many cameras include a range of presets that cover common lighting conditions. For example, our cheap desk lamp turns out to be "incandescent" (hopefully not!).
 
The normal procedure is to start taking pictures from the pages on the right-hand side, then turn the book and scan the remaining left-hand pages. Thus, if you plan to scan the whole book, you can start from the cover, proceed until the end of the book, and then you rotate the book 180 degrees and scan the rest. Alternatively -- say you want to scan only a section of the book, or the book you want to scan is written in Japanese --, you can choose to start scanning from the left-hand pages. There is an option on the Homer script that lets you choose whether the first half of the pictures must be treated as right-hand or left-hand pages. This is important to know because the two sets of pictures require different actions: right-hand pages must be rotated 90 degrees clockwise, while left-hand pages 90 degrees counterclockwise.

The best way to make sure that the script won't fail in renaming and rotating the photos is to follow these two simple rules, however stupid they might sound at first:

1. **Take a total even number of pages (2n)**, regardless of whether the first half consists in right- or left-hand ones; 
2. **Never take the same page twice, and don't skip any page, not even blank ones** -- you can delete unwanted pages after the renaming step is done.

Thus, for each scanned page there must always be another one following it. They must always go in pairs, be they `right + left` or `left + right`. So, if you scanned the right-hand pages first, you should proceed scanning from the *next* left-hand page *immediately following* the first picture, or viceversa. For example, if the first page you scanned is the front cover, then when you turn the book and take the second set you should begin with the inside of the cover page, i.e., the "front endpaper".

The reason is that, to reorder the set of scanned pages, the script gives each image file a number with an increment of two, so that the first half is given odd incremental numbers (0001, 0003, 0005, 0007, etc.), while the second half receives even numbers (0002, 0004, 0006, 0008, etc.). Therefore, if the total number is not even, the script may end up skipping some photos.

Computers are stupid, but humans too make mistakes, especially when taking hundreds of pictures in a row. It is a good idea to check that there aren't any duplicates or missing pages before feeding the beast. If you realize that there are indeed duplicates or missing pages, you have to delete the former, and rename the latter so that they will be placed in the correct alpha-numeric position. For example, you can append a letter to the interpolated image's filename: DSC2139, DSC2140, DSC2140*a*, DSC2141, etc.

 [15]: http://en.wikipedia.org/wiki/Color_balance "Color Balance (from Wikipedia)"