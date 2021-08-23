# Powercli: Container Image

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/tnk4on/powercli)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/tnk4on/powercli)

- This description assumes the use of [Podman](https://github.com/containers/podman) and [Buildah](https://github.com/containers/buildah). If you are using Docker, please read as appropriate.

## Description

- **PowerCLI**: A multi-platform scripting language to manage your VMware infrastructure on any OS. 

### Reference
- [VMware PowerCLI - VMware {code}](https://code.vmware.com/tool/vmware-powercli)
- [vmware/powerclicore: PowerCLI Core Dockerfile](https://github.com/vmware/powerclicore)
- [PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell)

## About container images

There are four types of container images depending on how they are built
- `tnk4on/powercli:latest,mcr-alpine-3.12` -> Base Image:`mcr.microsoft.com/powershell:preview-alpine-3.12` (include PowerShell:`v7.2.0-preview.8)
- `tnk4on/powercli:ubi8-minimal` -> Base Image:`ubi8-minimal` + PowerShell:`v7.2.0-preview.8`
- `tnk4on/powercli:alpine-scratch` -> Base Image:`alpine` + PowerShell:`v7.2.0-preview.8`
- `tnk4on/powercli:photon` -> Base Image:`photon:4.0` + PowerShell:`v7.2.0-preview.8`

### Features

- Image size smaller than official VMware image(vmware/powerclicore)
- PowerCLI-Example-Scripts are not included
- `POWERSHELL_TELEMETRY_OPTOUT` is set to true

## How to use

```
$ podman run --rm -it tnk4on/powercli
```
Note: `CMD` is set to `pwsh` command. You can override the execution command by specifying the command as an argument.