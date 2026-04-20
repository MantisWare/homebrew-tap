class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.6/tok-aarch64-apple-darwin.tar.gz"
    sha256 "cf26cacbd3adb60d5017366fa602f27d04439cd6cdaece7b1652e193c7f6452e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.6/tok-x86_64-apple-darwin.tar.gz"
    sha256 "9e4a464e9ba9744a234502fb442c14c07a0e6ba7d80d205906306f1840823380"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.6/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0851213156c21e35eeb28705e77d4aa271486a368f69a433bce26ca17546ddd9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.6/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f88a84fea3c0b2c35eae7f4fe7353b0bf084987e501f531764a16e48fc30a354"
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

    tok 0.1.6 — Token Optimization Kit
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
