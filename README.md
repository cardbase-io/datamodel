# datamodel

This sampleData contains basic initial data model of cardbaseio. It is good to use start an initial dummy firestore db w/ data model!

- loadDataModel.sh: Load first data to gcp storage, then  firestore dbs
- exportDataModel.sh: exports data from firestore to gcp storage, then downloads to local. suitable for extra backup needs, or initialize a new firebase project.

## How To Start

After fork, (into your own github account)

1. `git clone ...`
2. `cd datamodel`
3. Make sure you already created firestores w/ read all permission in all firebase projects (development, test, demo and production)!
4. Edit variables in `loadDataModel.sh`, then Run `./loadDataModel.sh`. Basicly
    - creates a bucket in your gcp account where your firebase projects resides.
    - copies files from dataModel/ folder into that bucket. Then makes it public w/ Storage admin permission. 
        - If you do not want that, change script to create bucket in all firebase projects, and Upload that data to that buckets !
  
