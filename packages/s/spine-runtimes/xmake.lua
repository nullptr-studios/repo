package("spine-runtimes")
	set_homepage("https://github.com/EsotericSoftware/spine-runtimes")
	set_description("2D skeletal animation runtimes for Spine (C++ runtime)")
	set_license("license available in upstream repo")

	add_urls("https://github.com/EsotericSoftware/spine-runtimes.git")

	add_versions("4.0", "4.0")
	add_versions("4.1", "4.1")
	add_versions("4.2", "4.2")

	on_install("macosx", "linux", "windows", "mingw", function (package)
			local xmake_lua = [[
					add_rules("mode.debug", "mode.release")
					set_languages("c++17")

					target("spine-cpp")
							set_kind("static")
							add_files("spine-cpp/spine-cpp/src/spine/**.cpp")
							add_headerfiles("spine-cpp/spine-cpp/include/(**.h)")
							add_includedirs("spine-cpp/spine-cpp/include", {public = true})
							if is_plat("windows") then
									add_defines("NOMINMAX")
							end
			]]
			io.writefile("xmake.lua", xmake_lua)
			import("package.tools.xmake").install(package)
	end)

	on_test(function (package)
			assert(package:has_cxxfuncs("spine::Skeleton::getData",
					{includes = "spine/Skeleton.h", configs = {languages = "c++17"}}))
	end)
