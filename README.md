<p>
    <a href="https://shields.io/community#backers" alt="Build Rmd workflow Action">
        <img src="https://img.shields.io/github/actions/workflow/status/Daveedge1/fairrmd/render-Rmd.yml?logo=data:image/svg%2bxml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+DQo8c3ZnIHdpZHRoPSIyMDAiIGhlaWdodD0iMjAwIiB2aWV3Qm94PSIyNSAyNSAxNTAgMTUwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9ImJsYWNrIj4NCiAgPCEtLSBFbmxhcmdlZCBTbW9vdGggQ2lyY3VsYXIgQXJyb3cgd2l0aCBMYXJnZXIgQXJyb3doZWFkIGFuZCBDZW50ZXJlZCBDaGVja21hcmsgLS0+DQogIDxwYXRoIGQ9Ik0gNjAgMTQwIEEgNTAgNTAgMCAxIDEgMTQwIDE0MCIgc3Ryb2tlPSJ3aGl0ZSIgc3Ryb2tlLXdpZHRoPSIxMCIgZmlsbD0ibm9uZSIvPg0KICA8cG9seWdvbiBwb2ludHM9IjUwLDE0MCA3NSwxMjUgNzUsMTU1IiBmaWxsPSJ3aGl0ZSIgLz4gPCEtLSBMYXJnZXIgQXJyb3doZWFkIHBvaW50aW5nIGludG8gY2lyY2xlIC0tPg0KICA8cG9seWxpbmUgcG9pbnRzPSI5MCwxMTAgMTAwLDEyMCAxMjAsMTAwIiBzdHJva2U9IndoaXRlIiBzdHJva2Utd2lkdGg9IjEwIiBmaWxsPSJub25lIi8+IDwhLS0gQ2VudGVyZWQgQ2hlY2ttYXJrIC0tPg0KPC9zdmc+&label=Reproducible&logoColor=white" /></a>
The knitting of RMarkdown to GitHub Markdown is automated</p>

<p>
    <a href="https://shields.io/community#backers" alt="Cache container image workflow Action">
        <img src="https://img.shields.io/github/actions/workflow/status/Daveedge1/fairrmd/docker-image.yml?logo=Docker&label=Containerized&logoColor=white" /></a>
The container image build is cached</p>

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14846119.svg)](https://doi.org/10.5281/zenodo.14846119)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/DaveEdge1/FAIRRmd/HEAD?urlpath=rstudio) Launch the environment in RStudio server online

# FAIRRmd - Sharing Reproducible Rmd workflows
This template harnesses GitHub Actions for sharing a reproducible workflow in Rmd format. What this template offers:

1. Simply uploading the RMarkdown and renv.lock files allows others to reproduce your work locally
2. A GitHub Action knits your RMarkdown and renders it as a GitHub Markdown file in your repository, simultaneously demonstrating the reproduciblity and sharing the rendered output
3. A separate Action produces a container image that can be used to interact with your workflow in RStudio:<br>
  a. via MyBinder (link above) in the cloud <br>
  b. locally with Docker
5. The repository release linked to Zenodo becomes a citable compendium

## Required items
1. An RMarkdown document you would like to share
2. An [renv.lock](https://rstudio.github.io/renv/articles/renv.html) file for this project
3. Data
  a. stored in a permanent repository with a DOI (FAIR, eg. Zenodo)
  b. stored in a file in your repo

## Using this Template
### Add your workflow file in RMarkdown fomrat

* There is an `example.Rmd` in this template to show you the one required element: "output: github_document"
* Much of the early setup code could be recycled for your RMarkdown document for appropriate rendering in GitHub Markdown format
* Add your Rmd code and edit the header with Author, Date, etc.
* Rename the `example.Rmd` file (or delete it if you've brought in your own file)

### Add your renv lock file

* Delete the existing renv.lock file
* Your lock file should come from the R project directory where your Rmd file was created

Learn to use `renv` here: [renv](https://rstudio.github.io/renv/articles/renv.html)

### Edit the render Rmd workflow

* This workflow is found here: ".github/workflows/render-Rmd.yml"
* Change the name of the referenced Rmd (example.Rmd) and md (example.md) files on lines 33 and 36 (your output md file will have the same name, just a different extentsion)

### Add repository secrets

* In order to push the container image to your Docker Hub, you'll need to give your login credentials to GitHub (they are stored securely)
* Settings -> Secretes and Variables -> Actions -> New repository secret
  * Add DOCKER_USERNAME
  * Add DOCKER_PASSWORD

### Test it out!

* Make a change to the Rmd file to trigger the actions (The workflows are set to run anytime a change is made to the Rmd file or the renv.lock file)
* You can see the progress unfold in the 'Actions' tab of your repo
* Share your feedback/troubles [here](https://github.com/DaveEdge1/FAIRRmd/issues)

### Edit this README file

* Edit the 3 badges at the top with the correct 'GitHub_Username', 'GitHub_Repo_Name' (remove the "<>"), etc.
* Add relevant details about the data and workflow, including citation info

### Make it citable

* Make sure you are happy with the REAME and the md file as they are before proceeding!
* Follow the instructions [here](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content) to get a DOI for your repo and add the Zenodo badge to your README

## Reproducing this workflow

### MyBinder (easiest option)

Click the Binder badge above. An RStudio session will launch in your browser after the the container initializes (usually about 60 seconds).

### Locally in RStudio

1. Clone this repository
2. Open the Rproj file using RStudio
3. Run `renv::restore()`
4. Open the devils_hole.Rmd file - it's ready to use!

### Locally with Docker

1. Start your Docker (or podman) engine
2. Open your terminal
3. pull the image `docker pull davidedge/devils_hole2`
4. run the container `docker run -e PASSWORD=rstudio --rm -ti -p 8787:8787 --user root davidedge/devils_hole2 /init`
5. open a browser window to `http://127.0.0.1:8787/`
6. enter the username: `rstudio` and passowrd: `rstudio`

## Filesystem structure
(not all files are listed here)

* Top
  * Dockerfile (builds the R environment from a rocker base image and the renv.lock file)
  * example.Rmd (workflow to be shared)
  * example.md (rendered workflow)
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

### example.Rmd

This RMarkdown document is our example of a reproducible workflow.

### renv

The renv.lock file is used to reproduce the environment needed to run the workflow. The file contains the R version and all package versions used to create the workflow. `renv` is the most important step to making R code reproducible.

Learn to use `renv` here: [renv](https://rstudio.github.io/renv/articles/renv.html)

### Dockerfile (<strong>note that there are two in this repo!</strong>)

This Dockerfile begins with a [base image from rocker](https://rocker-project.org/images/versioned/binder.html). The image contains R version 4 and is configured to run RStudio in Binder

The image is modified primarily by running `renv::restore()`, which installs the correct version of R and all packages as versioned in the `renv.lock` file.

## Actions

### docker-image.yml

The Docker Image referenced in "binder/Dockerfile" is built from a GitHub Action. The image is build from a [rocker image](https://rocker-project.org/images/versioned/binder.html) as outlined in the Docker file in the top directory. 

The GitHub Action also pushes the image to a repository. This image underlies the MyBinder environment linked below. The image is pulled from the repository, greatly speeding the mybinder initiation.

### render-Rmd.yml

To ensure the RMarkdown document [devils_hole.Rmd](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.Rmd) is reproducible, it is rendered as a GitHub-compatible markdown document [devils_hole.md](https://github.com/DaveEdge1/Devils_Hole2/blob/master/devils_hole.md) through a second GitHub Action. The action is triggered any time the RMarkdown document is altered.

## MyBinder

The R environment used in this repository can also be launched in RStudio on the web 

This badge will launch RStudio from the Docker image referenced in "binder/Dockerfile" using MyBinder"

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/DaveEdge1/Devils_Hole2/HEAD?urlpath=rstudio)
