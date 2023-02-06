class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.12.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_darwin_amd64.zip"
    sha256 "9484a00d633cd09133eafc7107e3d615a1e259ec96c04c7d1ae3a25646d01802"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_darwin_arm64.zip"
    sha256 "5c4a40b9d74bbaceefa6b4c4bc782c57983bb14e3e308e58942b1d4b95f0884f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_amd64.zip"
    sha256 "f4825bad06e77687b407eff7423acb9238adfd545d7345f2a0bb9e81b0c4b1eb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_arm.zip"
    sha256 "3a163889d74f365d4946a61236a6d4c33b04d6ad31b6c94e0ae8921507bc9592"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_arm64.zip"
    sha256 "4c997edbffe87e912a1e43fc3f4989de341807a0ed055ebb87dc06c20556f6da"
  end

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  plist_options manual: "vault server -dev"

  def plist; <<~EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/vault</string>
        <string>server</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/vault.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/vault.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/vault --version"
  end
end
