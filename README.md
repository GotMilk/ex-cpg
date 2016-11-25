# ex-cpg
Script to recursively extract CpG calls over a specific region for multiple files.

This script was originally designed to extract CpG methylation calls from multiple 
.bedgraph files that have been averagd for matching +/- strands.

An input and output directory may be specified, as well as regular expressions for
both the files to be grepped and the sequence inside each file to be grepped.

e.g. files are in the format ```/chr/startCpG/endCpG/%methylation/```

```
1	10468	10470	0.952381
1	10470	10472	0.952381
1	10483	10485	0.954545
1	10488	10490	0.891304
1	10492	10494	0.88
1	10496	10498	0.960784
1	10524	10526	1
1	10541	10543	0.972222
1	10562	10564	0.903226
1	10570	10572	1	
```

To find all CpG calls on chr3 between nt 36992850 and 36993450:

```
extractCpGCalls.sh -i inDir/ -o outDir/ -f "regex" -t NameOfSearch -r "3^\t('3699285\d|369928[6-9]\d|369929\d{2}|36993[0-3]\d{2}|369934[0-4]\d|36993450')"
```
