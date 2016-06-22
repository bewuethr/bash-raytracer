# Bash Raytracer

A raytracer written in Bash (except for floating point calculations, where I use `bc`). It requires a terminal emulator capable of displaying 256 colours.

## Changelog

### 2016/06/22

* First version capable of generating an image
* Simple raycasting: test for intersection, colouring pixel in sphere colour if ray intersects sphere and background colour if not (no shading)
* Camera ray generation with hardcoded camera position and scene (a single sphere)
* Intersection test is just true/false and doesn't return closest intersection, so clipping doesn't work yet
* Image size is whatever the terminal size is when starting the raytracer
* No reflection, refraction, phong or other illumination models, shadows, shapes other than spheres, depth of field effect, motion blur, bump or environment mapping, subsurface scattering, ... you name it.

The rendered image looks like this:

![image]()

If you think you can see an uncanny resemblance to the famous Whitted raytracer scene (minus the second sphere, the plane and all effects), you're completely right. That's what it'll become when it's grown up.
