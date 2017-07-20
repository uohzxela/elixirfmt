defmodule ExFormat.Unit.CommentTest do
  import Test.Support.Unit
  use ExUnit.Case

  describe "preserves prefix comments" do

    test "for function definitions" do
      assert_format_string(
        """
        # comment
        def f(), do: something
        """
      )
    end

    test "for numbers" do
      assert_format_string(
        """
        # comment
        123
        """
      )

      assert_format_string(
        """
        # comment
        12.3
        """
      )

      assert_format_string(
        """
        # comment
        0xEF
        """
      )

      assert_format_string(
        """
        # comment
        0b10
        """
      )

      assert_format_string(
        """
        # comment
        0o17
        """
      )

      assert_format_string(
        """
        # comment
        ?è
        """
      )
    end

    test "for strings" do
      assert_format_string(
        """
        # comment
        "hello"
        """
      )
    end

    test "for lists" do
      assert_format_string(
        """
        # comment
        [1, 2, 3]
        """
      )
    end

    test "for tuples" do
      assert_format_string(
        """
        # comment
        {:ok, 1}
        """
      )

    assert_format_string(
      """
      # comment
      {:ok, 1, 2}
      """
    )
    end
  end

  test "preserves suffix comments" do
    bad =
    """
    def test() do
      # comment 1
      if true do
        # comment 2
        if false do
          # comment 3
        else
          # comment 4
        end
        # comment 5
      end
      # comment 6
    catch
      # comment 7
    rescue
      # comment 8
    after
      # comment 9
      # blah blah
    end
    """

    good = 
    """
    def test() do
      # comment 1
      if true do
        # comment 2
        if false do
          nil
          # comment 3
        else
          nil
          # comment 4
        end
      end
    catch
      nil
      # comment 7
    rescue
      nil
      # comment 8
    after
      nil
      # comment 9
      # blah blah
    end
    """

    assert_format_string(bad, good)
  end

  test "preserves inline comments" do
    assert_format_string(
      """
      def test() do # comment 0
        # asdfasdf
        1 + 2 # comment 1
        if true do # comment 2
          :random # comment 3
          :asdf # comment 4
        else # comment 5
          :hello # comment 7
        end # comment 6
      end # comment 8
      """
    )
  end
end
