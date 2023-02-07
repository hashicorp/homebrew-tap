class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.4/consul-k8s_1.0.4_darwin_amd64.zip"
    sha256 "296a26908f0ca0e86a67af557e64f91f3dc334cb66986c27dba9671e9e32811e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.0.4/consul-k8s_1.0.4_darwin_arm64.zip"
    sha256 "fb24f1c4baab93047ecf8ea62b894e88cfb101bcb4708480766e96d68fd49a8b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.4/consul-k8s_1.0.4_linux_amd64.zip"
    sha256 "198476342f3d6542296adab3bdd20ee6474460376772e130a42dc75d13737a8e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.4/consul-k8s_1.0.4_linux_arm.zip"
    sha256 "351b6cb258e48691849eb5b8056869576eab82981a58487f1d957eaaddbee3d2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.4/consul-k8s_1.0.4_linux_arm64.zip"
    sha256 "ed4303d5dd3659a80c44d3016586cc050f6b1e191d695af630f94a9ab662c26e"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
