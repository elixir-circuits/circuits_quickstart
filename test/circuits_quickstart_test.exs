defmodule CircuitsQuickstartTest do
  use ExUnit.Case
  doctest CircuitsQuickstart

  test "greets the world" do
    assert CircuitsQuickstart.hello() == :world
  end
end
