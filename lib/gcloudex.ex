defmodule GCloudex do
  @moduledoc """
  Set of wrappers for Google Cloud Platform's services API's.
  """

  @doc """
  Returns the Google Project ID specified in the creds.json file in the configs.
  """
  @spec get_project_id :: binary
  def get_project_id do
    :goth
    |> Application.get_env(:json)
    |> decode()
  end

  defp decode(nil) do
    Application.get_env(:gcs_project)
  end

  defp decode(input) when is_binary(input) do
    input
    |> Poison.decode!()
    |> Map.get("project_id")
  end
end
