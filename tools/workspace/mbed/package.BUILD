# -*- python -*-

# Copyright 2018-2019 Josh Pieper, jjp@pobox.com.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package(default_visibility = ["//visibility:public"])


# Yay, The mbed source is full of circular dependencies.  About the
# best we can do is lump everything into one giant cc_library and suck
# up the recompilation time.
cc_library(
    name = "mbed",
    hdrs = glob(
        @HDR_GLOBS@
    ),
    srcs = glob(
        @SRC_GLOBS@
    ),
    includes =
        @INCLUDES@
    ,
    copts =
        @COPTS@
    ,
    defines = [
        "_RTE_",
        "__MBED__",
        "__FPU_PRESENT",
        "__CMSIS_RTOS",
        "__MBED_CMSIS_RTOS_CM",
        "TOOLCHAIN_GCC",
        "TOOLCHAIN_GCC_ARM",

        "TARGET_RELEASE",
        "TARGET_LIKE_MBED",

    ] + @DEFINES@,
    features = ["noimplicitfunction"],
)

genrule(
    name = "preprocess_linker_script",
    srcs = ["linker_script.ld.in"],
    outs = ["linker_script.ld"],
    tools = select({
        ":linux_x86_64" : [
            "@com_arm_developer_gcc_linux_x86_64//:everything",
            "@com_arm_developer_gcc_linux_x86_64//:cpp",
        ],
        ":windows_x64" : [
            "@com_arm_developer_gcc_windows_x86_64//:everything",
            "@com_arm_developer_gcc_windows_x86_64//:cpp",
        ],
        ":macos_x86_64" : [
            "@com_arm_developer_gcc_darwin_x86_64//:everything",
            "@com_arm_developer_gcc_darwin_x86_64//:cpp",
        ],
        ":macos_arm64" : [
            "@com_arm_developer_gcc_darwin_arm64//:everything",
            "@com_arm_developer_gcc_darwin_arm64//:cpp",
        ],
    })
    print(f'tools={tools}')
    cmd = "$(location @com_arm_developer_gcc//:cpp) -P {} $< -o $@".format(
        " ".join(["-D{}".format(x) for x in @DEFINES@
                  if x.find('|') == -1])),
)
