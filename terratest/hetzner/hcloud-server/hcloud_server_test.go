package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestHcloudServer(t *testing.T) {
	t.Parallel()

	ServerName := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	var hcloudToken = []string{
		"HCLOUD_TOKEN",
	}

	ssh_keys := []string{"andy@DESKTOP-CC1QGR9"}

	// website::tag::1:: Get the Project Id to use
	//project_gcp := gcp.GetGoogleProjectIDFromEnvVar(t)

	// website::tag::2:: Give the example instance a unique name
	//Prefix := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	// website::tag::6:: Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::3:: The path to where our Terraform code is located
		TerraformDir: "../../../terraform/modules/hcloud_server",

		// website::tag::4:: Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"server_name":  ServerName,
			"image_name":   "23857793",
			"server_type":  "cx11",
			"location":     "fsn1",
			"ssh_keys":     ssh_keys,
			"hcloud_token": hcloudToken,
			"name":         ServerName,
			"type":         "type=ubuntu_slave",
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
