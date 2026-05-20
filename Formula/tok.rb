class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.20"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.20/tok-aarch64-apple-darwin.tar.gz"
    sha256 "f51a97950eab747358f6f1393e5b726616124b19f2da5e200ce86ede452cd092"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.20/tok-x86_64-apple-darwin.tar.gz"
    sha256 "d38f9058d0e4c407a36262205eaf186025b624035dba5820f62e67fd16f57c67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.20/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6da33f3027a40427b659046803d36a1b43ff6ed9c64b58df5ddd5eb5738a715a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.20/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d88c9d55a1296534d747e3a80174177217cc9c84eb1888942b5766e02fc515b1"
  end

  def install
    bin.install "tok"
  end

  def caveats; <<~CAVEATS

      ████████╗  ██████╗   ██╗  ██╗
      ╚══██╔══╝ ██╔═══██╗  ██║ ██╔╝
         ██║    ██║   ██║  █████╔╝
         ██║    ██║   ██║  ██╔═██╗
         ██║     ╚████╔╝   ██║  ██╗
         ╚═╝      ╚═══╝    ╚═╝  ╚═╝

    tok 0.1.20 — Token Optimization Kit
    Squeeze noisy CLI output before it hits your LLM

  ── Quick Start ─────────────────────────────────────────

    # 1. Install for your AI tool
    tok init -g                  # Claude Code (recommended)
    tok init -g --gemini         # Gemini CLI
    tok init -g --codex          # Codex (OpenAI)
    tok init -g --agent cursor   # Cursor

    # 2. Restart your AI tool, then test
    tok --version                # Verify installation
    tok gain                     # View token savings

  ── What It Does ────────────────────────────────────────

    tok sits between your shell and your LLM, filtering
    command output for 60-90% token savings:

    tok git status          # Compact status
    tok cargo test          # Failures only (-90%)
    tok ls .                # Token-optimized tree
    tok grep "pattern" .    # Grouped results

  ── Resources ───────────────────────────────────────────

    Docs:   https://github.com/MantisWare/tok
    Help:   tok --help
    Issues: https://github.com/MantisWare/tok/issues

  CAVEATS
  end

  test do
    system "#{bin}/tok", "--version"
  end
end
