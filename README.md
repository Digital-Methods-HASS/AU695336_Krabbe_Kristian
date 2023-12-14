# Folketingvalg 1973-2022


---
## Author
Kristian Krabbe, Aarhus University, kkrabbe@hotmail.dk

## Abstract

---

## License
Creative Commons Zero v1.0 Universal, see attached [License.md](https://github.com/Digital-Methods-HASS/au669893_Buenemann_HansHermann/blob/main/LICENSE.md)

All data extracted from Trove are from before 1955 and therefore fall under public domain. 

## Data
The data used for this project comes from the official website of the Danish Parliament. 

To enhance usability of the dataset, I manually entered the elections results for the parties at different elections using Excel.
I did this because the original data file from the Parliaments website is a PDF-file.

After entering the data, I converted the file to a csv format to make the dataset usable in R and RStudio.

By using na.omit, I remove the cells in my dataset where NA (not available) occurs.
So my clean dataset is named ftv_clean (ftv = short for folketingsvalg)

### Metadata
The metadata about the dataset used in R Studio: folketingsvalg.csv

* Party = the political party

* Election_year = the year of Danish Parliamentary Election (known as Folketingsvalg in Danish)

* Procent = Percentage of votes

### Software
* R (version 4.3.1)
* RStudio (version 2023.06.2+561).
