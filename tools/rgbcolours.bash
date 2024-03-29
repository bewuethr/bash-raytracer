# Test mapping from RGB triplets to terminal colour codes

# Map single RGB component (0-255) to terminal colour component (0-5)
get_component() {
	local comp=$1
	echo $((comp > 115 ? (comp - 116) / 40 + 2 : comp > 47 ? 1 : 0))
}

# Draw a colour cube with step size "step"
draw_colourcube() {
	local step=34
	local r g b

	for ((r = 0; r <= 255; r += step)); do
		local rterm
		rterm=$(get_component $r)
		for ((g = 0; g <= 255; g += step)); do
			local gterm
			gterm=$(get_component $g)
			for ((b = 0; b <= 255; b += step)); do
				local bterm
				bterm=$(get_component $b)
				local termcol=$((16 + 36 * rterm + 6 * gterm + bterm))
				printf "%b" "$(tput setab $termcol)  $(tput sgr0)"
			done
			echo
		done
	done
}

# Interpolate between an RGB triple and (0,0,0) to test facing ratio shading
facing_ratio() {
	local r=${1:-248}
	local g=${2:-231}
	local b=${3:-44}
	local i
	local steps=20
	for ((i = steps; i >= 0; --i)); do
		local rterm
		rterm=$(get_component $((r * i / steps)))
		local gterm
		gterm=$(get_component $((g * i / steps)))
		local bterm
		bterm=$(get_component $((b * i / steps)))
		local termcol=$((16 + 36 * rterm + 6 * gterm + bterm))
		printf "%b" "$(tput setab $termcol) $(tput sgr0)"
	done
	echo
}
