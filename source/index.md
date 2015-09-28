---
title: Neblina API Reference

language_tabs:
  - C: C code

toc_footers:
  - <a href='http://www.motsai.com'>&copy; Motsai.</a> All Rights Reserved
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - motionengine
  - powermanagement

search: true
---

# Introduction

The developers can issue commands to Neblina through the BLE interface and ask for a variety of information by calling the appropriate API functions. The host application makes use of these high-level API functions to ask Neblina to stream different types of data through the BLE interface. By default all streaming features are disabled. We can also request the status of the subsystems on Neblina to check if there has been an invalid command issued in the past by the host. This document explains how developers can make use of these API functions.

Two main subsystems are defined on Neblina: the motion engine and the power management subsystem. All the API functions related to the motion engine are summarized in the `motion_engine_api.h` file, while the power management APIs are addressed in the `power_api.h` file. The data structures associated with the motion engine and power management APIs are addressed in two files: `neblina.h` and `FusionEngineDataTypes.h`.
