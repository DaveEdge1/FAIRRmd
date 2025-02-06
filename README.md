## Reproducible R workflow
This repo demonstrates the use of GitHub Actions for sharing a reproducible workflow in R

## Filesystem structure
(not all files are listed here)

* Top
  * Dockerfile (builds the R environment from a rocker base image and the renv.lock file)
  * devils_hole.Rmd (workflow to be shared)
  * devils_hole.md (rendered workflow)
  * renv.lock
  * LICENSE
  * README.md (this file)
* binder
  * Dockerfile (cached image for MyBinder)
* .github
  * workflows
    * docker-image.yml
    * render-Rmd.yml

## Containerized workflow

### devils_hole.Rmd

This RMarkdown document is a vignette from the `isogeochem` package. This is our example of a reproducible workflow.

### renv

The renv.lock file is used to reproduce the environment needed to run the workflow. The file contains the R version and all package versions used to create the workflow. `renv` is the most important step to making R code reproducible.

Learn to use `renv` here: [renv](https://rstudio.github.io/renv/articles/renv.html)

## Dockerfile (<strong>note that there are two in this repo!</strong>)

This Dockerfile begins with a [base image from rocker](https://rocker-project.org/images/versioned/binder.html). The image contains R version 4 and is configured to run RStudio in Binder

The image is modified primarily by running `renv::restore()`, which installs the correct version of R and all packages as versioned in the `renv.lock` file.

## Actions

### docker-image.yml

The Docker Image referenced in "binder/Dockerfile" is built from a GitHub Action. The image is build from a [rocker image](https://rocker-project.org/images/versioned/binder.html) as outlined in the Docker file in the top directory. 

The GitHub Action also pushes the image to a repository. This image underlies the MyBinder environment linked below. The image is pulled from the repository, greatly speeding the mybinder initiation.

### render-Rmd.yml

To ensure the RMarkdown document [devils_hole.Rmd](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.Rmd) is reproducible, it is rendered as a GitHub-compatible markdown document [devils_hole.md](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.md) through a second GitHub Action. The action is triggered any time the RMarkdown document is altered.

### MyBinder

The R environment used in this repository can also be launched in RStudio on the web 

This badge will launch RStudio from the Docker image referenced in "binder/Dockerfile" using MyBinder"

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/DaveEdge1/Devils_Hole2/HEAD?urlpath=rstudio)
