# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.34.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-darwin-amd64.tar.gz"
    sha256 "30673fe6363228f62ae079cb937fc7ca384a357b3eece32e43fc9b0f60f698e7"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-amd64.tar.gz"
      sha256 "04dff94726c16c2f3b01a27921da27b814009234f37ef5cbc4ca523250cfb04f"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-arm64.tar.gz"
        sha256 "d632d225eaa243a8857eb8125921ff404ab845a023a65e07662d80fddab26679"
      else
        url "https://github.com/prakritichauhan07/golangci-lint/releases/download/v1.34.0/golangci-lint-1.34.0-linux-armv6.tar.gz"
        sha256 "586dc0cd51a28c062ca1faee276812dd3767c3818b6c1084f2de6a85c6357943"
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
