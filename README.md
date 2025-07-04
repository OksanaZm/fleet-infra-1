flux discovering

to install
brew install fluxcd/tap/flux

create(or use existed) and export git user login and token
it will remain in a session 
export GITHUB_TOKEN=<your-token>
export GITHUB_USER=<your-username>

followed by quickstart 

flux bootstrap github \
--owner=$GITHUB_USER \
--repository=fleet-infra \
--branch=main \
--path=./clusters/my-cluster \
--personal

will cause an error if you do not have manually commit smth beforehand

