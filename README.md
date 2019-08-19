# datamodel:

This sampleData contains basic initial data model of cardbaseio. It is good to use start a initial dummy firestore db w/ data model!

while inside datamodel/ folder!

- export to gcp storage from firestore w/ `gcloud beta firestore export gs://firestore-backup-cardbaseio/dataModel`
- download to local from gcp storage w/ `gsutil cp -r gs://firestore-backup-cardbaseio/dataModel sampleData`

above 2 steps is not necessary. cause already done. and this folder always contain latest data model. 
importing to **another firestore db** in **another gcp account**, that's what we need.

- switch to new gcp account w/ 
    - `gcloud auth list` to see your account, if preconfigured before. Otherwise `gcloud auth login` w/ google account.
    -  If you have already configured, use `gcloud config set account ...` .
- upload from local to gcp bucket
    - create a bucket in your gcp account via gcp console ui. _Create a new bucket w/ different name_ :)
    - `gsutil cp -r  datamodel/dataModel gs://cardbaseio-initial/`
- create firestore from firebase ui or gcp console (bans write access for unauth. users default).
    - import data from gcp storage to firestore w/
        - use gshell or use `gcloud config set project [PROJECT_ID]` then run commands below 
        - `gcloud beta firestore import gs://cardbaseio-initial/2019-08-19T07:47:02_86574/`
    - this step will be done for all firebase projects (i.e. dev, test, prod, demo, release) !
      

`
  
