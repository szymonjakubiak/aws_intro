git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME

poetry install

cdk bootstrap aws://$CKD_ACCOUNT_NUMBER/$CKD_REGION
