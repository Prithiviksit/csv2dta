# csv2dta
An Rscript to convert csv file to dta files. Thanks to haven and data.table packages, it is much faster than Stata.

## Prereuisite
- Install the latest version of R
- Install the packages: haven, data.table, doParallel


## Usage
In linux, you can simply execute

`Rscript csv2dta.R [file names]`

It does not matter whether you enter ".csv", e.g.

`Rscript csv2dta.R a b c.csv`

will convert a.csv, b.csv and c.csv to a.dta, b.dta, and c.dta

To convert a lot of csv files simply run 

`Rscript csv2dta.R *.csv`


On windows, run the same command in cmd.
However, a file called binary.dta will be produced. Ignore it.

## reference
> data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
> The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way

> foreach: simple, scalable parallel programming from Revolution Analytics
> Use Revolution R for scalability, fault tolerance and more.
> http://www.revolutionanalytics.com


