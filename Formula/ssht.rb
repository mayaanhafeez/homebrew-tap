class Ssht < Formula
  desc "Smart SSH session manager that auto-attaches to persistent tmux sessions"
  homepage "https://github.com/mayaanhafeez/ssht"
  url "https://github.com/mayaanhafeez/ssht/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "58dd165cd9852222fbe189f9cbff30f659cb5f89f685996d282db246131a4a1c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ssht", "--help"
  end
end
