class Ssht < Formula
  desc "Smart SSH session manager that auto-attaches to persistent tmux sessions"
  homepage "https://github.com/mayaanhafeez/ssht"
  url "https://github.com/mayaanhafeez/ssht/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "97ac8c63c0a98f85755d45ea616fbb23d3d49ff2005a87ea2038acdb6f8194a9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ssht", "--help"
  end
end
