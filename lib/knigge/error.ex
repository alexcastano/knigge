defmodule Knigge.Error do
  @moduledoc false

  @spec default_for_required_callback!(env :: struct()) :: no_return
  def default_for_required_callback!(env) do
    raise_compile_error(
      "you can not define a default implementation for a required callback, as it will never be invoked.",
      env
    )
  end

  @spec module_not_loaded!(module :: module(), env :: struct()) :: no_return
  def module_not_loaded!(module, env) do
    raise_compile_error(
      "the given module could not be found: #{inspect(module)}",
      env
    )
  end

  defp raise_compile_error(message, env) do
    raise CompileError,
      description: message,
      file: env.file,
      line: env.line
  end
end
