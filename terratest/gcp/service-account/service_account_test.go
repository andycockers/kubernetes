package test

import (
	"fmt"
	"math/rand"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func RandomString(n int) string {
	var letters = []rune("abcdefghijklmnopqrstuvwxyz")
	s := make([]rune, n)
	for i := range s {
		s[i] = letters[rand.Intn(len(letters))]
	}
	return string(s)
}

func TestServiceAccount(t *testing.T) {
	t.Parallel()

	saID := fmt.Println(RandomString(10))
	// website::tag::1:: Get the Project Id to use
	//project_gcp := gcp.GetGoogleProjectIDFromEnvVar(t)

	// website::tag::2:: Give the example instance a unique name
	//Prefix := fmt.Sprintf("terratest-%s", strings.ToLower(random.UniqueId()))

	// website::tag::6:: Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::3:: The path to where our Terraform code is located
		TerraformDir: "../../../terraform/modules/service-account",

		// website::tag::4:: Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"project_id":      "jenkins-test-project-284609",
			"sa_account_id":   saID,
			"sa_display_name": "Terratest role",
			"name":            "Terratest",
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
