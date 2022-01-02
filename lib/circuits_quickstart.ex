defmodule CircuitsQuickstart do
  @moduledoc """
  Elixir Circuits Quickstart firmware

  This firmware lets you experiment with Elixir Circuits at the IEx prompt.
  """

  def ssh_check_pass(_provided_username, provided_password) do
    correct_password = Application.get_env(:circuits_quickstart, :password, "circuits")

    provided_password == to_charlist(correct_password)
  end

  def ssh_show_prompt(_peer, _username, _service) do
    {:ok, name} = :inet.gethostname()

    msg = """
    https://github.com/elixir-circuits/circuits_quickstart

    ssh circuits@#{name}.local # Use password "circuits"
    """

    {'Elixir Circuits Quickstart', to_charlist(msg), 'Password: ', false}
  end
end
