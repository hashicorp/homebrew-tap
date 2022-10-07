class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.4.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.1+ent/nomad_1.4.1+ent_darwin_amd64.zip"
    sha256 "d379c70ecafad3499ae0b56cef97dca1b6e6f7e2f84d0be81beb71abe6214fec"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.1+ent/nomad_1.4.1+ent_darwin_arm64.zip"
    sha256 "fbd00590a6f168fe01dc473b1b4952ba52588433700841d4fdf1e63b91f5641a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.1+ent/nomad_1.4.1+ent_linux_amd64.zip"
    sha256 "818ad4a68fdd7ac16cbf8f22fef50786963cf53c786965d5eddc157ea6780bc4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.1+ent/nomad_1.4.1+ent_linux_arm.zip"
    sha256 "93fe8c662332f92cbc9b842243478a5af52fb79f1913833b5ae6a18f3faead88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.1+ent/nomad_1.4.1+ent_linux_arm64.zip"
    sha256 "54307d15502b2578694965b991abdec65b3cfcd9c6b3ff91ec4bf3ce44a41610"
  end

  conflicts_with "nomad-enterprise"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

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
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/nomad --version"
  end
end
