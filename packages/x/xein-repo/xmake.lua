package("xein-repo")
    set_description("The xein-repo package")

    add_urls("https://github.com/ynks/xmake-repo-test")
    add_versions("1.0", "b86b7f59e663c48d4b9c057e025d3918e44c5c14")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
    end)
