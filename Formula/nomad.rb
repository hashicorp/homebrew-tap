class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.2/nomad_1.4.2_darwin_amd64.zip"
    sha256 "ce431bc1bda7443d58f78b2fe0ee528d7821a296812d0e9bdec52d09a62b4791"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.2/nomad_1.4.2_darwin_arm64.zip"
    sha256 "d1523ca8b1f584d186ab45dcc0478833279ab01d558280ee6a6a296d80939a15"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.2/nomad_1.4.2_linux_amd64.zip"
    sha256 "6e24efd6dfba0ba2df31347753f615cae4d3632090e68fc90933e51e640f7afc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.2/nomad_1.4.2_linux_arm.zip"
    sha256 "e8d8c3c76fbf5947252db3c0d87511427e6072510eae60a405f948862c949ee6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.2/nomad_1.4.2_linux_arm64.zip"
    sha256 "ceb6c11a565ff207e4c9d7d69829329bae573ccb999f386f7b95e8c949a5e4ee"
  end

  conflicts_with "nomad"

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
