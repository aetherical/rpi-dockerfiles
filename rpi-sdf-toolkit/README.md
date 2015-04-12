Raspberry Pi Dockerfile for [SDF Toolkit](http://cactus.nci.nih.gov/SDF_toolkit/).

> SDF or Structures Data File is a common file format developed by Molecular Design Limited to handle a list of molecular structures with associated properties. The file format has been published (Dalby et al., J. Chem. Inf. Comput. Sci. 1992, 32: 244-255).
    The purpose of this SDF toolkit is to provide functions to read and parse SDFs, filter, and add/remove properties. It can also read comma separated value (CSV) tables which contain new fields to be added to the SD file. A typical application is to add calculated Log P values or biological data exported from a spreadsheet. The new SDF can thereafter be displayed with the new data fields with e.g. ChemFinder, the CACTVS system browser csbr, and probably many other programs.
    The SDF toolkit is written in Perl 5, a free, widely available, scripting language.
    One useful application (at least for us) that has been written with this toolkit: "add_prop_sdf".  This script reads an SDF, adds properties from a CSV file and prints out the new SD file. No GUI here, it's a batch mode program. Also of interest is the script select_sdf which can be use to extract specific records of an SDF. Random selection of records from an SDF can be made with the help of the gen_rnd script.
    The SDF_toolkit is freely available under the GNU public license granted by the author. The U.S. Government imposes no license restrictions of its own on the toolkit.


