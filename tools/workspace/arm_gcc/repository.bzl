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
        "linux-x86_64": ("arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz", "d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121", "arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi"),
        "windows-x86_64": ("arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.zip", "e46fda043c0ce83582bc8db4b3ef85f77f4beb7333344c2f4193c17e1167a095", "arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi"),
        "darwin-x86_64": ("arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz", "826353d45e7fbaa9b87c514e7c758a82f349cb7fc3fd949423687671539b29cf", "arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi"),
    },
}  #826353d45e7fbaa9b87c514e7c758a82f349cb7fc3fd949423687671539b29cf

def arm_gcc_repository(name):
    version = "11.3.rel1"
    platform = "darwin-x86_64"  #"@com_github_mjbots_rules_mbed//tools:detect_platform.py"
    print('platform="{}"'.format(platform))
    base_url = "https://developer.arm.com/-/media/Files/downloads/gnu"
    distribution = _arm_gcc_distribution[version][platform]
    filename = distribution[0]
    file_sha256 = distribution[1]
    prefix = distribution[2]
    url = "{}/{}/binrel/{}".format(base_url, version, filename)

    http_archive(
        name = name,
        urls = [url],
        sha256 = file_sha256,
        strip_prefix = prefix,
        build_file = Label("//tools/workspace/arm_gcc:package.BUILD"),
    )
