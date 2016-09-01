# Bash Raytracer

A raytracer written in Bash (except for floating point calculations, where I use `bc`). It requires a terminal emulator capable of displaying 256 colours.

## Changelog

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
