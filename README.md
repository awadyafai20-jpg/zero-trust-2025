# Zero-Trust Adaptive Access Policy Lab

An open-source implementation of risk-based conditional access policies
(Okta device trust + SailPoint identity risk signals + OPA/Rego policy
evaluation), based on patterns I developed while working on IAM and
Zero-Trust security architecture. This repo generalizes and open-sources
the core policy logic so others can learn from, test, and adapt it.

## Background

During my professional work in identity and access management, I designed
and implemented risk-based access control, combining real-time device
trust scoring, identity risk attributes, and impossible-travel detection
to move access decisions beyond static rules. This repository extracts
the underlying policy logic into a standalone, testable framework —
client-specific details have been replaced with synthetic data, so anyone
can run and verify the logic themselves.

## Architecture

Login event

→ Okta conditional access policy (device trust, risk score)

→ SailPoint identity risk attribute feed

The Okta policy (`okta-risk-policy.json`) and OPA/Rego logic
(`impossible-travel-rule.rego`) represent two complementary layers of the
same design: Okta enforces phishing-resistant sign-in at the platform
level, while the Rego policy demonstrates custom risk logic that could be
fed in via a policy engine such as OPA Gatekeeper. This repo focuses its
test suite on the Rego layer, since that's the portable, independently
verifiable part.

## What's included

- `okta-risk-policy.json` — Conditional access policy requiring phishing-resistant sign-in for risky/unmanaged devices
- `sailpoint-risk-attributes.xml` — Identity risk feed schema
- `impossible-travel-rule.rego` — OPA/Rego policy logic for impossible-travel and device-trust detection
- `impossible_travel_rule_test.rego` — Test suite validating the policy against sample scenarios
- `test-scenarios/` — Synthetic login event samples (legitimate, impossible travel, low-trust device)
- `setup-guide.md` — Deployment walkthrough

## Try it yourself

```bash
# Install OPA: https://www.openpolicyagent.org/docs/latest/#running-opa
opa test . -v
```

This runs the included test suite against the Rego policy using the
sample data in `test-scenarios/` — you can inspect exactly what's being
Evaluate and see the pass/fail output yourself.

## Test results

Running `opa test . -v` against the included synthetic dataset:
- 1/1 impossible-travel scenario correctly flagged
- 1/1 low-trust-device scenario correctly flagged
- 1/1 legitimate login scenario correctly allowed

## Limitations & context

This is a lab/demonstration project generalizing patterns from the real world
IAM work. The included data is synthetic; this is not a production
deployment and should be adapted and tested before use in any live
environment.

## License

MIT
→ OPA/Rego policy evaluation (impossible-travel + device trust checks)

→ Allow / Step-up auth / Deny
