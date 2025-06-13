project "Box2D"
   kind        "StaticLib"
   language    "C"
   cdialect    "C17"
   staticruntime "off"

   targetdir   ("bin/"    .. outputdir .. "/%{prj.name}")
   objdir      ("bin-int/".. outputdir .. "/%{prj.name}")

   files {
      "src/**.h",
      "src/**.c",
      "include/**.h"
   }

   includedirs {
      "include",
      "src"
   }

   filter { "system:windows" }
      buildoptions { "/experimental:c11atomics" }
      systemversion "latest"

   filter { "system:linux" }
      pic "On"
      defines { "_POSIX_C_SOURCE=199309L" }
      links   { "pthread", "m", "rt" } 
   filter {}

   defines { "BOX2D_ENABLE_SIMD" }

   filter { "configurations:Debug" }
      runtime "Debug"
      symbols "On"

   filter { "configurations:Release" }
      runtime "Release"
      optimize "On"
      defines { "NDEBUG" }
   filter {}