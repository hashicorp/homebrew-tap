class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.10.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.4/vault_1.10.4_darwin_amd64.zip"
    sha256 "4f33fc0c1840cd2054f66706b8f4a2271abc5d7e257e4c245b8e66978bb991e7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.10.4/vault_1.10.4_darwin_arm64.zip"
    sha256 "e78a336fb87c689e06e27672ef99434cede6f639e8d52e8104025defd301bdc6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.4/vault_1.10.4_linux_amd64.zip"
    sha256 "0cfa7796139baf58365e10c4a353e72e56ef6332f4c9a4e66b6ae9a244167346"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.4/vault_1.10.4_linux_arm.zip"
    sha256 "b6bc5ef9fbdacd3076c016184a91499a51cebdab41238deb80d0e2d88a615d1e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.4/vault_1.10.4_linux_arm64.zip"
    sha256 "fe205af098a0a8cadad7c2ab197c4b71f64891e3a8a36d7aa08935e8cc16a003"
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
