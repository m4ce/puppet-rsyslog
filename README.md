# Puppet rsyslog module

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the rsyslog module](#setup)
4. [Reference - Types reference and additional functionalities](#reference)
5. [Hiera integration](#hiera)
6. [Contact](#contact)

<a name="overview"/>
## Overview

Module to manage rsyslog configuration and runtime. Configuration *and* filters are totally driven via Hiera.

<a name="module-description"/>
## Module Description

The rsyslog module allows to automate the configuration and deployment of the rsyslog daemon.

<a name="setup"/>
## Setup

The include the main class as follows:

```
include rsyslog
```

<a name="reference"/>
## Reference

### Classes

#### rsyslog
`rsyslog`

```
include rsyslog
```

##### `filter_properties` (optional)
rsyslog property-based filters in the form of {'filter_name' => { .. }}

##### `filter_facilities` (optional)
rsyslog facility-based filters in the form of {'filter_name' => { .. }}

##### `opts` (optional)
rsyslog daemon options in the form of {'option' => 'value'}.

Defaults to:
```
rsyslog::opts:
  "ModLoad":
    - "imuxsock"
    - "imjournal"
  "WorkDirectory": "/var/lib/rsyslog"
  "ActionFileDefaultTemplate": "RSYSLOG_TraditionalFileFormat"
  "IncludeConfig": "%{lookup('rsyslog::config_dir')}/*.conf"
  "OmitLocalLogging": true
  "IMJournalStateFile": "imjournal.state"
```

##### `packages` (optional)
Installation packages for rsyslog

Defaults to:
```
rsyslog::packages:
  "rsyslog": {}
```

##### `config_dir` (optional)
Path to the rsyslog configuration directory (default: /etc/rsyslog.d)

##### `config_dir_purge` (optional)
Whether we should purge unmanaged resources under the rsyslog's configuration directory (default: true)

##### `config_file` (optional)
Path to the rsyslog configuration file (default: /etc/rsyslog.conf)

##### `config_file_manage` (optional)
Whether we should manage rsyslog's configuration file or not (default: true)

##### `service_name` (optional)
rsyslog service name (default: 'rsyslog')

##### `service_manage` (optional)
Whether we should manage the service runtime or not (default: true)

##### `service_ensure` (optional)
Whether the resource is running or not. Valid values are 'running', 'stopped'. (default: 'running')

##### `service_enable` (optional)
Whether the service is onboot enabled or not. Defaults to true.

### Defined Types

#### rsyslog::filter_property
`rsyslog::filter_property` manages rsyslog property-based filters

```
rsyslog::filter_property {"filter_name": }
```

##### `name` (required)
Filter name

##### `order` (optional)
Filter order

##### `operator` (required)
Filter condition comparison operator (can be 'contains', 'isequal', 'startswidth', 'regex', 'ereregex'). You can use the bang-character (!) immediately in front of a compare-operation, the outcome of this operation is negated.

##### `value` (required)
Filter condition value

##### `discard` (required)
Discard messages if condition matches (default: false)

##### `ensure` (optional)
Whether the resource is present or not. Valid values are 'present', 'absent'. Defaults to 'present'.

#### rsyslog::filter_facility
`rsyslog::filter_facility` manages rsyslog property-facility filters

```
rsyslog::filter_facility {"filter_name": }
```

##### `name` (required)
Filter name

##### `order` (optional)
Filter order

##### `facility` (required)
Filter facility

##### `action` (required)
Filter action

##### `write_async` (required)
Whether to write asynchronously or not (default: false)

##### `ensure` (optional)
Whether the resource is present or not. Valid values are 'present', 'absent'. Defaults to 'present'.


<a name="hiera"/>
## Hiera integration

You can optionally define your filters in Hiera as follows.

```
---
rsyslog::filter_properties:
  "mesos-slave":
    property: "programname"
    operator: "isequal"
    value: "mesos-slave"
    discard: true
    ensure: "present"
rsyslog::filter_facilities:
  "log_kernel_messages":
    facility: "kern.*"
    action: "/dev/console"
    ensure: "present"
```

<a name="contact"/>
## Contact
Matteo Cerutti - matteo.cerutti@hotmail.co.uk
