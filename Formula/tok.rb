class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.19"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.19/tok-aarch64-apple-darwin.tar.gz"
    sha256 "c5ae980fe65e3123a23aa7175fdc2c65617b51eb56ad367a746f0cfa6d4e963c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.19/tok-x86_64-apple-darwin.tar.gz"
    sha256 "566c301a8f709574ee31a04110bfc8dfd72a1fefa5b345febd89478baade6cbe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.19/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c6182afbd844b1291258bd4b225edb05aa69e28a7c912cf768431d8cf29f790"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.19/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "284a218e2505d3d114f092b91100429c74b65db41fded9b8a0765a5f0d16c38d"
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

    tok 0.1.19 — Token Optimization Kit
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
