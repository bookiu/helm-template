# Helm部署模板

# 使用

下载该项目到你项目的`deployments/kubernetes/helm`（该目录可以自定义）文件夹中，按自己需求修改`Chart.yaml`文件中的`name`、`description`和`appVersion`等值。安装命令如下：

```bash
helm upgrade --install --create-namespace \
    --namespace=your_namespace \
    --set image.secret.username=123 \
    --set image.secret.password=456 \
    --set image.tag=v1.1.1 \
    your_app_name ./deployments/kubernetes/helm

```
