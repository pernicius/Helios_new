-----------------------
-- [ PROJECT CONFIG] --
-----------------------
project "HeliosEngine"
	kind          "StaticLib"
	architecture  "x86_64"
	language      "C++"
	cppdialect    "C++20"
	staticruntime "On"
	
--	targetdir ("%{wks.location}/bin/client/"   .. outputdir .. "/%{string.lower(prj.name)}")
	targetdir ("%{wks.location}/bin/client/"   .. outputdir)
	objdir    ("%{wks.location}/build/client/" .. outputdir .. "/%{string.lower(prj.name)}")
	
	pchheader "pch_engine.h"
	pchsource "source/pch_engine.cpp"

	defines {
		"GLFW_INCLUDE_NONE"
	}
	
	includedirs {
		"source",
		"vendor/spdlog/include",
		"vendor/glfw/include",
		"vendor/glad/include"
	}
	
	links {
		"HeliosEngine.glfw",
		"HeliosEngine.glad2",
--		"opengl32.lib"
	}

	files {
		"source/**.h",
		"source/**.cpp"
	}

	filter "platforms:Windows"

		defines {
			"HE_BUILDWITH_PLATFORM_GLFW",
--			"HE_BUILDWITH_PLATFORM_WINDOWS",
--			"HE_BUILDWITH_RENDERER_DIRECTX",
			"HE_BUILDWITH_RENDERER_OPENGL",
--			"HE_BUILDWITH_RENDERER_VULKAN",
		}

	filter "platforms:Linux"

		defines {
			"HE_BUILDWITH_PLATFORM_GLFW",
--			"HE_BUILDWITH_PLATFORM_WINDOWS",
--			"HE_BUILDWITH_RENDERER_DIRECTX",
			"HE_BUILDWITH_RENDERER_OPENGL",
--			"HE_BUILDWITH_RENDERER_VULKAN",
		}

	filter "platforms:MacOS"

		defines {
			"HE_BUILDWITH_PLATFORM_GLFW",
--			"HE_BUILDWITH_PLATFORM_WINDOWS",
--			"HE_BUILDWITH_RENDERER_DIRECTX",
			"HE_BUILDWITH_RENDERER_OPENGL",
--			"HE_BUILDWITH_RENDERER_VULKAN",
		}

	filter "configurations:Debug"

		defines {
			"HE_LOG_LEVEL=0",
			"HE_LOG_ASSERTS"
		}
		
	filter "configurations:Release"

		defines {
			"HE_LOG_LEVEL=2",
--			"HE_LOG_ASSERTS"
		}

	filter {}

	group "client/HeliosEngine/vendor"
		include("vendor/glfw")
		include("vendor/glad")
