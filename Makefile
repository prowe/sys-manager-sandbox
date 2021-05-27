zip-ansible:
	rm -rf ansible.zip && (cd ansible && zip -r ../ansible.zip *)

upload-zip: zip-ansible
	aws s3 cp ansible.zip s3://prowe-sai-sandbox-dev-deploy/prowe-ssm-sandbox/ansible.zip

sync-ansible:
	aws s3 sync ansible s3://prowe-sai-sandbox-dev-deploy/prowe-ssm-sandbox/ansible

deploy: upload-zip
	sam deploy

drop:
	aws cloudformation delete-stack --stack-name=prowe-ssm-sandbox