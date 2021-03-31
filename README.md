## The Survival Analysis for Code Technical Debt Items

**Authors:** Ehsan Zabardast - Kwabena Ebo Bennin - Javier Gonzalez Huerta

### Overview

This package contains the scripts used to conduct the study in the paper <em>Further Investigation of the Survivability 
of Code Technical Debt Items</em> submitted to the Journal of Software: Evolution and Process.

Specifically, the package includes the following:

* The <code>Python</code> scripts used to collect the raw data extracted from Sonarqube web API.
  * The script is available in <code>01_sonarqube_data_collection.py</code>
* The <code>Python</code> scripts used to pre-process the raw data extracted from Sonarqube web API.
  * The script is available in <code>02_survival_data_process.py</code>
* The <code>R</code> scripts used to perform the survival analysis and create survival curves.
  * The script is available in <code>03_survival_analysis.R</code>
* The pre-processed data from 31 open-source systems from the Apache Foundation that we analyzed in the paper.

The raw data is also available at: 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4650072.svg)](https://doi.org/10.5281/zenodo.4650072)

### Data
The raw data for the open-source systems is collected via the web API from 
[https://sonarcloud.io](https://sonarcloud.io)

The data used for the analysis of the paper is provided in this git repository 
under <code>opensource_data</code> directory.

Each system has three <code>csv</code> files:
* <code>SYSTEM_gitlot.csv</code> for the git log collected from the repository. For more information 
  refer to [Git log for the repositories](####Git log for the repository) 
* <code>SYSTEM_issues_data.csv</code> for the raw data extracted from the web API from sonarcloud.
* <code>SYSTEM_survival_data.csv</code> for the processed data before the survival analysis. Note that this 
  file will be generated as a result of <code>02_survival_data_process.py</code>

### Instructions

#### Running the Scripts

Start by collecting the raw data from the web API using <code>01_sonarqube_data_collection.py</code>. 
Note that there are variables in the script that you have to modify. You also need the git log from the git repository 
before processing the data. Follow the instructions in [Git log for the repositories](#### Git log for the repository)
for fetching the git log data.

Once you obtained the data, you can run <code>02_survival_data_process.py</code>. Note that similar to the previous
step, you need to change some variables in the script.

Finally, you can use the generated survival data to run the survival analysis in <code>03_survival_analysis.R</code>

#### Git Log for the Repository
Using the _terminal_ application, go to the repository's directory on the computer. 
Use the following command in the repository's directory to fetch the git log in the required format for the script.

<code>git log --all --pretty='format:%H,%ci,%ae'</code>

In order to save the results as a <code>csv</code> file in a certain directory, user the following command:

<code>git log --all --pretty='format:%H,%ci,%ae' > intended/directory/for/the/data/gitlog.csv</code>

### Known Issues

Depending on the version of the sonarqube, the format of the dates might change. You need to adjust the script 
in <code>02_survival_data_process.py</code> accordingly.

### Useful Links

* [Sonarcloud](https://sonarcloud.io)
* [Python](https://www.python.org)
* [R](https://cran.r-project.org)
* [git](https://git-scm.com)
* [PyCharm](https://www.jetbrains.com/pycharm/)
* [R Studio](https://www.rstudio.com)

### References
The manuscript of the paper is submitted to the Journal of Software: Evolution and Process. 

**Paper:** The citation will be updated when published.

**Data:** Zabardast, Ehsan, Bennin, Kwabena Ebo, & Gonzalez Huerta, Javier. (2021). 
Raw Data for Further Investigation of the Survivability of Code Technical Debt Items (Version 2.0.0) 
[Data set]. Zenodo. http://doi.org/10.5281/zenodo.4650072
