cask "macwifi" do
  version "0.1.1"
  sha256 "3c6f1dc0fffddc025cad162c4625150e97443c93d5767780b65b390e7eab16ea"

  url "https://github.com/mayaanhafeez/macwifi/archive/refs/tags/v#{version}.tar.gz"
  name "macwifi"
  desc "TUI for managing Wi-Fi on macOS, built on CoreWLAN"
  homepage "https://github.com/mayaanhafeez/macwifi"

  depends_on formula: "rust"
  depends_on macos: ">= :ventura"

  # There's no prebuilt binary to download: this builds macwifi from source
  # (cargo + the project's own bundle.sh) and ad-hoc signs the result, the
  # same way `just bundle` does locally. That sidesteps needing a paid Apple
  # Developer ID: Gatekeeper's notarization gate only fires on quarantined,
  # pre-built downloads, and nothing here was ever downloaded as a binary.
  preflight do
    system_command "cargo",
                    args: ["build", "--release", "--manifest-path", "#{staged_path}/Cargo.toml"],
                    env:  { "CARGO_TARGET_DIR" => "#{staged_path}/target" }

    system_command "#{staged_path}/scripts/bundle.sh",
                    env: { "CARGO_TARGET_DIR" => "#{staged_path}/target" }
  end

  app "target/release/macwifi.app"

  binary "#{appdir}/macwifi.app/Contents/MacOS/macwifi"

  # Registers the LaunchAgent and waits for the daemon socket, exactly what
  # `macwifi install-daemon` already does when run by hand.
  postflight do
    system_command "/Applications/macwifi.app/Contents/MacOS/macwifi",
                    args: ["install-daemon"]
  end

  uninstall script: {
              executable: "/Applications/macwifi.app/Contents/MacOS/macwifi",
              args:       ["uninstall-daemon"],
            },
            launchctl: "dev.macwifi.daemon"

  zap trash: [
    "~/Library/Application Support/macwifi",
    "~/.config/macwifi",
    "~/Library/LaunchAgents/dev.macwifi.daemon.plist",
  ]

  caveats do
    <<~EOS
      On first launch, macOS will prompt for Location permission — required
      for CoreWLAN to return real SSIDs instead of blank/redacted ones.
      Click "Allow While Using App".

      Built with ad-hoc code signing (no Apple Developer ID). Wi-Fi
      passwords cached in Keychain and the Location grant are tied to the
      app's signature, so they won't survive a rebuild with a different
      signing identity — re-upgrading via Homebrew will ask you to
      re-grant Location and re-enter saved passwords once.
    EOS
  end
end
