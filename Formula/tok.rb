class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.2/tok-aarch64-apple-darwin.tar.gz"
    sha256 "a6f42c2096ceb499f2bd12df4b42613b9a3d698cc08b5af0745615096b8181da"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.2/tok-x86_64-apple-darwin.tar.gz"
    sha256 "f3a908931dead0a8b1079a58ea03c920364e9b7b749b6015275764632b2bd713"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.2/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e1a3f155d1ab092a068f559371ccb42d87d96dddfc5e3c3d39a4c0018a243c4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.2/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "31664091107947f6acd230b018fe117f000f7f86d7171dfce8ebf615c20f2d8b"
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
