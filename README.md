A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add blobscan-helm-charts https://blobscan.github.io/blobscan-helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run the following command to see the charts.

```sh
helm search repo blobscan-helm-charts
```

To install the blobscan chart:

```sh
helm install blobscan blobscan-helm-charts/blobscan
```

To uninstall the chart:

```sh
helm delete blobscan
```

## More infos

You can find the source code for all charts under [github.com/blobscan/blobscan-helm-charts](https://github.com/blobscan/blobscan-helm-charts/).
