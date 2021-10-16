# Powercli: Container Image

Curent Version: PowerShell:`v7.1.5`

Dowonload ---> [[Quay.io](https://quay.io/repository/tnk4on/powercli): [![tnk4on/powercli on Quay.io](https://quay.io/repository/tnk4on/powercli/status "tnk4on/powercli on Quay.io")](https://quay.io/repository/tnk4on/powercli)] or [[Docker.io](https://hub.docker.com/r/tnk4on/powercli)]

[English](README.md) / [Japanese](README_ja.md)

- このリポジトリでは[Podman](https://github.com/containers/podman)と[Buildah](https://github.com/containers/buildah)での使用を前提として記載しています。Dockerをお使いの場合は適宜読み替えてください。

## 概要

- **PowerCLI**: 様々なOS上でVMwareインフラストラクチャを管理するためのマルチプラットフォームのスクリプト言語です。

### 参考
- [VMware PowerCLI - VMware {code}](https://code.vmware.com/tool/vmware-powercli)
- [vmware/powerclicore: PowerCLI Core Dockerfile](https://github.com/vmware/powerclicore)
- [PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell)

## コンテナイメージについて

コンテナイメージのビルド方式により下記の4種類があります
- `tnk4on/powercli:latest,mcr-alpine-3.13` -> Base Image:`mcr.microsoft.com/powershell:mcr-alpine-3.13`
- `tnk4on/powercli:ubi8-minimal` -> Base Image:`ubi8-minimal`
- `tnk4on/powercli:alpine-scratch` -> Base Image:`alpine`
- `tnk4on/powercli:photon` -> Base Image:`photon:4.0`

### 機能の特徴

- VMware公式のイメージ([vmware/powerclicore](https://github.com/vmware/powerclicore))よりも小さいイメージサイズ
- PowerCLI-Example-Scripts は含まれません
- `POWERSHELL_TELEMETRY_OPTOUT` は有効化されています（オプトアウト）

## 使い方

```
$ podman run --rm -it tnk4on/powercli
```
注釈: `CMD` には `pwsh` コマンドが設定されます。引数にコマンドを指定することで、実行コマンドを上書きすることができます。

## コンテナイメージのビルド方法

```
$ git clone https://github.com/tnk4on/powercli
$ cd powercli/Containerfile.d
$ TYPE=mcr-alpine
$ buildah bud -t tnk4on/powercli -f Containerfile.${TYPE}
```
注釈: `TYPE` にはビルドしたい名前を指定 (例 alpine-scratch)
- `TYPE`
    - alpine-scratch
    - mcr-alpine
    - photon
    - ubi8-minimal