package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestStorageBucket(t *testing.T) {
	t.Parallel()

	bucketName := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	bucketOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../terraform/modules/storage-bucket",

		Vars: map[string]interface{}{
			"project_id":  "jenkins-test-project-284609",
			"bucket_name": bucketName,
			"location":    "EU",
			"name":        bucketName,
		},
	},
	)

	defer terraform.Destroy(t, bucketOptions)
	terraform.InitAndApply(t, bucketOptions)

	bucket_name := terraform.Output(t, bucketOptions, "bucket_name")

	aclOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../terraform/modules/storage-bucket-acl",

		Vars: map[string]interface{}{
			"project_id":  "jenkins-test-project-284609",
			"bucket_name": bucket_name,
			"name":        bucket_name,
		},
	},
	)

	defer terraform.Destroy(t, aclOptions)
	terraform.InitAndApply(t, aclOptions)

}
