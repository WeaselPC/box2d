project "Box2D"
	kind "StaticLib"
	language "C"
	cdialect "C17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.c",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"src"
	}

	buildoptions { "/experimental:c11atomics" }

	defines { "BOX2D_ENABLE_SIMD" }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		defines { "NDEBUG" }