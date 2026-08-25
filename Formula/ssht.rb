class Ssht < Formula
  desc "Smart SSH session manager that auto-attaches to persistent tmux sessions"
  homepage "https://github.com/mayaanhafeez/ssht"
  url "https://github.com/mayaanhafeez/ssht/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "e86000798b02782d9ce7df98b60ee7c6ecebad07c8ad1cf809389d3fee343276"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ssht", "--help"
  end
end
