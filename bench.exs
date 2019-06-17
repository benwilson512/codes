Benchee.run(
  %{
    "v1" => fn -> Codes.V1.random_code() end,
    "v2" => fn -> Codes.V2.generate_random_discount_code() end,
    "v3" => fn -> Codes.V3.generate() end
  },
  time: 10
)
