class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.3.3"

  if OS.mac?
    url "https://releases.hashicorp.com/nomad/1.3.3/nomad_1.3.3_darwin_amd64.zip"
    sha256 "30bf4a8b1cba0e11cf20e4aa49467efe52252942cdb88a1e6cf31bdd069cd020"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.3.3/nomad_1.3.3_linux_amd64.zip"
    sha256 "d908811cebe2a8373e93c4ad3d09af5c706241878ff3f21ee0f182b4ecb571f2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.3.3/nomad_1.3.3_linux_arm.zip"
    sha256 "e492167d1b897a341a875a0e112af76a3e5b0d727681278b6d7bae717072edc4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.3.3/nomad_1.3.3_linux_arm64.zip"
    sha256 "b56e98b22268e21910ffc9039f2bf6dac05bd8b07daa64f9c93739d43fb21991"
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
