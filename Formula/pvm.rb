class Pvm < Formula
  desc "Polyglot version manager for clojure, elixir, golang, node, php, ruby, and rust"
  homepage "https://github.com/rbf/pvm"
  url "https://github.com/rbf/pvm/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "afb5bf2699115d5f36e92e244b6a59ab18df96cb68a7fdbde45ccad0da0aa25b"
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
