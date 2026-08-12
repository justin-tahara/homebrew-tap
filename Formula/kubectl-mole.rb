# Updated by goreleaser on each kubectl-mole release.
#
# This is a formula, not a cask, on purpose: Homebrew quarantines cask
# downloads, and Gatekeeper kills quarantined binaries that are not
# notarized. Formula downloads are not quarantined.
class KubectlMole < Formula
  desc "Watch Kubernetes workloads until they settle, then explain what broke"
  homepage "https://github.com/justin-tahara/kubectl-mole"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justin-tahara/kubectl-mole/releases/download/v0.1.0/kubectl-mole_v0.1.0_darwin_arm64.tar.gz"
      sha256 "dbd067f307034896c795a57398bcbda0979c848215ba75c8d10ceefa291a48ce"
    else
      url "https://github.com/justin-tahara/kubectl-mole/releases/download/v0.1.0/kubectl-mole_v0.1.0_darwin_amd64.tar.gz"
      sha256 "40a6eeb3c6bb4a95b1190d97e58e070c11b176f5f626b131c79c92a4308ec644"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/justin-tahara/kubectl-mole/releases/download/v0.1.0/kubectl-mole_v0.1.0_linux_arm64.tar.gz"
      sha256 "a422a6e176f677e9050c6f2caf36926c325550fb5143dcab6af073c662686d48"
    else
      url "https://github.com/justin-tahara/kubectl-mole/releases/download/v0.1.0/kubectl-mole_v0.1.0_linux_amd64.tar.gz"
      sha256 "52ae8dec9b8d39eae9d943e432fa8ee66a06d32966214e16da78462b235b8467"
    end
  end

  def install
    bin.install "kubectl-mole"
  end

  def caveats
    <<~EOS
      kubectl-mole needs read access to workloads, pods, and events.
      A minimal ClusterRole ships with the repo: deploy/rbac.yaml
    EOS
  end

  test do
    assert_match "kubectl-mole version v#{version}", shell_output("#{bin}/kubectl-mole --version")
  end
end
