return {
	renderer = "inlay-hints/render/eol",
	eol = {
		right_align = false,
		type = {
			separator = ', ',
			format = function(hints)
				local res = ''
				for match in string.gmatch(hints, "([^%s]+)") do
					if match ~= ":" then
						res = res .. match .. ' '
					end
				end
				return string.format(" => %s", res)
			end
		},
		parameter = {
			separator = ', ',
			format = function(hints)
				local res = ''
				for match in string.gmatch(hints, "([^%s]+)") do
					if match ~= ":" then
						res = res .. match .. ' '
					end
				end
				return string.format(" args (%s)", res)
			end
		},
	},
}
