#!/usr/bin/env python
# Copyright 2018 The Bazel Authors.
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
"""LLVM pre-built distribution file names."""

import platform
import sys

def detect_platform():
    system = platform.system().lower()
    machine = platform.machine().lower()
    if system.startswith('linux'):
        return sysconfig.get_platform()
    if system.startswith('darwin'):
        return 'darwin-'+machine
    depth,arch = platform.architecture()
    if arch.startswith('Windows'):
        if depth.startswith("64"):
            return 'windows-x86_64'
    sys.exit("Unsupported system: %s" % system)

def main():
    print(detect_platform())
    sys.exit()


if __name__ == '__main__':
    main()
