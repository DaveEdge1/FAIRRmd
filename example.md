## Introduction

This vignette demonstrates the usage of `isogeochem` using a case study
based on [Bajnai et al. (2021)](https://doi.org/10.1029/2021GL093257).

#### Background:

[Winograd et al. (2006)](https://doi.org/10.1016/j.yqres.2006.06.003)
acquired a *δ*<sup>18</sup>O time series from carbonates that
precipitated underwater in the Devils Hole caves spanning the last ca.
570 thousand years. Now, we are interested in the variations in the
*δ*<sup>18</sup>O value of the groundwater in this period. To
reconstruct a groundwater *δ*<sup>18</sup>O time series from the
carbonate *δ*<sup>18</sup>O values, we have to know the temperature of
the groundwater. Therefore, we measured the clumped isotope values of
ten calcite samples. First, we convert the measured *∆*<sub>47</sub>
values to carbonate growth temperatures. Then, using the mean of the
clumped isotope temperatures, we convert the carbonate *δ*<sup>18</sup>O
time series to a groundwater *δ*<sup>18</sup>O time series.

## Package setup

Download, install, and load the `isogeochem` package:

    if (!require("isogeochem")) install.packages("isogeochem")
    library("isogeochem")
