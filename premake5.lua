project "muscle"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/int-" .. outputdir .. "/%{prj.name}")

	files {
		"./dataio/*.cpp",
		"./dataio/*.h",
		"./iogateway/*.cpp",
		"./iogateway/*.h",
		"./message/*.cpp",
		"./message/*.h",
		"./reflector/*.cpp",
		"./reflector/*.h",
		"./regex/*.cpp",
		"./regex/*.h",
		"./syslog/*.cpp",
		"./syslog/*.h",
		"./system/*.cpp",
		"./system/*.h",
		"./util/*.cpp",
		"./util/*.h",
	}

	includedirs {
		"./"
	}

	excludes {
		"**SSL*",
		"dataio/SSL*",
	}	
	
	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"

	filter "system:windows"
		files {
			"./regex/regex/regcomp.c",
			"./regex/regex/regcomp.h",
			"./regex/regex/regerror.c",
			"./regex/regex/regerror.h",
			"./regex/regex/regexec.c",
			"./regex/regex/regexec.h",
			"./regex/regex/regfree.c",
			"./regex/regex/regfree.h",
		}

		includedirs {
			"./regex/regex",
		}