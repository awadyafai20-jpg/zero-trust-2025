# Setup Guide

1. Import `okta-risk-policy.json` in Okta Admin → Security → Policies
2. Add risk attributes in SailPoint IdentityNow → Risk Configuration
3. Deploy the Rego policy via OPA Gatekeeper (or run locally with `opa eval`)
4. Test with a simulated phishing campaign, or run the included test
   suite locally with `opa test . -v` to validate policy behavior against
   synthetic scenarios before deploying against live systems
