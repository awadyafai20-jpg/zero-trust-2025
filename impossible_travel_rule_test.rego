package sailpoint.risk

test_legit_login_allowed {
    allow with input as data.test_scenarios.legit_login
}

test_impossible_travel_denied {
    not allow with input as data.test_scenarios.impossible_travel
    reason == "Impossible travel detected" with input as data.test_scenarios.impossible_travel
}

test_low_trust_device_denied {
    not allow with input as data.test_scenarios.low_trust_device
    reason == "Untrusted device" with input as data.test_scenarios.low_trust_device
}
