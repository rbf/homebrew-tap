class Pvm < Formula
  desc "Polyglot version manager for clojure, elixir, golang, node, php, ruby, and rust"
  homepage "https://github.com/rbf/pvm"
  url "https://github.com/rbf/pvm/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "65bcf2d1b7d6f5eca6081fafbf6b01b17c3325feb279854884da37cc507998ab"
  license "MIT"

  def install
    share.install Dir["*"]
    bin.install_symlink share/name
  end

  def caveats
    <<~EOS
      #{name} is in its version #{version} and currently only works for Zshell
      and on macOS. Bash and Linux compatibility might come in the future.

      Note that although #{name} leverages Docker to start containers for each
      environment, it expects Docker to be running in the system and does not
      start it if missing. If you do not have Docker installed on your machine,
      please consider e.g. checking out Docker Desktop at

          https://www.docker.com/products/docker-desktop

      Finally, please note that for now the following command needs to be
      manually added at the end of your .zshrc file to allow #{name} to load
      environments:

        $(#{name} --setup-zsh-env)

    EOS
  end

  test do
    assert_equal "#{name} #{version}\n", shell_output("#{bin}/#{name} --version")
  end
end
