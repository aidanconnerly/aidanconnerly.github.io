---
title: "Deciphering Desirability: Patterns in Speed Dating"
excerpt: "What traits do we most value in our partners? I analyze data from over 6,000 speed dates to help answer this question<br/><img src='/images/speed_dating/eda_values.png' style='width: 600px; height: 300px; border: 2px solid black;'>"
collection: portfolio
permalink: /portfolio/speed-dating/
layout: archive
---
## Introduction
Choosing a romantic partner is one of the most significant decisions people make. Speed dating offers a unique and accelerated glimpse into the dynamics of interpersonal attraction. In this study, we examine how people make quick decisions about potential partners using data from over 6,000 speed-dates collected in the early 2000s.

This analysis aims to identify the traits that most strongly influence partner selection, explore differences in preferences between men and women, and assess whether these preferences align with what participants claim to value.

## The Data
### Source and experiment description
The data were originally downloaded from Columbia statistician Andrew Gelman's [website](http://www.stat.columbia.edu/~gelman/arm/examples/speed.dating/). The dataset itself was compiled by Columbia Business School professors Ray Fisman and Sheena Iyengar for their paper [*Gender Differences in Mate Selection: Evidence From a Speed Dating Experiment*](http://www.stat.columbia.edu/~gelman/stuff_for_blog/sheena.pdf).

From 2002-2004, researchers gathered data from volunteers consisting of graduate and professional students from Columbia University. At a local bar/restaurant near the university, participants would have four-minute speed dates with every other participant of the opposite sex. After each date, participants rated their date on six attributes: Attractiveness, Sincerity, Fun, Intelligence, Ambition, and Shared Interests. Perhaps most importantly though, participants were asked if they would like to see their date again.

Throughout the experiment, researchers also gave participants questionnaires to gather data on participant demographics, preferred partner attributes, dating habits, and perceptions of how the general population approaches dating.

### Cleaning
Initially, the dataset contained 8,379 speed dates between the 552 unique participants with 192 variables. A link to the key for a description of every variable is provided in the appendix.

For consistency, we removed 4 out of the 22 speed dating groups (waves 6-9) which utilized a separate rating/scoring scheme. We also removed 141 variables from the data set for simplification purposes. Participants were given multiple follow-up surveys with the same questions on dating preferences. We removed these variables due to irrelevance or containing many missing values (participants were much less likely to fill out surveys given to them 3-4 weeks after their speed dates). With the remaining data, we also omitted speed dates containing large amounts of missing values (e.g. no ratings for their partner).

The resulting data set contains 6,761 total speed dates with 224 male and 220 female participants. We kept 51 variables relating to demographics (race, age, field of study), hobby interests, dating values, and partner ratings.

## Exploratory Data Analysis
Before attending their speed dates, participants were questioned on traits they value in a partner. Specifically, they were given 100 points to distribute among the six attributes of interest: **Attractiveness**, **Sincerity**, **Fun**, **Intelligence**, **Ambition**, and **Shared Interests**. Separating participants by gender, we first examine the distributions.

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/speed_dating/eda_values.png" alt="Neural Network" style="display: block; margin: auto;" />
    <figcaption>
    Box plot of Male (blue) and Female (pink) preferences
</figcaption>
</figure>
**write-up in progress...**