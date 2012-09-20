#
# Cookbook Name:: misterhouse
# Attributes:: misterhouse
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
#

# General settings
default[:misterhouse][:port] = "5000"
default[:misterhouse][:dir] = "/usr/local/misterhouse"
default[:misterhouse][:user] = "mh"
default[:misterhouse][:group] = "mh"

# Installation method can be via subversion checkout or tarball
default[:misterhouse][:install_method] = "subversion"
default[:misterhouse][:subversion][:branch] = "trunk"
default[:misterhouse][:tarball][:version] = "2.105"
