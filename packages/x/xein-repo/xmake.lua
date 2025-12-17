package("xein-repo", function()
	set_description("the xein-repo package")

	add_urls("https://github.com/ynks/xmake-repo-test.git")
	add_versions("main", "main")

	on_install(function (package)
		package:set("always_update", true)

		local configs = {}
		if package:config("shared") then
			configs.kind = "shared"
		end
		import("package.tools.xmake").install(package, configs)
	end)

	on_test(function (package)
	end)
end)
