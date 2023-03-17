{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "266558c0",
   "metadata": {
    "papermill": {
     "duration": 0.006624,
     "end_time": "2023-03-17T14:15:59.388058",
     "exception": false,
     "start_time": "2023-03-17T14:15:59.381434",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Danziel Cempron\n",
    "## 17/03/2023\n",
    "\n",
    "This is my first ever Kaggle Notebook. I'm not yet familiar with Kaggle so please bear with me.\n",
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
   "id": "40a93e19",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-17T14:15:59.402680Z",
     "iopub.status.busy": "2023-03-17T14:15:59.400568Z",
     "iopub.status.idle": "2023-03-17T14:16:00.596358Z",
     "shell.execute_reply": "2023-03-17T14:16:00.594423Z"
    },
    "papermill": {
     "duration": 1.205747,
     "end_time": "2023-03-17T14:16:00.598873",
     "exception": false,
     "start_time": "2023-03-17T14:15:59.393126",
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
   "id": "152fc234",
   "metadata": {
    "papermill": {
     "duration": 0.005402,
     "end_time": "2023-03-17T14:16:00.609808",
     "exception": false,
     "start_time": "2023-03-17T14:16:00.604406",
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
   "execution_count": 2,
   "id": "09af6c9d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:16:00.653012Z",
     "iopub.status.busy": "2023-03-17T14:16:00.622531Z",
     "iopub.status.idle": "2023-03-17T14:17:46.935957Z",
     "shell.execute_reply": "2023-03-17T14:17:46.932764Z"
    },
    "papermill": {
     "duration": 106.325066,
     "end_time": "2023-03-17T14:17:46.940225",
     "exception": false,
     "start_time": "2023-03-17T14:16:00.615159",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# load the data into R\n",
    "Mar_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202203.csv\")\n",
    "Apr_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202204.csv\")\n",
    "May_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202205.csv\")\n",
    "Jun_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202206.csv\")\n",
    "Jul_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202207.csv\")\n",
    "Aug_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202208.csv\")\n",
    "Sep_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202209.csv\")\n",
    "Oct_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202210.csv\")\n",
    "Nov_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202211.csv\")\n",
    "Dec_2022 <- read.csv(\"/kaggle/input/divvy-tripdata/202212.csv\")\n",
    "Jan_2023 <- read.csv(\"/kaggle/input/divvy-tripdata/202301.csv\")\n",
    "Feb_2023 <- read.csv(\"/kaggle/input/divvy-tripdata/202302.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7c915e82",
   "metadata": {
    "papermill": {
     "duration": 0.006672,
     "end_time": "2023-03-17T14:17:46.957860",
     "exception": false,
     "start_time": "2023-03-17T14:17:46.951188",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Combine every dataset to consolidate analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "80b1605f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:17:46.974347Z",
     "iopub.status.busy": "2023-03-17T14:17:46.972694Z",
     "iopub.status.idle": "2023-03-17T14:18:19.980243Z",
     "shell.execute_reply": "2023-03-17T14:18:19.978058Z"
    },
    "papermill": {
     "duration": 33.02036,
     "end_time": "2023-03-17T14:18:19.983715",
     "exception": false,
     "start_time": "2023-03-17T14:17:46.963355",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trip_2223 <- rbind(Mar_2022, Apr_2022, May_2022, Jun_2022, Jul_2022, Aug_2022, \n",
    "                   Sep_2022, Oct_2022, Dec_2022, Jan_2023, Feb_2023)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2320075",
   "metadata": {
    "papermill": {
     "duration": 0.006094,
     "end_time": "2023-03-17T14:18:19.997276",
     "exception": false,
     "start_time": "2023-03-17T14:18:19.991182",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Check if the columns were maintained"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "0a47bfc5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:20.013785Z",
     "iopub.status.busy": "2023-03-17T14:18:20.011806Z",
     "iopub.status.idle": "2023-03-17T14:18:22.989426Z",
     "shell.execute_reply": "2023-03-17T14:18:22.987686Z"
    },
    "papermill": {
     "duration": 2.989257,
     "end_time": "2023-03-17T14:18:22.991968",
     "exception": false,
     "start_time": "2023-03-17T14:18:20.002711",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5491349     Length:5491349     Length:5491349     Length:5491349    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5491349     Length:5491349     Length:5491349     Length:5491349    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.55   Min.   :-88.14  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :42.07   Max.   :-87.52   Max.   :42.37   Max.   :-87.30  \n",
       "                                  NA's   :5708    NA's   :5708    \n",
       " member_casual     \n",
       " Length:5491349    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(trip_2223) # Shows all the columns within the dataframe\n",
    "summary(trip_2223) # Shows the metadata of the dataframe"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cb947f80",
   "metadata": {
    "papermill": {
     "duration": 0.005639,
     "end_time": "2023-03-17T14:18:23.004566",
     "exception": false,
     "start_time": "2023-03-17T14:18:22.998927",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Removing the columns columns not relevant to the business use case"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "43f3e2bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:23.019403Z",
     "iopub.status.busy": "2023-03-17T14:18:23.017839Z",
     "iopub.status.idle": "2023-03-17T14:18:23.072525Z",
     "shell.execute_reply": "2023-03-17T14:18:23.070449Z"
    },
    "papermill": {
     "duration": 0.064936,
     "end_time": "2023-03-17T14:18:23.075082",
     "exception": false,
     "start_time": "2023-03-17T14:18:23.010146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trip_2223 <- trip_2223 %>% # Why can't I use the shortcut (ctrl + shift + m)?\n",
    "    select(-c(start_lat, start_lng, end_lat, end_lng, start_station_id, end_station_id))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6fc0f67f",
   "metadata": {
    "papermill": {
     "duration": 0.005669,
     "end_time": "2023-03-17T14:18:23.086478",
     "exception": false,
     "start_time": "2023-03-17T14:18:23.080809",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### View the newly created dataset"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "4ae539cf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:23.101346Z",
     "iopub.status.busy": "2023-03-17T14:18:23.099823Z",
     "iopub.status.idle": "2023-03-17T14:18:23.153611Z",
     "shell.execute_reply": "2023-03-17T14:18:23.151187Z"
    },
    "papermill": {
     "duration": 0.064658,
     "end_time": "2023-03-17T14:18:23.156734",
     "exception": false,
     "start_time": "2023-03-17T14:18:23.092076",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>47EC0A7F82E65D52</td><td>classic_bike </td><td>2022-03-21 13:45:01</td><td>2022-03-21 13:51:18</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St            </span></td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>8494861979B0F477</td><td>electric_bike</td><td>2022-03-16 09:37:16</td><td>2022-03-16 09:43:34</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td>Orleans St &amp; Chestnut St (NEXT Apts)</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EFE527AF80B66109</td><td>classic_bike </td><td>2022-03-23 19:52:02</td><td>2022-03-23 19:54:48</td><td><span style=white-space:pre-wrap>Broadway &amp; Berwyn Ave             </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td>member</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>9F446FD9DEE3F389</td><td>classic_bike </td><td>2022-03-01 19:12:26</td><td>2022-03-01 19:22:14</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Franklin St &amp; Jackson Blvd          </span></td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>431128AD9AFFEDC0</td><td>classic_bike </td><td>2022-03-21 18:37:01</td><td>2022-03-21 19:19:11</td><td>DuSable Lake Shore Dr &amp; North Blvd</td><td><span style=white-space:pre-wrap>Loomis St &amp; Jackson Blvd            </span></td><td>member</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>9AA8A13AF7A85325</td><td>classic_bike </td><td>2022-03-07 17:10:22</td><td>2022-03-07 17:15:04</td><td><span style=white-space:pre-wrap>Bissell St &amp; Armitage Ave         </span></td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clybourn Ave        </span></td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 47EC0A7F82E65D52 & classic\\_bike  & 2022-03-21 13:45:01 & 2022-03-21 13:51:18 & Wabash Ave \\& Wacker Pl             & Kingsbury St \\& Kinzie St             & member\\\\\n",
       "\t2 & 8494861979B0F477 & electric\\_bike & 2022-03-16 09:37:16 & 2022-03-16 09:43:34 & Michigan Ave \\& Oak St              & Orleans St \\& Chestnut St (NEXT Apts) & member\\\\\n",
       "\t3 & EFE527AF80B66109 & classic\\_bike  & 2022-03-23 19:52:02 & 2022-03-23 19:54:48 & Broadway \\& Berwyn Ave              & Broadway \\& Ridge Ave                 & member\\\\\n",
       "\t4 & 9F446FD9DEE3F389 & classic\\_bike  & 2022-03-01 19:12:26 & 2022-03-01 19:22:14 & Wabash Ave \\& Wacker Pl             & Franklin St \\& Jackson Blvd           & member\\\\\n",
       "\t5 & 431128AD9AFFEDC0 & classic\\_bike  & 2022-03-21 18:37:01 & 2022-03-21 19:19:11 & DuSable Lake Shore Dr \\& North Blvd & Loomis St \\& Jackson Blvd             & member\\\\\n",
       "\t6 & 9AA8A13AF7A85325 & classic\\_bike  & 2022-03-07 17:10:22 & 2022-03-07 17:15:04 & Bissell St \\& Armitage Ave          & Southport Ave \\& Clybourn Ave         & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 7\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 47EC0A7F82E65D52 | classic_bike  | 2022-03-21 13:45:01 | 2022-03-21 13:51:18 | Wabash Ave &amp; Wacker Pl             | Kingsbury St &amp; Kinzie St             | member |\n",
       "| 2 | 8494861979B0F477 | electric_bike | 2022-03-16 09:37:16 | 2022-03-16 09:43:34 | Michigan Ave &amp; Oak St              | Orleans St &amp; Chestnut St (NEXT Apts) | member |\n",
       "| 3 | EFE527AF80B66109 | classic_bike  | 2022-03-23 19:52:02 | 2022-03-23 19:54:48 | Broadway &amp; Berwyn Ave              | Broadway &amp; Ridge Ave                 | member |\n",
       "| 4 | 9F446FD9DEE3F389 | classic_bike  | 2022-03-01 19:12:26 | 2022-03-01 19:22:14 | Wabash Ave &amp; Wacker Pl             | Franklin St &amp; Jackson Blvd           | member |\n",
       "| 5 | 431128AD9AFFEDC0 | classic_bike  | 2022-03-21 18:37:01 | 2022-03-21 19:19:11 | DuSable Lake Shore Dr &amp; North Blvd | Loomis St &amp; Jackson Blvd             | member |\n",
       "| 6 | 9AA8A13AF7A85325 | classic_bike  | 2022-03-07 17:10:22 | 2022-03-07 17:15:04 | Bissell St &amp; Armitage Ave          | Southport Ave &amp; Clybourn Ave         | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 47EC0A7F82E65D52 classic_bike  2022-03-21 13:45:01 2022-03-21 13:51:18\n",
       "2 8494861979B0F477 electric_bike 2022-03-16 09:37:16 2022-03-16 09:43:34\n",
       "3 EFE527AF80B66109 classic_bike  2022-03-23 19:52:02 2022-03-23 19:54:48\n",
       "4 9F446FD9DEE3F389 classic_bike  2022-03-01 19:12:26 2022-03-01 19:22:14\n",
       "5 431128AD9AFFEDC0 classic_bike  2022-03-21 18:37:01 2022-03-21 19:19:11\n",
       "6 9AA8A13AF7A85325 classic_bike  2022-03-07 17:10:22 2022-03-07 17:15:04\n",
       "  start_station_name                 end_station_name                    \n",
       "1 Wabash Ave & Wacker Pl             Kingsbury St & Kinzie St            \n",
       "2 Michigan Ave & Oak St              Orleans St & Chestnut St (NEXT Apts)\n",
       "3 Broadway & Berwyn Ave              Broadway & Ridge Ave                \n",
       "4 Wabash Ave & Wacker Pl             Franklin St & Jackson Blvd          \n",
       "5 DuSable Lake Shore Dr & North Blvd Loomis St & Jackson Blvd            \n",
       "6 Bissell St & Armitage Ave          Southport Ave & Clybourn Ave        \n",
       "  member_casual\n",
       "1 member       \n",
       "2 member       \n",
       "3 member       \n",
       "4 member       \n",
       "5 member       \n",
       "6 member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>5491344</th><td>B60EA061E2123F62</td><td>electric_bike</td><td>2023-02-04 17:52:34</td><td>2023-02-04 17:59:57</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5491345</th><td>C04510F8EBB5EE8A</td><td>classic_bike </td><td>2023-02-08 21:57:22</td><td>2023-02-08 22:08:06</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5491346</th><td>187BA364FB265C80</td><td>electric_bike</td><td>2023-02-19 11:29:09</td><td>2023-02-19 11:39:11</td><td>Ogden Ave &amp; Roosevelt Rd </td><td><span style=white-space:pre-wrap>Delano Ct &amp; Roosevelt Rd    </span></td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5491347</th><td>46B54F6B417D1B27</td><td>electric_bike</td><td>2023-02-07 09:01:33</td><td>2023-02-07 09:16:53</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>5491348</th><td>335B3CAD59F6C016</td><td>electric_bike</td><td>2023-02-22 08:33:22</td><td>2023-02-22 08:50:11</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>5491349</th><td>03D59518BB151EFA</td><td>classic_bike </td><td>2023-02-01 21:52:17</td><td>2023-02-01 22:04:17</td><td><span style=white-space:pre-wrap>Clark St &amp; Winnemac Ave  </span></td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t5491344 & B60EA061E2123F62 & electric\\_bike & 2023-02-04 17:52:34 & 2023-02-04 17:59:57 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member\\\\\n",
       "\t5491345 & C04510F8EBB5EE8A & classic\\_bike  & 2023-02-08 21:57:22 & 2023-02-08 22:08:06 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member\\\\\n",
       "\t5491346 & 187BA364FB265C80 & electric\\_bike & 2023-02-19 11:29:09 & 2023-02-19 11:39:11 & Ogden Ave \\& Roosevelt Rd  & Delano Ct \\& Roosevelt Rd     & member\\\\\n",
       "\t5491347 & 46B54F6B417D1B27 & electric\\_bike & 2023-02-07 09:01:33 & 2023-02-07 09:16:53 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual\\\\\n",
       "\t5491348 & 335B3CAD59F6C016 & electric\\_bike & 2023-02-22 08:33:22 & 2023-02-22 08:50:11 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual\\\\\n",
       "\t5491349 & 03D59518BB151EFA & classic\\_bike  & 2023-02-01 21:52:17 & 2023-02-01 22:04:17 & Clark St \\& Winnemac Ave   & Sheffield Ave \\& Waveland Ave & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 7\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 5491344 | B60EA061E2123F62 | electric_bike | 2023-02-04 17:52:34 | 2023-02-04 17:59:57 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member |\n",
       "| 5491345 | C04510F8EBB5EE8A | classic_bike  | 2023-02-08 21:57:22 | 2023-02-08 22:08:06 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member |\n",
       "| 5491346 | 187BA364FB265C80 | electric_bike | 2023-02-19 11:29:09 | 2023-02-19 11:39:11 | Ogden Ave &amp; Roosevelt Rd  | Delano Ct &amp; Roosevelt Rd     | member |\n",
       "| 5491347 | 46B54F6B417D1B27 | electric_bike | 2023-02-07 09:01:33 | 2023-02-07 09:16:53 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual |\n",
       "| 5491348 | 335B3CAD59F6C016 | electric_bike | 2023-02-22 08:33:22 | 2023-02-22 08:50:11 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual |\n",
       "| 5491349 | 03D59518BB151EFA | classic_bike  | 2023-02-01 21:52:17 | 2023-02-01 22:04:17 | Clark St &amp; Winnemac Ave   | Sheffield Ave &amp; Waveland Ave | member |\n",
       "\n"
      ],
      "text/plain": [
       "        ride_id          rideable_type started_at          ended_at           \n",
       "5491344 B60EA061E2123F62 electric_bike 2023-02-04 17:52:34 2023-02-04 17:59:57\n",
       "5491345 C04510F8EBB5EE8A classic_bike  2023-02-08 21:57:22 2023-02-08 22:08:06\n",
       "5491346 187BA364FB265C80 electric_bike 2023-02-19 11:29:09 2023-02-19 11:39:11\n",
       "5491347 46B54F6B417D1B27 electric_bike 2023-02-07 09:01:33 2023-02-07 09:16:53\n",
       "5491348 335B3CAD59F6C016 electric_bike 2023-02-22 08:33:22 2023-02-22 08:50:11\n",
       "5491349 03D59518BB151EFA classic_bike  2023-02-01 21:52:17 2023-02-01 22:04:17\n",
       "        start_station_name        end_station_name             member_casual\n",
       "5491344 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491345 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491346 Ogden Ave & Roosevelt Rd  Delano Ct & Roosevelt Rd     member       \n",
       "5491347 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491348 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491349 Clark St & Winnemac Ave   Sheffield Ave & Waveland Ave member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check the aggregated dataset\n",
    "head(trip_2223) # Shows the first six Rows of the dataframe\n",
    "tail(trip_2223) # Shows the last six Rows of the dataframe"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "97948403",
   "metadata": {
    "papermill": {
     "duration": 0.0061,
     "end_time": "2023-03-17T14:18:23.169033",
     "exception": false,
     "start_time": "2023-03-17T14:18:23.162933",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Converting char class to a date and time class"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "4c69747e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:23.185180Z",
     "iopub.status.busy": "2023-03-17T14:18:23.183521Z",
     "iopub.status.idle": "2023-03-17T14:18:29.416142Z",
     "shell.execute_reply": "2023-03-17T14:18:29.414378Z"
    },
    "papermill": {
     "duration": 6.244421,
     "end_time": "2023-03-17T14:18:29.419612",
     "exception": false,
     "start_time": "2023-03-17T14:18:23.175191",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Converts to the correct format for subtraction\n",
    "trip_2223$ended_at <- ymd_hms(trip_2223$ended_at)\n",
    "trip_2223$started_at <- ymd_hms(trip_2223$started_at)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8062254b",
   "metadata": {
    "papermill": {
     "duration": 0.006206,
     "end_time": "2023-03-17T14:18:29.432220",
     "exception": false,
     "start_time": "2023-03-17T14:18:29.426014",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Compute for the ride length and add it to the existing dataframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "95c6e702",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:29.448296Z",
     "iopub.status.busy": "2023-03-17T14:18:29.446741Z",
     "iopub.status.idle": "2023-03-17T14:18:34.750858Z",
     "shell.execute_reply": "2023-03-17T14:18:34.749011Z"
    },
    "papermill": {
     "duration": 5.316083,
     "end_time": "2023-03-17T14:18:34.754451",
     "exception": false,
     "start_time": "2023-03-17T14:18:29.438368",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Subtracts the end time to start time and get the desired result in unit of minutes \n",
    "trip_2223$ride_length <- as.double(difftime(trip_2223$ended_at, trip_2223$started_at, units = \"mins\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9c18b9cb",
   "metadata": {
    "papermill": {
     "duration": 0.007113,
     "end_time": "2023-03-17T14:18:34.767741",
     "exception": false,
     "start_time": "2023-03-17T14:18:34.760628",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Check if the output is correct"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "885f7478",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:34.783782Z",
     "iopub.status.busy": "2023-03-17T14:18:34.782218Z",
     "iopub.status.idle": "2023-03-17T14:18:34.832352Z",
     "shell.execute_reply": "2023-03-17T14:18:34.829951Z"
    },
    "papermill": {
     "duration": 0.061435,
     "end_time": "2023-03-17T14:18:34.835404",
     "exception": false,
     "start_time": "2023-03-17T14:18:34.773969",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>47EC0A7F82E65D52</td><td>classic_bike </td><td>2022-03-21 13:45:01</td><td>2022-03-21 13:51:18</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St            </span></td><td>member</td><td> 6.283333</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>8494861979B0F477</td><td>electric_bike</td><td>2022-03-16 09:37:16</td><td>2022-03-16 09:43:34</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td>Orleans St &amp; Chestnut St (NEXT Apts)</td><td>member</td><td> 6.300000</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EFE527AF80B66109</td><td>classic_bike </td><td>2022-03-23 19:52:02</td><td>2022-03-23 19:54:48</td><td><span style=white-space:pre-wrap>Broadway &amp; Berwyn Ave             </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td>member</td><td> 2.766667</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>9F446FD9DEE3F389</td><td>classic_bike </td><td>2022-03-01 19:12:26</td><td>2022-03-01 19:22:14</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Franklin St &amp; Jackson Blvd          </span></td><td>member</td><td> 9.800000</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>431128AD9AFFEDC0</td><td>classic_bike </td><td>2022-03-21 18:37:01</td><td>2022-03-21 19:19:11</td><td>DuSable Lake Shore Dr &amp; North Blvd</td><td><span style=white-space:pre-wrap>Loomis St &amp; Jackson Blvd            </span></td><td>member</td><td>42.166667</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>9AA8A13AF7A85325</td><td>classic_bike </td><td>2022-03-07 17:10:22</td><td>2022-03-07 17:15:04</td><td><span style=white-space:pre-wrap>Bissell St &amp; Armitage Ave         </span></td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clybourn Ave        </span></td><td>member</td><td> 4.700000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & ride\\_length\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 47EC0A7F82E65D52 & classic\\_bike  & 2022-03-21 13:45:01 & 2022-03-21 13:51:18 & Wabash Ave \\& Wacker Pl             & Kingsbury St \\& Kinzie St             & member &  6.283333\\\\\n",
       "\t2 & 8494861979B0F477 & electric\\_bike & 2022-03-16 09:37:16 & 2022-03-16 09:43:34 & Michigan Ave \\& Oak St              & Orleans St \\& Chestnut St (NEXT Apts) & member &  6.300000\\\\\n",
       "\t3 & EFE527AF80B66109 & classic\\_bike  & 2022-03-23 19:52:02 & 2022-03-23 19:54:48 & Broadway \\& Berwyn Ave              & Broadway \\& Ridge Ave                 & member &  2.766667\\\\\n",
       "\t4 & 9F446FD9DEE3F389 & classic\\_bike  & 2022-03-01 19:12:26 & 2022-03-01 19:22:14 & Wabash Ave \\& Wacker Pl             & Franklin St \\& Jackson Blvd           & member &  9.800000\\\\\n",
       "\t5 & 431128AD9AFFEDC0 & classic\\_bike  & 2022-03-21 18:37:01 & 2022-03-21 19:19:11 & DuSable Lake Shore Dr \\& North Blvd & Loomis St \\& Jackson Blvd             & member & 42.166667\\\\\n",
       "\t6 & 9AA8A13AF7A85325 & classic\\_bike  & 2022-03-07 17:10:22 & 2022-03-07 17:15:04 & Bissell St \\& Armitage Ave          & Southport Ave \\& Clybourn Ave         & member &  4.700000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 47EC0A7F82E65D52 | classic_bike  | 2022-03-21 13:45:01 | 2022-03-21 13:51:18 | Wabash Ave &amp; Wacker Pl             | Kingsbury St &amp; Kinzie St             | member |  6.283333 |\n",
       "| 2 | 8494861979B0F477 | electric_bike | 2022-03-16 09:37:16 | 2022-03-16 09:43:34 | Michigan Ave &amp; Oak St              | Orleans St &amp; Chestnut St (NEXT Apts) | member |  6.300000 |\n",
       "| 3 | EFE527AF80B66109 | classic_bike  | 2022-03-23 19:52:02 | 2022-03-23 19:54:48 | Broadway &amp; Berwyn Ave              | Broadway &amp; Ridge Ave                 | member |  2.766667 |\n",
       "| 4 | 9F446FD9DEE3F389 | classic_bike  | 2022-03-01 19:12:26 | 2022-03-01 19:22:14 | Wabash Ave &amp; Wacker Pl             | Franklin St &amp; Jackson Blvd           | member |  9.800000 |\n",
       "| 5 | 431128AD9AFFEDC0 | classic_bike  | 2022-03-21 18:37:01 | 2022-03-21 19:19:11 | DuSable Lake Shore Dr &amp; North Blvd | Loomis St &amp; Jackson Blvd             | member | 42.166667 |\n",
       "| 6 | 9AA8A13AF7A85325 | classic_bike  | 2022-03-07 17:10:22 | 2022-03-07 17:15:04 | Bissell St &amp; Armitage Ave          | Southport Ave &amp; Clybourn Ave         | member |  4.700000 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 47EC0A7F82E65D52 classic_bike  2022-03-21 13:45:01 2022-03-21 13:51:18\n",
       "2 8494861979B0F477 electric_bike 2022-03-16 09:37:16 2022-03-16 09:43:34\n",
       "3 EFE527AF80B66109 classic_bike  2022-03-23 19:52:02 2022-03-23 19:54:48\n",
       "4 9F446FD9DEE3F389 classic_bike  2022-03-01 19:12:26 2022-03-01 19:22:14\n",
       "5 431128AD9AFFEDC0 classic_bike  2022-03-21 18:37:01 2022-03-21 19:19:11\n",
       "6 9AA8A13AF7A85325 classic_bike  2022-03-07 17:10:22 2022-03-07 17:15:04\n",
       "  start_station_name                 end_station_name                    \n",
       "1 Wabash Ave & Wacker Pl             Kingsbury St & Kinzie St            \n",
       "2 Michigan Ave & Oak St              Orleans St & Chestnut St (NEXT Apts)\n",
       "3 Broadway & Berwyn Ave              Broadway & Ridge Ave                \n",
       "4 Wabash Ave & Wacker Pl             Franklin St & Jackson Blvd          \n",
       "5 DuSable Lake Shore Dr & North Blvd Loomis St & Jackson Blvd            \n",
       "6 Bissell St & Armitage Ave          Southport Ave & Clybourn Ave        \n",
       "  member_casual ride_length\n",
       "1 member         6.283333  \n",
       "2 member         6.300000  \n",
       "3 member         2.766667  \n",
       "4 member         9.800000  \n",
       "5 member        42.166667  \n",
       "6 member         4.700000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>5491344</th><td>B60EA061E2123F62</td><td>electric_bike</td><td>2023-02-04 17:52:34</td><td>2023-02-04 17:59:57</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td> 7.383333</td></tr>\n",
       "\t<tr><th scope=row>5491345</th><td>C04510F8EBB5EE8A</td><td>classic_bike </td><td>2023-02-08 21:57:22</td><td>2023-02-08 22:08:06</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td>10.733333</td></tr>\n",
       "\t<tr><th scope=row>5491346</th><td>187BA364FB265C80</td><td>electric_bike</td><td>2023-02-19 11:29:09</td><td>2023-02-19 11:39:11</td><td>Ogden Ave &amp; Roosevelt Rd </td><td><span style=white-space:pre-wrap>Delano Ct &amp; Roosevelt Rd    </span></td><td>member</td><td>10.033333</td></tr>\n",
       "\t<tr><th scope=row>5491347</th><td>46B54F6B417D1B27</td><td>electric_bike</td><td>2023-02-07 09:01:33</td><td>2023-02-07 09:16:53</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td><td>15.333333</td></tr>\n",
       "\t<tr><th scope=row>5491348</th><td>335B3CAD59F6C016</td><td>electric_bike</td><td>2023-02-22 08:33:22</td><td>2023-02-22 08:50:11</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td><td>16.816667</td></tr>\n",
       "\t<tr><th scope=row>5491349</th><td>03D59518BB151EFA</td><td>classic_bike </td><td>2023-02-01 21:52:17</td><td>2023-02-01 22:04:17</td><td><span style=white-space:pre-wrap>Clark St &amp; Winnemac Ave  </span></td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td>12.000000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & ride\\_length\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t5491344 & B60EA061E2123F62 & electric\\_bike & 2023-02-04 17:52:34 & 2023-02-04 17:59:57 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member &  7.383333\\\\\n",
       "\t5491345 & C04510F8EBB5EE8A & classic\\_bike  & 2023-02-08 21:57:22 & 2023-02-08 22:08:06 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member & 10.733333\\\\\n",
       "\t5491346 & 187BA364FB265C80 & electric\\_bike & 2023-02-19 11:29:09 & 2023-02-19 11:39:11 & Ogden Ave \\& Roosevelt Rd  & Delano Ct \\& Roosevelt Rd     & member & 10.033333\\\\\n",
       "\t5491347 & 46B54F6B417D1B27 & electric\\_bike & 2023-02-07 09:01:33 & 2023-02-07 09:16:53 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual & 15.333333\\\\\n",
       "\t5491348 & 335B3CAD59F6C016 & electric\\_bike & 2023-02-22 08:33:22 & 2023-02-22 08:50:11 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual & 16.816667\\\\\n",
       "\t5491349 & 03D59518BB151EFA & classic\\_bike  & 2023-02-01 21:52:17 & 2023-02-01 22:04:17 & Clark St \\& Winnemac Ave   & Sheffield Ave \\& Waveland Ave & member & 12.000000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 5491344 | B60EA061E2123F62 | electric_bike | 2023-02-04 17:52:34 | 2023-02-04 17:59:57 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member |  7.383333 |\n",
       "| 5491345 | C04510F8EBB5EE8A | classic_bike  | 2023-02-08 21:57:22 | 2023-02-08 22:08:06 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member | 10.733333 |\n",
       "| 5491346 | 187BA364FB265C80 | electric_bike | 2023-02-19 11:29:09 | 2023-02-19 11:39:11 | Ogden Ave &amp; Roosevelt Rd  | Delano Ct &amp; Roosevelt Rd     | member | 10.033333 |\n",
       "| 5491347 | 46B54F6B417D1B27 | electric_bike | 2023-02-07 09:01:33 | 2023-02-07 09:16:53 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual | 15.333333 |\n",
       "| 5491348 | 335B3CAD59F6C016 | electric_bike | 2023-02-22 08:33:22 | 2023-02-22 08:50:11 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual | 16.816667 |\n",
       "| 5491349 | 03D59518BB151EFA | classic_bike  | 2023-02-01 21:52:17 | 2023-02-01 22:04:17 | Clark St &amp; Winnemac Ave   | Sheffield Ave &amp; Waveland Ave | member | 12.000000 |\n",
       "\n"
      ],
      "text/plain": [
       "        ride_id          rideable_type started_at          ended_at           \n",
       "5491344 B60EA061E2123F62 electric_bike 2023-02-04 17:52:34 2023-02-04 17:59:57\n",
       "5491345 C04510F8EBB5EE8A classic_bike  2023-02-08 21:57:22 2023-02-08 22:08:06\n",
       "5491346 187BA364FB265C80 electric_bike 2023-02-19 11:29:09 2023-02-19 11:39:11\n",
       "5491347 46B54F6B417D1B27 electric_bike 2023-02-07 09:01:33 2023-02-07 09:16:53\n",
       "5491348 335B3CAD59F6C016 electric_bike 2023-02-22 08:33:22 2023-02-22 08:50:11\n",
       "5491349 03D59518BB151EFA classic_bike  2023-02-01 21:52:17 2023-02-01 22:04:17\n",
       "        start_station_name        end_station_name             member_casual\n",
       "5491344 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491345 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491346 Ogden Ave & Roosevelt Rd  Delano Ct & Roosevelt Rd     member       \n",
       "5491347 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491348 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491349 Clark St & Winnemac Ave   Sheffield Ave & Waveland Ave member       \n",
       "        ride_length\n",
       "5491344  7.383333  \n",
       "5491345 10.733333  \n",
       "5491346 10.033333  \n",
       "5491347 15.333333  \n",
       "5491348 16.816667  \n",
       "5491349 12.000000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(trip_2223)\n",
    "tail(trip_2223)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a35b5bd6",
   "metadata": {
    "papermill": {
     "duration": 0.007009,
     "end_time": "2023-03-17T14:18:34.849877",
     "exception": false,
     "start_time": "2023-03-17T14:18:34.842868",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Convert the day of week when the ride started"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "ffe3f4b3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:34.867616Z",
     "iopub.status.busy": "2023-03-17T14:18:34.865996Z",
     "iopub.status.idle": "2023-03-17T14:18:36.903899Z",
     "shell.execute_reply": "2023-03-17T14:18:36.902048Z"
    },
    "papermill": {
     "duration": 2.050858,
     "end_time": "2023-03-17T14:18:36.907495",
     "exception": false,
     "start_time": "2023-03-17T14:18:34.856637",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trip_2223$day_of_week <- weekdays(trip_2223$started_at) # Converted using the weekdays function and added it to the existing dataframe"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a1bbbe4d",
   "metadata": {
    "papermill": {
     "duration": 0.00732,
     "end_time": "2023-03-17T14:18:36.922118",
     "exception": false,
     "start_time": "2023-03-17T14:18:36.914798",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Check if the desired output is correct"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "19a3ed05",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-17T14:18:36.939619Z",
     "iopub.status.busy": "2023-03-17T14:18:36.938033Z",
     "iopub.status.idle": "2023-03-17T14:18:38.130889Z",
     "shell.execute_reply": "2023-03-17T14:18:38.128438Z"
    },
    "papermill": {
     "duration": 1.204666,
     "end_time": "2023-03-17T14:18:38.133651",
     "exception": false,
     "start_time": "2023-03-17T14:18:36.928985",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>47EC0A7F82E65D52</td><td>classic_bike </td><td>2022-03-21 13:45:01</td><td>2022-03-21 13:51:18</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St            </span></td><td>member</td><td> 6.283333</td><td><span style=white-space:pre-wrap>Monday   </span></td></tr>\n",
       "\t<tr><th scope=row>2</th><td>8494861979B0F477</td><td>electric_bike</td><td>2022-03-16 09:37:16</td><td>2022-03-16 09:43:34</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td>Orleans St &amp; Chestnut St (NEXT Apts)</td><td>member</td><td> 6.300000</td><td>Wednesday</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EFE527AF80B66109</td><td>classic_bike </td><td>2022-03-23 19:52:02</td><td>2022-03-23 19:54:48</td><td><span style=white-space:pre-wrap>Broadway &amp; Berwyn Ave             </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td>member</td><td> 2.766667</td><td>Wednesday</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>9F446FD9DEE3F389</td><td>classic_bike </td><td>2022-03-01 19:12:26</td><td>2022-03-01 19:22:14</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td><span style=white-space:pre-wrap>Franklin St &amp; Jackson Blvd          </span></td><td>member</td><td> 9.800000</td><td><span style=white-space:pre-wrap>Tuesday  </span></td></tr>\n",
       "\t<tr><th scope=row>5</th><td>431128AD9AFFEDC0</td><td>classic_bike </td><td>2022-03-21 18:37:01</td><td>2022-03-21 19:19:11</td><td>DuSable Lake Shore Dr &amp; North Blvd</td><td><span style=white-space:pre-wrap>Loomis St &amp; Jackson Blvd            </span></td><td>member</td><td>42.166667</td><td><span style=white-space:pre-wrap>Monday   </span></td></tr>\n",
       "\t<tr><th scope=row>6</th><td>9AA8A13AF7A85325</td><td>classic_bike </td><td>2022-03-07 17:10:22</td><td>2022-03-07 17:15:04</td><td><span style=white-space:pre-wrap>Bissell St &amp; Armitage Ave         </span></td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clybourn Ave        </span></td><td>member</td><td> 4.700000</td><td><span style=white-space:pre-wrap>Monday   </span></td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 47EC0A7F82E65D52 & classic\\_bike  & 2022-03-21 13:45:01 & 2022-03-21 13:51:18 & Wabash Ave \\& Wacker Pl             & Kingsbury St \\& Kinzie St             & member &  6.283333 & Monday   \\\\\n",
       "\t2 & 8494861979B0F477 & electric\\_bike & 2022-03-16 09:37:16 & 2022-03-16 09:43:34 & Michigan Ave \\& Oak St              & Orleans St \\& Chestnut St (NEXT Apts) & member &  6.300000 & Wednesday\\\\\n",
       "\t3 & EFE527AF80B66109 & classic\\_bike  & 2022-03-23 19:52:02 & 2022-03-23 19:54:48 & Broadway \\& Berwyn Ave              & Broadway \\& Ridge Ave                 & member &  2.766667 & Wednesday\\\\\n",
       "\t4 & 9F446FD9DEE3F389 & classic\\_bike  & 2022-03-01 19:12:26 & 2022-03-01 19:22:14 & Wabash Ave \\& Wacker Pl             & Franklin St \\& Jackson Blvd           & member &  9.800000 & Tuesday  \\\\\n",
       "\t5 & 431128AD9AFFEDC0 & classic\\_bike  & 2022-03-21 18:37:01 & 2022-03-21 19:19:11 & DuSable Lake Shore Dr \\& North Blvd & Loomis St \\& Jackson Blvd             & member & 42.166667 & Monday   \\\\\n",
       "\t6 & 9AA8A13AF7A85325 & classic\\_bike  & 2022-03-07 17:10:22 & 2022-03-07 17:15:04 & Bissell St \\& Armitage Ave          & Southport Ave \\& Clybourn Ave         & member &  4.700000 & Monday   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | ride_length &lt;dbl&gt; | day_of_week &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 47EC0A7F82E65D52 | classic_bike  | 2022-03-21 13:45:01 | 2022-03-21 13:51:18 | Wabash Ave &amp; Wacker Pl             | Kingsbury St &amp; Kinzie St             | member |  6.283333 | Monday    |\n",
       "| 2 | 8494861979B0F477 | electric_bike | 2022-03-16 09:37:16 | 2022-03-16 09:43:34 | Michigan Ave &amp; Oak St              | Orleans St &amp; Chestnut St (NEXT Apts) | member |  6.300000 | Wednesday |\n",
       "| 3 | EFE527AF80B66109 | classic_bike  | 2022-03-23 19:52:02 | 2022-03-23 19:54:48 | Broadway &amp; Berwyn Ave              | Broadway &amp; Ridge Ave                 | member |  2.766667 | Wednesday |\n",
       "| 4 | 9F446FD9DEE3F389 | classic_bike  | 2022-03-01 19:12:26 | 2022-03-01 19:22:14 | Wabash Ave &amp; Wacker Pl             | Franklin St &amp; Jackson Blvd           | member |  9.800000 | Tuesday   |\n",
       "| 5 | 431128AD9AFFEDC0 | classic_bike  | 2022-03-21 18:37:01 | 2022-03-21 19:19:11 | DuSable Lake Shore Dr &amp; North Blvd | Loomis St &amp; Jackson Blvd             | member | 42.166667 | Monday    |\n",
       "| 6 | 9AA8A13AF7A85325 | classic_bike  | 2022-03-07 17:10:22 | 2022-03-07 17:15:04 | Bissell St &amp; Armitage Ave          | Southport Ave &amp; Clybourn Ave         | member |  4.700000 | Monday    |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 47EC0A7F82E65D52 classic_bike  2022-03-21 13:45:01 2022-03-21 13:51:18\n",
       "2 8494861979B0F477 electric_bike 2022-03-16 09:37:16 2022-03-16 09:43:34\n",
       "3 EFE527AF80B66109 classic_bike  2022-03-23 19:52:02 2022-03-23 19:54:48\n",
       "4 9F446FD9DEE3F389 classic_bike  2022-03-01 19:12:26 2022-03-01 19:22:14\n",
       "5 431128AD9AFFEDC0 classic_bike  2022-03-21 18:37:01 2022-03-21 19:19:11\n",
       "6 9AA8A13AF7A85325 classic_bike  2022-03-07 17:10:22 2022-03-07 17:15:04\n",
       "  start_station_name                 end_station_name                    \n",
       "1 Wabash Ave & Wacker Pl             Kingsbury St & Kinzie St            \n",
       "2 Michigan Ave & Oak St              Orleans St & Chestnut St (NEXT Apts)\n",
       "3 Broadway & Berwyn Ave              Broadway & Ridge Ave                \n",
       "4 Wabash Ave & Wacker Pl             Franklin St & Jackson Blvd          \n",
       "5 DuSable Lake Shore Dr & North Blvd Loomis St & Jackson Blvd            \n",
       "6 Bissell St & Armitage Ave          Southport Ave & Clybourn Ave        \n",
       "  member_casual ride_length day_of_week\n",
       "1 member         6.283333   Monday     \n",
       "2 member         6.300000   Wednesday  \n",
       "3 member         2.766667   Wednesday  \n",
       "4 member         9.800000   Tuesday    \n",
       "5 member        42.166667   Monday     \n",
       "6 member         4.700000   Monday     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>5491344</th><td>B60EA061E2123F62</td><td>electric_bike</td><td>2023-02-04 17:52:34</td><td>2023-02-04 17:59:57</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td> 7.383333</td><td>Saturday </td></tr>\n",
       "\t<tr><th scope=row>5491345</th><td>C04510F8EBB5EE8A</td><td>classic_bike </td><td>2023-02-08 21:57:22</td><td>2023-02-08 22:08:06</td><td>Clark St &amp; Wrightwood Ave</td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td>10.733333</td><td>Wednesday</td></tr>\n",
       "\t<tr><th scope=row>5491346</th><td>187BA364FB265C80</td><td>electric_bike</td><td>2023-02-19 11:29:09</td><td>2023-02-19 11:39:11</td><td>Ogden Ave &amp; Roosevelt Rd </td><td><span style=white-space:pre-wrap>Delano Ct &amp; Roosevelt Rd    </span></td><td>member</td><td>10.033333</td><td><span style=white-space:pre-wrap>Sunday   </span></td></tr>\n",
       "\t<tr><th scope=row>5491347</th><td>46B54F6B417D1B27</td><td>electric_bike</td><td>2023-02-07 09:01:33</td><td>2023-02-07 09:16:53</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td><td>15.333333</td><td><span style=white-space:pre-wrap>Tuesday  </span></td></tr>\n",
       "\t<tr><th scope=row>5491348</th><td>335B3CAD59F6C016</td><td>electric_bike</td><td>2023-02-22 08:33:22</td><td>2023-02-22 08:50:11</td><td>Clark St &amp; Wrightwood Ave</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St       </span></td><td>casual</td><td>16.816667</td><td>Wednesday</td></tr>\n",
       "\t<tr><th scope=row>5491349</th><td>03D59518BB151EFA</td><td>classic_bike </td><td>2023-02-01 21:52:17</td><td>2023-02-01 22:04:17</td><td><span style=white-space:pre-wrap>Clark St &amp; Winnemac Ave  </span></td><td>Sheffield Ave &amp; Waveland Ave</td><td>member</td><td>12.000000</td><td>Wednesday</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t5491344 & B60EA061E2123F62 & electric\\_bike & 2023-02-04 17:52:34 & 2023-02-04 17:59:57 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member &  7.383333 & Saturday \\\\\n",
       "\t5491345 & C04510F8EBB5EE8A & classic\\_bike  & 2023-02-08 21:57:22 & 2023-02-08 22:08:06 & Clark St \\& Wrightwood Ave & Sheffield Ave \\& Waveland Ave & member & 10.733333 & Wednesday\\\\\n",
       "\t5491346 & 187BA364FB265C80 & electric\\_bike & 2023-02-19 11:29:09 & 2023-02-19 11:39:11 & Ogden Ave \\& Roosevelt Rd  & Delano Ct \\& Roosevelt Rd     & member & 10.033333 & Sunday   \\\\\n",
       "\t5491347 & 46B54F6B417D1B27 & electric\\_bike & 2023-02-07 09:01:33 & 2023-02-07 09:16:53 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual & 15.333333 & Tuesday  \\\\\n",
       "\t5491348 & 335B3CAD59F6C016 & electric\\_bike & 2023-02-22 08:33:22 & 2023-02-22 08:50:11 & Clark St \\& Wrightwood Ave & Canal St \\& Madison St        & casual & 16.816667 & Wednesday\\\\\n",
       "\t5491349 & 03D59518BB151EFA & classic\\_bike  & 2023-02-01 21:52:17 & 2023-02-01 22:04:17 & Clark St \\& Winnemac Ave   & Sheffield Ave \\& Waveland Ave & member & 12.000000 & Wednesday\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | ride_length &lt;dbl&gt; | day_of_week &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 5491344 | B60EA061E2123F62 | electric_bike | 2023-02-04 17:52:34 | 2023-02-04 17:59:57 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member |  7.383333 | Saturday  |\n",
       "| 5491345 | C04510F8EBB5EE8A | classic_bike  | 2023-02-08 21:57:22 | 2023-02-08 22:08:06 | Clark St &amp; Wrightwood Ave | Sheffield Ave &amp; Waveland Ave | member | 10.733333 | Wednesday |\n",
       "| 5491346 | 187BA364FB265C80 | electric_bike | 2023-02-19 11:29:09 | 2023-02-19 11:39:11 | Ogden Ave &amp; Roosevelt Rd  | Delano Ct &amp; Roosevelt Rd     | member | 10.033333 | Sunday    |\n",
       "| 5491347 | 46B54F6B417D1B27 | electric_bike | 2023-02-07 09:01:33 | 2023-02-07 09:16:53 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual | 15.333333 | Tuesday   |\n",
       "| 5491348 | 335B3CAD59F6C016 | electric_bike | 2023-02-22 08:33:22 | 2023-02-22 08:50:11 | Clark St &amp; Wrightwood Ave | Canal St &amp; Madison St        | casual | 16.816667 | Wednesday |\n",
       "| 5491349 | 03D59518BB151EFA | classic_bike  | 2023-02-01 21:52:17 | 2023-02-01 22:04:17 | Clark St &amp; Winnemac Ave   | Sheffield Ave &amp; Waveland Ave | member | 12.000000 | Wednesday |\n",
       "\n"
      ],
      "text/plain": [
       "        ride_id          rideable_type started_at          ended_at           \n",
       "5491344 B60EA061E2123F62 electric_bike 2023-02-04 17:52:34 2023-02-04 17:59:57\n",
       "5491345 C04510F8EBB5EE8A classic_bike  2023-02-08 21:57:22 2023-02-08 22:08:06\n",
       "5491346 187BA364FB265C80 electric_bike 2023-02-19 11:29:09 2023-02-19 11:39:11\n",
       "5491347 46B54F6B417D1B27 electric_bike 2023-02-07 09:01:33 2023-02-07 09:16:53\n",
       "5491348 335B3CAD59F6C016 electric_bike 2023-02-22 08:33:22 2023-02-22 08:50:11\n",
       "5491349 03D59518BB151EFA classic_bike  2023-02-01 21:52:17 2023-02-01 22:04:17\n",
       "        start_station_name        end_station_name             member_casual\n",
       "5491344 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491345 Clark St & Wrightwood Ave Sheffield Ave & Waveland Ave member       \n",
       "5491346 Ogden Ave & Roosevelt Rd  Delano Ct & Roosevelt Rd     member       \n",
       "5491347 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491348 Clark St & Wrightwood Ave Canal St & Madison St        casual       \n",
       "5491349 Clark St & Winnemac Ave   Sheffield Ave & Waveland Ave member       \n",
       "        ride_length day_of_week\n",
       "5491344  7.383333   Saturday   \n",
       "5491345 10.733333   Wednesday  \n",
       "5491346 10.033333   Sunday     \n",
       "5491347 15.333333   Tuesday    \n",
       "5491348 16.816667   Wednesday  \n",
       "5491349 12.000000   Wednesday  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5491349     Length:5491349     Min.   :2022-03-01 00:00:19  \n",
       " Class :character   Class :character   1st Qu.:2022-06-04 11:12:27  \n",
       " Mode  :character   Mode  :character   Median :2022-07-27 13:24:56  \n",
       "                                       Mean   :2022-08-02 09:42:15  \n",
       "                                       3rd Qu.:2022-09-19 10:27:59  \n",
       "                                       Max.   :2023-02-28 23:59:31  \n",
       "    ended_at                   start_station_name end_station_name  \n",
       " Min.   :2022-03-01 00:04:30   Length:5491349     Length:5491349    \n",
       " 1st Qu.:2022-06-04 11:32:46   Class :character   Class :character  \n",
       " Median :2022-07-27 13:45:49   Mode  :character   Mode  :character  \n",
       " Mean   :2022-08-02 10:01:47                                        \n",
       " 3rd Qu.:2022-09-19 10:49:11                                        \n",
       " Max.   :2023-03-06 15:09:53                                        \n",
       " member_casual       ride_length        day_of_week       \n",
       " Length:5491349     Min.   :-10353.35   Length:5491349    \n",
       " Class :character   1st Qu.:     5.82   Class :character  \n",
       " Mode  :character   Median :    10.30   Mode  :character  \n",
       "                    Mean   :    19.53                     \n",
       "                    3rd Qu.:    18.52                     \n",
       "                    Max.   : 41387.25                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(trip_2223)\n",
    "tail(trip_2223)\n",
    "summary(trip_2223)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "40bff3e1",
   "metadata": {
    "papermill": {
     "duration": 0.007579,
     "end_time": "2023-03-17T14:18:38.148816",
     "exception": false,
     "start_time": "2023-03-17T14:18:38.141237",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4eaf8748",
   "metadata": {
    "papermill": {
     "duration": 0.0074,
     "end_time": "2023-03-17T14:18:38.163763",
     "exception": false,
     "start_time": "2023-03-17T14:18:38.156363",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "c315ba7e",
   "metadata": {
    "papermill": {
     "duration": 0.007791,
     "end_time": "2023-03-17T14:18:38.179021",
     "exception": false,
     "start_time": "2023-03-17T14:18:38.171230",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Credits\n",
    "\n",
    "Credits to **Tendo Bosa** who did a [video](https://www.youtube.com/watch?v=rVb_UWLKUuA \"YouTube Video\") of his analysis and posted a [Kaggle notebook](https://www.kaggle.com/code/tendobosa/cyclistic-in-what-ways-can-bike-sharing-improve/notebook \"Kaggle Notebook\")."
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
   "duration": 162.621445,
   "end_time": "2023-03-17T14:18:38.510168",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-17T14:15:55.888723",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
