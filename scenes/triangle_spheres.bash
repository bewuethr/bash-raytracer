# shellcheck disable=SC2034
# Plane with triangle, three spheres and two rather dim point light sources
# Background colour
bg_col="55 163 212"

# Lights
declare -Ag lt_light0=(
    [col]="50 50 50"
    [location]="1 2 0.1"
    [type]="point"
)
declare -Ag lt_light1=(
    [col]="50 50 50"
    [location]="0 2.5 2.5"
    [type]="point"
)
declare -Ag lt_light2=(
    [col]="50 50 50"
    [location]="-1 3 0.1"
    [type]="point"
)

# Objects
declare -Ag obj_plane0=(
    [p0]="0 0 0"
    [n]="0 0 1"
    [col]="92 23 124"
    [intersect]=intersect_plane
)
declare -Ag obj_sphere0=(
    [origin]="1 2.5 0"
    [radius]=0.4
    [col]="178 80 45"
    [intersect]=intersect_sphere
)
declare -Ag obj_sphere1=(
    [origin]="0 3 2.5"
    [radius]=0.4
    [col]="42 147 69"
    [intersect]=intersect_sphere
)
declare -Ag obj_sphere2=(
    [origin]="-1 3.5 0"
    [radius]=0.4
    [col]="42 48 147"
    [intersect]=intersect_sphere
)
declare -Ag obj_triangle0=(
    [p0]="1 2.5 0"
    [p1]="0 3 2.5"
    [p2]="-1 3.5 0"
    [col]="193 193 25"
    [intersect]=intersect_triangle
)

# Camera-to-world matrix
declare -Ag cam_to_world=(
    [0,0]=1 [0,1]=0  [0,2]=0 [0,3]=0
    [1,0]=0 [1,1]=0  [1,2]=1 [1,3]=0
    [2,0]=0 [2,1]=-1 [2,2]=0 [2,3]=0
    [3,0]=0 [3,1]=1  [3,2]=1 [3,3]=1
)
