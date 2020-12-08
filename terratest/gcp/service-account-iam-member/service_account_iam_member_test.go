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
func TestServiceAccountIAMMember(t *testing.T) {
	//t.Parallel()

	saID := fmt.Sprintf(RandomString(10))

	optionsServiceAccount := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../terraform/modules/service-account",
		Vars: map[string]interface{}{
			"project_id":      "jenkins-test-project-284609",
			"sa_account_id":   saID,
			"sa_display_name": "Terratest role",
			"name":            "",
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
			"name":       "",
		},
	},
	)

	defer terraform.Destroy(t, optionsIAMMember)
	terraform.InitAndApply(t, optionsIAMMember)

}
