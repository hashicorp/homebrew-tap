class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.1/consul-k8s_1.0.1_darwin_amd64.zip"
    sha256 "257483157cdf458b791fab9991923a4830631b61dbcd3fc72f970800ab429058"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.0.1/consul-k8s_1.0.1_darwin_arm64.zip"
    sha256 "70177dc53ad8f279dd8feff68b35a1345869557de5f0a4113cfbbe5d2956249b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.1/consul-k8s_1.0.1_linux_amd64.zip"
    sha256 "474e19e649b6f1db91b149ac45c0d6166c636688cd5b954d64861b3d6b16032b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.1/consul-k8s_1.0.1_linux_arm.zip"
    sha256 "0f9b5e42be0539736729218fcec68902755a54a4b18eaaa61e2e17c8b410615b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.1/consul-k8s_1.0.1_linux_arm64.zip"
    sha256 "6247bc585e6aadb80bb151c438ba3163d20676677e0f75f0346e351e6c8dbd41"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
