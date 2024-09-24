project "Box2D"
	kind "StaticLib"
	language "C"
	cdialect  "C17"
	staticruntime "off"
	visibility "Hidden" -- gcc compile option
	warnings "off" -- 隐藏一些编译警告

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.c",
		"src/**.h",
		"include/**.h",
	}

	includedirs
	{
		"include",
	}

	filter { "system:windows", "action:vs*" }
		buildoptions { "/experimental:c11atomics" }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		-- targetsuffix "_d"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"