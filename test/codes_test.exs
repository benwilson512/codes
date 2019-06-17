defmodule CodesTest do
  use ExUnit.Case
  doctest Codes

  test "greets the world" do
    assert Codes.hello() == :world
  end
end
