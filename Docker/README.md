<div align="center" id="top"> 
  <img src="./.github/app.gif" alt="Aws Terraform 1" />

  &#xa0;

  <!-- <a href="https://awsterraform1.netlify.app">Demo</a> -->
</div>

<h1 align="center">Aws Terraform 1</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8">

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/{{YOUR_GITHUB_USERNAME}}/aws-terraform-1?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Aws Terraform 1 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/{{YOUR_GITHUB_USERNAME}}" target="_blank">Author</a>
</p>

<br>

## :dart: About ##
Create Terraform Infrastructure with a Docker NGINX container. 

## :sparkles: Features ##

:heavy_check_mark: Provision and destroyed an NGINX webserver with Terraform.\
## :rocket: Technologies ##

The following tools were used in this project:

- [Link to download Visual Studio Code:](https://code.visualstudio.com/#alt-downloads) 
- [Terraform Plugins:](https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
- [Terraform Plugins:](https://marketplace.visualstudio.com/items?itemName=erd0s.terraform-autocomplete)

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) and [Node](https://nodejs.org/en/) installed.

## :checkered_flag: Starting ##

```bash
# In vscode create a main.tf file. 
# Copy and paste the following configuration. Save your changes in main.tf
$ terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

# In the "Terminal" tab, initialize the project, which downloads a plugin that allows Terraform to interact with Docker.
$ terraform init

# Provision the NGINX server container with apply. When Terraform asks you to confirm, type yes and press ENTER.
$ terraform apply

# Verify NGINX instance Run docker ps to view the NGINX container running in Docker via Terraform.
$ docker ps

# Destroy resources
# To stop the container and destroy the resources created in this tutorial, run terraform destroy. When Terraform asks you to confirm, type # yes and press ENTER.
$ terraform destroy

```

## terraform apply output ## 
```
❯ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach           = false
      + bridge           = (known after apply)
      + command          = (known after apply)
      + container_logs   = (known after apply)
      + entrypoint       = (known after apply)
      + env              = (known after apply)
      + exit_code        = (known after apply)
      + gateway          = (known after apply)
      + hostname         = (known after apply)
      + id               = (known after apply)
      + image            = (known after apply)
      + init             = (known after apply)
      + ip_address       = (known after apply)
      + ip_prefix_length = (known after apply)
      + ipc_mode         = (known after apply)
      + log_driver       = "json-file"
      + logs             = false
      + must_run         = true
      + name             = "tutorial"
      + network_data     = (known after apply)
      + read_only        = false
      + remove_volumes   = true
      + restart          = "no"
      + rm               = false
      + security_opts    = (known after apply)
      + shm_size         = (known after apply)
      + start            = true
      + stdin_open       = false
      + tty              = false

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "nginx:latest"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 15s [id=sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39fnginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=292ab0ee79c7ed55a8169785b094e2927dd6fa525690454e753878df22cb20ef]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

```

## Docker ps ##
```
❯ docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED              STATUS              PORTS                  NAMES
292ab0ee79c7   76c69feac34e                    "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8000->80/tcp   tutorial
95973d7d3f43   jordanistan/nginx-demo:latest   "/bin/bash"              4 weeks ago          Up 4 weeks          80/tcp, 443/tcp        inspiring_hertz
```

## terraform destroy ## 
```
❯ terraform destroy

docker_image.nginx: Refreshing state... [id=sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39fnginx:latest]
docker_container.nginx: Refreshing state... [id=292ab0ee79c7ed55a8169785b094e2927dd6fa525690454e753878df22cb20ef]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach            = false -> null
      - command           = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - cpu_shares        = 0 -> null
      - dns               = [] -> null
      - dns_opts          = [] -> null
      - dns_search        = [] -> null
      - entrypoint        = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env               = [] -> null
      - gateway           = "172.17.0.1" -> null
      - group_add         = [] -> null
      - hostname          = "292ab0ee79c7" -> null
      - id                = "292ab0ee79c7ed55a8169785b094e2927dd6fa525690454e753878df22cb20ef" -> null
      - image             = "sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39f" -> null
      - init              = false -> null
      - ip_address        = "172.17.0.3" -> null
      - ip_prefix_length  = 16 -> null
      - ipc_mode          = "private" -> null
      - links             = [] -> null
      - log_driver        = "json-file" -> null
      - log_opts          = {} -> null
      - logs              = false -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
      - must_run          = true -> null
      - name              = "tutorial" -> null
      - network_data      = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> null
      - network_mode      = "default" -> null
      - privileged        = false -> null
      - publish_all_ports = false -> null
      - read_only         = false -> null
      - remove_volumes    = true -> null
      - restart           = "no" -> null
      - rm                = false -> null
      - security_opts     = [] -> null
      - shm_size          = 64 -> null
      - start             = true -> null
      - stdin_open        = false -> null
      - storage_opts      = {} -> null
      - sysctls           = {} -> null
      - tmpfs             = {} -> null
      - tty               = false -> null

      - ports {
          - external = 8000 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39fnginx:latest" -> null
      - keep_locally = false -> null
      - latest       = "sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39f" -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:943c25b4b66b332184d5ba6bb18234273551593016c0e0ae906bab111548239f" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

docker_container.nginx: Destroying... [id=292ab0ee79c7ed55a8169785b094e2927dd6fa525690454e753878df22cb20ef]
docker_container.nginx: Destruction complete after 0s
docker_image.nginx: Destroying... [id=sha256:76c69feac34e85768b284f84416c3546b240e8cb4f68acbbe5ad261a8b36f39fnginx:latest]
docker_image.nginx: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
```
## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/{{YOUR_GITHUB_USERNAME}}" target="_blank">{{YOUR_NAME}}</a>

&#xa0;

<a href="#top">Back to top</a>
