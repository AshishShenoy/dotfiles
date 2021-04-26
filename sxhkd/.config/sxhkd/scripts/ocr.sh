#!/bin/bash
# Performs OCR on an image present in the clipboard.
# Saves the recognised text back to the clipboard.
# Dependencies:
#   tesseract (for OCR)
#   copyq (only way that I could get an image from the clipboard)
set -e

copyq read image/png 0 > /tmp/image.png

tesseract /tmp/image.png /tmp/output

copyq copy "$(cat /tmp/output.txt)" && notify-send "OCR Complete"
