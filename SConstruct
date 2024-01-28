#!/usr/bin/env python
import os
import sys

env = SConscript("thirdparty/godot-cpp/SConstruct")


env.Append(
    CPPDEFINES=[
        "HAVE_CONFIG_H",
        "PACKAGE=",
        "VERSION=",
        "CPU_CLIPS_POSITIVE=0",
        "CPU_CLIPS_NEGATIVE=0",
        "WEBRTC_APM_DEBUG_DUMP=0",
        "GLOG_NO_ABBREVIATED_SEVERITIES",
    ]
)

env.Append(CXXFLAGS=["/W0","/wd4244","/wd4042", "/bigobj", "/wd4267", "/D_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS"])


env.Prepend(CPPPATH=["thirdparty", "include",
					 "thirdparty/material-color-utilities",
					 ])
env.Append(CPPPATH=["src/"])
sources = [Glob("src/*.cpp")]



material_color_utilities_sources = [
    'thirdparty/material-color-utilities/cpp/blend/blend.cc',
    'thirdparty/material-color-utilities/cpp/cam/cam.cc',
    'thirdparty/material-color-utilities/cpp/cam/hct_solver.cc',
    'thirdparty/material-color-utilities/cpp/cam/hct.cc',
    'thirdparty/material-color-utilities/cpp/cam/viewing_conditions.cc',
    'thirdparty/material-color-utilities/cpp/contrast/contrast.cc',
    'thirdparty/material-color-utilities/cpp/dislike/dislike.cc',
    'thirdparty/material-color-utilities/cpp/dynamiccolor/dynamic_color.cc',
    'thirdparty/material-color-utilities/cpp/dynamiccolor/dynamic_scheme.cc',
    'thirdparty/material-color-utilities/cpp/dynamiccolor/material_dynamic_colors.cc',
    'thirdparty/material-color-utilities/cpp/palettes/core.cc',
    'thirdparty/material-color-utilities/cpp/palettes/tones.cc',
    'thirdparty/material-color-utilities/cpp/quantize/celebi.cc',
    'thirdparty/material-color-utilities/cpp/quantize/lab.cc',
    'thirdparty/material-color-utilities/cpp/quantize/wsmeans.cc',
    'thirdparty/material-color-utilities/cpp/quantize/wu.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_content.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_expressive.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_fidelity.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_fruit_salad.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_monochrome.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_neutral.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_rainbow.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_tonal_spot.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme_vibrant.cc',
    'thirdparty/material-color-utilities/cpp/scheme/scheme.cc',
    'thirdparty/material-color-utilities/cpp/score/score.cc',
    'thirdparty/material-color-utilities/cpp/temperature/temperature_cache.cc',
    'thirdparty/material-color-utilities/cpp/utils/utils.cc',
]

sources.extend(material_color_utilities_sources)

if env["platform"] == "macos":
	library = env.SharedLibrary(
		"bin/addons/godot_ui_design/bin/libgodot_ui_design{}.framework/libgodot_ui_design{}".format(
			env["suffix"], env["suffix"]
		),
		source=sources,
	)
else:
	library = env.SharedLibrary(
		"bin/addons/godot_ui_design/bin/libgodot_ui_design{}{}".format(env["suffix"], env["SHLIBSUFFIX"]),
		source=sources,
	)
Default(library)
