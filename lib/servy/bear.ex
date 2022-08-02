defmodule Servy.Bear do
  defstruct id: nil, name: "", type: "", hibernating: false

  @doc """
  Checks if a.name is before b.name

  ## Example
    iex> Servy.Bear.order_asc_by_name(%{name: "Zelda"}, %{name: "Link"})
    false
    iex> Servy.Bear.order_asc_by_name(%{name: "Link"}, %{name: "Zelda"})
    true
  """
  def order_asc_by_name(a, b) do
    a.name <= b.name
  end
end
