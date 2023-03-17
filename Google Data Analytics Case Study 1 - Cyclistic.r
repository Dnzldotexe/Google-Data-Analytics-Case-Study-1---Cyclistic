{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "4d694c41",
   "metadata": {
    "papermill": {
     "duration": 0.002873,
     "end_time": "2023-03-17T10:07:32.933166",
     "exception": false,
     "start_time": "2023-03-17T10:07:32.930293",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Danziel Cempron\n",
    "## 17/03/2023\n",
    "\n",
    "\n",
    "# Case Study 1\n",
    "## Case Study: How Does a Bike-Share Navigate Speedy Success?\n",
    "\n",
    "\n",
    "# Background\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago.\n",
    "\n",
    "Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.\n",
    "\n",
    "# Case study \n",
    "\n",
    "This report will examine the business question: 'what is the most effective marketing strategy to converting  Cyclistic’s casual riders to annul memberships?'\n",
    "\n",
    "It is understood that the goal can be broken down into 3 main questions.\n",
    "\n",
    " 1. How do annual members and casual riders use Cyclistic bikes differently? \n",
    " 2. Why would casual riders buy Cyclistic annual memberships? \n",
    " 3. How can Cyclistic use digital media to influence casual riders to become members?\n",
    "\n",
    "\n",
    "This report will seek to deliver on the following objectives:\n",
    "\n",
    "**How do annual members and casual riders use Cyclistic bikes differently?**\n",
    "\n",
    "# Stakeholders\n",
    "\n",
    "This report also seeks to identify the important stakeholders that are involved in the overall analysis. This includes: \n",
    "- cyclistic users, \n",
    "- director of marketing,\n",
    "- Cyclistic marketing team\n",
    "- Cyclistic executive team\n",
    "\n",
    "# Data sources\n",
    "\n",
    "User data from the past 12 months, March 2023 - February 2023 has been made available. Each data set is in csv format and details every ride logged by Cyclistic customers. This data has been made publicly available via license by Motivate International Inc. and the city of Chicago available [here](https://divvy-tripdata.s3.amazonaws.com/index.html). All user’s personal data has been scrubbed for privacy.\n",
    "\n",
    "# Documentation, cleaning and preparation of data for analysis\n",
    "\n",
    "## Tools for analysis\n",
    "\n",
    "R is being used due to the data size and visualizations needed to complete this analysis.\n",
    "\n",
    "## Preparation of Data "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "46f71db8",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-17T10:07:32.941495Z",
     "iopub.status.busy": "2023-03-17T10:07:32.939395Z",
     "iopub.status.idle": "2023-03-17T10:07:34.126586Z",
     "shell.execute_reply": "2023-03-17T10:07:34.124911Z"
    },
    "papermill": {
     "duration": 1.193929,
     "end_time": "2023-03-17T10:07:34.128954",
     "exception": false,
     "start_time": "2023-03-17T10:07:32.935025",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#Load the necessary libraries that will be utilized for the project\n",
    "library(tidyverse)\n",
    "library(lubridate)\n",
    "library(janitor)\n",
    "library(dplyr)\n",
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3b5c1410",
   "metadata": {
    "papermill": {
     "duration": 0.00194,
     "end_time": "2023-03-17T10:07:34.133116",
     "exception": false,
     "start_time": "2023-03-17T10:07:34.131176",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Load all the data, as well as combine every dataset"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "cd94c1cc",
   "metadata": {
    "papermill": {
     "duration": 0.001938,
     "end_time": "2023-03-17T10:07:34.136916",
     "exception": false,
     "start_time": "2023-03-17T10:07:34.134978",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "0509751a",
   "metadata": {
    "papermill": {
     "duration": 0.001768,
     "end_time": "2023-03-17T10:07:34.140523",
     "exception": false,
     "start_time": "2023-03-17T10:07:34.138755",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Credits\n",
    "\n",
    "Credits to **Tendo Bosa** who did a [video](https://www.youtube.com/watch?v=rVb_UWLKUuA \"YouTube Video\") of his analysis and posted a [Kaggle notebook](https://www.kaggle.com/code/tendobosa/cyclistic-in-what-ways-can-bike-sharing-improve/notebook \"Kaggle Notebook\"). "
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.773143,
   "end_time": "2023-03-17T10:07:34.263680",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-17T10:07:29.490537",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
