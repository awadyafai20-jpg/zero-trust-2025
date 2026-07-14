package sailpoint.risk

default allow = true

# Deny if impossible travel speed detected
allow = false {
    input.speed_kph > 800
}

# Deny if device trust score is below threshold
allow = false {
    input.device_trust_score < 30
}

reason = "Impossible travel detected" {
    input.speed_kph > 800
}

reason = "Untrusted device" {
    input.device_trust_score < 30
    input.speed_kph <= 800
}

reason = "None" {
    allow
}
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
