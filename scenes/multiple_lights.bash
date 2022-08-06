# shellcheck disable=SC2034
# Sphere, plane and multiple lights
# Background colour
bg_col="55 163 212"

# Lights
declare -Ag lt_light0=(
    [col]="83 83 83"
    [location]="-0.6 0 0"
    [type]="point"
)
declare -Ag lt_light2=(
    [col]="83 83 83"
    [location]="-0.1 0 1.86"
    [type]="point"
)
declare -Ag lt_light3=(
    [col]="83 83 83"
    [location]="-1.1 0 1.86"
    [type]="point"
)

# Objects
declare -Ag obj_plane0=(
    [p0]="0 5 0"
    [n]="0.4 -1 0"
    [col]="195 38 0"
    [intersect]=intersect_plane
)

declare -Ag obj_sphere0=(
    [origin]="-0.25 2 1"
    [radius]=1
    [col]="147 244 136"
    [intersect]=intersect_sphere
)

# Camera-to-world matrix
declare -Ag cam_to_world=(
    [0,0]=1 [0,1]=0  [0,2]=0 [0,3]=0
    [1,0]=0 [1,1]=0  [1,2]=1 [1,3]=0
    [2,0]=0 [2,1]=-1 [2,2]=0 [2,3]=0
    [3,0]=0 [3,1]=0  [3,2]=1 [3,3]=1
)
