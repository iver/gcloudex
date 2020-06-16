defmodule GCloudex.Mixfile do
  use Mix.Project

  @version "0.4.5"

  def project do
    [
      app: :gcloudex,
      version: @version,
      elixir: "~> 1.2",
      description: description(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def description() do
    """
    Google Cloud for Elixir. Friendly set of wrappers for Google Cloud Platform API's.
    """
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :goth]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11"},
      {:goth,      "~> 0.5.0"},
      {:poison,    "~> 3.0"},
      {:credo,     "~> 0.3.13", only: [:dev, :test]},
      {:ex_doc,    ">= 0.11.0", only: [:dev]},
      {:earmark,   ">= 0.0.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Iván Jaimes"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/iver/gcloudex"}
    ]
  end
end
