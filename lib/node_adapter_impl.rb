# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative 'node_adapter_impl/version'

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

  # initialize(n = nil).
  # @description
  #   Initializes a NodeAdapter.
  # @param n [Node]
  #   The adapting instance.
  # @return [NodeAdapter]
  #   The instance.
  # @raise [ArgumentError]
  #   In the case n is not a Node instance.
  def initialize(n = nil)

    unless (n.instance_of?(Node))
      raise(ArgumentError, "#{n} is not a Node instance.")
    else

      self.back  = n.back_ref()
      self.data  = n.data()
      self.front = n.front_ref()

    end

  end

  # back().
  # @description
  #   Gets back's reference.
  # @return [Node, NilClass]
  #   back's reference.
  def back()
    return @back
  end

  # front().
  # @description
  #   Gets front's reference.
  # @return [Node, NilClass]
  #   front's reference.
  def front()
    return @front
  end

  # attach_back(n = nil).
  # @description
  #   Attaches 'back' a Node.
  # @param n [Node]
  #   An attachment Node.
  # @return [NilClass]
  #   nil.
  # @raise [ArgumentError]
  #   In the case the argument is any type other than Node.
  def attach_back(n = nil)

    unless (n.instance_of?(Node))
      raise(ArgumentError, "#{n} is not a Node instance.")
    else
      self.back = n
      return nil
    end

  end

  # attach_front(n = nil).
  # @description
  #   Attaches 'front' the argument Node.
  # @param n [Node]
  #   The attachment.
  # @return [NilClass]
  #   nil.
  # @raise [ArgumentError]
  #   In the case the argument is any type other than Node.
  def attach_front(n = nil)

    unless (n.instance_of?(Node))
      raise(ArgumentError, "#{n} is not a Node instance.")
    else
      self.front = n
      return nil
    end

  end

  # detach_back().
  # @description
  #   Sets 'back' nil.
  # @return [NilClass]
  #   nil.
  def detach_back()
    self.back = nil
  end

  # detach_front().
  # @description
  #   Sets 'front' nil.
  # @return [NilClass]
  #   nil.
  def detach_front()
    self.front = nil
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
