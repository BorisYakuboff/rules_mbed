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

_arm_gcc_distribution = {
    "11.3.rel1": {
        "linux_x86_64": ("arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz", "d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121"),
        "windows_x86_64": ("arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.exe", "cabeba12c1122a185aa7a6a56ad47ed5611e74359f73b7f0d13427d8a7437c99"),
        "macos_x86_64": ("arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz", "1ab00742d1ed0926e6f227df39d767f8efab46f5250505c29cb81f548222d794"),
        "macos_arm64": ("arm-gnu-toolchain-13.3.rel1-darwin-arm64-arm-none-eabi.tar.xz", "fb6921db95d345dc7e5e487dd43b745e3a5b4d5c0c7ca4f707347148760317b4"),
    },
}

def arm_gcc_repository():
    version = "11.3.rel1"
    platform = "macos_x86_64"
    base_url = "https://developer.arm.com/-/media/Files/downloads/gnu"
    distribution = _arm_gcc_distribution[version][platform]
    filename = distribution[0]
    file_sha256 = distribution[1]
    url = "{}/{}/binrel/{}".format(base_url, version, filename)

    print("platform={} url={}".format(platform, url))
    http_archive(
        name = "com_arm_developer_gcc",
        urls = [
            url,
        ],
        sha256 = file_sha256,
        strip_prefix = filename,
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
