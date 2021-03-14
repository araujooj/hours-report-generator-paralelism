defmodule HoursReportGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      filename = "gen_report_test"

      response = HoursReportGenerator.build(filename)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 58,
          "Daniele" => 35,
          "Danilo" => 30,
          "Diego" => 51,
          "Giuliano" => 38,
          "Jakeliny" => 57,
          "Joseph" => 48,
          "Mayk" => 50,
          "Rafael" => 35,
          "Vinicius" => 30
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            abril: 5,
            dezembro: 6,
            fevereiro: 1,
            julho: 7,
            junio: 13,
            maio: 4,
            março: 8,
            outubro: 14
          },
          "Daniele" => %{
            abril: 7,
            dezembro: 5,
            fevereiro: 1,
            janeiro: 5,
            junio: 5,
            maio: 8,
            outubro: 4
          },
          "Danilo" => %{abril: 1, fevereiro: 7, junio: 3, março: 4, novembro: 7, outubro: 8},
          "Diego" => %{
            abril: 8,
            agosto: 5,
            dezembro: 1,
            fevereiro: 2,
            julho: 11,
            junio: 6,
            maio: 1,
            março: 14,
            setembro: 3
          },
          "Giuliano" => %{
            abril: 7,
            agosto: 3,
            dezembro: 2,
            fevereiro: 9,
            maio: 4,
            novembro: 8,
            setembro: 5
          },
          "Jakeliny" => %{
            agosto: 7,
            dezembro: 9,
            julho: 14,
            junio: 4,
            maio: 1,
            março: 14,
            outubro: 8
          },
          "Joseph" => %{
            abril: 4,
            agosto: 5,
            dezembro: 20,
            julho: 4,
            maio: 3,
            março: 3,
            novembro: 5,
            setembro: 4
          },
          "Mayk" => %{
            abril: 4,
            dezembro: 9,
            julho: 7,
            junio: 3,
            março: 15,
            novembro: 4,
            setembro: 8
          },
          "Rafael" => %{abril: 2, agosto: 11, janeiro: 9, julho: 13},
          "Vinicius" => %{agosto: 8, julho: 8, junio: 6, março: 3, outubro: 5}
        },
        "hours_per_year" => %{
          "Cleiton" => %{2016 => 4, 2017 => 7, 2018 => 13, 2019 => 6, 2020 => 28},
          "Daniele" => %{2016 => 15, 2017 => 3, 2018 => 12, 2020 => 5},
          "Danilo" => %{2016 => 7, 2017 => 7, 2018 => 1, 2019 => 14, 2020 => 1},
          "Diego" => %{2016 => 4, 2017 => 24, 2018 => 7, 2019 => 1, 2020 => 15},
          "Giuliano" => %{2016 => 7, 2017 => 8, 2018 => 9, 2019 => 6, 2020 => 8},
          "Jakeliny" => %{2016 => 16, 2017 => 9, 2018 => 6, 2019 => 13, 2020 => 13},
          "Joseph" => %{2017 => 4, 2018 => 3, 2019 => 7, 2020 => 34},
          "Mayk" => %{2016 => 11, 2017 => 8, 2019 => 13, 2020 => 18},
          "Rafael" => %{2016 => 11, 2017 => 18, 2019 => 2, 2020 => 4},
          "Vinicius" => %{2016 => 8, 2017 => 6, 2020 => 16}
        }
      }

      assert response == expected_response
    end
  end
end
