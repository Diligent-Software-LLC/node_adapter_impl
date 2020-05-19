require_relative 'test_helper'

# NodeAdapterTest.
# @class_description
#   Tests the NodeAdapter implementation.
class NodeAdapterTest < Minitest::Test

  # Constants.
  NILCLASS_I = nil
  TEST_FLOAT = 3.14
  TEST_SYMBOL = :test_symbol

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   .yardopts, .gitignore, Changelog.md, CODE_OF_CONDUCT.md,
  #   node_adapter_impl.gemspec, Gemfile.lock, and Rakefile files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')
    assert_path_exists('.gitignore')
    assert_path_exists('Changelog.md')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('node_adapter_impl.gemspec')
    assert_path_exists('Gemfile.lock')
    assert_path_exists('Rakefile')

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
    @node = Node.new(NILCLASS_I, NILCLASS_I, NILCLASS_I)
    @adapter = NodeAdapter.new(@node)
  end

  # initialize(n = nil).

  # test_init_x1().
  # @description
  #   A Node argument.
  def test_init_x1()
    assert_equal(@adapter, @node)
  end

  # test_init_x2().
  # @description
  #   An invalid argument.
  def test_init_x2()

    assert_raises(ArgumentError) {
      NodeAdapter.new(TEST_FLOAT)
    }

  end

  # back().

  # test_back_x1().
  # @description
  #   'back' is nil.
  def test_back_x1()
    assert_nil(@adapter.back())
  end

  # test_back_x2().
  # @description
  #   'back' is a Node instance.
  def test_back_x2()

    n = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    @adapter.attach_back(n)
    assert_instance_of(Node, @adapter.back())

  end

  # front().

  # test_front_x1().
  # @description
  #   'front' is nil.
  def test_front_x1()
    assert_nil(@adapter.front())
  end

  # test_front_x2().
  # @description
  #   'front' is a Node.
  def test_front_x2()

    n = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    @adapter.attach_front(n)
    assert_instance_of(Node, @adapter.front())

  end

  # attach_back(n = nil).

  # test_ab_x1().
  # @description
  #   A Node instance argument.
  def test_ab_x1()

    attachment = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    r = @adapter.attach_back(attachment)
    assert_nil(r)
    assert_predicate(@adapter, :pioneer)

  end

  # test_ab_x2().
  # @description
  #   No arguments. The method takes the default parameter.
  def test_ab_x2()

    assert_raises(ArgumentError, "#{nil} is not a Node instance.") {
      @adapter.attach_back()
    }

  end

  # test_ab_x3().
  # @description
  #   Any argument excluding Node or NilClass instances.
  def test_ab_x3()

    assert_raises(ArgumentError, "#{TEST_SYMBOL} is neither nil nor a Node
instance.") {
      @adapter.attach_back(TEST_SYMBOL)
    }

  end

  # attach_front(n = nil).

  # test_af_x1().
  # @description
  #   A Node argument.
  def test_af_x1()

    attachment = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    r = @adapter.attach_front(attachment)
    assert_nil(r)
    assert_predicate(@adapter, :base)

  end

  # test_af_x2().
  # @description
  #   A nil argument.
  def test_af_x2()

    attachment = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    r = @adapter.attach_front(attachment)
    assert_nil(r)
    assert_predicate(@adapter, :base)

  end

  # test_af_x3().
  # @description
  #   Any object excluding a Node or NilClass instance.
  def test_af_x3()

    assert_raises(ArgumentError, "#{TEST_SYMBOL} is neither nil nor a Node
instance.") {
      @adapter.attach_front(TEST_SYMBOL)
    }

  end

  # detach_back().

  # test_db_x1().
  # @description
  #   self's 'back' is nil.
  def test_db_x1()

    r = @adapter.detach_back()
    assert_nil(r)
    assert_predicate(@adapter, :lone)

  end

  # test_db_x2().
  # @description
  #   self's 'back' is a Node.
  def test_db_x2()

    node = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    @adapter.attach_back(node)
    r = @adapter.detach_back()
    assert_nil(r)
    assert_predicate(@adapter, :lone)

  end

  # detach_front().

  # test_df_x1().
  # @description
  #   A nil 'front'.
  def test_df_x1()

    r = @adapter.detach_front()
    assert_nil(r)
    assert_predicate(@adapter, :lone)

  end

  # test_df_x2().
  # @description
  #   'front' is a Node.
  def test_df_x2()

    attachment = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    r = @adapter.attach_front(attachment)
    assert_nil(r)
    assert_predicate(@adapter, :base)

  end

  # Private methods.

  # back=(n = nil).

  # test_bass_x1().
  # @description
  #   'back=(n = nil)' is private.
  def test_bass_x1()

    assert_raises(NameError) {
      @adapter.back = nil
    }

  end

  # front=(n = nil).

  # test_fass_x1().
  # @description
  #   'front=(n = nil)' is private.
  def test_fass_x1()

    assert_raises(NameError) {
      @adapter.front = nil
    }

  end

  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end

end
