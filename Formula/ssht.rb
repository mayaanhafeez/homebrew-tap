class Ssht < Formula
  desc "Smart SSH session manager that auto-attaches to persistent tmux sessions"
  homepage "https://github.com/mayaanhafeez/ssht"
  url "https://github.com/mayaanhafeez/ssht/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "34ac1d5f0cb92f9463dda0e9f7037f569951cd57242eb76ec449e2282a9a6d77"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ssht", "--help"
  end
end
