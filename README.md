# Bash Raytracer

A raytracer written in Bash (except for floating point calculations, where I use `bc`). It requires a terminal emulator capable of displaying 256 colours.

## Changelog

### 2016/10/25

* Command line options and usage text: simpler setup for size/fullscreen, field of view and colours settings, using `getopts` and this syntax:

        raytracer [-hf8] [-v FOV] [-s FACTOR]

* Default to 24-bit colours and fall back to 8-bit colours when the new `-8` option is used
* Reduce intensity of ambient lighting to 10%

Colours in the shadows are now discernible:

![rendering9](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20161025.png)

### 2016/10/24

* Shadows: every hitpoint checks if there is an object covering the directional light; if there is, the point is shaded with just ambient colour (20% of light intensity). If there is nothing covering the light, diffuse colouring is added. I've also tweaked the light direction a little.
* New resolution: I've switched my system (no more MSYS2 Bash under Windows, proper Ubuntu now!) and have adjusted the default resolution to match the size of the original Whitted picture.

Because there aren't many colours available, the shadows tend to be very dark and "dark yellow" on the checkered floor becomes "pitch black":

![rendering8](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20161024.png)

I plan on switching to true colour soon, which should get rid of this problem.

### 2016/10/03

* Lambertian shading: similar to incident angle shading, but the light source is no longer the camera; the direction of light can be defined freely in space. The light source is distant, i.e., all light rays are parallel.
* No shadows (yet)

Unlit parts of objects are pitch black, which doesn't look super natural:

![rendering7](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20161003.png)

* Add ambient lighting to scene at 20% of intensity of light source; it's a bit much, but the RGB to terminal colour mapping results in all black otherwise (or my mapping is screwed up)

Rendered image:

![rendering8](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20161003a.png)


### 2016/09/16

* Add incident angle shader: treat camera as light source, shade surfaces darker the smaller the incident angle of the camera ray

![rendering6](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160916.png)

### 2016/09/10

* Make `rgbcolours` into a sourceable library of test functions
* Add test function `facing_ratio` to `rgbcolours` to test interpolation between an RGB triple and (0,0,0) for later use with a simple facing ratio shading technique

Testing `facing_ratio` with all the colours of the last rendering, drawing 21 shades each:

![facing_ratio_test](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/facing_ratio_test.png)

### 2016/09/07

* Checkerboard texture for triangles (square size should be slightly reduced, and colours are currently inverted from original)
* Use RGB to terminal colour mapping everywhere
* Slight adjustment to right end of rectangle in scene

Rendered image:

![rendering5](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160907.png)

And overlaid on top of the original scene:

![rendering5whitted](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160907_overlay.png)

### 2016/09/01

* Groundwork for shading: figure out mapping from RGB triplets to terminal colours, mostly following [this Stack Overflow answer](http://stackoverflow.com/questions/27159322/rgb-values-of-the-colors-in-the-ansi-extended-colors-index-17-255)
* Auxiliary script to show and label all terminal colours: `tools/showcolours`
* Auxiliary script to loop over RGB space, convert to terminal colours and display them: `tools/rgbcolours`

Output of these two scripts: `showcolours` (left) and `rgbcolours` (right, slightly resized)

![showcolours](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/showcolours.png)
![rgbtest](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/rgbtest.png)

### 2016/08/30

* Add ray-triangle intersection function (simple "inside-outside" technique)
* Replace infinite plane with two triangles and change a few colours to accommodate yellow/red plane (will be checkered later)
* Clean up `bc` parts after understanding how to pass arrays to functions by reference (which is mentioned in the [manual](https://www.gnu.org/software/bc/manual/html_mono/bc.html#SEC17), but not shown)

Rendered image:

![rendering4](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160830.png)

And overlaid on top of the original scene:

![rendering4whitted](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160830_overlay.png)

### 2016/07/11

* Add ray-plane intersection function
* Add plane to scene

Rendered image:

![rendering3](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160711.png)

And overlaid on top of the original scene:

![rendering3whitted](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160711_overlay.png)

### 2016/07/02

* Now capable of handling multiple objects
    * Loops over all variables with a name that starts with `obj_`
    * Calculates actual intersection point, tests for closest one
    * Still only spheres, though
* Scene with two spheres
    * "Glass" is currently red
    * New camera-to-world matrix for simpler scene geometry values

The rendered image now looks like this:

![rendering2](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160702.png)

Overlaid on top of the original Whitted scene:

![rendering2whitted](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160702_overlay.png)

### 2016/06/22

* First version capable of generating an image
* Simple raycasting: test for intersection, colouring pixel in sphere colour if ray intersects sphere and background colour if not (no shading)
* Camera ray generation with hardcoded camera position and scene (a single sphere)
* Intersection test is just true/false and doesn't return closest intersection, so clipping doesn't work yet
* Image size is whatever the terminal size is when starting the raytracer
* No reflection, refraction, phong or other illumination models, shadows, shapes other than spheres, depth of field effect, motion blur, bump or environment mapping, subsurface scattering, ... you name it.

The rendered image looks like this:

![rendering1](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/result20160622.png)

If you think you can see an uncanny resemblance to the famous Whitted raytracer scene (minus the second sphere, the plane and all effects), you're completely right. That's what it'll become when it's grown up.

![whitted](https://raw.githubusercontent.com/bewuethr/bash-raytracer/master/images/whitted.jpg)
