defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # {:ok, file} = File.read("#{filename}.csv")

    # file = File.read("#{filename}.csv")
    # handle_file(file)

    # Return has the first argument
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # defp handle_file({:ok, file}), do: file # Short Function
  defp handle_file({:ok, result}) do
    # result = String.split(result, ",")
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)
    # result # Aways last line is the return

    result =
      result
      |> String.split(",")
      # |> Number.map(fn number -> String.to_integer(number) end)
      # Stream is more efficient doing the map and the sum at the same time
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
