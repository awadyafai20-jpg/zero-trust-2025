package sailpoint.risk
default allow = true
allow = false {
    input.speed_kph > 800
    input.reason := "Impossible travel detected"
}
