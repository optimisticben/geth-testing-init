# geth-testing-init

Deploy to a new namespace

Create the new, unique namespace.

```
kubectl create ns <YOUR_NS_NAME>
```

Edit `kustomization.yaml` to use your namespace by updateing the `namespace` field.

View pending changes

```
kubectl diff -k .
```

Apply your changes

```
kubectl apply -k .
```
