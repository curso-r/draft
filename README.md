# draft [![Travis-CI Build Status](https://travis-ci.org/jtrecenti/draft.svg?branch=master)](https://travis-ci.org/jtrecenti/draft)

The goal of draft is to create drafts in a fast and useful way. It also uses `gistr` package to upload files to Gist.

## Installation

You can install draft from github with:

``` r
# install.packages("devtools")
devtools::install_github("jtrecenti/draft")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
draft::draft()
```

After edit your file,

``` r
draft::upload()
```

