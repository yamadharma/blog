---
title: "Сопоставление команд Cisco и Huawei"
author: ["Dmitry S. Kulyabov"]
date: 2023-04-04T15:26:00+03:00
lastmod: 2023-04-04T16:01:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "cisco-huawei-commands"
---

Команды Cisco и Huawei.

<!--more-->

{{< toc >}}

<div class="table-caption">
  <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
  Exec mode
</div>

| Cisco exec mode                    | Huawei user view               |
|------------------------------------|--------------------------------|
| traceroute                         | tracert                        |
| terminal length 0                  | screen-length 0 temporary      |
| show                               | display                        |
| show version                       | display version                |
| show history-command               | display history-command        |
| show interfaces                    | display interface              |
| show ip interface                  | display ip interface           |
| show ip route                      | display ip routing-table       |
| show ip bgp                        | display bgp routing-table      |
| show clock                         | display clock                  |
| show flash                         | dir flash:                     |
| show logging                       | display logbuffer              |
| show snmp                          | display snmp-agent statistics  |
| show users                         | display users                  |
| show tech-support                  | display diagnostic-information |
| show running-config                | display current-configuration  |
| write terminal                     | display current-configuration  |
| show startup-config                | display saved-configuration    |
| more nvram:startup-config          | display saved-configuration    |
| write erase                        | reset saved-configuration      |
| write memory                       | save                           |
| copy running-config startup-config | save                           |
| clear                              | reset                          |
| clear counters                     | reset counters interface       |
| clear interface                    | reset counters interface       |
| clear access-list counters         | reset acl counter all          |
| no                                 | undo                           |
| debug / no debug                   | debugging / undo debugging     |
| reload                             | reboot                         |
| enable                             | super                          |
| disable                            | super 0                        |
| erase                              | delete                         |
| exit                               | quit                           |
| configure terminal                 | system-view                    |

<div class="table-caption">
  <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 2:</span>
  Configuration mode
</div>

| Cisco configuration mode | Huawei system view       |
|--------------------------|--------------------------|
| end                      | return                   |
| snmp-server              | snmp-agent               |
| hostname                 | sysname                  |
| router bgp               | bgp                      |
| router ospf              | ospf                     |
| router rip               | rip                      |
| shutdown / no shutdown   | shutdown / undo shutdown |