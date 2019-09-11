gcloud auth list
echo 'if necessary use -gcloud auth login- to add your new user'
gcloud config set account tansu@cardbase.io

export PRODUCT_NAME=cardbase
export BUCKET_NAME=${PRODUCT_NAME}-initial_data_model_1000  #should be unique + public :)
export LOCATION=us-central1
export PROJECT_NAME_BUCKET=development-3f127
export LAST_EXPORT_NAME=2019-09-11T12:20:37_46078  #file name of .overall_export_metadata. As firestore expects under previos export

gsutil mb  -l ${LOCATION} -p ${PROJECT_NAME_BUCKET} -b on gs://${BUCKET_NAME}/
gsutil iam ch allUsers:objectViewer,admin gs://${BUCKET_NAME}/


gcloud config set project ${PROJECT_NAME_BUCKET} && gcloud beta firestore export gs://${BUCKET_NAME}/

gsutil cp -r gs://${BUCKET_NAME}/${LAST_EXPORT_NAME} backupData