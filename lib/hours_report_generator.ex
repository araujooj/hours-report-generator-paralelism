defmodule HoursReportGenerator do
  alias HoursReportGenerator.Parser

  def build(filename) do
    filename
    |> Parser.call()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([username, hours, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = merge_maps(all_hours, %{username => hours})
    hours_per_month = merge_year_and_month_maps(hours_per_month, %{username => %{month => hours}})
    hours_per_year = merge_year_and_month_maps(hours_per_year, %{username => %{year => hours}})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_year_and_month_maps(map1, map2) do
    Map.merge(map1, map2, fn _k, v1, v2 -> merge_maps(v1, v2) end)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp report_acc do
    build_report(%{}, %{}, %{})
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
