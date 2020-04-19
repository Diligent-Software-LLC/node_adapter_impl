# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative 'node_adapter_impl/version'

# NodeAdapter.
# @class_description
#   A NodeAdapter implementation. Implements the NodeAdapter interface.
# @attr back [Node, NilCLass]
#   A 'back' instance reference.
# @attr data [DataType]
#   A 'data' instance reference.
# @attr front [Node, NilClass]
#   A 'front' instance reference.
class NodeAdapter < Node

  # back().
  # @description
  #   Gets back's reference.
  # @return [Node, NilClass]
  #   back's reference.
  def back()
    return @back
  end

  # data().
  # @description
  #   Gets data's reference.
  # @return [DataType]
  #   Data's reference.
  def data()
    return @data
  end

  # front().
  # @description
  #   Gets front's reference.
  # @return [Node, NilClass]
  #   front's reference.
  def front()
    return @front
  end

  protected

  # initialize(n = nil).
  # @description
  #   Instantiates a NodeAdapter.
  # @param n [Node]
  #   An adapting instance.
  # @return [NodeAdapter]
  #   The instantiation.
  # @raise [ArgumentError]
  #   In the case the argument's type is not Node.
  def initialize(n = nil)

    unless (n.instance_of?(Node))
      raise(ArgumentError, "#{n} is not a Node instance.")
    else

      self.back  = n.back_ref()
      self.data  = n.data_ref()
      self.front = n.front_ref()

    end

  end

  private

  # back=(n = nil).
  # @description
  #   Sets back's reference.
  # @param n [Node, NilClass]
  #   back's setting.
  # @return [Node, NilClass]
  #   The argument.
  def back=(n = nil)
    @back = n
  end

  # data=(dti = nil).
  # @description
  #   Sets data's reference.
  # @param dti [DataType]
  #   data's setting.
  # @return [DataType]
  #   The argument.
  def data=(dti = nil)
    @data = dti
  end

  # front=(n = nil).
  # @description
  #   Sets front's reference.
  # @param n [Node, NilClass]
  #   front's setting.
  # @return [Node, NilClass]
  #   The argument.
  def front=(n = nil)
    @front = n
  end

end
