#use rocker/binder image
FROM rocker/binder:4

#Set up renv
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
WORKDIR /home/docker_renv
COPY renv.lock renv.lock
ENV RENV_PATHS_LIBRARY renv/library

#restore environment from lockfile
RUN R -e "renv::restore()"

#add Rmd file to image
WORKDIR /home
COPY devils_hole.Rmd devils_hole.Rmd
