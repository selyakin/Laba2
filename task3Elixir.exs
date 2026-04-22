defmodule PrimeChecker do
  @moduledoc """
  Проверка чисел на простоту
  """
  
  def prime_numbers(n, numbers) when is_list(numbers) do
    cond do
      n <= 0 ->
        "Error: некорректный N"
      
      Enum.any?(numbers, fn el -> el <= 0 end) ->
        "Error: некорректное число (только натуральные числа)"
      
      true ->
        numbers
        |> Enum.map(&check_prime/1)
        |> Enum.join(" ")
    end
  end
  
  defp check_prime(1), do: "No"
  defp check_prime(2), do: "Yes"
  defp check_prime(el) do
    limit = :math.sqrt(el) |> floor()
    
    is_prime = 2..limit
    |> Enum.all?(fn x -> rem(el, x) != 0 end)
    
    if is_prime, do: "Yes", else: "No"
  end
  
  def run do
    try do
      IO.write("Введите количество чисел N: ")
      n = IO.gets("") |> String.trim() |> Integer.parse()
      
      case n do
        {n, ""} when is_integer(n) and n > 0 ->
          IO.write("Введите #{n} чисел: ")
          input = IO.gets("") |> String.trim()
          
          numbers = input
          |> String.split()
          |> Enum.map(&Integer.parse/1)
          |> Enum.filter(fn {num, _} -> is_integer(num) end)
          |> Enum.map(fn {num, _} -> num end)
          
          if length(numbers) != n do
            IO.puts("Error: введено неверное количество чисел")
          else
            IO.puts(prime_numbers(n, numbers))
          end
        
        _ ->
          IO.puts("Error: N должно быть положительным целым числом")
      end
    rescue
      _ -> IO.puts("Error: некорректный ввод")
    end
  end
end

# Запуск
PrimeChecker.run()
