@echo on
mkdir %1temp
mkdir %1temp\plugins
mkdir %1temp\bin
del /Q %1temp\plugins\*
del /Q %1temp\bin\*
xcopy %GSTREAMER_1_0_ROOT_X86%\lib\gstreamer-1.0\*.dll  %1temp\plugins
xcopy %GSTREAMER_1_0_ROOT_X86%\bin\*.dll  %1temp\bin
"C:\Program Files (x86)\WiX Toolset v3.10\bin\heat.exe" dir "%1\temp\plugins" -cg PluginFiles -gg -scom -sreg -sfrag -srd -dr INSTALLPLUGINBINFOLDER -var var.SourcePluginDir -out "%1\PluginFragment.wxs"
"C:\Program Files (x86)\WiX Toolset v3.10\bin\heat.exe" dir "%1\temp\bin" -cg BinFiles -gg -scom -sreg -sfrag -srd -dr INSTALLBINFOLDER -var var.SourceBinDir -out "%1\BinFragment.wxs"