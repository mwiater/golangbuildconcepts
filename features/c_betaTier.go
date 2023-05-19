//go:build beta

// Package features implements various build features
package features

func init() {
	FeatureTier = "betaTier"
	Features = append(Features,
		"Beta Tier: Feature #1",
		"Beta Tier: Feature #2",
	)
}
