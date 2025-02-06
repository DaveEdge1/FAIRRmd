## Reproducible R workflow
This repo demonstrates the use of GitHub Actions for sharing a reproducible workflow in R

The ".github/workflows" directory contains two actions:

1. docker-image.yml
2. render-Rmd.yml

### docker-image.yml

The Docker Image referenced in "binder/Dockerfile" is built from a GitHub Action. The image is build from a [rocker image](https://rocker-project.org/images/versioned/binder.html) as outlined in the Docker file in the top directory. 

The GitHub Action also pushes the image to a repository. This image underlies the MyBinder environment linked below. The image is pulled from the repository, greatly speeding the mybinder initiation.

### render-Rmd.yml

To ensure the RMarkdown document [devils_hole.Rmd](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.Rmd) is reproducible, it is rendered as a GitHub-compatible markdown document [devils_hole.md](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.md) through a second GitHub Action. The action is triggered any time the RMarkdown document is altered.

### MyBinder

The R environment used in this repository can also be launched in RStudio on the web 

This badge will launch RStudio from the Docker image referenced in "binder/Dockerfile" using MyBinder"

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/DaveEdge1/Devils_Hole2/HEAD?urlpath=rstudio)
