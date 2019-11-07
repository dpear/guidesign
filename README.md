# guidesign

## 1. Install the command line version of CHOPCHOP from valenlab on bitbucket
- Valid as of: 27 June 2019
- Go to https://bitbucket.org/valenlab/chopchop/src/master/ and click clone in the upper right hand corner
- Refer to the ```README.md``` file from the chopchop github page
- After reading the "Prerequisites", create an ```environment.yml``` file in order to create a [conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html). The ```~/chopchop/environment.yml``` file in THIS git repo contains all the necessary versions specified in "Prerequisites".
- Create the conda environment:
  ``` conda env create -f environment.yml ```
- The ```config.json``` file's directories have been edited to point to the correct folders and was renamed to ```config_local.json```. 
- Run the following to create directories in the ```chopchop``` folder:
  ```
  mkdir isoforms
  mkdir hg38
  ```
- Access chopchop's server http://129.177.123.213/ and download the 7 files with "hg38" into the ```hg38``` directory. The easiest way to do this is to change directories into the ```hg38``` folder and run the following commands:
   ~~~
  curl -o hg38.1.ebwt http://129.177.123.213/hg38.1.ebwt
  curl -o hg38.2.ebwt http://129.177.123.213/hg38.2.ebwt
  curl -o hg38.3.ebwt http://129.177.123.213/hg38.3.ebwt
  curl -o hg38.4.ebwt http://129.177.123.213/hg38.4.ebwt
  curl -o hg38.2bit http://129.177.123.213/hg38.2bit
  curl -o hg38.rev.1.ebwt http://129.177.123.213/hg38.rev.1.ebwt
  curl -o hg38.rev.2.ebwt http://129.177.123.213/hg38.rev.2.ebwt
   ~~~
**Note: curl is used to download files using links. The -o flag specifies the name to be downloaded under. For more information, type** ```man curl``` **in the terminal.**

- Access chopchop's isoforms folder at http://129.177.123.213/isoforms/ and download the 8 files with "hg38" into the ```isoforms``` directory. The easiest way to do this is to change directories into the ```isoforms``` folder and run the following commands:
  ~~~
  curl -o hg38.1.ebwt http://129.177.123.213/isoforms/hg38.1.ebwt
  curl -o hg38.2.ebwt http://129.177.123.213/isoforms/hg38.2.ebwt
  curl -o hg38.3.ebwt http://129.177.123.213/isoforms/hg38.3.ebwt
  curl -o hg38.4.ebwt http://129.177.123.213/isoforms/hg38.4.ebwt
  curl -o hg38.2bit http://129.177.123.213/isoforms/hg38.2bit
  curl -o hg38.rev.1.ebwt http://129.177.123.213/isoforms/hg38.rev.1.ebwt
  curl -o hg38.rev.2.ebwt http://129.177.123.213/isoforms/hg38.rev.2.ebwt
  curl -o hg38.gene_table http://129.177.123.213/isoforms/hg38.gene_table
  ~~~

## 2. Get chopchop output for a list of genes
- Activate the conda environment: ```conda activate chopchop ```
- Place your list of genes in a file: ```scripts/full_gene_list.txt```
- Navigate to the ```scripts``` directory
- Run ./getguides.sh <OPTIONS>. Note that this may take a while to run depending on your gene list size. There should be some warnings that pop up regarding a pandas error, or update, this is fine. 


