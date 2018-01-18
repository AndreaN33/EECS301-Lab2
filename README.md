# Lab #2 Assignment

## Objective

This lab will focus on learning the basics of [Hardware Description Languages](https://en.wikipedia.org/wiki/Hardware_description_language) (HDL) as it applies to FPGA design. Examples using the two most common HDL for FPGA design, [Verilog](https://en.wikipedia.org/wiki/Verilog) and [VHDL](https://en.wikipedia.org/wiki/VHDL), will demonstrate how to construct the core building blocks used in most designs.

## Assignment Overview

* Retrieve the Lab Assignment from GitHub
* Create the [**Quartus Project**](Lab2-Guide/QuartusProject-Guide.md)
* Review the [**HDL Starter** Guide](Lab2-Guide/HDL-StarterGuide.md)
* Follow the [**Lab 2 Project** Guide](Lab2-Guide/Lab2-ProjectGuide.md)
* Lab Report write-up
* Commit, tag, and push all modified lab files to **GitHub** following the [**Submission Guide**](Lab2-Guide/GitHub-SubmissionGuide.md)
* Submit report PDF to **Canvas**

## Assignment Details

1. Retrieve the **Lab 2 Assignment** repository from GitHub.

	An e-mail with the **Lab 2 Assignment Invitation Link** should have been received, if not, contact an instructor.  Opening the Invitation Link and accepting the assignment will create a new private GitHub repository labeled with your username (***lab2-assignment-username***).

	* The Lab 2 Assignment repository can be found here: [**GitHub EECS301**](https://github.com/CWRU-EECS301-S18)
	* Clone the ***lab2-assignment-username*** repository to your development machine using the same procedures outlined in the **Lab 1 Git Tutorial**.

	:information_source: **NOTE:** The GitHub website can be used to read through the lab documentation, guides, and instructions.  This can be easier if your development machine does not have a good Markdown viewer.
	
2. Create the Quartus Project for the lab assignment following the instructions detailed in the [**Quartus Project Guide**](Lab2-Guide/QuartusProject-Guide.md).

	:information_source: The Quartus project creation will follow the same procedure as used in the first lab but with a different starting code framework.
	
1. The [**HDL Starter Guide**](Lab2-Guide/HDL-StarterGuide.md) has an overview of the HDL constructs and syntax needed for the lab.  Both Verilog and VHDL examples are presented but Verilog is the preferred language for the lab.

3. The [**Lab 2 Project Guide**](Lab2-Guide/Lab2-ProjectGuide.md) will provide the main implementation details for the lab assignment. 

1. Write the lab report following the [**Lab Report Requirements**](#lab-report-equirements).

1. Submit the assignment (including all code, project files, and lab report) back to GitHub following the [**Lab Assignment Submission Guide**](Lab2-Guide/GitHub-SubmissionGuide.md).

1. Submit the lab report in PDF format to **Canvas**.

	**NOTE:** See the [MarkdownViewer++ Workaround](Lab2-Guide/NPP-PDF-Workaround.md) document if using NotePad++ to create the PDFs. 


## Lab Report Requirements

Include the following in the lab report:

* Brief description of what the lab does and what you learned from doing the lab.
* Image of correct ModelSim image captured from IDE (the ModelSim export image).
* What computer you used to do the work (lab computer or your own ---> what OS / hardware you are running).
* How long it took you to do the actual lab, how long it took you to do the writeup, total time spent on this lab.
* Any issues you ran into that could use better explanation or you found confusing.


## Lab Due Date

The lab project and report will be due by 3:00pm on **Feb 2, 2018**.

All files and code must be committed and pushed to GitHub by the submission deadline.  The submission process is detailed in the [**Lab Submission Guide**](Lab2-Guide/GitHub-SubmissionGuide.md).

The PDF version of the lab report also needs to be submitted to Canvas by the same submission deadline.


## Grading Rubric

### Lab 2 is worth 180 points total:

* 20 points for the picture of the correct simulation of the lab operation
* 20 points for a correct instantiation of CLS\_Scanner\_Module
* 20 points for a correct instantiation of CLS\_PWM\_Interval\_Timer
* 20 points for a correct instantiation of CLS\_PWM\_DutyCycle\_Timer
* 50 points for a correct instantiation of CLS\_LED\_Output\_Multiplexer
* 20 points for a correct verification of the 4 scan rates of the LED's by a TA.
	* 5 points for the 2 Hz scan rate
	* 5 points for the 8 Hz scan rate
	* 5 points for the 16 Hz scan rate
	* 5 points for the 32 Hz scan rate
* 20 points for the content of the lab report (description, computer used, times, issues)
* 5 points for the completed lab report submitted in MD file to GitHub repo
* 5 points for the completed lab report in PDF submitted to Canvas

Note: If you're burning the midnight oil and can't get a lab TA to verify your project, make a video of your DE1-SOC dev board showing operation of all 4 switch settings and make sure to show the sticker on the dev board so we know it's yours and not copied from someone else.  You can then show this video to the lab TA when you cross paths with them at the normal hours for credit.


