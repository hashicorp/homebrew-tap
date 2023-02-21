package main

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestPrintOSSFormula(t *testing.T) {
	product := "consul"
	version := "1.13.2"
	config := "./config.hcl"
	buf := new(bytes.Buffer)
	expect := `class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.13.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_darwin_amd64.zip"
    sha256 "c2214b99fab0752fcc988fdae2add0437287332ef6b1f647ecee13d880af29eb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_darwin_arm64.zip"
    sha256 "054af8ce69b643ea5748a9604aed0e6b87f6176f901184430ee225f022743e32"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_amd64.zip"
    sha256 "a72e88cbfec6c0fb3620cd58314ff0b42fc9d605a5192d6a568a417180f0b35f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_arm.zip"
    sha256 "e507590c4d044bc50651a6a64c25a1d02fd94bd9aaa7f27f93865b750f32d735"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_arm64.zip"
    sha256 "f3c38df5abe515b29520ff72ef11f05013d8da25109da425b1b9e1df1f3c3cc6"
  end

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
`

	err := printFormula(product, version, config, buf)
	require.Nil(t, err)
	assert.Equal(t, expect, buf.String())
}

func TestPrintENTFormula(t *testing.T) {
	product := "consul-enterprise"
	version := "1.13.2+ent"
	config := "./config.hcl"
	buf := new(bytes.Buffer)
	expect := `class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.13.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_darwin_amd64.zip"
    sha256 "ab58cc9dd3ff5fe82e468423e7a27bfa8d2b494980394d8685505d85e1a2b3e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_darwin_arm64.zip"
    sha256 "01be28011910dc4f2efb3b347c40bfbc59d6b7d25641f3f0d2dfc767c76ab6b2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_amd64.zip"
    sha256 "5442ab15f7374c3488d5ea06a8fb72b97a19a0096b6fc587c7608387e28ab01d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_arm.zip"
    sha256 "b29f186f4ca3a33b6851da74455daa94308404bcbecbd95087b1cc5f95267711"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_arm64.zip"
    sha256 "cb76403a31ecec5e945b56d91aed71f1fad0ee68102a4afead2f0c42274374d5"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
`

	err := printFormula(product, version, config, buf)
	require.Nil(t, err)
	assert.Equal(t, expect, buf.String())
}
