defmodule Codes do
  defmodule V1 do
    def random_code() do
      charset = "CDEFGHJKLMNPQRTUVWXYZ23679" |> String.split("", trim: true)

      random_chars =
        Enum.reduce(0..16, [], fn _i, acc ->
          [Enum.random(charset) | acc]
        end)
        |> Enum.join("")

      group_a = String.slice(random_chars, 1..4)
      group_b = String.slice(random_chars, 5..8)
      group_c = String.slice(random_chars, 9..12)
      group_d = String.slice(random_chars, 13..16)

      "#{group_a}-#{group_b}-#{group_c}-#{group_d}"
    end
  end

  defmodule V2 do
    def generate_strong_random_string(length, case \\ :upper) do
      # TODO: limit this to charset: CDEFGHJKLMNPQRTUVWXYZ23679
      :crypto.strong_rand_bytes(length)
      |> Base.encode32(case: case)
      |> binary_part(0, length)
    end

    def generate_random_discount_code() do
      group_a = generate_strong_random_string(4)
      group_b = generate_strong_random_string(4)
      group_c = generate_strong_random_string(4)
      group_d = generate_strong_random_string(4)

      "#{group_a}-#{group_b}-#{group_c}-#{group_d}"
    end
  end
end
