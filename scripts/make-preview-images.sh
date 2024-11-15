#! /bin/bash
##
## Script to generate preview images for social media
##
## Some pages like homepage do not have any image to automatically generate social preview.
## This script takes a screenshot of the web page to use them as preview images.
##

function screenshot() {
    url=$1
    path=$2
    tmppath=/tmp/screenshot.$$.png
    google-chrome --headless --disable-gpu --screenshot=$tmppath --window-size=820,400 $url

    # Google chrome seems to be adding a scrollbar to the screenshot.
    # Cropping the image to get rid of that.
    convert -crop 800x400+0+0 $tmppath $path
    rm -f $tmppath
    echo "generated $path"
}

screenshot https://sambhavam-autism.com/ images/preview.png