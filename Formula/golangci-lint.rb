# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.34.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-darwin-amd64.tar.gz"
    sha256 "33ccf959d6ea0307907aeaa7ed1a7d711cf6c8987bd265f2b579d1b2810c58fe"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-amd64.tar.gz"
      sha256 "e26d0e65ffac321018d1754d76cecaf050545e279eed03a078730635c5b8248d"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-arm64.tar.gz"
        sha256 "4fedc0681117af199b4b20355b5c7bcf0f84a6e6ea12842b45bedbfe75c62b84"
      else
        url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-armv6.tar.gz"
        sha256 "1860cde2fa0f311905a6a98c41fa69ad800adc3db3abffec070864aa9894b909"
      end
    end
  end

  def install
    bin.install "golangci-lint"
    output = Utils.popen_read("#{bin}/golangci-lint completion bash")
    (bash_completion/"golangci-lint").write output
    output = Utils.popen_read("#{bin}/golangci-lint completion zsh")
    (zsh_completion/"_golangci-lint").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/golangci-lint --version"
  end
end
