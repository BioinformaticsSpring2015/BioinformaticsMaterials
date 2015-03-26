#Bioinformatics Week 10 Lab
##Genome analysis

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Identify steps in a genomic workflow
2. Implement steps required to map reads and detect variants from NGS data

###Readings:

Additional materials for reference:
* [Galaxy](https://usegalaxy.org)
* This lab is based on materials from the [FSU Research Computing Center](https://rcc.fsu.edu/software/galaxy)

###Activities

**Orientation to Galaxy**

In a web browser, navigate to [Galaxy](https://usegalaxy.org) and apply for an account by going to "User" in the top toolbar and clicking "Register". You don't need to have an account to perform analyses, but this will allow you to access your files later.

*Orientation* Once you have logged in to your account, take a moment to orient yourself to the web interface (note the "Help" section in the top toolbar). The panel on the right lists your data usage and files with which you are working. The panel on the left shows the categories of analysis possible. If you click on a category, it will expand to show the specific tasks available. If you click on a task, it will fill the center window with the options for that command, as well as data you have loaded that may be used for this particular analysis.

*Load sequence reads* We're going to use existing data available on Galaxy that other researchers have shared for public use. Click on "Shared Data" in the toolbar at the top of the page, then "Data Libraries" in the drop down menu. You should see a list of data packages. Use the search box at the top of this list to find "mtProjectDemo" and click on the link. Click on "Blood-PCR1" and select "Import this data into selected histories." On the next page, confirm the import and a green box will appear near the top of the page. 

Click on "Analyze Data" in the toolbar at the top of the page to return to your home page. You should see your data file loaded in the right pane. Click on the title of the data in the right pane to preview the data file, or the eye (it says "View Data" if you scroll over) to see more lines. What is the type and format of these data?

These data were sequenced from human tissue samples and represent sequence reads from the mitochondrial genome (mitogenome). Today we are going to start with raw sequence reads in fastq format, pre-process these data (filter and trim), map to a reference genome, and perform a variant analysis to determine how the raw reads differ from the previously sequenced results.

**Quality assessment and filtering of raw sequence reads**

*Running FastQC* First we're going to assess the raw (unprocessed) data. FastQC is a program that summarizes and visualizes a number of useful statistics about the distribution of sequence data. Click on "NGS: QC and manipulation", then "FastQC." Apply the default options; you should note that your fastq data file is auto-detected as selected as the input data. You will see two new boxes (RawData and Webpage) appear in the window to the right. These boxes may appear gray if they are waiting in the queue to be run. They will turn yellow when the analysis is being conducted, then green when the results are available. 

*Interpreting FastQC output* We're most interested in the "webpage" result from FastQC. If you click on the button showing an eye in this box, the middle pane will show the visualized results from this analysis. You can see examples of "good" and "bad" sequence reads for different types of data on the [FastQC website](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/). You can also look at [the manual](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/) for a more in-depth description of each visualization. It should be apparent that the measures with a green checkmark are acceptable, yellow exclamation points are questionable (but likely acceptable), and red X marks require further attention. Are there any problems with these data? Note that we're most concerned with the graph for "Per base sequence quality".

*Filtering and trimming* You can manipulate this data file in many different ways. We're going to apply a few steps to these data. Each step should be applied to the output data file from the previous step, which should be loaded by default as the The program names for each step are described below, with a short description of why we applied each command what options are appropriate:

1. FASTQ Quality Trimmer: removes positions in sequences with low quality scores. Enter "20" for "Quality score".
2. Filter FASTQ: removes reads from dataset with overall low quality scores for the entire sequence. Enter "50" for "Minimum size", "20" for "Minimum quality", and "5" for "Maximum number of bases allowed outside of quality range".
3. FastQC: compare these results to your previous assessment. What issues remain?

Now that we are confident our reads are of acceptable quality, we are ready to compare them to a previously published genome. 

**Read mapping**

*Load reference sequence* We need to load a previously sequenced mitochondrial genome to use for comparison to our data. Go back to the "Get Data" category and select "Upload data". Select the button for "Paste/Fetch Data". Navigate in another window to the [Cambridge Reference Sequence for Human Mitochondrial DNA](http://www.ncbi.nlm.nih.gov/nuccore/NC_012920.1?report=fasta&log$=seqview&format=text) and copy all text. Paste this text in a text editor and save the file as "humanMT.fas". Go back to Galaxy and upload it using "Choose local file". You should see the data appear in the right pane. Rename this data "humanMT" using the pencil (edit) button. 

*Index reference sequence* The sequence that you just uploaded will be our reference sequence. Genome analysis programs require this data be indexed in a particular way, so now click on "User" in the top toolbar, then select "Custom Builds" from the drop-down menu. Enter "Human mitogenome" in the "Name" field, and "humanMT_Cam" in the "Key" field. Your uploaded data file should already be selected in the data menu, so click "Submit" and you will see it being processed in the "Current Custom Builds" section above.

*Map reads to reference* Select the "NGS: Mapping" category in the left pane and then "BWA". Under "Load reference genome from", select "History" and you should see "humanMT entered under "Use the following dataset as the reference sequence". Under "Select input type", select "Single fastq". For "fastq dataset", you should see your final, processed fastq file loaded. Your output file will be in BAM format, which shows an alignment between a reference genome and short sequence reads. 

BAM files aren't human readable, but we can look at the summary of the analysis by selecting the "flagstat" command under "NGS: SAM Tools". The output is simple summary statistics for your mapped reads. How many reads were mapped?

*Visualize mapped results* We can visualize these results as reads mapped to the reference genome. First we need make sure the mapping is specified for our particular reference. Click on the pencil (edit) button next to your BWA results and correct the "Database/Build" field if it is incorrect (it may specify another human genome assembly). Then select "Visualization" in the top toolbar, then "New Track Browser". You should see your reference listed under "Reference genome build". Click "create", then click the button for "Add Datasets to Visualization". Your BWA/BAM file should be available to select. It will take a few moments to render, but then you should be able to zoom in to view more detail about parts of the alignment. How much of the genome is covered? What do the symbols represent?

**Variant detection**

While the reads are mapped, we don't have a good sense of which variants are biologically relevant. For this, we need to perform a variant analysis. Go to the "NGS: SAM Tools" category and select "Mpileup". Select your reference in the drop down menu beneath "Choose the source for the reference list". Make sure your BWA/BAM file is specified under "BAM file". Choose "Perform a genotype likelihood computation", which create a bcf file showing both indels and SNPs for our raw sequence data relative to the reference. 

Now we need to summarize the results of these results by going back to "NGS: SAM Tools" and choosing "bcftools view". Select your bcf file as input data and run the analysis. When it is complete, click on the pencil icon in the result box. Click the "Datatype" tab and select vcf as the format.

Go back to the visualization view and repeat the steps above, this time selecting the vcf file as the dataset. What do these results mean?

###Assignment
* Due Wednesday, April 1 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk10Homework.md". Title (header) is "Genome analysis".
	* Answer the following questions about the tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1. Run FastQC on the quality trimmed file (from step 2 under *Filtering and trimming*). Why did we perform the "Filter Fastq" step, given these results?
2. Create a new visualization using the same reference sequence, and add both the vcf and BAM file as datasets. Why aren't all of the variants (colored base pairs) from the BAM analysis listed in the vcf track? What do these variants represent?
3. What is the difference between these two tools: "Fastq Quality Trimmer" and "Filter Fastq"?
4. Load the "Blood-1 small sample" dataset from the same library used previously in this lab. Run FastQC on this dataset. What accounts for the differences in initial quality of this dataset and the Blood-PCR1 dataset?
5. Apply a filtering or trimming method to improve the FastQC results of "Blood-1 small sample". Include the program you choose, parameters you implement, and number of reads remaining after filtering.
6. Describe two ways you feel this lab would've been harder if you had performed the analysis on the command line, instead of through a point-and-click online interface.
7. Describe two ways you feel this lab would've been easier if you had performed the analysis on the command line, instead of through a point-and-click online interface.
8. How long did it take you to complete these questions?
9. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
