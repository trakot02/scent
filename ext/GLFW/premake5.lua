project "GLFW"
    kind     "StaticLib"
    language "C"

    targetdir "%{wks.location}/bin/%{prj.name}"
    objdir    "%{wks.location}/obj/%{prj.name}"

    files {
        "src/context.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/init.c",
        "src/null_init.c",
        "src/input.c",
        "src/null_joystick.c",
        "src/window.c",
        "src/null_window.c",
        "src/monitor.c",
        "src/null_monitor.c",
        "src/platform.c",
        "src/vulkan.c",
    }

    filter { "system:linux" }
        files {
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/posix_poll.c",
            "src/posix_module.c",
            "src/xkb_unicode.c",
            "src/x11_init.c",
            "src/x11_window.c",
            "src/x11_monitor.c",
            "src/linux_joystick.c",
        }

        defines {
            "_GLFW_X11",
        }

    filter { "system:windows" }
        files {
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_module.c",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_window.c",
            "src/win32_monitor.c",
        }

        defines {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS",
        }

    filter { "configurations:debug" }
        symbols "on"

    filter { "configurations:release" }
        optimize "on"
