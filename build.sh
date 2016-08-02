emconfigure ./configure --without-x

emmake make

emcc -O2\
    -o libtiff.js\
    -s ASSERTIONS=1\
    -s EXPORTED_FUNCTIONS="['_TIFFOpen', '_TIFFClose', '_TIFFGetField', '_TIFFReadRGBAImageOriented', '_TIFFSetDirectory', '_TIFFCurrentDirectory', '_TIFFReadDirectory', '__TIFFmalloc', '__TIFFfree', '_get_width', '_get_height']"\
    --pre-js pre.js\
    --post-js post.js\
    --memory-init-file 0\
    libtiff/.libs/libtiff.a helper.c

