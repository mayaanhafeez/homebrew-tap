class KeyboardCleanerCli < Formula
  desc "Temporarily freeze the keyboard so you can clean it"
  homepage "https://github.com/mayaanhafeez/keyboard_cleaner"
  url "https://github.com/mayaanhafeez/keyboard_cleaner/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c58aa180e163529724b950889b0ec9f5888e471fff1eeb372737f3830ffa8f4f"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "keyboard_cleaner.swift", "-o", "keyboard_cleaner"
    bin.install "keyboard_cleaner"
  end

  def caveats
    <<~EOS
      keyboard_cleaner intercepts keyboard input via a CGEventTap, which
      requires Accessibility permission for whatever terminal launches it.

      Grant it under System Settings -> Privacy & Security -> Accessibility,
      then fully quit and reopen your terminal before running keyboard_cleaner.
    EOS
  end

  test do
    assert_path_exists bin/"keyboard_cleaner"
  end
end
