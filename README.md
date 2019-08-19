
##### Basic steps:

This sampleData contains basic initial data model of cardbaseio. It is good to use start a initial dummy firestore db w/ data model!

while inside core-app folder!

- export to gcp storage from firestore w/ `gcloud beta firestore export gs://firestore-backup-cardbaseio/dataModel`
- download to local from gcp storage w/ `gsutil cp -r gs://firestore-backup-cardbaseio/dataModel sampleData`

above 2 steps is not necessary. cause already done. and this folder always contain latest data model.

- importing to another firestore db in **another gcp account** w/ 
  - switch to new gcp account w/ `gcloud auth login ` or `gcloud config set account ...`
  - upload from local to gcp bucket `gsutil cp -r  TOFROM gs://cardbaseio-initial/`. Create a new bucket w/ different name :)
  - create firestore from firebase ui or gcp console.
  - import data from gcp storage to firestore w/
      - use gshell or use `gcloud config set project [PROJECT_ID]` then run commands below 
      - `gcloud beta firestore import gs://cardbaseio-initial/2019-08-19T07:47:02_86574/`
`
  
