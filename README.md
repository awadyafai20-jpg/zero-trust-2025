# Zero-Trust Adaptive Access Policy Lab

An open-source implementation of risk-based conditional access policies 
(Okta device trust + SailPoint identity risk signals + OPA/Rego policy 
evaluation), based on patterns I developed while working on IAM and 
Zero-Trust security architecture. This repo generalizes and opens up 
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

Login event → Okta device trust signal

→ SailPoint identity risk attribute

→ OPA/Rego policy evaluation

→ Allow / Step-up auth / Deny

## What's included

- `okta-risk-policy.json` — Conditional access + device trust scoring configuration
- `sailpoint-risk-attributes.xml` — Identity risk feed schema
- `impossible-travel-rule.rego` — OPA/Rego policy logic for impossible-travel detection
- `test-scenarios/` — Synthetic login event samples (legitimate + high-risk) with expected outcomes
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

Running `opa test` against the included synthetic dataset:
- X/X impossible-travel scenarios correctly flagged
- X/X legitimate login scenarios are correctly allowed

*(Fill in real numbers once your test suite is in place — see note below.)*

## Limitations & context

This is a lab/demonstration project generalizing patterns from the real world 
IAM work. The included data is synthetic; this is not a production 
deployment and should be adapted and tested before use in any live 
environment.

## License

MIT
