# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require 'node'

# NodeAdapter.
# @class_description
#   A NodeAdapter implementation. Implements the NodeAdapter interface.
# @attr back [Node, NilClass]
#   A backward reference.
# @attr data [DataType]
#   A data instance reference.
# @attr front [Node, NilClass]
#   A forward reference.
class NodeAdapter < Node
  VERSION = '0.2.0'.freeze()
end
