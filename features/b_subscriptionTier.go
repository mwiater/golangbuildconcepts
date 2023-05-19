//go:build subscription

// Package features implements various build features
package features

func init() {
	FeatureTier = "subscriptionTier"
	Features = append(Features,
		"Subscription Tier: Feature #1",
		"Subscription Tier: Feature #2",
	)
}
