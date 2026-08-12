# Updated by goreleaser on each kubectl-mole release.
cask "kubectl-mole" do
  version "0.1.0"

  on_intel do
    url "https://github.com/justin-tahara/kubectl-mole/releases/download/v#{version}/kubectl-mole_v#{version}_darwin_amd64.tar.gz"
    sha256 "40a6eeb3c6bb4a95b1190d97e58e070c11b176f5f626b131c79c92a4308ec644"
  end
  on_arm do
    url "https://github.com/justin-tahara/kubectl-mole/releases/download/v#{version}/kubectl-mole_v#{version}_darwin_arm64.tar.gz"
    sha256 "dbd067f307034896c795a57398bcbda0979c848215ba75c8d10ceefa291a48ce"
  end

  binary "kubectl-mole"

  name "kubectl-mole"
  desc "Watch Kubernetes workloads until they settle, then explain what broke"
  homepage "https://github.com/justin-tahara/kubectl-mole"

  caveats <<~EOS
    kubectl-mole needs read access to workloads, pods, and events.
    A minimal ClusterRole ships with the repo: deploy/rbac.yaml
  EOS
end
