package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestComputeInstance(t *testing.T) {
	t.Parallel()

	InstanceName := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	// website::tag::1:: Get the Project Id to use
	//project_gcp := gcp.GetGoogleProjectIDFromEnvVar(t)

	// website::tag::2:: Give the example instance a unique name
	//Prefix := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	// website::tag::6:: Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::3:: The path to where our Terraform code is located
		TerraformDir: "../../../terraform/modules/google_compute_instance",

		// website::tag::4:: Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"project_id":        "jenkins-test-project-284609",
			"gce_instance_name": InstanceName,
			"machine_type":      "f1-micro",
			"zone":              "europe-west2-a",
			"image":             "ubuntu-2004-focal-v20201201",
		},

		// website::tag::5:: Variables to pass to our Terraform code using TF_VAR_xxx environment variables
		//EnvVars: map[string]string{
		//	"GOOGLE_CLOUD_PROJECT": project_gcp,
		//},
	})

	// website::tag::8:: At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::7:: Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)
}
