require_relative 'test_helper'

# NodeAdapterTest.
# @class_description
#   Tests the NodeAdapter implementation.
class NodeAdapterTest < Minitest::Test

  # Constants
  NILCLASS_DATA = nil
  STRING_DATA   = 'test'

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   and .yardopts files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')

  end

  # test_version_declared().
  # @description
  #   The version was declared.
  def test_version_declared()
    refute_nil(NodeAdapter::VERSION)
  end

  # setup().
  # @description
  #   Set fixtures.
  def setup()
    @node = Node.new(NILCLASS_DATA, NILCLASS_DATA, NILCLASS_DATA)
  end

  # back()

  # test_back_x1().
  # @description
  #   back is nil.
  def test_back_x1()

    n = Minitest::Mock.new()
    n.expect(:back_ref, NILCLASS_DATA)
    n.expect(:data_ref, NILCLASS_DATA)
    n.expect(:front_ref, NILCLASS_DATA)
    n.expect(:instance_of?, true, [Node])
    n_a = NodeAdapter.new(n)
    n.expect(:adapt, n_a)
    n_a = n.adapt()
    assert_same(NILCLASS_DATA, n_a.back())

  end

  # test_back_x2().
  # @description
  #   back is a Node instance.
  def test_back_x2()

    n = Minitest::Mock.new()
    n.expect(:back_ref, @node)
    n.expect(:data_ref, NILCLASS_DATA)
    n.expect(:front_ref, NILCLASS_DATA)
    n.expect(:instance_of?, true, [Node])
    n_a = NodeAdapter.new(n)
    n.expect(:adapt, n_a)
    n_a = n.adapt()
    assert_same(@node, n_a.back())

  end

  # front()

  # test_front_x1().
  # @description
  #   front is nil.
  def test_front_x1()

    n = Minitest::Mock.new()
    n.expect(:back_ref, NILCLASS_DATA)
    n.expect(:data_ref, NILCLASS_DATA)
    n.expect(:front_ref, NILCLASS_DATA)
    n.expect(:instance_of?, true, [Node])
    n_a = NodeAdapter.new(n)
    n.expect(:adapt, n_a)
    n_a = n.adapt()
    assert_same(NILCLASS_DATA, n_a.front())

  end

  # test_front_x2().
  # @description
  #   front is a Node instance.
  def test_front_x2()

    n = Minitest::Mock.new()
    n.expect(:back_ref, NILCLASS_DATA)
    n.expect(:data_ref, NILCLASS_DATA)
    n.expect(:front_ref, @node)
    n.expect(:instance_of?, true, [Node])
    n_a = NodeAdapter.new(n)
    n.expect(:adapt, n_a)
    n_a = n.adapt()
    assert_same(@node, n_a.front())

  end

  # data()

  # test_data_x().
  # @description
  #   The data reference.
  def test_data_x()

    n = Minitest::Mock.new()
    n.expect(:back_ref, NILCLASS_DATA)
    n.expect(:data_ref, STRING_DATA)
    n.expect(:front_ref, NILCLASS_DATA)
    n.expect(:instance_of?, true, [Node])
    n_a = NodeAdapter.new(n)
    n.expect(:adapt, n_a)
    n_a = n.adapt()
    assert_same(STRING_DATA, n_a.data())

  end

  # initialize(n = nil)

  # test_init_x1().
  # @description
  #   A Node argument.
  def test_init_x1()
    a_n = NodeAdapter.new(@node)
    assert_same(NodeAdapter, a_n.class())
  end

  # test_init_x2().
  # @description
  #   An invalid argument.
  def test_init_x2()

    assert_raises(ArgumentError) {
      NodeAdapter.new(STRING_DATA)
    }

  end

  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end

end
