local wares = require("wares")
local deps = wares.sync() -- includes msdfgen

project "msdf-atlas-gen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	files {
		"msdf-atlas-gen/**.h",
		"msdf-atlas-gen/**.hpp",
		"msdf-atlas-gen/**.cpp"
	}

	includedirs {
		"msdf-atlas-gen",
		deps["msdfgen"],
		deps["msdfgen"] .. "/include"
	}

	links {
		"msdfgen"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
