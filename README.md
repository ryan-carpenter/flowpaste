# flowpaste
Autohotkey script to reflow text when copied from a PDF.

This script removes unwanted line breaks while preserving 'real' paragraphs in text copied from a PDF. Just copy and paste like usual, and that's it. Setting the autohotkey class makes the script execute only when the PDF viewer (or designated application) is the active window. The script also removes extra blank lines. So far, I have done some initial tests in PDF-Xchange. Heading paragraphs were not preserved, but it worked great on body copy. Note that Adobe Acrobat (paid versions) include reflow functionality out-of-the-box. Many other PDF applications (free and paid) do not. Improvements welcome.
