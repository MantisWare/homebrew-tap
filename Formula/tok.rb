class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.1/tok-aarch64-apple-darwin.tar.gz"
    sha256 "316d6c65bd1dc81754b721c8a424dad7a73a71b9cf95d4dbbbd5e720c28ea912"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.1/tok-x86_64-apple-darwin.tar.gz"
    sha256 "43b862f9fa66a2b9e023d08d0a1158db3c5eb78d3f2c6b731dc97936ac1a7938"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.1/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a4ccdf144895146e187bece25ae38eae6c5118cfef935a729b3e9b64f15bfe92"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.1/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b05eae2a15aeb9973ab95476a0f3af06d86471a21c5071abee22a86d9c418b60"
  end

  def install
    bin.install "tok"
  end

  def caveats
    <<~EOS
      tok is installed! Get started:

        # Initialize for Claude Code
        tok init -g          # Global hook-first setup (recommended)
        tok init             # Add to ./CLAUDE.md (this project only)

        # See all commands
        tok --help

        # Measure your token savings
        tok gain

      Full documentation: https://github.com/MantisWare/tok
    EOS
  end

  test do
    system "#{bin}/tok", "--version"
  end
end
