# guidesign

## 1. Install the command line version of CHOPCHOP from valenlab on bitbucket
- Valid as of: 27 June 2019
- Go to https://bitbucket.org/valenlab/chopchop/src/master/ and click -Clone- in the upper right hand corner.
- Now navigate to the ```guidesign``` directory and clone chopchop by pasting the command you just copied:
  ~~~
  guidesign$ git clone https://bitbucket.org/valenlab/chopchop.git
  ~~~
- The ```README.md``` file from the chopchop github page has more information on chopchop, although I found its installation instructions harder to follow. They explain how they obtained all the following files, but later in the document they state that you can download the versions that they use for the web tool, so I decided to do this, because it is much more straightforward.
- After reading the "Prerequisites" section, I created an ```environment.yml``` file in order to create a [conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html). The ```~/chopchop/environment.yml``` file in THIS git repo contains all the necessary versions specified in "Prerequisites".
- Create the conda environment:
  ``` conda env create -f environment.yml ```
- Next download the files needed to run chopchop:
- I created three separate directories in a different location (where I store all my large data files):
```
/data/daniela/Projects/guidesign/hg38
/data/daniela/Projects/guidesign/isoforms
/data/daniela/Projects/guidesign/isoforms/vienna_mt
```
- Access chopchop's server http://129.177.123.213/ and download the 7 files with "hg38" into the ```hg38``` directory. The easiest way to do this is to change directories into the ```hg38``` folder (listed above) and run the following commands:
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
- Though they have the same names, the files in the ```isoforms``` and ```hg38``` directories are different. Verify this by checking their [md5 checksum](https://en.wikipedia.org/wiki/MD5). The following should produce different hexadecimal values.
~~~
$ md5sum  /data/daniela/Projects/guidesign/hg38/hg38.1.ebwt
$ md5sum /data/daniela/Projects/guidesign/isoforms/hg38.1.ebwt
~~~
- The ```config.json``` file's directories have been edited to point to the correct folders and was renamed to ```config_local.json``` as instructed by the chopchop readme. The directory assignments may seem a bit cryptic. They were changed as follows:
```javascript
{
  "PATH": {
    "PRIMER3": "./primer3_core",  # unchanged
    "BOWTIE": "bowtie/bowtie",    # unchanged
    "TWOBITTOFA": "./twoBitToFa", # unchanged
    "TWOBIT_INDEX_DIR": "/data/daniela/Projects/guidesign/isoforms",            # CHANGE
    "BOWTIE_INDEX_DIR": "/data/daniela/Projects/guidesign/hg38",                # CHANGE
    "ISOFORMS_INDEX_DIR": "/data/daniela/Projects/guidesign/isoforms",          # CHANGE
    "ISOFORMS_MT_DIR": "/data/daniela/Projects/guidesign/isoforms/vienna_mt",   # CHANGE
    "GENE_TABLE_INDEX_DIR": "/data/daniela/Projects/guidesign/isoforms"         # CHANGE
  },
  "THREADS": 1
}
```
- You should now be able to run the chopchop wrapper I wrote for multiple genes! See below for its functionality.


## 2. Get chopchop output for a list of genes
- Activate the conda environment: ```conda activate chopchop ```
- Place your list of genes in a file: ```scripts/full_gene_list.txt```
- Navigate to the ```scripts``` directory
- Run ./getguides.sh <OPTIONS>. Note that this may take a while to run depending on your gene list size. There should be some warnings that pop up regarding a pandas error, or update, this is fine. 


