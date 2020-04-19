# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require 'node_adapter_int'

# NodeAdapter.
# @class_description
#   A NodeAdapter implementation. Implements the NodeAdapter interface.
# @attr back [Node, NilCLass]
#   A 'back' instance reference.
# @attr data [DataType]
#   A 'data' instance reference.
# @attr front [Node, NilClass]
#   A 'front' instance reference.
class NodeAdapter < NodeAdapterInt
  VERSION = '0.1.0'.freeze()
end
