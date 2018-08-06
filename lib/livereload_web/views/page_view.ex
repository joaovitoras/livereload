defmodule LivereloadWeb.PageView do
  use LivereloadWeb, :view

  def version do
    to_string(Application.spec(:livereload, :vsn))
  end
end
