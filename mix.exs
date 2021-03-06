defmodule ExFormat.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :ex_format,
      version: "0.1.0",
      elixir: "~> 1.5",
      escript: [main_module: ExFormat.CLI],
      build_embedded: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "ExFormat",
      source_url: "https://github.com/uohzxela/ex_format"
    ]
  end

  defp elixirc_paths(:test) do
    ["lib", "test/support"]
  end

  defp elixirc_paths(_) do
    ["lib"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application() do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps() do
    [
      {:ex_doc, "~> 0.16", only: :dev},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
    ]
  end

  defp description() do
    "ExFormat formats Elixir source code according to a standard set of rules."
  end

  defp package() do
    [
      name: "ex_format",
      maintainers: ["Alex Jiao"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/uohzxela/ex_format"}
    ]
  end
end
