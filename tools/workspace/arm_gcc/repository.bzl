# -*- python -*-

# Copyright 2018-2022 Josh Pieper, jjp@pobox.com.
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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def arm_gcc_repository():
    print('arm_gcc_repository')
    http_archive(
        name = "com_arm_developer_gcc_linux_x86_64",
        urls = [
            "https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz",
        ],
        sha256 = "d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121",
        strip_prefix = "arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi",
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
    http_archive(
        name = "com_arm_developer_gcc_windows_x86_64",
        urls = [
            "https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.exe",
        ],
        sha256 = "cabeba12c1122a185aa7a6a56ad47ed5611e74359f73b7f0d13427d8a7437c99",
        strip_prefix = "arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.exe",
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
    http_archive(
        name = "com_arm_developer_gcc_darwin_x86_64",
        urls = [
            "https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz",
        ],
        sha256 = "1ab00742d1ed0926e6f227df39d767f8efab46f5250505c29cb81f548222d794",
        strip_prefix = "arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi",
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
    http_archive(
        name = "com_arm_developer_gcc_darwin_arm64",
        urls = [
            "https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-darwin-arm64-arm-none-eabi.tar.xz",
        ],
        sha256 = "fb6921db95d345dc7e5e487dd43b745e3a5b4d5c0c7ca4f707347148760317b4",
        strip_prefix = "arm-gnu-toolchain-11.3.rel1-darwin-arm64-arm-none-eabi",
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
