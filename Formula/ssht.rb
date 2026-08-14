class Ssht < Formula
  desc "Smart SSH session manager that auto-attaches to persistent tmux sessions"
  homepage "https://github.com/mayaanhafeez/ssht"
  url "https://github.com/mayaanhafeez/ssht/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3419c1019fb8e2bdfd73603d1219adaee043e5327fb968d6c0e4ab3b162bcbe7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ssht", "--help"
  end
end
