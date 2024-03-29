# shellcheck disable=SC2034
# Single point light source on vertical plane
# Background colour
bg_col="55 163 212"

# Lights
declare -Ag lt_light1=(
	[col]="255 255 255"
	[location]="0 0 1"
	[type]="point"
)

# Objects
declare -Ag obj_plane0=(
	[p0]="0 0 0"
	[n]="0 0 1"
	[col1]="195 38 0"
	[col2]="248 231 44"
	[intersect]=intersect_plane
	[pattern]=checker
)

# Camera-to-world matrix
declare -Ag cam_to_world=(
	[0, 0]=1 [0, 1]=0 [0, 2]=0 [0, 3]=0
	[1, 0]=0 [1, 1]=1 [1, 2]=0 [1, 3]=0
	[2, 0]=0 [2, 1]=0 [2, 2]=1 [2, 3]=0
	[3, 0]=0 [3, 1]=0 [3, 2]=3 [3, 3]=1
)
