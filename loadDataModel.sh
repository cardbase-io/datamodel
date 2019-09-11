gcloud auth list
echo 'if necessary use -gcloud auth login- to add your new user'
gcloud config set account tansu@cardbase.io

export PRODUCT_NAME=cardbase
export BUCKET_NAME=${PRODUCT_NAME}-initial_data_model_1000  #should be unique + public :)
export LOCATION=us-central1
export PROJECT_NAME_BUCKET=development-3f127
export LAST_EXPORT_NAME=2019-08-19T07:47:02_86574  #file name of .overall_export_metadata. As firestore expects under previos export

gsutil mb  -l ${LOCATION} -p ${PROJECT_NAME_BUCKET} -b on gs://${BUCKET_NAME}/
gsutil iam ch allUsers:objectViewer,admin gs://${BUCKET_NAME}/
gsutil cp -r dataModel gs://${BUCKET_NAME}/2019-08-19T07:47:02_86574

#  make sure you created firestores w/ read all in all firebase projects (development, test, demo and production)!


# load $PROJECT_NAME_BUCKET to all firestores in firebase projects!
# to see projects: gcloud projects list
export DEVELOPMENT_PROJECT_ID=development-3f127
export RELEASE_PROJECT_ID=release-91f9d
# export DEMO_PROJECT_ID=
export PRODUCTION_PROJECT_ID=production-34b0f

gcloud config set project $DEVELOPMENT_PROJECT_ID && gcloud beta firestore import gs://${BUCKET_NAME}/${LAST_EXPORT_NAME}/
gcloud config set project $RELEASE_PROJECT_ID && gcloud beta firestore import gs://${BUCKET_NAME}/${LAST_EXPORT_NAME}/
# gcloud config set project $DEMO_PROJECT_ID && gcloud beta firestore import gs://${BUCKET_NAME}/${LAST_EXPORT_NAME}/
gcloud config set project $PRODUCTION_PROJECT_ID && gcloud beta firestore import gs://${BUCKET_NAME}/${LAST_EXPORT_NAME}/

