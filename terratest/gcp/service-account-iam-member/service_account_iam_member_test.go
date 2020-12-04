package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestServiceAccountIAMMember(t *testing.T) {
	//t.Parallel()

	optionsServiceAccount := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../terraform/modules/service-account",
		Vars: map[string]interface{}{
			"project_id":      "jenkins-test-project-284609",
			"sa_account_id":   "terratest",
			"sa_display_name": "Terratest role",
			"name":            "Terratest",
		},
	},
	)

	defer terraform.Destroy(t, optionsServiceAccount)
	terraform.InitAndApply(t, optionsServiceAccount)

	email := terraform.Output(t, optionsServiceAccount, "email")

	optionsIAMMember := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		TerraformDir: "../../../terraform/modules/service-account-iam-member",
		Vars: map[string]interface{}{
			"project_id": "jenkins-test-project-284609",
			"role":       "roles/storage.objectViewer",
			"member":     email,
			//"name":       "Terratest",
		},
	},
	)

	defer terraform.Destroy(t, optionsIAMMember)
	terraform.InitAndApply(t, optionsIAMMember)

}
