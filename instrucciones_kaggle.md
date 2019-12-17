# Kaggle Competition Instructions

For this competition, you are tasked with categorizing shopping trip types based on the items that customers purchased. To give a few hypothetical examples of *trip types*:
- a customer may make a small daily dinner trip,
- a weekly large grocery trip,
- a trip to buy gifts for an upcoming holiday, or
- a seasonal trip to buy clothes.

**Walmart** has categorized the trips contained in this data into 38 distinct types using a proprietary method applied to an extended set of data. **You are challenged to recreate this categorization/clustering with a more limited set of features. This could provide new and more robust ways to categorize trips.**

The **training set (train.csv)** contains a large number of customer visits with the TripType included. You must predict the TripType for each customer visit in the test set (test.csv). Each visit may only have one TripType. You will not be provided with more information than what is given in the data (e.g. what the TripTypes represent or more product information).

The test set file is encrypted. You must complete this brief survey to receive the password.

**Data Fields**


- TripType - a categorical id representing the type of shopping trip the customer made. This is the ground truth that you are predicting.

- TripType_999 is an "other" category.
VisitNumber - an id corresponding to a single trip by a single customer
- Weekday - the weekday of the trip
- Upc - the UPC number of the product purchased
- ScanCount - the number of the given item that was purchased. A negative value indicates a product return.
- DepartmentDescription - a high-level description of the item's department
- FinelineNumber - a more refined category for each of the products, created by Walmart


**About Walmart**

Walmart uses both art and science to continually make progress on their core mission of better understanding and serving their customers. One way Walmart is able to improve customers' shopping experiences is by segmenting their store visits into different trip types.

Whether they're on a last minute run for new puppy supplies or leisurely making their way through a weekly grocery list, classifying trip types enables Walmart to create the best shopping experience for every customer.

Currently, Walmart's trip types are created from a combination of existing customer insights ("art") and purchase history data ("science"). In their third recruiting competition, Walmart is challenging Kagglers to focus on the (data) science and classify customer trips using only a transactional dataset of the items they've purchased. Improving the science behind trip type classification will help Walmart refine their segmentation process.

Walmart is hosting this competition to connect with data scientists who break the mold.

**About the Evaluation**

Submissions are evaluated using the multi-class logarithmic loss. For each visit, you must submit a set of predicted probabilities (one for every TripType). The formula is:

```math
-\frac{1}{N}\sum_{i=1}^{N} \sum_{j=1}^{M} y_{ij} log(p_{ij})
```

where *N* is the number of visits in the test set, *M* is the number of trip types, *log* is the natural logarithm, *yij* is 1 if observation *i* is of class *j* and *0* otherwise, and *pij* is the predicted probability that observation $i$ belongs to class *j*.

The submitted probabilities for a given visit are not required to sum to one because they are rescaled prior to being scored (each row is divided by the row sum). In order to avoid the extremes of the log function, predicted probabilities are replaced with *max(min(p,1−10−15),10−15)*.

**Submission Format**

You must submit a $csv$ file with the VisitNumber, all candidate TripTypes, and a probability for each class. The order of the rows does not matter. The file must have a header and should look like the following:

```
"VisitNumber","TripType_3","TripType_4",...

1,0,0.1,...

2,1,0,...

etc.
```
