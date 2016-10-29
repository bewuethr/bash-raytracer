# Background colour
bg_col="55 163 212"

# Lights
declare -Ag light0=(
    [col]="255 255 255"
    [dir]="-0.1 0.2 -1"
    [type]='dir'
)

# Objects
declare -Ag obj_sphere0=(
    [origin]="0.2 3 1.1"
    [radius]=1.25
    [col]="147 244 136"
    [intersect]=intersect_sphere
)
declare -Ag obj_sphere1=(
    [origin]="-1.5 4 0.3"
    [radius]=1.2
    [col]="161 214 220"
    [intersect]=intersect_sphere
)
declare -Ag obj_triangle0=(
    [p0]="-10 0 -1.2"
    [p1]="2.75 10 -1.2"
    [p2]="-10 10 -1.2"
    [col1]="195 38 0"
    [col2]="248 231 44"
    [intersect]=intersect_triangle
    [pattern]=checker
)
declare -Ag obj_triangle1=(
    [p0]="-10 0 -1.2"
    [p1]="2.75 0 -1.2"
    [p2]="2.75 10 -1.2"
    [col1]="195 38 0"
    [col2]="248 231 44"
    [intersect]=intersect_triangle
    [pattern]=checker
)

# Camera-to-world matrix
declare -Ag cam_to_world=(
    [0,0]=1 [0,1]=0  [0,2]=0 [0,3]=0
    [1,0]=0 [1,1]=0  [1,2]=1 [1,3]=0
    [2,0]=0 [2,1]=-1 [2,2]=0 [2,3]=0
    [3,0]=0 [3,1]=0  [3,2]=1 [3,3]=1
)
