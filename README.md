# Simple application helm template

# Usage

```bash
git clone https://github.com/yaxin-cn/helm-template.git
cd helm-template
cp values.yaml values.prod.yaml
# modify values.prod.yaml as you want
helm install -f values.prod.yaml <name> ../helm-template
```
