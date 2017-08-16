---
title: 'Welcome to Sensum'
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - javascript--nodejs: Node.JS
  - python: Python
  - ruby: Ruby
  - java: Java
  - swift: Swift 

includes:
  - api/api
  - android/android
  - androidserviceconstants/serviceconstants
  - ios/ios
    
search: true

---

# Introduction

Welcome to Sensum Emotion API/SDK

## Quick Start

### Metrics

Below are the metrics that Emotion AI can analyse and the units that data should be sent in

|Metric Name|Unit|
|-----------|----|
|heartrate  |bpm |
|breathingrate|bpm|
|temperature|C, assumed to be ambient/external|
|skintemperature|C|
|location_latitude|deg|
|location_longitude|deg|
|location_altitude|m|
|location_accuracy|or location_accuracy_h/v if available|
|location_speed|m/s|
|acceleration|linear accelleration in m/s2*|
|acceleration_x|m/s2|
|acceleration_y|m/s2|
|acceleration_z|m/s2|
